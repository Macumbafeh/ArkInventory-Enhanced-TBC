	
ArkInventory.Const.MoneyTypeInfo = { }

ArkInventory.Const.MoneyTypeInfo["PLAYER"] = {

	OnloadFunc = function( moneyFrame )
	
		if not moneyFrame then
			moneyFrame = this
		end
		
		moneyFrame.events = { "PLAYER_MONEY", "PLAYER_TRADE_MONEY", "SEND_MAIL_MONEY_CHANGED", "SEND_MAIL_COD_CHANGED" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function()
		return GetMoney() - GetCursorMoney() - GetPlayerTradeMoney()
	end,

	PickupFunc = function( amount )
		PickupPlayerMoney( amount )
	end,

	DropFunc = function()
		DropCursorMoney()
	end,

	collapse = 1,
	canPickup = 1,
	showSmallerCoins = "Backpack"

}

ArkInventory.Const.MoneyTypeInfo["STATIC"] = {

	UpdateFunc = function( moneyFrame )
	
		if not moneyFrame then
			moneyFrame = this
		end
		
		moneyFrame.events = { }

		return moneyFrame.staticMoney
		
	end,

	collapse = 1,
	
}

ArkInventory.Const.MoneyTypeInfo["GUILDBANK"] = {

	OnloadFunc = function( moneyFrame )
	
		if not moneyFrame then
			moneyFrame = this
		end

		moneyFrame.events = { "GUILDBANK_UPDATE_MONEY" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end
		
	end,

	UpdateFunc = function()
		return GetGuildBankMoney() - GetCursorMoney()
	end,

	PickupFunc = function( amount )
		PickupGuildBankMoney( amount )
	end,

	DropFunc = function()
		DropCursorMoney()
	end,

	collapse = 1,
	
}

ArkInventory.Const.MoneyTypeInfo["GUILDBANKWITHDRAW"] = {

	OnloadFunc = function( moneyFrame )
	
		if not moneyFrame then
			moneyFrame = this
		end
		
		moneyFrame.events = { "GUILDBANK_UPDATE_WITHDRAWMONEY" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function()
		GuildBankFrame_UpdateWithdrawMoney()
		return nil
	end,

	collapse = 1,
	showSmallerCoins = "Backpack",
	
}

ArkInventory.Const.MoneyTypeInfo["GUILD_REPAIR"] = {

	OnloadFunc = function( moneyFrame )
	
		if not moneyFrame then
			moneyFrame = this
		end
		
		moneyFrame.events = { }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function( moneyFrame )

		if not moneyFrame then
			moneyFrame = this
		end

		return moneyFrame.staticMoney
		
	end,

	collapse = 1,
	showSmallerCoins = "Backpack",
	
}

ArkInventory.Const.MoneyTypeInfo["AUCTION"] = {

	OnloadFunc = function( moneyFrame )
	
		if not moneyFrame then
			moneyFrame = this
		end
		
		moneyFrame.events = { }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function( moneyFrame )
	
		if not moneyFrame then
			moneyFrame = this
		end

		return moneyFrame.staticMoney
		
	end,
	
	showSmallerCoins = "Backpack",
	fixedWidth = 1,
	collapse = 1,
	truncateSmallCoins = nil,
	
}

ArkInventory.Const.MoneyTypeInfo["PLAYER_TRADE"] = {

	OnloadFunc = function( moneyFrame )
	
		if not moneyFrame then
			moneyFrame = this
		end
		
		moneyFrame.events = { "PLAYER_TRADE_MONEY" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function()
		return GetPlayerTradeMoney()
	end,

	PickupFunc = function( amount )
		PickupTradeMoney( amount )
	end,

	DropFunc = function()
		AddTradeMoney()
	end,

	collapse = 1,
	canPickup = 1,
	
}

ArkInventory.Const.MoneyTypeInfo["TARGET_TRADE"] = {

	OnloadFunc = function( moneyFrame )
	
		if not moneyFrame then
			moneyFrame = this
		end
		
		moneyFrame.events = { "TRADE_MONEY_CHANGED" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function()
		return GetTargetTradeMoney()
	end,

	collapse = 1,
	
}

ArkInventory.Const.MoneyTypeInfo["SEND_MAIL"] = {

	OnloadFunc = function( moneyFrame )
	
		if not moneyFrame then
			moneyFrame = this
		end
		
		moneyFrame.events = { "SEND_MAIL_MONEY_CHANGED" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function()
		return GetSendMailMoney()
	end,

	PickupFunc = function( amount )
		PickupSendMailMoney( amount )
	end,

	DropFunc = function()
		AddSendMailMoney()
	end,

	collapse = nil,
	canPickup = 1,
	showSmallerCoins = "Backpack",
	
}

ArkInventory.Const.MoneyTypeInfo["SEND_MAIL_COD"] = {
	
	OnloadFunc = function( moneyFrame )
	
		if not moneyFrame then
			moneyFrame = this
		end
		
		moneyFrame.events = { "SEND_MAIL_COD_CHANGED" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function()
		return GetSendMailCOD()
	end,

	PickupFunc = function( amount )
		PickupSendMailCOD( amount )
	end,

	DropFunc = function()
		AddSendMailCOD()
	end,

	collapse = 1,
	canPickup = 1,
	
}

function ArkInventory.MoneyFrame_OnEvent( moneyFrame, event, ... )

	if not moneyFrame then
		moneyFrame = this
	end

	if not moneyFrame.info or not moneyFrame:IsVisible() then
		return
	end

	ArkInventory.MoneyFrame_UpdateMoney( moneyFrame )
	
end

function ArkInventory.SmallMoneyFrame_OnLoad( moneyFrame, moneyType )

	if not moneyFrame then
		moneyFrame = this
	end

	if not moneyType then
		moneyType = "PLAYER"
	end
	
	moneyFrame.small = 1
	
	ArkInventory.MoneyFrame_SetType( moneyFrame, moneyType )
	
end

function ArkInventory.MoneyFrame_SetType( moneyFrame, moneyType )
	
	if not moneyFrame then
		moneyFrame = this
	end
	
	local info = ArkInventory.Const.MoneyTypeInfo[moneyType]
	if not info then
		ArkInventory.Output( { "invalid moneyType [", moneyType, "] assigned to frame [", moneyFrame:GetName(), "], deafulting to PLAYER" } )
		info = ArkInventory.Const.MoneyTypeInfo["PLAYER"]
	end
	
	if moneyFrame.events then
		-- this money frame has already been used for something else so deregister the old events
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:UnregisterEvent( v )
		end
		
		moneyFrame.events = nil
		
	end

	moneyFrame.info = info
	moneyFrame.moneyType = moneyType
	
	-- register the events required
	if info.OnloadFunc then
		info.OnloadFunc( moneyFrame )
	end
	
	local frameName = moneyFrame:GetName()
	if info.canPickup then
		getfenv()[frameName .. "GoldButton"]:EnableMouse( true )
		getfenv()[frameName .. "SilverButton"]:EnableMouse( true )
		getfenv()[frameName .. "CopperButton"]:EnableMouse( true )
	else
		getfenv()[frameName .. "GoldButton"]:EnableMouse( false )
		getfenv()[frameName .. "SilverButton"]:EnableMouse( false )
		getfenv()[frameName .. "CopperButton"]:EnableMouse( false )
	end

	ArkInventory.MoneyFrame_UpdateMoney( moneyFrame )
	
end

function ArkInventory.MoneyFrame_UpdateMoney( moneyFrame )

	if not moneyFrame then
		moneyFrame = this
	end
	
	if not moneyFrame:IsVisible() then
		return
	end
	
	if moneyFrame.info then
	
		local moneyAmount = moneyFrame.info.UpdateFunc( moneyFrame )
		
		if moneyAmount then
			MoneyFrame_Update( moneyFrame:GetName(), moneyAmount )
		end
		
		if moneyFrame.hasPickup == 1 then
			UpdateCoinPickupFrame( moneyAmount )
		end
		
	else
	
		ArkInventory.Output( { "Error moneyType not set for moneyFrame [", moneyFrame:GetName(), "]" } )

	end
	
end

function ArkInventory.MoneyText( money )

	local c = money or 0
	
	local g = math.floor( money / COPPER_PER_GOLD )
	c = math.floor( money - g * COPPER_PER_GOLD )
	local s = math.floor( c / COPPER_PER_SILVER )
	c = math.floor( c - s * COPPER_PER_SILVER )
	
	local t = ""
	
	if g > 0 then
		t = string.format( "|cffffd100%dg|r ", g )
	end

	if s > 0 or ( g > 0 and c > 0 ) then
		t = string.format( "%s|cffe6e6e6%ds|r ", t, s )
	end
	
	if c > 0 then
		t = string.format( "%s|cffc8602c%dc|r", t, c )
	end
	
	return strtrim( t )

end
