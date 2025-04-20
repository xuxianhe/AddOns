-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                          https://tradeskillmaster.com                          --
--    All Rights Reserved - Detailed license information included with addon.     --
-- ------------------------------------------------------------------------------ --

local TSM = select(2, ...) ---@type TSM
local AuctionDB = TSM:NewPackage("AuctionDB")
local L = TSM.Include("Locale").GetTable()
local Event = TSM.Include("Util.Event")
local CSV = TSM.Include("Util.CSV")
local Log = TSM.Include("Util.Log")
local Table = TSM.Include("Util.Table")
local Math = TSM.Include("Util.Math")
local ItemString = TSM.Include("Util.ItemString")
local Wow = TSM.Include("Util.Wow")
local Threading = TSM.Include("Service.Threading")
local ItemInfo = TSM.Include("Service.ItemInfo")
local CustomPrice = TSM.Include("Service.CustomPrice")
local AuctionScan = TSM.Include("Service.AuctionScan")
local private = {
	region = nil,
	realmAppData = {
		scanTime = nil,
		data = {},
		itemOffset = {},
		fieldOffset = {},
		numFields = nil,
	},
	realmData = {},
	realmUpdateTime = nil,
	regionData = {},
	regionUpdateTime = nil,
	lastScanTemp = {},
	scanRealmData = {},
	scanRealmTime = nil,
	scanThreadId = nil,
	ahOpen = false,
	didScan = false,
	auctionScan = nil,
	isScanning = false,
}
local CSV_KEYS = { "itemString", "minBuyout", "marketValue", "numAuctions", "quantity", "lastScan" }



-- ============================================================================
-- Module Functions
-- ============================================================================

function AuctionDB.OnInitialize()
	private.scanThreadId = Threading.New("AUCTIONDB_SCAN", private.ScanThread)
	Threading.SetCallback(private.scanThreadId, private.ScanThreadCleanup)
	Event.Register("AUCTION_HOUSE_SHOW", private.OnAuctionHouseShow)
	Event.Register("AUCTION_HOUSE_CLOSED", private.OnAuctionHouseClosed)
end

