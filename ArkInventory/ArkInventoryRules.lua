local Rule = {
	Item = false,
	Execute = { }, -- rule functions
	Entry = { }, -- database functions
}

function ArkInventory.RuleItemAdd( rulenum, h )

	local r = ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data[rulenum]
	if not r then
		return
	end
	
	local id = ArkInventory.ItemGetInternalString( h )
	
	r.formula = string.format( "%s or id( %s )", r.formula, id )
	r["enabled"] = ArkInventory.db.profile.option.rule[rulenum]
	
	ArkInventory.RuleEntryEdit( rulenum, r )
	
end

function ArkInventory.RuleAppliesToItem( rulenum, i )

	local ra = ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data[rulenum]
	local rp = ArkInventory.db.profile.option.rule[rulenum]
	
	if not i or not ra or ra.damaged or not rp then
		return false, nil
	end
	
	if ra.compiled == ""  then
		return false, "not compiled"
	end
	
	local p, eor = loadstring( ra.compiled, "Error in rule " .. rulenum .. " [" .. ra.name .. "]" )

	if not p then
		return nil, eor
	end
	
	Rule.Item = i
	
	setfenv( p, Rule.Environment )
	local ok, eor = pcall( p )
	
	if not ok then
		return nil, eor
	else
		return eor, nil
	end
	
end

function Rule.Execute.Soulbound()

	if Rule.Item.sb then
		return true
	end

	return false
	
end

function Rule.Execute.Empty()

	if not Rule.Item.h or strtrim( Rule.Item.h ) == "" then
		return true
	end

	return false
	
end

function Rule.Execute.ItemId( t )

	if not Rule.Item.h or not t or strtrim( t ) == "" then return false end
	
	for w in t:gmatch( ArkInventory.Localise["RULE_PATTERN_SEP"] ) do
		
		w = strtrim( w ) .. ":"
		local e = string.sub( ArkInventory.ItemGetInternalString( Rule.Item.h ) .. ":", 1, string.len( w ) )
	
		if w == e then
			return true
		end
		
	end
	
	return false
	
end

function Rule.Execute.ItemType( t )

	if not Rule.Item.h or not t or strtrim( t ) == "" then return false end
	
	local e = string.lower( select( 6, GetItemInfo( Rule.Item.h ) ) or "" )
	
	if e ~= "" then
	
		for w in t:gmatch( ArkInventory.Localise["RULE_PATTERN_SEP"] ) do
		
			if e == string.lower( strtrim( w ) ) then
				return true
			end
			
		end
		
	end
	
	return false
	
end

function Rule.Execute.ItemSubType( t )

	if not Rule.Item.h or not t or strtrim( t ) == "" then return false end
	
	local e = string.lower( select( 7, GetItemInfo( Rule.Item.h ) ) or "" )
	
	if e ~= "" then
	
		for w in t:gmatch( ArkInventory.Localise["RULE_PATTERN_SEP"] ) do
		
			if e == string.lower( strtrim( w ) ) then
				return true
			end
			
		end
		
	end
	
	return false
	
end

function Rule.Execute.ItemEquipLocation( t )

	if not Rule.Item.h then return false end
	
	local e = strtrim( select( 9, GetItemInfo( Rule.Item.h ) ) or "" )
	if string.len( e ) > 1 then
		e = getfenv()[e]
	end
	e = string.lower( strtrim( e ) )
	
	local t = string.lower( strtrim( t ) )
	
	if e ~= "" then
	
		if t == "" then
		
			-- no tokens so just check if item can be equipped
			if e == "" then
				return false
			else
				return true
			end
		
		else
		
			for w in t:gmatch( ArkInventory.Localise["RULE_PATTERN_SEP"] ) do
			
				if e == strtrim( w ) then
					return true
				end
				
			end
			
		end
		
	end
	
	return false
	
end

function Rule.Execute.ItemName( t )

	if not Rule.Item.h or not t or strtrim( t ) == "" then return false end
	
	local e = string.lower( ArkInventory.ItemGetName( Rule.Item.h ) or "" )
	local t = string.lower( strtrim( t ) )
	
	for w in string.gmatch( t, ArkInventory.Localise["RULE_PATTERN_SEP"] ) do

		if string.find( e, strtrim( w ) ) then
			return true
		end
			
	end
	
	return false
	
end

function Rule.Execute.ItemQuality( t )

	if not Rule.Item.h or not t or strtrim( t ) == "" then return false end
	
	local t = string.lower( strtrim( t ) )
	for z in pairs( ITEM_QUALITY_COLORS ) do
		if z >= 0 then
			local d = getfenv()[string.format( "ITEM_QUALITY%d_DESC", z )]
			local q = string.lower( d or tostring( z ) )
			t = string.gsub( t, q, tostring( z ) )
		end
	end

	for w in t:gmatch( ArkInventory.Localise["RULE_PATTERN_SEP"] ) do
	
		w = strtrim( w )
		
		if w == tostring( Rule.Item.q or -2 ) then
			return true
		end

	end
	
	return false
	
end

function Rule.Execute.ItemLevelStat( t )

	if not Rule.Item.h or not t or strtrim( t ) == "" then return false end
	
	local level = select( 4, GetItemInfo( Rule.Item.h ) ) or 0
	
	local v = { }
	for w in t:gmatch( ArkInventory.Localise["RULE_PATTERN_SEP"] ) do
		table.insert( v, strtrim( w ) )
	end

	local imin = v[1] or "0"
	local imax = v[2] or v[1] or "0"
	
	imin = tonumber( imin ) or 0
	imax = tonumber( imax ) or imin
	
	if level >= imin and level <= imax then
		return true
	end

	return false
	
