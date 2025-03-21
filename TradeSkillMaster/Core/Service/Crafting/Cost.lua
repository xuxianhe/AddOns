-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                          https://tradeskillmaster.com                          --
--    All Rights Reserved - Detailed license information included with addon.     --
-- ------------------------------------------------------------------------------ --

local TSM = select(2, ...) ---@type TSM
local Cost = TSM.Crafting:NewPackage("Cost") ---@type AddonPackage
local TempTable = TSM.LibTSMUtil:Include("BaseType.TempTable")
local Math = TSM.LibTSMUtil:Include("Lua.Math")
local OptionalMatData = TSM.LibTSMData:Include("OptionalMat")
local ItemString = TSM.LibTSMTypes:Include("Item.ItemString")
local CraftString = TSM.LibTSMTypes:Include("Crafting.CraftString")
local RecipeString = TSM.LibTSMTypes:Include("Crafting.RecipeString")
local MatString = TSM.LibTSMTypes:Include("Crafting.MatString")
local CustomString = TSM.LibTSMTypes:Include("CustomString")
local Profession = TSM.LibTSMService:Include("Profession")
local CraftingOperation = TSM.LibTSMSystem:Include("CraftingOperation")
local private = {
	settings = nil,
	matsVisited = {},
	matsTemp = {},
	matsTempInUse = false,
	currentMatProfession = nil,
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function Cost.OnInitialize(settingsDB)
	private.settings = settingsDB:NewView()
		:AddKey("factionrealm", "internalData", "mats")
		:AddKey("global", "craftingOptions", "defaultCraftPriceMethod")
		:AddKey("global", "craftingOptions", "defaultMatCostMethod")
end

function Cost.GetMatCost(itemString)
	itemString = ItemString.GetBaseFast(itemString)
	if not private.settings.mats[itemString] then
		return
	end
	if private.matsVisited[itemString] then
		-- There's a loop in the mat cost, so bail
		return
	end
	private.matsVisited[itemString] = true
	local priceStr = private.settings.mats[itemString].customValue or private.settings.defaultMatCostMethod
	local result = CustomString.GetValue(priceStr, itemString)
	private.matsVisited[itemString] = nil
	return result
end

function Cost.GetCraftingCostByCraftString(craftString, optionalMats, qualityMats)
	local releaseQualityMats = false
	if not qualityMats then
		qualityMats = TempTable.Acquire()
		releaseQualityMats = true
	end
	local cost = private.GetCraftingCostHelper(craftString, nil, optionalMats, qualityMats)
	if releaseQualityMats then
		TempTable.Release(qualityMats)
	end
	return cost
end

function Cost.GetCraftedItemValue(itemString)
	local hasCraftPriceMethod, craftPrice = CraftingOperation.GetCraftedItemValue(itemString)
	if hasCraftPriceMethod then
		return craftPrice
	end
	local value = CustomString.GetValue(private.settings.defaultCraftPriceMethod, itemString)
	return value
end

function Cost.GetProfitByCraftString(craftString)
	local _, _, profit = Cost.GetCostsByCraftString(craftString)
	return profit
end

function Cost.GetProfitByRecipeString(recipeString)
	local _, _, profit = Cost.GetCostsByRecipeString(recipeString)
	return profit
end

function Cost.GetCostsByCraftString(craftString)
	local craftingCost = Cost.GetCraftingCostByCraftString(craftString)
	local itemString = TSM.Crafting.GetItemString(craftString)
	local craftedItemValue = itemString and Cost.GetCraftedItemValue(itemString) or nil
	return craftingCost, craftedItemValue, craftingCost and craftedItemValue and (craftedItemValue - craftingCost) or nil
end

function Cost.GetCostsByRecipeString(recipeString)
	local craftString = CraftString.FromRecipeString(recipeString)
	local craftingCost = private.GetCraftingCostHelper(craftString, recipeString)
	local itemString = Cost.GetLevelItemString(recipeString)
	local craftedItemValue = itemString and Cost.GetCraftedItemValue(itemString) or nil
	return craftingCost, craftedItemValue, craftingCost and craftedItemValue and (craftedItemValue - craftingCost) or nil
end

function Cost.GetLevelItemString(recipeString)
	local itemString = TSM.Crafting.GetItemString(CraftString.FromRecipeString(recipeString))
	if not itemString then
		return nil
	end
	return Profession.GenerateResultItemString(recipeString, itemString)
end

function Cost.GetSaleRateByCraftString(craftString)
	local itemString = TSM.Crafting.GetItemString(craftString)
	return itemString and CustomString.GetSourceValue("DBRegionSaleRate", itemString) or nil
end

function Cost.GetLowestCostByItem(itemString, optionalMats, qualityMats)
	local levelItemString = ItemString.ToLevel(itemString)
	local shouldReleaseOptionalMats = false
	if not optionalMats then
		shouldReleaseOptionalMats = true
		optionalMats = TempTable.Acquire()
	end
	private.GetOptionalMats(itemString, optionalMats)
	local lowestCost, lowestCraftString = nil, nil
	local cdCost, cdSpellId = nil, nil
	local numSpells = 0
	local singleCraftString = nil
	local relItemLevel = nil
	local tempQualityMats = TempTable.Acquire()
	for _, craftString, hasCD, profession in TSM.Crafting.GetCraftStringByItem(levelItemString) do
		if not private.currentMatProfession or not OptionalMatData.Info[levelItemString] or private.currentMatProfession == profession then
			local level = CraftString.GetLevel(craftString)
			if level then
				level = level + Profession.GetOptionalMatLevelIncrease(optionalMats)
			end
			if level and not relItemLevel then
				local isAbs = nil
				relItemLevel, isAbs = ItemString.ParseLevel(ItemString.ToLevel(itemString))
				if isAbs then
					relItemLevel = nil
				end
			end
			if not level or OptionalMatData.ItemLevelByRank[level] == relItemLevel then
				if not hasCD then
					if singleCraftString == nil then
						singleCraftString = craftString
					elseif singleCraftString then
						singleCraftString = 0
					end
				end
				numSpells = numSpells + 1
				wipe(tempQualityMats)
				local cost = Cost.GetCraftingCostByCraftString(craftString, optionalMats, tempQualityMats)
				if cost and (not lowestCost or cost < lowestCost) then
					-- Exclude spells with cooldown if option to ignore is enabled and there is more than one way to craft
					if hasCD then
						cdCost = cost
						cdSpellId = craftString
					else
						if qualityMats then
							wipe(qualityMats)
							for k, v in pairs(tempQualityMats) do
								qualityMats[k] = v
							end
						end
						lowestCost = cost
						lowestCraftString = craftString
					end
				end
			end
		end
	end
	TempTable.Release(tempQualityMats)
	if shouldReleaseOptionalMats then
		TempTable.Release(optionalMats)
	end
	if singleCraftString == 0 then
		singleCraftString = nil
	end
	if numSpells == 1 and not lowestCost and cdCost then
		-- Only way to craft it is with a CD craft, so use that
		if qualityMats then
			-- TODO: This path isn't currently supported
			wipe(qualityMats)
		end
		lowestCost = cdCost
		lowestCraftString = cdSpellId
	end
	return lowestCost, lowestCraftString or singleCraftString
end



-- ============================================================================
-- Private Helper Functions
-- ============================================================================

function private.GetOptionalMats(itemString, resultTbl)
	ItemString.GetStatModifiers(itemString, true, resultTbl)
	for i = #resultTbl, 1, -1 do
		local statOptionalMat = nil
		for optionalMatItemString, info in pairs(OptionalMatData.Info) do
			if info.statModifier == resultTbl[i] then
				statOptionalMat = optionalMatItemString
				break
			end
		end
		if statOptionalMat then
			resultTbl[i] = statOptionalMat
		else
			tremove(resultTbl, i)
		end
	end
	local itemLevel = ItemString.GetItemLevel(itemString)
	if itemLevel then
		for optionalMatItemString, info in pairs(OptionalMatData.Info) do
			if info.absItemLevel == itemLevel then
				tinsert(resultTbl, optionalMatItemString)
				break
			end
		end
	end
	local relItemLevel, isAbs = ItemString.ParseLevel(ItemString.ToLevel(itemString))
	if not isAbs then
		local levelItemString = ItemString.ToLevel(itemString)
		for _, craftString in TSM.Crafting.GetCraftStringByItem(levelItemString) do
			local level = CraftString.GetLevel(craftString)
			if level and relItemLevel then
				for optionalMatItemString, info in pairs(OptionalMatData.Info) do
					if info.relItemLevels and info.relItemLevels[relItemLevel] and not info.ignored then
						tinsert(resultTbl, optionalMatItemString)
						relItemLevel = nil
						break
					end
				end
			end
		end
	end
end

function private.GetCraftingCostHelper(craftString, recipeString, optionalMats, qualityMats)
	local cost = 0
	local hasMats = false
	local mats = nil
	if private.matsTempInUse then
		mats = TempTable.Acquire()
	else
		mats = private.matsTemp
		private.matsTempInUse = true
		wipe(mats)
	end
	TSM.Crafting.GetMatsAsTable(craftString, mats)
	if recipeString then
		assert(not optionalMats)
		for _, _, itemId in RecipeString.OptionalMatIterator(recipeString) do
			local optionalMatItemString = ItemString.Get(itemId)
			local optionalMatItemId = ItemString.ToId(optionalMatItemString)
			local matchStr1 = "[:,]"..optionalMatItemId.."$"
			local matchStr2 = "[:,]"..optionalMatItemId..","
			for itemString, quantity in pairs(mats) do
				if (strmatch(itemString, matchStr1) or strmatch(itemString, matchStr2)) then
					mats[optionalMatItemString] = ((mats[optionalMatItemString] or 0) + 1) * quantity
					break
				end
			end
		end
	elseif TSM.Crafting.IsQualityCraft(craftString) then
		local canCraft = TSM.Crafting.Quality.GetOptionalMats(craftString, mats, qualityMats)
		if not canCraft then
			if mats == private.matsTemp then
				private.matsTempInUse = false
			else
				TempTable.Release(mats)
			end
			return nil
		end
		for _, itemString in ipairs(qualityMats) do
			mats[itemString] = mats[qualityMats[itemString]]
		end
	elseif optionalMats then
		for _, optionalMatItemString in pairs(optionalMats) do
			local optionalMatItemId = ItemString.ToId(optionalMatItemString)
			local matchStr1 = "[:,]"..optionalMatItemId.."$"
			local matchStr2 = "[:,]"..optionalMatItemId..","
			for itemString, quantity in pairs(mats) do
				if (strmatch(itemString, matchStr1) or strmatch(itemString, matchStr2)) then
					mats[optionalMatItemString] = ((mats[optionalMatItemString] or 0) + 1) * quantity
					break
				end
			end
		end
	end
	local didSetProfession = false
	if not private.currentMatProfession then
		private.currentMatProfession = TSM.Crafting.GetProfession(craftString)
		didSetProfession = true
	end
	for itemString, quantity in pairs(mats) do
		if MatString.GetType(itemString) == MatString.TYPE.NORMAL then
			hasMats = true
			local matCost = CustomString.GetSourceValue("MatPrice", itemString)
			if not matCost then
				cost = nil
			elseif cost then
				cost = cost + matCost * quantity
			end
		end
	end
	if didSetProfession then
		private.currentMatProfession = nil
	end
	if mats == private.matsTemp then
		private.matsTempInUse = false
	else
		TempTable.Release(mats)
	end
	if not cost or not hasMats then
		return nil
	end
	cost = Math.Round(cost / TSM.Crafting.GetNumResult(craftString))
	return cost > 0 and cost or nil
end