function AuctionDB.OnEnable()
	local realmData, realmScanStat, realmHistorical, regionCommodity, regionStat, regionHistorical, regionSale = TSM.AppHelper.GetAuctionDBData()
	if realmData then
		local loadedData, updateTime = private.LoadAppData(realmData)
		for field in pairs(loadedData.fieldLookup) do
			assert(not private.realmData[field])
			private.realmData[field] = loadedData
		end
		private.realmUpdateTime = max(private.realmUpdateTime or 0, updateTime)
		Log.Info("Loaded realm data (%s)", SecondsToTime(time() - updateTime).." ago")
	end
	if realmScanStat then
		local loadedData, updateTime = private.LoadAppData(realmScanStat)
		for field in pairs(loadedData.fieldLookup) do
			assert(not private.realmData[field])
			private.realmData[field] = loadedData
		end
		Log.Info("Loaded realm scan stat (%s)", SecondsToTime(time() - updateTime).." ago")
	end
	if realmHistorical then
		local loadedData, updateTime = private.LoadAppData(realmHistorical)
		for field in pairs(loadedData.fieldLookup) do
			assert(not private.realmData[field])
			private.realmData[field] = loadedData
		end
		Log.Info("Loaded realm historical (%s)", SecondsToTime(time() - updateTime).." ago")
	end
	if regionCommodity then
		local loadedData, updateTime = private.LoadAppData(regionCommodity)
		if realmData then
			-- Merge items into existing realmData
			local existing = private.realmData[next(loadedData.fieldLookup)]
			assert(Table.Equal(existing.fieldLookup, loadedData.fieldLookup))
			for itemString, data in pairs(loadedData.itemLookup) do
				if existing.itemLookup[itemString] then
					error("Duplicate data for item: "..tostring(itemString))
				end
				existing.itemLookup[itemString] = data
			end
		else
			for field in pairs(loadedData.fieldLookup) do
				assert(not private.realmData[field])
				private.realmData[field] = loadedData
			end
		end
		Log.Info("Loaded region commodity (%s)", SecondsToTime(time() - updateTime).." ago")
	end
	if regionStat then
		local loadedData, updateTime = private.LoadAppData(regionStat)
		for field in pairs(loadedData.fieldLookup) do
			assert(not private.regionData[field])
			private.regionData[field] = loadedData
		end
		private.regionUpdateTime = updateTime
		Log.Info("Loaded region stat (%s)", SecondsToTime(time() - updateTime).." ago")
	end
	if regionHistorical then
		local loadedData, updateTime = private.LoadAppData(regionHistorical)
		for field in pairs(loadedData.fieldLookup) do
			assert(not private.regionData[field])
			private.regionData[field] = loadedData
		end
		Log.Info("Loaded region historical (%s)", SecondsToTime(time() - updateTime).." ago")
	end
	if regionSale then
		local loadedData, updateTime = private.LoadAppData(regionSale)
		for field in pairs(loadedData.fieldLookup) do
			assert(not private.regionData[field])
			private.regionData[field] = loadedData
		end
		Log.Info("Loaded region sale (%s)", SecondsToTime(time() - updateTime).." ago")
	end

	-- Pre-fetch item info for items currently on the AH
	if private.realmData.minBuyout then
		for itemString in pairs(private.realmData.minBuyout.itemLookup) do
			ItemInfo.FetchInfo(itemString)
		end
	end
	if TSM.db.factionrealm.internalData.auctionDBScanTime > 0 then
		private.LoadSVRealmData()
	end
	if not private.realmUpdateTime then
		Log.PrintfUser(L["TSM doesn't currently have any AuctionDB pricing data for your realm. We recommend you download the TSM Desktop Application from %s to automatically update your AuctionDB data (and auto-backup your TSM settings)."], Log.ColorUserAccentText("https://tradeskillmaster.com"))
	end

	CustomPrice.OnSourceChange("DBMarket")
	CustomPrice.OnSourceChange("DBMinBuyout")
	CustomPrice.OnSourceChange("DBHistorical")
	CustomPrice.OnSourceChange("DBRecent")
	CustomPrice.OnSourceChange("DBRegionMarketAvg")
	CustomPrice.OnSourceChange("DBRegionHistorical")
	CustomPrice.OnSourceChange("DBRegionSaleAvg")
	CustomPrice.OnSourceChange("DBRegionSaleRate")
	CustomPrice.OnSourceChange("DBRegionSoldPerDay")
	collectgarbage()
end

function AuctionDB.OnDisable()
	if not private.didScan then
		return
	end

	local encodeContext = CSV.EncodeStart(CSV_KEYS)
	for itemString, data in pairs(private.scanRealmData) do
		CSV.EncodeAddRowDataRaw(encodeContext, itemString, data.minBuyout, data.marketValue, data.numAuctions, data.quantity, data.lastScan)
	end
	TSM.db.factionrealm.internalData.csvAuctionDBScan = CSV.EncodeEnd(encodeContext)
	TSM.db.factionrealm.internalData.auctionDBScanHash = Math.CalculateHash(TSM.db.factionrealm.internalData.csvAuctionDBScan)
end

function AuctionDB.GetAppDataUpdateTimes()
	return private.realmUpdateTime or 0, private.regionUpdateTime or 0
end

function AuctionDB.GetLastCompleteScanTime()
	local result = private.didScan and (private.scanRealmTime or 0) or (private.realmAppData.scanTime or 0)
	return result ~= 0 and result or nil
end