end

function Rule.Execute.ItemLevelUse( t )

	if not Rule.Item.h or not t or strtrim( t ) == "" then return false end
	
	local level = select( 5, GetItemInfo( Rule.Item.h ) ) or 0
	
	local v = { }
	for w in t:gmatch( ArkInventory.Localise["RULE_PATTERN_SEP"] ) do
		table.insert( v, strtrim( w ) )
	end

	local imin = v[1] or "0"
	local imax = v[2] or v[1] or "0"
	
	imin = tonumber( imin ) or 0
	imax = tonumber( imax ) or imin
	
	if level >= imin and level <= imax then
		return true
	end
	
	return false

end

function Rule.Execute.PeriodicTable( t )

	if not Rule.Item.h or not t or strtrim( t ) == "" then return false end
	
	return ArkInventory.PT_ItemInSets( Rule.Item.h, t )
	
end

function Rule.Execute.Tooltip( t )

	local i = Rule.Item
	
	if not i or not i.h or i.bag_id == nil or i.slot_id == nil or not t or strtrim( t ) == "" then return false end
	
	if i.test_rule then
	
		ArkInventory.Global.Tooltip.Rule:SetHyperlink( i.h )
	
	else

		-- tooltip is also used offline mode
		if ArkInventory.Global.Location[i.loc_id].isOffline then
			ArkInventory.Global.Tooltip.Rule:SetHyperlink( i.h )
		else
			local bliz_id = ArkInventory.BagID_Blizzard( i.loc_id, i.bag_id )
			ArkInventory.Global.Tooltip.Rule:SetItem( bliz_id, i.slot_id )
		end
		
	end

	local t = string.lower( strtrim( t ) )

	for w in t:gmatch( ArkInventory.Localise["RULE_PATTERN_SEP"] ) do

		if ArkInventory.Global.Tooltip.Rule:Contains( strtrim( w ) ) then
			return true
		end
	
	end
	
	return false

end

function Rule.Execute.Outfit( t )

	if not Rule.Item.h then return false end
	
	if IsAddOnLoaded( "Outfitter" ) and Outfitter.Initialized then
		return Rule.Execute.OutfitOutfitter( t, Rule.Item.h )
	elseif IsAddOnLoaded( "ItemRack" ) then
		return Rule.Execute.OutfitItemRack( t, Rule.Item.h )
	elseif IsAddOnLoaded( "ClosetGnome" ) then
		return Rule.Execute.OutfitClosetGnome( t, Rule.Item.h )
	end
	
	return false

end

function Rule.Execute.OutfitOutfitter( t, h )

	if not h or not IsAddOnLoaded( "Outfitter" ) or not Outfitter.Initialized then
		return false
	end
	
	local ItemInfo = Outfitter_GetItemInfoFromLink( h )
	
	if not ItemInfo then
		return false
	end
	
	--if 1 == 1 then return false end
	
	local Outfits = Outfitter_GetOutfitsUsingItem( ItemInfo )
	
	if not Outfits or next( Outfits ) == nil then return false end
	
	if not t or strtrim( t ) == "" then
		-- nil t means is it in any outfit
		return true
	end
	
	for w in t:gmatch( ArkInventory.Localise["RULE_PATTERN_SEP"] ) do

		for _, o in pairs( Outfits ) do
			if string.lower( strtrim( o.Name ) ) == string.lower( strtrim( w ) ) then
				return true
			end
		end
		
	end
	
	return false

end

function Rule.Execute.OutfitClosetGnome( t, h )

	if not h or not IsAddOnLoaded( "ClosetGnome" ) then
		return false
	end

	local Outfits = { }	
	
	if ClosetGnome.GetOutfitsUsingItem then
	
		Outfits = { ClosetGnome:GetOutfitsUsingItem( h ) }

	else

		for n in pairs( ClosetGnome.db.char.set ) do
			for s, v in pairs( ClosetGnome.db.char.set[n] ) do
				if v == h then
					tinsert( Outfits, strtrim( n ) )
					break
				end
			end
		end
		
	end

	
	if not Outfits or next( Outfits ) == nil then return false end
	
	if not t or strtrim( t ) == "" then
		-- nil t means is it in any outfit
		return true
	end

	for w in t:gmatch( ArkInventory.Localise["RULE_PATTERN_SEP"] ) do

		for _, o in pairs( Outfits ) do
			if string.lower( o ) == string.lower( strtrim( w ) ) then
				return true
			end
		end
	
	end
	
	return false
	
end

function Rule.Execute.OutfitItemRack( t, h )

	-- item rack 2.1

	if not h or not IsAddOnLoaded( "ItemRack" ) then return false end
	
	local id = string.match( h or "", "item:(.+):%-?%d+" ) or 0
	
	local Outfits = { }
	
	for setname, set in pairs( ItemRackUser.Sets ) do
		--ArkInventory.Output( { "setname=[", setname, "]" } )
		for k, setitem in pairs( set.equip ) do
			--ArkInventory.Output( { "pos=[", k, "], item=[", setitem, "], id=[", id, "]" } )
			if id == setitem and string.sub( setname, 1, 1 ) ~= "~" then
				tinsert( Outfits, strtrim( setname ) )
				--ArkInventory.Output( { "added set [", setname, "] for item [", id, "]" } )
				break
			end
		end
	end
	
	if not Outfits or next( Outfits ) == nil then return false end
	
	if not t or strtrim( t ) == "" then
		-- nil t means is it in any outfit
		return true
	end

	for w in t:gmatch( ArkInventory.Localise["RULE_PATTERN_SEP"] ) do

		for _, o in pairs( Outfits ) do
			if string.lower( o ) == string.lower( strtrim( w ) ) then
				return true
			end
		end
	
	end
	
	return false

