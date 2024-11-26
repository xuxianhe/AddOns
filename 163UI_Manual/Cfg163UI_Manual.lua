
U1CoreAPI.RegisterAddOn("163UI_Manual", {
	title = "有爱手册",
	defaultEnable = 1,
	load = "NORMAL",
	tags = { "TAG_MANAGEMENT", },

	runBeforeLoad = function(info, name)
		U1CoreAPI.GetModule("Manual"):OnInitialize();
	end,
	
	{
		text = "显示/关闭界面",
		type = "button",
		callback = function(cfg, val, loading)
			U1CoreAPI.GetModule("Manual"):Toggle();
		end,
	},

})