function AuctionDB.LastScanIteratorThreaded()
	wipe(private.lastScanTemp)
	local minBuyoutData = private.realmData.minBuyout
	local minBuyoutIndex = minBuyoutData.fieldLookup.minBuyout
	assert(minBuyoutIndex)
	local baseItems = Threading.AcquireSafeTempTable()
	for itemString in pairs(minBuyoutData.itemLookup) do
		local minBuyout = private.UnpackData(minBuyoutData, itemString)[minBuyoutIndex]
		itemString = ItemString.Get(itemString)
		local baseItemString = ItemString.GetBaseFast(itemString)
		if baseItemString ~= itemString then
			baseItems[baseItemString] = true
		end
		if minBuyout and minBuyout > 0 then
			private.lastScanTemp[itemString] = min(private.lastScanTemp[itemString] or math.huge, minBuyout)
		end
		Threading.Yield()
	end

	-- remove the base items since they would be double-counted with the specific variants
	for itemString in pairs(baseItems) do
		private.lastScanTemp[itemString] = nil
	end
	Threading.ReleaseSafeTempTable(baseItems)

	return pairs(private.lastScanTemp)
end

function AuctionDB.LastScanIteratorThreaded() --改
	local itemNumAuctions = Threading.AcquireSafeTempTable()
	local itemMinBuyout = Threading.AcquireSafeTempTable()
	local baseItems = Threading.AcquireSafeTempTable()

	local lastScanTime = AuctionDB.GetLastCompleteScanTime()
	for itemString, data in pairs(private.didScan and private.scanRealmData or private.realmAppData.itemOffset) do
		if not private.didScan or data.lastScan >= lastScanTime then
			itemString = ItemString.Get(itemString)
			local baseItemString = ItemString.GetBaseFast(itemString)
			if baseItemString ~= itemString then
				baseItems[baseItemString] = true
			end
			local numAuctions, minBuyout = nil, nil
			if private.didScan then
				numAuctions = data.numAuctions
				minBuyout = data.minBuyout
			else
				numAuctions = private.realmAppData.data[data * private.realmAppData.numFields + private.realmAppData.fieldOffset.numAuctions]
				minBuyout = private.realmAppData.data[data * private.realmAppData.numFields + private.realmAppData.fieldOffset.minBuyout]
			end
			itemNumAuctions[itemString] = (itemNumAuctions[itemString] or 0) + numAuctions
			if minBuyout and minBuyout > 0 then
				itemMinBuyout[itemString] = min(itemMinBuyout[itemString] or math.huge, minBuyout)
			end
		end
		Threading.Yield()
	end

	-- remove the base items since they would be double-counted with the specific variants
	for itemString in pairs(baseItems) do
		itemNumAuctions[itemString] = nil
		itemMinBuyout[itemString] = nil
	end
	Threading.ReleaseSafeTempTable(baseItems)

	-- convert the remaining items into a list
	local itemList = Threading.AcquireSafeTempTable()
	itemList.numAuctions = itemNumAuctions
	itemList.minBuyout = itemMinBuyout
	for itemString in pairs(itemNumAuctions) do
		tinsert(itemList, itemString)
	end
	return Table.Iterator(itemList, private.LastScanIteratorHelper, itemList, private.LastScanIteratorCleanup)
end

function AuctionDB.GetRealmItemData(itemString, key)
	return private.GetItemDataHelper(private.realmData[key], key, itemString)
end

function AuctionDB.GetRealmItemData(itemString, key) --改
	local realmData = nil
	if private.didScan and (key == "minBuyout" or key == "numAuctions" or key == "lastScan") then
		-- always use scanRealmData for minBuyout/numAuctions/lastScan if we've done a scan
		realmData = private.scanRealmData
	elseif private.realmAppData.numFields then
		-- use app data
		return private.GetRealmAppItemDataHelper(private.realmAppData, key, itemString)
	else
		realmData = private.scanRealmData
	end
    --marketValue
	return private.GetItemDataHelper(realmData, key, itemString)
end

function AuctionDB.GetRegionItemData(itemString, key)
	local result = private.GetItemDataHelper(private.regionData[key], key, itemString)
	if key == "regionSalePercent" or key == "regionSoldPerDay" then
		result = result and (result / 1000) or nil
	end
	return result
end