end

function Rule.Execute.ItemVendorPriceUnder( t )
	return Rule.Execute.ItemVendorPrice( 1, t )
end

function Rule.Execute.ItemVendorPriceOver( t )
	return Rule.Execute.ItemVendorPrice( 0, t )
end

function Rule.Execute.ItemVendorPrice( opt, t )

	if not Rule.Item.h or not t or strtrim( t ) == "" then return false end
	
	local price_per = GetSellValue( Rule.Item.h )
	
	if price_per == nil then
	
		--ArkInventory.Output( { "item=[", Rule.Item.h, "], nil sell value" } )
		return false
		
	elseif price_per > 0 then
	
		local count = Rule.Item.count or 1
		local price = price_per * count
	
		local v = tonumber( t )
		if type( v ) == "number" then
		
			if opt == 1 then
				
				--ArkInventory.Output( { "[", count, "] x [", Rule.Item.h, "] = [", price, "], under=[", v, "]" } )
				
				if price <= v then
					return true
				end
				
			else
			
				--ArkInventory.Output( { "[", count, "] x [", Rule.Item.h, "] = [", price, "], over=[", v, "]" } )
			
				if price >= v then
					return true
				end
				
			end
		
		end
	
	end
	
	return false
	
end

function Rule.Execute.CharacterLevelRange( t )

	-- ( levels below, levels above )

	if not Rule.Item.h or not t or strtrim( t ) == "" then return false end

	local clevel = UnitLevel( "player" )
	local ilevel = select( 5, GetItemInfo( Rule.Item.h ) ) or clevel
	
	local t = strtrim( t )

	local v_below = strmatch( t, "^(%d+)" )
	if not v_below then
		error( "invalid argument " .. t )
	end
	
	local v_above = strmatch( t, v_below .. "[^%d]-(%d+)" )
	if not v_above then
		-- single value
		v_above = v_below
	end

	v_below = clevel - tonumber( v_below ) or 0
	v_above = clevel + tonumber( v_above ) or 0
	
	if ilevel >= v_below and ilevel <= v_above then
		return true
	end
	
	return false
	
end

function Rule.Execute.BagNumber( t )

	if not Rule.Item.bag_id or not t or strtrim( t ) == "" then return false end

	t = string.lower( strtrim( t ) )
	
	if t == "bag" or t == string.lower( ArkInventory.Localise["LOCATION_BAG"] ) then
		t = table.concat( ArkInventory.Global.Location[ArkInventory.Const.Location.Bag].Bags, "," )
	elseif t == "bank" or t == string.lower( ArkInventory.Localise["LOCATION_BANK"] ) then
		t = table.concat( ArkInventory.Global.Location[ArkInventory.Const.Location.Bank].Bags, "," )
	elseif t == "key" or t == "keyring" or t == string.lower( KEYRING ) then
		t = table.concat( ArkInventory.Global.Location[ArkInventory.Const.Location.Key].Bags, "," )
	elseif t == "guild bank" or t == "vault" or t == string.lower( GUILD_BANK ) then
		t = table.concat( ArkInventory.Global.Location[ArkInventory.Const.Location.Vault].Bags, "," )
	end
	
	for w in t:gmatch( ArkInventory.Localise["RULE_PATTERN_SEP"] ) do
		if Rule.Item.bag_id == ( tonumber( w ) or -9999 ) then
			--ArkInventory.Output( { Rule.Item.bag_id, " = ", t } )
			return true
		end
	end
	
	--ArkInventory.Output( { Rule.Item.bag_id, " <> ", t } )
	return false
	
end

function Rule.Execute.Useable()

	if not Rule.Item.h then return false end
	
	ArkInventory.Global.Tooltip.Rule:SetHyperlink( Rule.Item.h )

	return ArkInventory.Global.Tooltip.Rule:CanUse()

end

function Rule.Execute.ItemCount( t )

	--ArkInventory.Output( "Rule.Execute.ItemCount" )

	if not Rule.Item.h or not t or strtrim( t ) == "" then return false end
	
	if Rule.Item.count >= tonumber( t ) then
		return true
	end
	
	return false
	
end

function Rule.Execute.ItemStacks( )

	--ArkInventory.Output( "Rule.Execute.ItemStacks" )
	
	if not Rule.Item.h then return false end
	
	if select( 8, ArkInventory.ItemInfoGet( Rule.Item.h ) ) > 1 then
		return true
	end
	
	return false
	
end




Rule.Environment = {
	soulbound=Rule.Execute.Soulbound,
	sb=Rule.Execute.Soulbound,
	--empty=Rule.Execute.Empty,
	id=Rule.Execute.ItemId,
	type=Rule.Execute.ItemType,
	itemtype=Rule.Execute.ItemType,
	subtype=Rule.Execute.ItemSubType,
	equip=Rule.Execute.ItemEquipLocation,
	name=Rule.Execute.ItemName,
	quality=Rule.Execute.ItemQuality,
	periodictable=Rule.Execute.PeriodicTable,
	pt=Rule.Execute.PeriodicTable,
	tooltip=Rule.Execute.Tooltip,
	tt=Rule.Execute.Tooltip,
	outfit=Rule.Execute.Outfit,
	itemlevel=Rule.Execute.ItemLevelStat,
	ilvl=Rule.Execute.ItemLevelStat,
	statlevel=Rule.Execute.ItemLevelStat,
	ireq=Rule.Execute.ItemLevelUse,
	uselevel=Rule.Execute.ItemLevelUse,
	clr=Rule.Execute.CharacterLevelRange,
	vpu=Rule.Execute.ItemVendorPriceUnder,
	vpo=Rule.Execute.ItemVendorPriceOver,
	bag=Rule.Execute.BagNumber,
	loc=Rule.Execute.BagNumber,
	use=Rule.Execute.Useable,
	useable=Rule.Execute.Useable,
	usable=Rule.Execute.Useable,
	count=Rule.Execute.ItemCount,
	stacks=Rule.Execute.ItemStacks,
}



function ArkInventory.Frame_Rules_Hide()
	ARKINV_Rules:Hide()
end
	
function ArkInventory.Frame_Rules_Show()
	ARKINV_Rules:Show()
end

function ArkInventory.Frame_Rules_Toggle()

	if ARKINV_Rules:IsVisible() then
		ArkInventory.Frame_Rules_Hide()
	else
		ArkInventory.Frame_Rules_Show()
	end
	
end

function ArkInventory.Frame_Rules_Paint()

	local frame = ARKINV_Rules

	-- scale
	frame:SetScale( ArkInventory.db.profile.option.ui.rules.scale or 1 )
	
	-- background
	
	-- border
	for _, z in pairs( { frame:GetChildren() } ) do
	
		if ArkInventory.db.profile.option.ui.rules.border.show then
		
			local default = "Tooltip"
		
			local file = ArkInventory.db.profile.option.ui.rules.border.file or ArkInventory.Const.Texture.Border[default].file
			local size = ArkInventory.db.profile.option.ui.rules.border.size or ArkInventory.Const.Texture.Border[default].size
			local scale = ArkInventory.db.profile.option.ui.rules.border.scale or 1
			z:SetBackdrop( { ["edgeFile"] = file, ["edgeSize"] = size * scale } )
			
			local colour = ArkInventory.db.profile.option.ui.rules.border.colour
			z:SetBackdropBorderColor( colour.r, colour.g, colour.b, 1 )
			
		else
		
			z:SetBackdrop( { ["edgeFile"] = "" } )
			
		end
		
	end

	
	-- font
	ArkInventory.SetFontFrame( frame, ArkInventory.db.profile.option.ui.rules.font.name )
	
	-- title
	obj = getfenv()[frame:GetName() .. "TitleWho"]

	t = string.format( "%s: %s %s", ArkInventory.Localise["MOD_MENU_MAIN_RULES"], ArkInventory.Const.Program.Name, ArkInventory.Global.Version )

	obj:SetText( t )
	
end

function ArkInventory.UiSetEditBoxLabel( arg1 )
	getfenv()[this:GetName() .. "Label"]:SetText( arg1 )
end

function ArkInventory.Frame_Rules_TabToNext( w_curr, w_prev, w_next )

	if not w_curr or not w_prev or not w_next then
		return
	end
	
	local f = this:GetName()
	f = string.sub( f, 1, string.len( f ) - string.len( w_curr ) )
	
	if IsShiftKeyDown() then
		f = f .. w_prev
	else
		f = f .. w_next
	end

	local w = getfenv()[f]
	if w then
		w:SetFocus()
	end

end