function AuctionDB.RunScan()
	if private.isScanning then
		return
	end
	if not private.ahOpen then
		Log.PrintUser('拍卖行未打开')
		return
	end
	local canScan, canGetAllScan = CanSendAuctionQuery()
	if not canScan then
		Log.PrintUser('当前正在运行其他扫描,请稍后再试')
		return
	elseif not canGetAllScan then
		Log.PrintUser("扫描冷却中. 请小退以重置冷却.")
		return
	end
	if not TSM.UI.AuctionUI.StartingScan("FULL_SCAN") then
		return
	end
	Log.PrintUser("开始扫描. 扫描可能导致游戏卡顿甚至崩溃. 扫描可能需要1-2分钟")
	Threading.Start(private.scanThreadId)
	private.isScanning = true
end

-- ============================================================================
-- Scan Thread
-- ============================================================================

function private.ScanThread()
	assert(not private.auctionScan)

	-- run the scan
	local auctionScan = AuctionScan.GetManager()
		:SetResolveSellers(false)
	private.auctionScan = auctionScan
	local query = auctionScan:NewQuery()
		:SetGetAll(true)
	if not auctionScan:ScanQueriesThreaded() then
		Log.PrintUser("扫描失败.")
		return
	end

	-- process the results
	Log.PrintfUser("处理扫描结果...")
	wipe(private.scanRealmData)
	private.scanRealmTime = time()
	TSM.db.factionrealm.internalData.auctionDBScanTime = time()
	TSM.db.factionrealm.internalData.csvAuctionDBScan = ""
	local numScannedAuctions = 0
	local subRows = Threading.AcquireSafeTempTable()
	local subRowSortValue = Threading.AcquireSafeTempTable()
	local itemBuyouts = Threading.AcquireSafeTempTable()
	for baseItemString, row in query:BrowseResultsIterator() do
		wipe(subRows)
		wipe(subRowSortValue)
		for _, subRow in row:SubRowIterator() do
			local _, itemBuyout = subRow:GetBuyouts()
			tinsert(subRows, subRow)
			subRowSortValue[subRow] = itemBuyout
		end
		Table.SortWithValueLookup(subRows, subRowSortValue, false, true)

		wipe(itemBuyouts)
		for _, subRow in ipairs(subRows) do
			local _, itemBuyout = subRow:GetBuyouts()
			local quantity, numAuctions = subRow:GetQuantities()
			numScannedAuctions = numScannedAuctions + numAuctions
			for _ = 1, numAuctions do
				private.ProcessScanResultItem(baseItemString, itemBuyout, quantity)
			end
			if itemBuyout > 0 then
				for _ = 1, quantity * numAuctions do
					tinsert(itemBuyouts, itemBuyout)
				end
			end
		end

		local data = private.scanRealmData[baseItemString]
		data.marketValue = private.CalculateItemMarketValue(itemBuyouts, data.quantity)
		assert(data.minBuyout == 0 or data.marketValue >= data.minBuyout)
		Threading.Yield()
	end
	Threading.ReleaseSafeTempTable(subRows)
	Threading.ReleaseSafeTempTable(subRowSortValue)
	Threading.ReleaseSafeTempTable(itemBuyouts)
	Threading.Yield()

	collectgarbage()
	Log.PrintfUser("全局扫描完成(共"..tostring(numScannedAuctions).."拍卖)!")
	private.didScan = true
	CustomPrice.OnSourceChange("DBMinBuyout")
end

function private.ScanThreadCleanup()
	private.isScanning = false
	if private.auctionScan then
		private.auctionScan:Release()
		private.auctionScan = nil
	end
	TSM.UI.AuctionUI.EndedScan("FULL_SCAN")
end

function private.ProcessScanResultItem(itemString, itemBuyout, stackSize)
	private.scanRealmData[itemString] = private.scanRealmData[itemString] or { numAuctions = 0, quantity = 0, minBuyout = 0 }
	local data = private.scanRealmData[itemString]
	data.lastScan = time()
	if itemBuyout > 0 then
		data.minBuyout = min(data.minBuyout > 0 and data.minBuyout or math.huge, itemBuyout)
		data.quantity = data.quantity + stackSize
	end
	data.numAuctions = data.numAuctions + 1