function ArkInventory.Frame_Rules_Build_Sort()

	local f = this:GetName()
	
	local x
	
	--enabled
	x = getfenv()[f .. "_T1"]
	x:ClearAllPoints()
	x:SetWidth( 32 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetPoint( "LEFT", 15, 0 )
	x:SetText( ArkInventory.Localise["MOD_FRAME_RULE_LIST_ENABLED"] )
	x:Show()

	--damaged
	x = getfenv()[f .. "_T2"]
	x:ClearAllPoints()
	x:SetWidth( 32 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetPoint( "LEFT", f .. "_T1", "RIGHT", 5, 0 )
	x:SetText( ArkInventory.Localise["MOD_FRAME_RULE_LIST_DAMAGED"] )
	x:Show()
	
	-- id
	x = getfenv()[f .. "_C1"]
	x:ClearAllPoints()
	x:SetWidth( 50 )
	x:SetPoint( "LEFT", f .. "_T2", "RIGHT", 5, 0 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetText( ArkInventory.Localise["MOD_FRAME_RULE_LIST_ID"] )
	x:Show()

	-- order
	x = getfenv()[f .. "_C2"]
	x:ClearAllPoints()
	x:SetWidth( 50 )
	x:SetPoint( "LEFT", f .. "_C1", "RIGHT", 5, 0 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetText( ArkInventory.Localise["MOD_FRAME_RULE_LIST_ORDER"] )
	x:Show()

	-- description
	x = getfenv()[f .. "_C3"]
	x:ClearAllPoints()
	x:SetPoint( "LEFT", f .. "_C2", "RIGHT", 5, 0 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetPoint( "RIGHT", -35, 0 )
	x:SetText( ArkInventory.Localise["MOD_FRAME_RULE_LIST_DESCRIPTION"] )
	x:Show()
	
end

function ArkInventory.Frame_Rules_Build_Row()

	local f = this:GetName()
	
	local x
	local sz = 18
	
	--enabled
	x = getfenv()[f .. "T1"]
	x:ClearAllPoints()
	x:SetWidth( sz )
	x:SetHeight( sz )
	x:SetPoint( "LEFT", 17, 0 )
	x:Show()

	--damaged
	x = getfenv()[f .. "T2"]
	x:ClearAllPoints()
	x:SetWidth( sz )
	x:SetHeight( sz )
	x:SetPoint( "LEFT", f .. "T1", "RIGHT", 19, 0 )
	x:Show()
	
	-- id
	x = getfenv()[f .. "C1"]
	x:ClearAllPoints()
	x:SetWidth( 50 )
	x:SetPoint( "LEFT", f .. "T2", "RIGHT", 12, 0 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetTextColor( 1, 1, 1, 1 )
	x:SetJustifyH( "CENTER", 0, 0 )
	x:Show()

	-- order
	x = getfenv()[f .. "C2"]
	x:ClearAllPoints()
	x:SetWidth( 50 )
	x:SetPoint( "LEFT", f .. "C1", "RIGHT", 5, 0 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetTextColor( 1, 1, 1, 1 )
	x:SetJustifyH( "CENTER", 0, 0 )
	x:Show()

	-- description
	x = getfenv()[f .. "C3"]
	x:ClearAllPoints()
	x:SetPoint( "LEFT", f .. "C2", "RIGHT", 5, 0 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetPoint( "RIGHT", -5, 0 )
	x:SetJustifyH( "LEFT", 0, 0 )
	x:Show()

end

function ArkInventory.Frame_Rules_Build_Table( f )

	if not f or type( f ) ~= "string" then f = this:GetName() end

	local p = getfenv()[f]
	if not p then
		ArkInventory.Output( { RED_FONT_COLOR_CODE, "OOPS: Invalid value at ArkInventory.Frame_Rules_Build_Table( [", f, "] )" } )
		return
	end
	
	local maxrows = tonumber( getfenv()[f .. "MaxRows"]:GetText() )
	local rows = maxrows
	local height = 24
	
	if rows > maxrows then rows = maxrows end
	getfenv()[f .. "NumRows"]:SetText( rows )
	
	if height == 0 then
		height = tonumber( getfenv()[f .. "RowHeight"]:GetText() )
	end
	getfenv()[f .. "RowHeight"]:SetText( height )

	-- stretch scrollbar to bottom row
	getfenv()[f .. "Scroll"]:SetPoint( "BOTTOM", f .. "Row" .. rows, "BOTTOM", 0, 0 )

	-- set frame height to correct size
	getfenv()[f]:SetHeight( height * rows + 20 )

end

function ArkInventory.Frame_Rules_Table_Row_OnClick()

	local f = this:GetName()
	
	-- ArkInventory.Print( "RuleTableClick( " .. f .. " )" )
	local parent = getfenv()[f]:GetParent():GetName()
	
	local cs = getfenv()[parent .. "SelectedRow"]:GetText()
	local ns = tostring( getfenv()[f]:GetID() )

	if ns == "0" then
		ArkInventory.Output( { "OOPS: widget [", f, "] has no ID allocated" } )
		return false
	end
	
	
	if IsShiftKeyDown() then
	
		-- shift click - enable/disable the rule
		id = tonumber( getfenv()[f .. "Id"]:GetText() )
		if id > 0 then
		
			if ArkInventory.db.profile.option.rule[id] then
			
				ArkInventory.db.profile.option.rule[id] = false
				ArkInventory.ItemCacheClear()
				ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
			
			else
		
				d = ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data[id]
				d["enabled"] = true
				ArkInventory.RuleEntryEdit( id, d )
				
			end
			
		end
	
		ArkInventory.Frame_Rules_Table_Refresh()
		
	else
	
		-- normal click - show/hide selected background
	
		if cs ~= "-1" then
			getfenv()[parent .. "Row" .. cs .. "Selected"]:Hide()
		end

		-- second click removes selection		
		if cs == ns then
			getfenv()[parent .. "SelectedRow"]:SetText( "-1" )
			getfenv()[parent .. "SelectedId"]:SetText( "-1" )
			return
		end
	
		getfenv()[parent .. "SelectedRow"]:SetText( ns )
		getfenv()[parent .. "SelectedId"]:SetText( getfenv()[f .. "Id"]:GetText() )
	
		getfenv()[f .. "Selected"]:Show()
		
	end

end

function ArkInventory.Frame_Rules_Table_Reset( f )

	if not f or type( f ) ~= "string" then f = this:GetName() end
	-- hide and reset all rows
	
	local t = f .. "Table"
	
	local h = tonumber( getfenv()[t .. "RowHeight"]:GetText() )
	local r = tonumber( getfenv()[t .. "NumRows"]:GetText() )

	getfenv()[t .. "SelectedRow"]:SetText( "-1" )
	for x = 1, r do
		getfenv()[t .. "Row" .. x .. "Selected"]:Hide()
		getfenv()[t .. "Row" .. x .. "Id"]:SetText( "-1" )
		getfenv()[t .. "Row" .. x]:Hide()
		getfenv()[t .. "Row" .. x]:SetHeight( h )
	end

end

function ArkInventory.Frame_Rules_Table_Refresh( f )

	if not f then
		f = this:GetParent():GetParent():GetParent():GetName()
	end
	
--	if type( f ) == "table" then
--		f = f:GetParent():GetParent():GetParent():GetName()
--	end
	
	-- ArkInventory.Print( "Frame_Rules_Table_Refresh( " .. ArkInventory.nilStringText( f ) .. " ), " .. this:GetName() )

	local p = getfenv()[f]
	if not p then
		ArkInventory.Output( { RED_FONT_COLOR_CODE, "OOPS: Invalid widget name at Frame_Rules_Table_Refresh( ", f, " )" } )
		return
	end
	
	f = f .. "View"
	
	local ft = f .. "Table"
	local fs = f .. "Search"

	local height = tonumber( getfenv()[ft .. "RowHeight"]:GetText() )
	local rows = tonumber( getfenv()[ft .. "NumRows"]:GetText() )

	local line
	local lineplusoffset
	
	ArkInventory.Frame_Rules_Table_Reset( f )

	-- collect all valid items
	local filter = getfenv()[fs .. "Filter"]:GetText()
	--ArkInventory.Print( "filter = [" .. filter .. "]" )

	local t = { }
	local tc = 0
	
	local ignore
	
	for k, d in pairs( ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data ) do

		-- ArkInventory.Print( "k = [" .. k .. "], order = [" .. d.order .. "], name = [" .. ArkInventory.nilStringEmpty( d.name ) .. "], formula = [" .. ArkInventory.nilStringEmpty( d.formula ) .. "]" )
	
		ignore = false
		
		if filter ~= "" then
			if not string.find( string.lower( d.name or "" ), string.lower( filter ) ) then
				ignore = true
			end
		end
		
--		if ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data[k].order < 0 then
--			ignore = true
--		end
		
		if not ArkInventory.db.global.option.showdisabled and not ArkInventory.db.profile.option.rule[k] then
			ignore = true
		end
		
		if not ignore then
			table.insert( t, { ["sorted"]=format( "%04i %04i", d.order or 0, k ), ["id"]=k, ["enabled"]=ArkInventory.db.profile.option.rule[k] or false, ["order"]=d.order or 0, ["name"]=d.name or "", ["formula"]=d.formula or "", ["damaged"]=d.damaged or false } )
			tc = tc + 1
		end

	end

	if tc == 0 then
		return
	end
	
	-- sort them by name
	table.sort( t, function( a, b ) return a.sorted < b.sorted end )

	FauxScrollFrame_Update( getfenv()[ft .. "Scroll"], tc, rows, height )
	
	local linename, c, r
	
	for line = 1, rows do

		linename = ft .. "Row" .. line
		
		lineplusoffset = line + FauxScrollFrame_GetOffset( getfenv()[ft .. "Scroll"] )

		if lineplusoffset <= tc then

			c = ""
			r = t[lineplusoffset]
			
			getfenv()[linename .. "Id"]:SetText( r.id )

			if r.enabled then
				getfenv()[linename .. "T1"]:SetTexture( "Interface\\Icons\\Spell_ChargePositive" )
			else
				getfenv()[linename .. "T1"]:SetTexture( "Interface\\Icons\\Spell_ChargeNegative" )
			end
			
			if r.damaged then
				getfenv()[linename .. "T2"]:SetTexture( "Interface\\Icons\\Spell_Shadow_DeathCoil" )
			else
				getfenv()[linename .. "T2"]:SetTexture( 0, 0, 0, 0 )
			end

			getfenv()[linename .. "C1"]:SetText( r.id )

			c = string.format( r.order )
			getfenv()[linename .. "C2"]:SetText( c )

			c = r.name
			if not c then c = "<not set>" end
			getfenv()[linename .. "C3"]:SetText( c )

			getfenv()[linename]:Show()
			
			-- show selected if id is scrolled into view
			if getfenv()[ft .. "SelectedId"]:GetText() == r.order then
				getfenv()[ft .. "SelectedRow"]:SetText( line )
				getfenv()[ft .. "Row" .. line .. "Selected"]:Show()
			end
			
		else
		
			getfenv()[linename .. "Id"]:SetText( "-1" )
			getfenv()[linename]:Hide()
			
		end
	end

	-- ~~~~ clean table t
	
end

function ArkInventory_Frame_Rules_Table_Refresh()
	ArkInventory.Frame_Rules_Table_Refresh()
end



function ArkInventory.RuleEntryCompile( d )

	d["compiled"] = ""
	
	if not d["formula"] then
		return
	end
	
	d.compiled = "return ( " .. d.formula .. " );"
	d.compiled = string.gsub( d.compiled, "[\r]", " " )
	d.compiled = string.gsub( d.compiled, "[\n]", " " )
	d.compiled = string.gsub( d.compiled, "%s+", " " )
	d.compiled = string.gsub( d.compiled, "(%a+)%((.-)%)", '%1("%2")' )
	
end

function ArkInventory.RuleEntryValid( d )

	if not d.formula or strtrim( d.formula ) == "" then
		return false, "Formula is empty"
	end
	
	ArkInventory.RuleEntryCompile( d )
	
	Rule.Item = { ["test_rule"]=true, ["bag_id"]=0, ["slot_id"]=1, ["count"]=1, ["q"]=1, ["sb"]=true, ["h"]="item:6948:0:0:0:0:0:0:0" } -- hearthstone
	
	local p, eor = loadstring( d.compiled, "Error in formula" )
	
	if not p then
		return false, eor
	end
	
	setfenv( p, Rule.Environment )
	local ok, eor = pcall( p )
	
	if not ok then
		return false, eor
	else
		return true
	end
	
end

function ArkInventory.RuleEntryFormat( d )

	if not d then
		return
	end
	
	local zOrder = 9999
	local zName = ""
	local zFormula = ""

	local x1 = tonumber( d["order"] )

	if x1 then
		zOrder = x1
	end

	if zOrder < 0 then
		zOrder = 9999
	end
	
	if zOrder > 9999 then
		zOrder = 9999
	end
	
	local x1 = d["name"]
	if x1 then
		zName = x1
	end

	local x1 = d["formula"]
	if x1 then
		zFormula = x1
	end

	d["damaged"] = false
	d["order"] = tonumber( zOrder )
	d["name"] = strtrim( tostring( zName ) )
	d["formula"] = string.gsub( strtrim( tostring( zFormula ) ), "[%a]-%(", string.lower )
	d.formula = string.gsub( d.formula, "%s+", " " )

	if d["enabled"] and ( d.enabled == 1 or d.enabled == true ) then
		d["enabled"] = true
	else
		d["enabled"] = false
	end

	return d
	
end

function ArkInventory.RuleEntryUpdate( k, d )

	k = tonumber( k )
	ArkInventory.RuleEntryFormat( d )

	-- increment the rule counter if this is a new rule
	if not ArkInventory.RuleEntryExists( k ) then
		ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].next = ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].next + 1
	end

	-- enable/disable the rule at the profile level
	if d.enabled then
		ArkInventory.db.profile.option.rule[k] = true
	else
		ArkInventory.db.profile.option.rule[k] = nil
	end
	d.enabled = nil
	
	-- save the rule data at the account level
	ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data[k] = d
	
	ArkInventory.ItemCacheClear()
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
	
end

function ArkInventory.RuleEntryValidate( k, d )

	if not k then
		return false, ArkInventory.Localise["RULE_FAILED_NIL_KEY"]
	end
	
	if not d then
		return false, ArkInventory.Localise["RULE_FAILED_NIL_DATA"]
	end

	ArkInventory.RuleEntryFormat( d )
	
	if d.name == "" then
		return false, ArkInventory.Localise["RULE_FAILED_NIL_DESCRIPTION"]
	end
	
	if d.formula == "" then
		return false, ArkInventory.Localise["RULE_FAILED_NIL_FORMULA"]
	end
	
	local ok, em = ArkInventory.RuleEntryValid( d )
	if not ok then
		d["damaged"] = true
		return false, em
	end

	return true

end

function ArkInventory.RuleEntryExists( k )

	if not k then
		error( "passed argument is nil" )
	end
	
	if ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data[tonumber( k )] then
		return true
	else
		return false
	end

end

function ArkInventory.RuleEntryAdd( k, d )
	
	local ok, msg = ArkInventory.RuleEntryValidate( k, d )
	if not ok then
		message( msg )
		return false
	end
	
	ArkInventory.RuleEntryUpdate( k, d )

	return true

end

function ArkInventory.RuleEntryEdit( k, d )

	local ok, msg = ArkInventory.RuleEntryValidate( k, d )
	if not ok then
		message( msg )
		return false
	end
	
	ArkInventory.RuleEntryUpdate( k, d )
	
	return true
	
end

function ArkInventory.RuleEntryRemove( k )

	if not k then
		error( "FAILED: key is nil" )
	end
	
	for k, v in pairs( ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data[tonumber( k )] ) do
		v = nil
	end
	ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data[tonumber( k )] = nil

	ArkInventory.ItemCacheClear()
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
	
	return true
	
end


function ArkInventory.Frame_Rules_Button_Modify( t )

	local f = this:GetParent():GetParent():GetParent():GetName()
	
	local fvt = f .. "ViewTable"

	local fm = f .. "Modify"
	local fmt = fm .. "Title"
	local fmd = fm .. "Data"

	getfenv()[fm .. "Type"]:SetText( t )

	local k = getfenv()[fvt .. "SelectedId"]:GetText()
	if not k then k = "-1" end
	if t == "A" then k = "-1" end

	local v
	
	if k ~= "-1" then
		local d = ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data[tonumber( k )]
		d["enabled"] = ArkInventory.db.profile.option.rule[tonumber( k )]
		getfenv()[fmd .. "Id"]:SetText( k )
		getfenv()[fmd .. "Enabled"]:SetChecked( d.enabled )
		getfenv()[fmd .. "Order"]:SetText( ArkInventory.nilStringEmpty( d.order ) )
		getfenv()[fmd .. "Description"]:SetText( ArkInventory.nilStringEmpty( d.name ) )
		getfenv()[fmd .. "ScrollFormula"]:SetText( ArkInventory.nilStringEmpty( d.formula ) )
	else
		getfenv()[fmd .. "Id"]:SetText( ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].next )
		getfenv()[fmd .. "Enabled"]:SetChecked( true )
		getfenv()[fmd .. "Order"]:SetText( "0" )
		getfenv()[fmd .. "Description"]:SetText( "" )
		getfenv()[fmd .. "ScrollFormula"]:SetText( "false" )
	end

	getfenv()[fmd .. "IdLabel"]:SetText( ArkInventory.Localise["MOD_FRAME_RULE_RULE"] .. ":"  )
	getfenv()[fmd .. "EnabledLabel"]:SetText( ArkInventory.Localise["MOD_FRAME_RULE_ENABLED"] .. ":"  )
	getfenv()[fmd .. "OrderLabel"]:SetText( ArkInventory.Localise["MOD_FRAME_RULE_ORDER"] .. ":"  )
	getfenv()[fmd .. "DescriptionLabel"]:SetText( ArkInventory.Localise["MOD_FRAME_RULE_DESCRIPTION"] .. ":"  )
	getfenv()[fmd .. "FormulaLabel"]:SetText( ArkInventory.Localise["MOD_FRAME_RULE_FORMULA"] .. ":" )
	
	getfenv()[fmd .. "Enabled"]:Show()
	getfenv()[fmd .. "Order"]:Show()
	getfenv()[fmd .. "Description"]:Show()
	getfenv()[fmd .. "ScrollFormula"]:Show()

	getfenv()[fmd .. "EnabledReadOnly"]:SetChecked( getfenv()[fmd .. "Enabled"]:GetChecked() )
	getfenv()[fmd .. "EnabledReadOnly"]:Hide()
	getfenv()[fmd .. "OrderReadOnly"]:SetText( getfenv()[fmd .. "Order"]:GetText() )
	getfenv()[fmd .. "OrderReadOnly"]:Hide()
	getfenv()[fmd .. "DescriptionReadOnly"]:SetText( getfenv()[fmd .. "Description"]:GetText() )
	getfenv()[fmd .. "DescriptionReadOnly"]:Hide()
	getfenv()[fmd .. "FormulaReadOnly"]:SetText( getfenv()[fmd .. "ScrollFormula"]:GetText() )
	getfenv()[fmd .. "FormulaReadOnly"]:Hide()

	if t == "R" then

		if k == "-1" then return end

		getfenv()[fmt .. "Text"]:SetText( string.upper( ArkInventory.Localise["MOD_FRAME_RULE_REMOVE"] ) )

		getfenv()[fmd .. "Enabled"]:Hide()
		getfenv()[fmd .. "EnabledReadOnly"]:Disable()
		getfenv()[fmd .. "EnabledReadOnly"]:Show()

		getfenv()[fmd .. "Order"]:Hide()
		getfenv()[fmd .. "OrderReadOnly"]:Show()

		getfenv()[fmd .. "Description"]:Hide()
		getfenv()[fmd .. "DescriptionReadOnly"]:Show()

		getfenv()[fmd .. "ScrollFormula"]:Hide()
		getfenv()[fmd .. "FormulaReadOnly"]:Show()

	elseif t == "E" then

		if k == "-1" then return end

		getfenv()[fmt .. "Text"]:SetText( string.upper( ArkInventory.Localise["MOD_FRAME_RULE_EDIT"] ) )

	elseif t == "A" then

		getfenv()[fmt .. "Text"]:SetText( string.upper( ArkInventory.Localise["MOD_FRAME_RULE_ADD"] ) )

	else
		ArkInventory.Output( { RED_FONT_COLOR_CODE, "OOPS: Uncoded argument ArkInventory.Frame_Rules_Button_Modify( ", t, " )" } )
		return
	end

	getfenv()[f .. "View"]:Hide()
	getfenv()[fm]:Show()

end

function ArkInventory.Frame_Rules_Button_Modify_Ok()

	local f = this:GetParent():GetParent():GetParent():GetParent():GetName()
	local fm = this:GetParent():GetParent():GetName()
	local fmd = fm .. "Data"
	
	local d = { }
	d["enabled"] = getfenv()[fmd .. "Enabled"]:GetChecked()
	d["order"] = getfenv()[fmd .. "Order"]:GetText()
	d["name"] = getfenv()[fmd .. "Description"]:GetText()
	d["formula"] = getfenv()[fmd .. "ScrollFormula"]:GetText()

	local k = getfenv()[fmd .. "Id"]:GetText()

	f = this:GetParent():GetParent():GetParent():GetName()
	fm = this:GetParent():GetParent():GetName()
	
	local t = getfenv()[fm .. "Type"]:GetText()

	if t =="A" then
		if not ArkInventory.RuleEntryAdd( k, d ) then return end
		getfenv()[f .. "ViewTableSelectedId"]:SetText( k )
	elseif t == "E" then
		if not ArkInventory.RuleEntryEdit( k, d, false ) then return end
	elseif t == "R" then
		if not ArkInventory.RuleEntryRemove( k ) then return end
		getfenv()[f .. "ViewTableSelectedId"]:SetText( "-1" )
	else
		ArkInventory.Output( { RED_FONT_COLOR_CODE, "OOPS: Uncoded value [", t, "] at ArkInventory.Frame_Rules_Button_Modify_Ok" } )
		return
	end

	getfenv()[fm]:Hide()
	getfenv()[f .. "View"]:Show()

end

function ArkInventory.Frame_Rules_Button_Modify_Cancel()

	f = this:GetParent():GetParent():GetParent():GetName()
	
	getfenv()[f .. "Modify"]:Hide()
	getfenv()[f .. "View"]:Show()

end


function ArkInventory.Frame_Rules_Button_View_Add()
	return ArkInventory.Frame_Rules_Button_Modify( "A" )
end

function ArkInventory.Frame_Rules_Button_View_Edit()
	return ArkInventory.Frame_Rules_Button_Modify( "E" )
end

function ArkInventory.Frame_Rules_Button_View_Remove()
	return ArkInventory.Frame_Rules_Button_Modify( "R" )
end




--[[

function Rule.Execute.SlotNumber( t )

	if not t or not n then return "false" end

	for w in t:gmatch( ArkInventory.Localise["RULE_PATTERN_SEP"] ) do
		if n == tonumber( w ) then
			return "true"
		end
	end
	
	return "false"
	
end

function Rule.Execute.BagType( t )

	if not t or not b then return "false" end

	bt = ArkInventory.BagGetType( b )
	
	for w in t:gmatch( ArkInventory.Localise["RULE_PATTERN_SEP"] ) do

		for k, v in pairs( ArkInventory.Const.Slot.Data ) do
			if v["type"] and string.lower( v.type ) == string.lower( strtrim( w ) ) then
				if bt == k then
					return "true"
				end
			end
		end
		
	end
	
	return "false"
	
end

]]--