end

function private.CalculateItemMarketValue(itemBuyouts, quantity)
	assert(#itemBuyouts == quantity)
	if quantity == 0 then
		return 0
	end

	-- calculate the average of the lowest 15-30% of auctions
	local total, num = 0, 0
	local lowBucketNum = max(floor(quantity * 0.15), 1)
	local midBucketNum = max(floor(quantity * 0.30), 1)
	local prevItemBuyout = 0
	for i = 1, midBucketNum do
		local itemBuyout = itemBuyouts[i]
		if num < lowBucketNum or itemBuyout < prevItemBuyout * 1.2 then
			num = num + 1
			total = total + itemBuyout
		end
		prevItemBuyout = itemBuyout
	end
	local avg = total / num

	-- calculate the stdev of the auctions we used in the average
	local stdev = nil
	if num > 1 then
		local stdevSum = 0
		for i = 1, num do
			local itemBuyout = itemBuyouts[i]
			stdevSum = stdevSum + (itemBuyout - avg) ^ 2
		end
		stdev = sqrt(stdevSum / (num - 1))
	else
		stdev = 0
	end

	-- calculate the market value as the average of all data within 1.5 stdev of our previous average
	local minItemBuyout = avg - stdev * 1.5
	local maxItemBuyout = avg + stdev * 1.5
	local avgTotal, avgCount = 0, 0
	for i = 1, num do
		local itemBuyout = itemBuyouts[i]
		if itemBuyout >= minItemBuyout and itemBuyout <= maxItemBuyout then
			avgTotal = avgTotal + itemBuyout
			avgCount = avgCount + 1
		end
	end
	return avgTotal > 0 and floor(avgTotal / avgCount) or 0
end


-- ============================================================================
-- Private Helper Functions
-- ============================================================================

function private.LoadSVRealmData()
	local decodeContext = CSV.DecodeStart(TSM.db.factionrealm.internalData.csvAuctionDBScan, CSV_KEYS)
	if not decodeContext then
		Log.Err("Failed to decode records")
		return
	end
	for itemString, minBuyout, marketValue, numAuctions, quantity, lastScan in CSV.DecodeIterator(decodeContext) do
		private.scanRealmData[itemString] = {
			minBuyout = tonumber(minBuyout),
			marketValue = tonumber(marketValue),
			numAuctions = tonumber(numAuctions),
			quantity = tonumber(quantity),
			lastScan = tonumber(lastScan),
		}
	end
	if not CSV.DecodeEnd(decodeContext) then
		Log.Err("Failed to decode records")
	end
	private.scanRealmTime = TSM.db.factionrealm.internalData.auctionDBScanTime
end

function private.LoadAppData(appData)
	-- Extract the metadata from the start of the string
	local metadataEndIndex, dataStartIndex = strfind(appData, ",data={")
	local itemData = strsub(appData, dataStartIndex + 1, -3)
	local metadataStr = strsub(appData, 1, metadataEndIndex - 1).."}"
	local metadata = assert(loadstring(metadataStr))()

	local result = { fieldLookup = {}, itemLookup = {} }
	assert(metadata.fields[1] == "itemString")
	for i = 2, #metadata.fields do
		result.fieldLookup[metadata.fields[i]] = i - 1
	end

	for itemString, otherData in gmatch(itemData, "{\"?([^,\"]+)\"?,([^}]+)}") do
		if tonumber(itemString) then
			itemString = "i:"..itemString
		end
		result.itemLookup[itemString] = otherData
	end

	return result, metadata.downloadTime
end

function private.GetItemDataHelper(tbl, key, itemString)
	if not itemString or not tbl then
		return nil
	end
	local fieldIndex = tbl.fieldLookup[key]
	if not fieldIndex then
		return nil
	end
	itemString = ItemString.Filter(itemString)
	if not tbl.itemLookup[itemString] and not strmatch(itemString, "^[ip]:[0-9]+$") then
		-- first try to get the data for the level itemString (if there is an explicit one)
		local levelItemString = ItemString.ToLevel(itemString)
		levelItemString = ItemString.IsLevel(levelItemString) and levelItemString or nil
		if levelItemString and tbl.itemLookup[levelItemString] then
			itemString = levelItemString
		else
			-- try the base item
			itemString = private.GetBaseItemHelper(itemString)
			if not itemString then
				return nil
			end
		end
	end
	local data = private.UnpackData(tbl, itemString)
	local value = data and data[fieldIndex] or 0
	return value > 0 and value or nil
end

function private.GetItemDataHelper(tbl, key, itemString) --改
	if not itemString or not tbl then
		return nil
	end
	itemString = ItemString.Filter(itemString)
	local value = nil
	if not tbl[itemString] and not strmatch(itemString, "^[ip]:[0-9]+$") then
		-- first try to get the data for the level itemString (if there is an explicit one)
		local levelItemString = ItemString.ToLevel(itemString)
		levelItemString = ItemString.IsLevel(levelItemString) and levelItemString or nil
		if levelItemString and tbl[levelItemString] then
			itemString = levelItemString
		else
			-- try the base item
			itemString = private.GetBaseItemHelper(itemString)
		end
	end
	if not itemString or not tbl[itemString] then
		return nil
	end
	value = tbl[itemString][key]
	return (value or 0) > 0 and value or nil
end

function private.GetBaseItemHelper(itemString)
	local quality = ItemInfo.GetQuality(itemString)
	local itemLevel = ItemInfo.GetItemLevel(itemString)
	local classId = ItemInfo.GetClassId(itemString)
	if quality and quality >= 2 and itemLevel and itemLevel >= TSM.CONST.MIN_BONUS_ID_ITEM_LEVEL and (classId == Enum.ItemClass.Weapon or classId == Enum.ItemClass.Armor) then
		if strmatch(itemString, "^i:[0-9]+:[0-9%-]*:") then
			return nil
		end
	end
	return ItemString.GetBaseFast(itemString)
end

function private.UnpackData(tbl, itemString)
	local data = tbl.itemLookup[itemString]
	if type(data) ~= "string" then
		return data
	end
	-- Need to unpack the data
	local tblData = {strsplit(",", data)}
	for i = 1, #tblData do
		local val = tblData[i]
		if #val > 6 then
			-- tonumber only works for 32-bit values, so need to cut the value in half
			val = tonumber(strsub(val, -6), 32) + tonumber(strsub(val, 1, -7), 32) * (2 ^ 30)
		else
			val = tonumber(val, 32)
		end
		tblData[i] = val
	end
	tbl.itemLookup[itemString] = tblData
	data = tblData
	return data
end

function private.OnAuctionHouseShow()
	private.ahOpen = true
	if not select(2, CanSendAuctionQuery()) then
		return
	elseif (AuctionDB.GetLastCompleteScanTime() or 0) > time() - 60 * 60 * 2 then
		-- the most recent scan is from the past 2 hours
		return
	elseif (TSM.db.factionrealm.internalData.auctionDBScanTime or 0) > time() - 60 * 60 * 24 then
		-- this user has contributed a scan within the past 24 hours
		return
	end
	StaticPopupDialogs["TSM_AUCTIONDB_SCAN"] = StaticPopupDialogs["TSM_AUCTIONDB_SCAN"] or {
		text = "TSM没有AuctionDB数据. 是否需要进行全局扫描?",
		button1 = YES,
		button2 = NO,
		timeout = 0,
		OnAccept = AuctionDB.RunScan,
	}
	Wow.ShowStaticPopupDialog("TSM_AUCTIONDB_SCAN")
end

function private.OnAuctionHouseClosed()
	private.ahOpen = false
end