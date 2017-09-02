function ArkInventory.EraseSavedData( player_id, loc_id, silent )
	
	ArkInventory.Frame_Main_Hide( )
	
	for r, rd in pairs( ArkInventory.db.global.player.realm ) do
		for f, fd in pairs( rd.faction ) do
			for n, nd in pairs( fd.name ) do
				if player_id == nil or nd.info.player_id == player_id then
					for l, ld in pairs( nd.location ) do
						if loc_id == nil or l == loc_id then
						
							ld["slot_count"] = 0
							for b, bd in pairs( ld.bag ) do
								bd["status"] = ArkInventory.Const.Bag.Status.Unknown
								bd["texture"] = nil
								bd["h"] = nil
								bd["type"] = ArkInventory.Const.Slot.Type.Unknown
								bd["count"] = 0
								bd["empty"] = 0
								for s, sd in pairs( bd.slot ) do
									bd.slot[s] = nil
								end
							end
							
							--if not silent then
								ArkInventory.Output( { "Saved ", string.lower( ArkInventory.Global.Location[l].Name ), " data for ", nd.info.name, " has been erased" } )
							--end
							
						end
					end
				end
			end
		end	
	end
	
	--rescan everything
	for x in pairs( ArkInventory.Global.Location ) do
		ArkInventory.ScanLocation( x )
	end
	
end

function ArkInventory.Table.Sum( tbl, fcn )
	local r = 0
	for k, v in pairs( tbl ) do
		r = r + ( fcn( v ) or 0 )
	end
	return r
end

function ArkInventory.Table.Max( tbl, fcn )
	local r = nil
	for k, v in pairs( tbl ) do
		if not r then
			r = ( fcn( v ) or 0 )
		else
			if ( fcn( v ) or 0 ) > r then
				r = ( fcn( v ) or 0 )
			end
		end
	end
	return r
end

function ArkInventory.Table.Elements( tbl )
	-- #table only returns the number of elements where the table keys are numeric and does not take into account missing values
	local r = 0
	for _, _ in pairs( tbl ) do
		r = r + 1
	end
	return r
end

function ArkInventory.Table.Concat2( t, d )

	if type( t ) ~= "table" then
		return t
	end
	
	local n = { }
	
	for i in pairs( t ) do
	
		if t[i] ~= nil then
		
			local z = type( t[i] )
		
			if z == "table" then
				tinsert( n, "[" .. i .. "]={ " .. ArkInventory.Table.Concat2( t[i], ", " ) .. " }" )
				--tinsert( n, i .. "={table}" )
			elseif z == "boolean" then
				if t[i] then
					tinsert( n, "[" .. i .. "]=true" )
				else
					tinsert( n, "[" .. i .. "]=false" )
				end
			elseif z == "string" or z == "number" then
				tinsert( n, "[" .. i .. "]=" .. t[i] )
			else
				tinsert( n, "[" .. i .. "]=**" .. z .. "**" )
			end
			
		else
			tinsert( n, "[" .. i .. "]=nil" )
		end
		
	end

	if d then
		return table.concat( n, d )
	else
		return table.concat( n )
	end
	
end

function ArkInventory.Table.Concat( t, d )

	if type( t ) ~= "table" then
		return t
	end
	
	local n = { }
	
	local mx = 0
	for k, v in pairs( t ) do
		if k > mx then mx = k end
	end
	
	if mx == 0 then return "nil" end
	
	for i = 1, mx do
	
		if t[i] ~= nil then
		
			local z = type( t[i] )
	
			if z == "table" then
				tinsert( n, "{ " .. ArkInventory.Table.Concat2( t[i], ", " ) .. " }" )
				--tinsert( n, "{table}" )
			elseif z == "boolean" then
				if t[i] then
					tinsert( n, "true" )
				else
					tinsert( n, "false" )
				end
			elseif z == "string" or z == "number" then
				tinsert( n, t[i] )
			else
				tinsert( n, "**" .. z .. "**" )
			end
		else
			tinsert( n, "nil" )
		end
	end

	if d then
		return table.concat( n, d )
	else
		return table.concat( n )
	end
	
end

function ArkInventory.Table.Clean( tbl, key, full )

	-- tbl = table to be cleaned

	-- key = a specific key you want cleaned (nil for all keys)

	-- sub (true) = if a value is a table then clean it as well
	-- sub (false) = only clean the values from this table

	-- full (true) = if a value is a table then nil it as well
	-- full (false) = if a value is a table then leave the skeleton there
	
	if type( tbl ) ~= "table" then
		return
	end
	
	local sub = true
	
	for k, v in pairs( tbl ) do
		
		if key == nil or key == k then
		
			if type( v ) == "table" then
			
				if sub then
					--ArkInventory.Output( { "cleaning subtable ", k } )
					ArkInventory.Table.Clean( v, nil, full )
				end
				
				if full then
					--ArkInventory.Output( { "erasing subtable ", k } )
					tbl[k] = nil
				end
				
			else
			
				--ArkInventory.Output( { "erasing value ", k } )
				tbl[k] = nil

			end
			
		end
		
	end

end

function ArkInventory.spairs( tbl, comparator )

	if type( tbl ) ~= "table" then
		return
	end
	
	local sortedKeys = {}
	for k in pairs( tbl ) do
		tinsert( sortedKeys, k )
	end
	
	sort( sortedKeys, comparator )
	
	local i = 0
	local function _f( _s, _v )
		i = i + 1
		local k = sortedKeys[i]
		if k ~= nil then
			return k, tbl[k]
		end
	end
	
	return _f, nil, nil

end

function ArkInventory.ItemGetTexture( h )
	local x = select( 10, ArkInventory.ItemInfoGet( h ) )
	return x
end

function ArkInventory.ItemGetName( h )
	local x = select( 1, ArkInventory.ItemInfoGet( h ) )
	return x
end

function ArkInventory.ItemInfoGet( obj )

	if obj ~= nil then
	
		local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture = GetItemInfo( obj )
		
		if itemTexture == nil then
			itemTexture = GetItemIcon( obj )
		end
		
		return itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture
		
	end
	
end

function ArkInventory.PlayerInfoSet()
	
	--ArkInventory.Output( { "PlayerInfoSet()" } )
	
	local r = GetRealmName()
	local f, f2 = UnitFactionGroup( "player" )
	local n = UnitName( "player" )
	
	ArkInventory.Global.Me = ArkInventory.db.global.player.realm[r].faction[f].name[n]
	
	local p = ArkInventory.Global.Me.info
	
	p["realm"] = r
	p["faction"] = f
	p["faction_local"] = f2
	p["name"] = n
	
	p["player_id"] = ArkInventory.PlayerIDGenerate( r, f, n )
	
	-- WARNING, most of this stuff is not available upon first login, even when the mod gets to OnEnabled (ui reloads are fine), and some are not available on logout
	
	p["class_local"], p["class"] = UnitClass( "player" )
	p["level"] = UnitLevel( "player" )
	p["race_local"], p["race"] = UnitRace( "player" )
	p["gender"] = UnitSex( "player" )
	
	p["guild"] = GetGuildInfo( "player" )
	--ArkInventory.Output( { "IsInGuild=[", IsInGuild(), "], g=[", p.guild, "]" } )
	if p["guild"] then
		p["guild"] = GetGuildInfo( "player" )
		p["guild_id"] = ArkInventory.GuildIDGenerate( p.realm, p.faction, p.guild )
	else
		p["guild"] = nil
		p["guild_id"] = nil
	end
	
	local m = GetMoney()
	if m > 0 then  -- returns 0 on logout so dont wipe the current value
		p["money"] = m
	end
	
	if p.guild then
	
		local n = ArkInventory.Const.GuildTag .. p.guild
		local g = ArkInventory.db.global.player.realm[p.realm].faction[p.faction].name[n].info
		
		g["realm"] = p.realm
		g["faction"], g["faction_local"] = p.faction, p.faction_local
		g["name"] = n
		g["player_id"] = p.guild_id
		
		g["guild"] = p.guild
		g["guild_id"] = p.guild_id
		
		g["level"] = 0
		
		g["money"] = GetGuildBankMoney()
		
		g["class_local"], g["class"] = GUILD, "GUILD"
		
	end
	
	return p

end

function ArkInventory.PlayerInfoGet( id )
	
	if id == nil then
		return
	end
	
	local r, f, n = string.match( id, "(.+)!(.+)!(.+)" )
	if r and f and n then
		return ArkInventory.db.global.player.realm[r].faction[f].name[n]
	end
	
end

function ArkInventory.PlayerIDGenerate( r, f, n )
	return string.format( "%s!%s!%s", r, f, n )
end

function ArkInventory.GuildIDGenerate( r, f, g )
	--ArkInventory.Output( { "r=[", r, "], f=[", f, "], g=[", g, "]" } )
	return string.format( "%s!%s!+%s", r, f, g )
end


function ArkInventory:LISTEN_STORAGE_EVENT( msg, arg1, arg2, arg3, arg4 )

	--ArkInventory.Output( { GREEN_FONT_COLOR_CODE, "LISTEN_STORAGE_EVENT( ", arg1, ", ", arg2, ", ", arg3, ", ", arg4, " )" } )

	if arg1 == ArkInventory.Const.Event.BagUpdate then
		
		--ArkInventory.Output( { GREEN_FONT_COLOR_CODE, "BAG_UPDATE( ", arg2, ", ", [", arg4, "] )" } )
		ArkInventory.Frame_Main_Generate( arg2, arg4 )
		
	else
		
		ArkInventory.Output( { RED_FONT_COLOR_CODE, "Unknown Storage Event Code: ", arg1 } )
		
	end
	
end


function ArkInventory:LISTEN_PLAYER_ENTER()

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_PLAYER_ENTER" } )
	
	ArkInventory.PlayerInfoSet()
	
end

function ArkInventory:LISTEN_PLAYER_LEAVE()

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_PLAYER_LEAVE" } )
	
	ArkInventory.Frame_Main_Hide()
	
	ArkInventory.PlayerInfoSet()
	
end

function ArkInventory:LISTEN_PLAYER_MONEY()

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "PLAYER_MONEY" } )

	ArkInventory.PlayerInfoSet()
	
end

function ArkInventory:LISTEN_PLAYER_SKILLS()

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "SKILL_LINES_CHANGED" } )
	
	ArkInventory.SkillsUpdate()
	
end


function ArkInventory:LISTEN_COMBAT_ENTER()
	
	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_COMBAT_ENTER()" } )
	
	ArkInventory.Global.Mode.Combat = true
	
	if ArkInventory.db.global.option.auto.close.combat then
		ArkInventory.Frame_Main_Hide()
	end
	
end

function ArkInventory:LISTEN_COMBAT_LEAVE()
	
	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_COMBAT_LEAVE()" } )
	
	ArkInventory.Global.Mode.Combat = false
	
end


function ArkInventory:LISTEN_BAG_UPDATE_BUCKET( arg1 )

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_BAG_UPDATE_BUCKET( ", arg1, " )" } )
	
	-- arg1 = table in the format bag_id=true so we need to loop through them

	local bag_changed = false
	
	for k in pairs( arg1 ) do
		ArkInventory.Scan( k )
		if ArkInventory.BagID_Internal( k ) == ArkInventory.Const.Location.Bag then
			bag_changed = true
		end
	end

	-- re-scan empty bag slots to wipe their data - no events are triggered when you move a bag from one bag slot into an empty bag slot (for the empty slot, new slot is fine)
	if bag_changed then
		for _, bag_id in pairs( ArkInventory.Global.Location[ArkInventory.Const.Location.Bag].Bags ) do
			if GetContainerNumSlots( bag_id ) == 0 then
				ArkInventory.ScanBag( bag_id )
			end
		end
	end

	
 	-- instant sorting enabled
	for loc_id in pairs( ArkInventory.Global.Location ) do
		if ArkInventory.LocationOptionGet( loc_id, { "sort", "instant" } ) then
			ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
		end
	end
	
end

function ArkInventory:LISTEN_BAG_UPDATE( event, arg1 )
	
	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_BAG_UPDATE( ", arg1, " )" } )
	
	ArkInventory.RestackResume()
	
	ArkInventory:SendMessage( "LISTEN_BAG_UPDATE_BUCKET", arg1 )

end

function ArkInventory:LISTEN_BAG_LOCK( event, arg1, arg2 )

	ArkInventory.RestackResume()

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_BAG_LOCK( ", arg1, ",", arg2, " )" } )

	if not arg2 then
	
		-- inventory lock
		
		for bliz_id = 1, NUM_BAG_SLOTS do
			local slotName = string.format( "Bag%sSlot", bliz_id - 1 )
			if arg1 == GetInventorySlotInfo( slotName ) then
				local loc_id, bag_id = ArkInventory.BagID_Internal( bliz_id )
				ArkInventory.ObjectLockChanged( loc_id, bag_id, nil )
			end
		end
	
	else
	
		if arg1 == BANK_CONTAINER then
		
			local count = GetContainerNumSlots( BANK_CONTAINER )
	
			if arg2 <= count then
				-- item lock
				local loc_id, bag_id = ArkInventory.BagID_Internal( arg1 )
				ArkInventory.ObjectLockChanged( loc_id, bag_id, arg2 )
			else
				-- bag lock
				local loc_id, bag_id = ArkInventory.BagID_Internal( arg2 - count + NUM_BAG_SLOTS )
				ArkInventory.ObjectLockChanged( loc_id, bag_id, nil )
			end

		else
	
			-- item lock
			local loc_id, bag_id = ArkInventory.BagID_Internal( arg1 )
			ArkInventory.ObjectLockChanged( loc_id, bag_id, arg2 )
			
		end
	
	end

end

function ArkInventory:LISTEN_CHANGER_UPDATE_BUCKET( arg1 )

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_CHANGER_UPDATE_BUCKET( ", arg1, " )" } )
	
	-- arg1 = table in the format loc_id_id=true so we need to loop through them

	for k in pairs( arg1 ) do
		ArkInventory.Frame_Changer_Update( k )
	end
	
end


function ArkInventory:LISTEN_BANK_ENTER()

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_BANK_ENTER()" } )
	
	ArkInventory.Global.Mode.Bank = true
		
	local loc_id = ArkInventory.Const.Location.Bank
	
	ArkInventory.ScanLocation( loc_id )
	
	if ArkInventory.LocationIsControlled( loc_id ) then
		ArkInventory.Frame_Main_Show( loc_id )
	end

	if ArkInventory.db.global.option.auto.open.bank and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Show( ArkInventory.Const.Location.Bag )
	end

end

function ArkInventory:LISTEN_BANK_LEAVE()

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_BANK_LEAVE()" } )
	
	ArkInventory.Global.Mode.Bank = false
	
	local loc_id = ArkInventory.Const.Location.Bank

	if not ArkInventory.LocationIsSaved( loc_id ) then
		ArkInventory.EraseSavedData( ArkInventory.Global.Me.info.player_id, loc_id, true )
	end
	
	if ArkInventory.db.global.option.auto.close.bank then
		ArkInventory.Frame_Main_Hide( loc_id )
		ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
	else
		-- refresh the bank window so it shows offline
		ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	end
	
end

function ArkInventory:LISTEN_BANK_UPDATE( event, arg1 )

	-- player changed a bank bag or item

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_BANK_UPDATE( ", arg1, " ) " } )

	local count = GetContainerNumSlots( BANK_CONTAINER )
	
	if arg1 <= count then
		-- item was changed
		ArkInventory:SendMessage( "LISTEN_BAG_UPDATE_BUCKET", BANK_CONTAINER )
	else
		-- bag was changed
		ArkInventory:SendMessage( "LISTEN_BAG_UPDATE_BUCKET", arg1 - count + NUM_BAG_SLOTS )
	end
	
end

function ArkInventory:LISTEN_BANK_SLOT()

	-- player just purchased a bank bag slot
	
	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_BANK_SLOT()" } )
	
	for x = NUM_BAG_SLOTS + 1, NUM_BAG_SLOTS + NUM_BANKBAGSLOTS do
		ArkInventory:SendMessage( "LISTEN_BAG_UPDATE_BUCKET", x )
	end

end


function ArkInventory:LISTEN_VAULT_ENTER()

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_VAULT_ENTER" } )

	ArkInventory.Global.Mode.Vault = true
	
	local loc_id = ArkInventory.Const.Location.Vault

	ArkInventory.PlayerInfoSet()

	for bag_id in ipairs( ArkInventory.Global.Location[loc_id].Bags ) do
		ArkInventory.ScanVaultHeader( bag_id )
	end
	
	--SetCurrentGuildBankTab( 1 )
	QueryGuildBankTab( GetCurrentGuildBankTab() or 1 )
	
	
	local cp = ArkInventory.Global.Me

	if ArkInventory.LocationIsControlled( loc_id ) then
		ArkInventory.Frame_Main_Show( loc_id )
	end
	
	if ArkInventory.db.global.option.auto.open.vault and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Show( ArkInventory.Const.Location.Bag )
	end
	
end

function ArkInventory:LISTEN_VAULT_LEAVE()

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_VAULT_LEAVE" } )
	
	ArkInventory.Global.Mode.Vault = false

	local loc_id = ArkInventory.Const.Location.Vault

	if not ArkInventory.LocationIsSaved( loc_id ) then
		ArkInventory.EraseSavedData( ArkInventory.Global.Me.info.player_id, loc_id, true )
	end
	
	if ArkInventory.db.global.option.auto.close.vault then
		ArkInventory.Frame_Main_Hide( loc_id )
		ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
	else
		-- refresh the vault window so it shows offline
		ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	end

end

function ArkInventory:LISTEN_VAULT_UPDATE_BUCKET()
	
	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_VAULT_UPDATE_BUCKET( )" } )
	
	local loc_id = ArkInventory.Const.Location.Vault

	ArkInventory.ScanVault()

	ArkInventory.LocationSetValue( loc_id, "resort", true )

	--ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	
end

function ArkInventory:LISTEN_VAULT_RESTACK_BUCKET()
	
	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_VAULT_RESTACK_BUCKET( )" } )
	
	ArkInventory.RestackResume()
	
end

function ArkInventory:LISTEN_VAULT_UPDATE()

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_VAULT_UPDATE()" } )
	
	ArkInventory:SendMessage( "LISTEN_VAULT_UPDATE_BUCKET" )
	ArkInventory:SendMessage( "LISTEN_VAULT_RESTACK_BUCKET" )

end

function ArkInventory:LISTEN_VAULT_LOCK()

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_VAULT_LOCK()" } )
	
	ArkInventory.RestackResume()
	
	local loc_id = ArkInventory.Const.Location.Vault
	local bag_id = GetCurrentGuildBankTab()
	
	for slot_id = 1, ArkInventory.Global.Location[loc_id].maxSlot[bag_id] or 0 do
		ArkInventory.ObjectLockChanged( loc_id, bag_id, slot_id )
	end

end

function ArkInventory:LISTEN_VAULT_MONEY()

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_VAULT_MONEY" } )

	local loc_id = ArkInventory.Const.Location.Vault
	
	ArkInventory.PlayerInfoSet()
	
end

function ArkInventory:LISTEN_VAULT_TABS()

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_VAULT_TABS" } )
	
	for tab_id = 1, MAX_GUILDBANK_TABS do
		ArkInventory.ScanVaultHeader( tab_id )
	end

end

function ArkInventory:LISTEN_VAULT_LOG()

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_VAULT_LOG" } )
	
	ArkInventory.Frame_Vault_Log_Update()
	
end



function ArkInventory:LISTEN_INVENTORY_CHANGE_BUCKET()
	
	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_INVENTORY_CHANGE_BUCKET( )" } )
	
	local loc_id = ArkInventory.Const.Location.Wearing
	
	ArkInventory.ScanLocation( loc_id )
	
end

function ArkInventory:LISTEN_INVENTORY_CHANGE( event, arg1, arg2 )
	
	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_INVENTORY_CHANGE( ", arg1, ", ", arg2, " ) " } )

	if arg1 == "player" then
		ArkInventory:SendMessage( "LISTEN_INVENTORY_CHANGE_BUCKET" )
	end
	
end


function ArkInventory:LISTEN_MAIL_ENTER()
	
	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "MAIL_SHOW" } )
	
	local loc_id = ArkInventory.Const.Location.Mail
	
	ArkInventory.Global.Mode.Mail = true
	
	if ArkInventory.db.global.option.auto.open.mail and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Show( ArkInventory.Const.Location.Bag )
	end
	
end

function ArkInventory:LISTEN_MAIL_LEAVE()

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "MAIL_CLOSED" } )
	
	local loc_id = ArkInventory.Const.Location.Mail
	
	ArkInventory.Global.Mode.Mail = false
	
	if not ArkInventory.LocationIsSaved( loc_id ) then
		ArkInventory.EraseSavedData( ArkInventory.Global.Me.info.player_id, loc_id, true )
	end

	if ArkInventory.db.global.option.auto.close.mail and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
	end
	
end

function ArkInventory:LISTEN_MAIL_UPDATE_BUCKET()

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_MAIL_UPDATE_BUCKET" } )

	local loc_id = ArkInventory.Const.Location.Mail
	
	ArkInventory.ScanLocation( loc_id )
	
	ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
	
end

function ArkInventory:LISTEN_MAIL_UPDATE()

	ArkInventory.RestackResume()

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "MAIL_UPDATE" } )
	
	ArkInventory:SendMessage( "LISTEN_MAIL_UPDATE_BUCKET" )
	
end


function ArkInventory:LISTEN_TRADE_ENTER()

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_TRADE_ENTER" } )
	
	if ArkInventory.db.global.option.auto.open.trade and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Show( ArkInventory.Const.Location.Bag )
	end
	
end

function ArkInventory:LISTEN_TRADE_LEAVE()

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_TRADE_LEAVE" } )
	
	if ArkInventory.db.global.option.auto.close.trade then
		ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
	end
	
end


function ArkInventory:LISTEN_AUCTION_ENTER()

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_AUCTION_ENTER" } )
	
	if ArkInventory.db.global.option.auto.open.auction and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Show( ArkInventory.Const.Location.Bag )
	end
	
end

function ArkInventory:LISTEN_AUCTION_LEAVE()

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_AUCTION_LEAVE" } )
	
	if ArkInventory.db.global.option.auto.close.auction then
		ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
	end
	
end


function ArkInventory:LISTEN_MERCHANT_ENTER()

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_MERCHANT_ENTER" } )
	
	ArkInventory.Global.Mode.Merchant = true
	
	if ArkInventory.db.global.option.auto.open.merchant and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Show( ArkInventory.Const.Location.Bag )
	end

	ArkInventory.VendorPriceScan()
	
end

function ArkInventory:LISTEN_MERCHANT_LEAVE()

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "LISTEN_MERCHANT_LEAVE" } )
	
	ArkInventory.Global.Mode.Merchant = false
	
	if ArkInventory.db.global.option.auto.close.merchant then
		ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
	end
	
end








function ArkInventory.BagID_Blizzard( loc_id, bag_id )

	-- converts internal location+bag codes into blizzzard bag ids
	
	if loc_id == nil or bag_id == nil then
		return nil
	end
	
	return ArkInventory.Global.Location[loc_id].Bags[bag_id]

end

function ArkInventory.BagID_Internal( bliz_id )

	-- converts blizzard bag codes into storage location+bag ids

	if bliz_id == nil then
		return nil, nil
	end
	
	for loc_id, loc in pairs( ArkInventory.Global.Location ) do
		for bag_id, v in pairs( loc.Bags ) do
			if bliz_id == v then
				return loc_id, bag_id
			end
		end
	end

	return nil, nil
	
end

function ArkInventory.BagType( bliz_id )

	local loc_id = ArkInventory.BagID_Internal( bliz_id )
	if loc_id == nil then
		return ArkInventory.Const.Slot.Type.Unknown
	end

	if bliz_id == KEYRING_CONTAINER then
		return ArkInventory.Const.Slot.Type.Key
	elseif bliz_id == BANK_CONTAINER or bliz_id == BACKPACK_CONTAINER then
		return ArkInventory.Const.Slot.Type.Bag
	end

	if loc_id == ArkInventory.Const.Location.Vault then
		return ArkInventory.Const.Slot.Type.Bag
	elseif loc_id == ArkInventory.Const.Location.Mail then
		return ArkInventory.Const.Slot.Type.Mail
	elseif loc_id == ArkInventory.Const.Location.Wearing then
		return ArkInventory.Const.Slot.Type.Wearing
	end
	
	local h = GetInventoryItemLink( "player", ContainerIDToInventoryID( bliz_id ) )
	
	if h then
	
		local t, s = select( 6, ArkInventory.ItemInfoGet( h ) )

		if t == ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER"] then
		
			if s == ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_BAG"] then
				return ArkInventory.Const.Slot.Type.Bag
			elseif s == ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_ENCHANTING"] then
				return ArkInventory.Const.Slot.Type.Enchanting
			elseif s == ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_ENGINEERING"] then
				return ArkInventory.Const.Slot.Type.Engineering
			elseif s == ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_GEM"] then
				return ArkInventory.Const.Slot.Type.Gem
			elseif s == ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_HERB"] then
				return ArkInventory.Const.Slot.Type.Herb
			elseif s == ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_INSCRIPTION"] then
				return ArkInventory.Const.Slot.Type.Inscription
			elseif s == ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_LEATHERWORKING"] then
				return ArkInventory.Const.Slot.Type.Leatherworking
			elseif s == ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_MINING"] then
				return ArkInventory.Const.Slot.Type.Mining
			elseif s == ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_SOULSHARD"] then
				return ArkInventory.Const.Slot.Type.Soulshard
			end
			
		elseif t == ArkInventory.Localise["WOW_ITEM_TYPE_QUIVER"] then
		
			if s == ArkInventory.Localise["WOW_ITEM_TYPE_QUIVER_ARROW"] then
				return ArkInventory.Const.Slot.Type.Arrow
			elseif s == ArkInventory.Localise["WOW_ITEM_TYPE_QUIVER_BULLET"] then
				return ArkInventory.Const.Slot.Type.Bullet
			end
			
		end
	
		--ArkInventory.Output( "debug unknown bag type: bag_id=" .. bliz_id .. ", type=" .. t .. " (" .. ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER"] .. ") , subtype=" .. s .. " (" .. ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_BAG"] .. ")" )
		return ArkInventory.Const.Slot.Type.Unknown
	
	else

		-- empty bag slots
		return ArkInventory.Const.Slot.Type.Bag
	
	end
	
end



function ArkInventory.ScanLocation( arg1 )

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "ScanLocation( ", arg1, " )" } )
	
	for loc_id, loc in pairs( ArkInventory.Global.Location ) do
		if arg1 == nil or arg1 == loc_id then
			ArkInventory.Scan( loc.Bags )
		end
	end
	
end

function ArkInventory.Scan( arg1 )

	if type( arg1 ) ~= "table" then
		arg1 = { arg1 }
	end

	for _, bliz_id in pairs( arg1 ) do
	
		local loc_id = ArkInventory.BagID_Internal( bliz_id )
		
		if loc_id == nil then
			--ArkInventory.Output( { "aborted scan of bag ", bliz_id, ", not an ", ArkInventory.Const.Program.Name, " controlled bag" } )
			return
		elseif loc_id == ArkInventory.Const.Location.Bag or loc_id == ArkInventory.Const.Location.Bank or loc_id == ArkInventory.Const.Location.Key then
			ArkInventory.ScanBag( bliz_id )
		elseif loc_id == ArkInventory.Const.Location.Vault then
			ArkInventory.ScanVault()
		elseif loc_id == ArkInventory.Const.Location.Wearing then
			ArkInventory.ScanWearing()
		elseif loc_id == ArkInventory.Const.Location.Mail then
			ArkInventory.ScanMail()
		else
			ArkInventory.Output( { "uncoded location [", loc_id, "] for bag [", bliz_id, "]" } )
		end
		
	end

end

function ArkInventory.ScanBag( bliz_id )

	--local m1 = ArkInventory.MemoryUsed( true )
	
	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "ScanBag( ", bliz_id, " )" } )

	if bliz_id == nil then
		--ArkInventory.Output( { RED_FONT_COLOR_CODE, "aborted scan of bag - nil id" } )
		return
	end
	
	local loc_id, bag_id = ArkInventory.BagID_Internal( bliz_id )
	
	if not loc_id then
		--ArkInventory.Output( { RED_FONT_COLOR_CODE, "aborted scan of bag id [", bliz_id, "], unknown bag id" } )
		return
	else
		--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "found bag id [", bliz_id, "] in location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "]" } )
	end
	
	if loc_id == ArkInventory.Const.Location.Bank and ArkInventory.Global.Mode.Bank == false then
		--ArkInventory.Output( { RED_FONT_COLOR_CODE, "aborted scan of bag id [", bliz_id, "], not at bank" } )
		return
	end
	
	local cp = ArkInventory.Global.Me
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( { RED_FONT_COLOR_CODE, "aborted scan of bag id [", bliz_id, "], location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] is not being monitored" } )
		return
	end
	
	--ArkInventory.Output( { GREEN_FONT_COLOR_CODE, "scaning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", bliz_id, "]" } )

	
	local bag = cp.location[loc_id].bag[bag_id]
	
	local old_count = bag.count
	local old_link = bag.h
	local old_status = bag.status
	
	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.BagType( bliz_id )
	bag.status = ArkInventory.Const.Bag.Status.Unknown
	
	
	if loc_id == ArkInventory.Const.Location.Bag then
		
		bag.count = GetContainerNumSlots( bliz_id )
		
		if bliz_id == BACKPACK_CONTAINER then
		
			bag.texture = ArkInventory.Global.Location[loc_id].Texture
			bag.status = ArkInventory.Const.Bag.Status.Active
		
		else
		
			if bag.count == 0 then
			
				bag.texture = ArkInventory.Const.Texture.Empty.Bag
				bag.status = ArkInventory.Const.Bag.Status.Empty
			
			else
			
				bag.h = GetInventoryItemLink( "player", ContainerIDToInventoryID( bliz_id ) )
				bag.texture = ArkInventory.ItemGetTexture( bag.h )
				bag.status = ArkInventory.Const.Bag.Status.Active
			
			end
			
		end
		
	end

	
	if loc_id == ArkInventory.Const.Location.Key then
	
		bag.count = GetContainerNumSlots( bliz_id )
		
		bag.texture = ArkInventory.Global.Location[loc_id].Texture
		
		bag.status = ArkInventory.Const.Bag.Status.Active
		
	end

	
	if loc_id == ArkInventory.Const.Location.Bank then
	
		bag.count = GetContainerNumSlots( bliz_id )
		
		if bliz_id == BANK_CONTAINER then
		
			bag.texture = ArkInventory.Global.Location[loc_id].Texture
			bag.status = ArkInventory.Const.Bag.Status.Active
			
		else
			
			if bliz_id - NUM_BAG_SLOTS > GetNumBankSlots() then
			
				bag.texture = ArkInventory.Const.Texture.Empty.Bag
				bag.status = ArkInventory.Const.Bag.Status.Purchase
				
			else
				
				if bag.count == 0 then
					
					bag.texture = ArkInventory.Const.Texture.Empty.Bag
					bag.status = ArkInventory.Const.Bag.Status.Empty
					
				else
					
					bag.h = GetInventoryItemLink( "player", ContainerIDToInventoryID( bliz_id ) )
					bag.texture = ArkInventory.ItemGetTexture( bag.h )
					bag.status = ArkInventory.Const.Bag.Status.Active
					
				end
				
			end

		end

	end


	local changed_bag = false
	if old_count ~= bag.count or old_link ~= bag.h or old_status ~= bag.status then
		changed_bag	= true
	end


	for slot_id = 1, bag.count do
	
		if not bag.slot[slot_id] then
			bag.slot[slot_id] = { }
		end
		
		local i = bag.slot[slot_id]

		local h = GetContainerItemLink( bliz_id, slot_id )
		local sb = false
		local count = 0
		
		if h then
		
			count = select( 2, GetContainerItemInfo( bliz_id, slot_id ) ) or 1
			
			ArkInventory.Global.Tooltip.Scan:SetItem( bliz_id, slot_id )

			if ArkInventory.Global.Tooltip.Scan:Contains( "^" .. ITEM_SOULBOUND .. "$" ) then
				sb = true
			end
			
		else
		
			bag.empty = bag.empty + 1
			
		end
		
		
		local changed_item, new = ArkInventory.ScanChanged( i, h, sb, count )

		if changed_item or i.loc_id == nil then
		
			i["loc_id"] = loc_id
			i["bag_id"] = bag_id
			i["slot_id"] = slot_id
			
			i["h"] = h
			i["count"] = count
			i["sb"] = sb

			i["q"] = select( 3, ArkInventory.ItemInfoGet( h ) ) or 1
			i["new"] = new
			
			i["cat"] = nil
			i["catdef"] = nil

			if h then
				local id = ArkInventory.TooltipItemID( h )
				ArkInventory.Global.Cache.ItemCount[id] = nil
			end
			
			if not changed_bag then
				ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
				ArkInventory:SendMessage( "LISTEN_CHANGER_UPDATE_BUCKET", loc_id )
			end
			
		end
		
	end

	-- remove unwanted slots
	if old_count > bag.count then
		for slot_id = bag.count + 1, old_count do
			bag.slot[slot_id] = nil
		end
	end
	
	if changed_bag then
		cp.location[loc_id].slot_count = ArkInventory.Table.Sum( cp.location[loc_id].bag, function( a ) return a.count end )
		ArkInventory:SendMessage( "LISTEN_STORAGE_EVENT", ArkInventory.Const.Event.BagUpdate, loc_id, bag_id, ArkInventory.Const.Window.Draw.Recalculate )
	end
	
	--local m0 = string.format( "%.3f", ArkInventory.MemoryUsed() - m1 )
	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "Scan( ", loc_id, "-", bag_id, " ) =  ", m0 } )
	
end

function ArkInventory.ScanVault()

	--local m1 = ArkInventory.MemoryUsed( true )

	--ArkInventory.Output( { GREEN_FONT_COLOR_CODE, "ScanVault()" } )
	
	if ArkInventory.Global.Mode.Vault == false then
		--ArkInventory.Output( { RED_FONT_COLOR_CODE, "aborted scan of vault, not at vault" } )
		return
	end
	
	if not IsInGuild() or not ArkInventory.Global.Me.info.guild_id then
		--ArkInventory.Output( { RED_FONT_COLOR_CODE, "aborted scan of vault, not in a guild" } )
		return
	end
	
	if GetNumGuildBankTabs( ) == 0 then
		--ArkInventory.Output( { RED_FONT_COLOR_CODE, "aborted scan of vault, no tabs purchased" } )
		return
	end
	
	local loc_id = ArkInventory.Const.Location.Vault
	local bag_id = GetCurrentGuildBankTab()

	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( { RED_FONT_COLOR_CODE, "aborted scan of bag id [", bliz_id, "], location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] is not being monitored" } )
		return
	end

	
	local cp = ArkInventory.PlayerInfoGet( ArkInventory.Global.Me.info.guild_id )
	
	--ArkInventory.Output( { GREEN_FONT_COLOR_CODE, "scaning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", bliz_id, "]" } )
	
	
	local bag = cp.location[loc_id].bag[bag_id]
	
	local old_count = bag.count
	
	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.Const.Slot.Type.Unknown
	bag.status = ArkInventory.Const.Bag.Status.Unknown
	
	local _, _, isViewable, canDeposit = GetGuildBankTabInfo( bag_id )

	if isViewable or canDeposit then
		bag.count = MAX_GUILDBANK_SLOTS_PER_TAB
		bag.status = ArkInventory.Const.Bag.Status.Active
	end

	local changed_bag = false
	if old_count ~= bag.count or old_status ~= bag.status then
		changed_bag	= true
	end
	

	--local m1 = ArkInventory.MemoryUsed( true )
	
	for slot_id = 1, bag.count or 0 do
		
		--local m1 = ArkInventory.MemoryUsed( true )

		if not bag.slot[slot_id] then
			bag.slot[slot_id] = { }
		end
		
		local i = bag.slot[slot_id]
		
		local texture, count = GetGuildBankItemInfo( bag_id, slot_id )
		local h = nil
		local sb = false
		
		if texture then
		
			h = GetGuildBankItemLink( bag_id, slot_id )
			
			if h == nil then
				ArkInventory.Global.Tooltip.Scan:SetGuildBankItem( bag_id, slot_id )
				local _, itemlink = ArkInventory.Global.Tooltip.Scan:GetItem()
				h = itemlink
			end
			
		else
		
			bag.empty = bag.empty + 1
		
		end
		
		
		local changed_item, new = ArkInventory.ScanChanged( i, h, sb, count )

		if changed_item or i.loc_id == nil then
		
			changed_item = true
			
			i["loc_id"] = loc_id
			i["bag_id"] = bag_id
			i["slot_id"] = slot_id
			
			i["h"] = h
			i["count"] = count
			i["sb"] = sb
			
			i["q"] = select( 3, ArkInventory.ItemInfoGet( h ) ) or 1
			i["new"] = new
		
			i["cat"] = nil
			i["catdef"] = nil

			if h then
				local id = ArkInventory.TooltipItemID( h )
				ArkInventory.Global.Cache.ItemCount[id] = nil
			end
			
			if not changed_bag then
				ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
				ArkInventory:SendMessage( "LISTEN_CHANGER_UPDATE_BUCKET", loc_id )
			end
			
		end
		
		--local m0 = string.format( "%.3f", ArkInventory.MemoryUsed( true ) - m1 )
		--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "Scan( ", loc_id, "-", bag_id, "-", slot_id, " ) =  ", m0, " [", changed_item, "]" } )
		
	end

	--local m0 = string.format( "%.3f", ArkInventory.MemoryUsed() - m1 )
	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "Scan( ", loc_id, "-", bag_id, " ) =  ", m0 } )
	
	ArkInventory.ScanVaultHeader( bag_id )
	
	--local m0 = string.format( "%.3f", ArkInventory.MemoryUsed() - m1 )
	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "Scan( ", loc_id, "-", bag_id, " ) =  ", m0 } )
	
	cp.location[loc_id].slot_count = ArkInventory.Table.Sum( cp.location[loc_id].bag, function( a ) return a.count end )

	ArkInventory:SendMessage( "LISTEN_STORAGE_EVENT", ArkInventory.Const.Event.BagUpdate, loc_id, bag_id, ArkInventory.Const.Window.Draw.Refresh )
--[[
	if changed_bag then
		ArkInventory:SendMessage( "LISTEN_STORAGE_EVENT", ArkInventory.Const.Event.BagUpdate, loc_id, bag_id, ArkInventory.Const.Window.Draw.Recalculate )
	else
		ArkInventory:SendMessage( "LISTEN_STORAGE_EVENT", ArkInventory.Const.Event.BagUpdate, loc_id, bag_id, ArkInventory.Const.Window.Draw.Refresh )
	end
]]--

	--local m0 = string.format( "%.3f", ArkInventory.MemoryUsed() - m1 )
	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "Scan( ", loc_id, "-", bag_id, " ) =  ", m0 } )

	
end

function ArkInventory.ScanVaultHeader( bag_id )

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "ScanVaultHeader( ", bag_id, " ) start" } )

	if ArkInventory.Global.Mode.Vault == false then
		--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "aborted scan of tab ", bag_id, ", header, not at vault" } )
		return
	end
	
	if bag_id < 1 or bag_id > MAX_GUILDBANK_TABS then
		--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "aborted scan of tab ", bag_id, " header, invalid tab id" } )
		return
	end

	if not IsInGuild() or not ArkInventory.Global.Me.info.guild_id then
		--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "aborted scan of tab ", bag_id, " header, not in a guild" } )
		return
	end
	
	local cp = ArkInventory.PlayerInfoGet( ArkInventory.Global.Me.info.guild_id )
	
	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "scaning tab ", bag_id, " header" } )
	
	local loc_id = ArkInventory.Const.Location.Vault
	
	local bag = cp.location[loc_id].bag[bag_id]

	bag["type"] = ArkInventory.Const.Slot.Type.Bag

	if bag_id <= GetNumGuildBankTabs( ) then
		
		local name, icon, isViewable, canDeposit, numWithdrawals, remainingWithdrawals = GetGuildBankTabInfo( bag_id )

		bag["name"] = name
		bag["texture"] = icon
		
		bag["count"] = MAX_GUILDBANK_SLOTS_PER_TAB

		local access -- sourced from Blizzard_GuildBankUI.lua - GuildBankFrame_UpdateTabs()
		if not isViewable then
			access = ArkInventory.Localise["VAULT_TAB_ACCESS_NONE"]
		elseif ( not canDeposit and numWithdrawals == 0 ) then
			access = GUILDBANK_TAB_LOCKED
		elseif ( not canDeposit ) then
			access = GUILDBANK_TAB_WITHDRAW_ONLY
		elseif ( numWithdrawals == 0 ) then
			access = GUILDBANK_TAB_DEPOSIT_ONLY
		else
			access = GUILDBANK_TAB_FULL_ACCESS
		end
		bag["access"] = access
		
		local stackString
		if remainingWithdrawals > 0 then
			stackString = string.format( GetText( "STACKS", nil, remainingWithdrawals ), remainingWithdrawals )
		elseif remainingWithdrawals == 0 then
			stackString = NONE
		else
			stackString = UNLIMITED
		end
		bag["withdraw"] = stackString
		
		bag["status"] = ArkInventory.Const.Bag.Status.Active
		
	else
	
		bag["name"] = string.format( GUILDBANK_TAB_NUMBER, bag_id )
		bag["texture"] = ArkInventory.Const.Texture.Empty.Bag
		bag["count"] = 0
		--bag["empty"] = 0
		bag["access"] = ArkInventory.Localise["VAULT_TAB_ACCESS_NONE"]
		bag["withdraw"] = nil
		bag["status"] = ArkInventory.Const.Bag.Status.Purchase
	
	end


	ArkInventory.Frame_Changer_Update( loc_id, bag_id )

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "ScanVaultHeader( ", bag_id, " ) end" } )
	
end

function ArkInventory.ScanWearing()

	--local m1 = ArkInventory.MemoryUsed( true )

	--ArkInventory.Output( { GREEN_FONT_COLOR_CODE, "ScanWearing() start" } )
	
	local bliz_id = ArkInventory.Const.Offset.Wearing + 1
	
	local loc_id, bag_id = ArkInventory.BagID_Internal( bliz_id )
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( { RED_FONT_COLOR_CODE, "aborted scan of bag id [", bliz_id, "], location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] is not being monitored" } )
		return
	end

	--ArkInventory.Output( { GREEN_FONT_COLOR_CODE, "scaning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", bliz_id, "]" } )
	
	
	local cp = ArkInventory.Global.Me
	
	local bag = cp.location[loc_id].bag[bag_id]

	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.Const.Slot.Type.Wearing
	bag.status = ArkInventory.Const.Bag.Status.Active

	
	for slot_id, v in ipairs( ArkInventory.Const.InventorySlotName ) do
	
		bag.count = bag.count + 1
		
		if not bag.slot[slot_id] then
			bag.slot[slot_id] = { }
		end
		
		local i = bag.slot[slot_id]
		
		local inv_id = GetInventorySlotInfo( v )
		local h = GetInventoryItemLink( "player", inv_id )
		local sb = false
		local count = 0
		
		if h then
		
			count = 1 --GetInventoryItemCount( "player", inv_id )

			-- check for soulbound
			ArkInventory.Global.Tooltip.Scan:SetInventoryItem( inv_id )
			if ArkInventory.Global.Tooltip.Scan:Contains( "^" .. ITEM_SOULBOUND .. "$" ) then
				sb = true
			end
			
		else
		
			bag.empty = bag.empty + 1
			
		end

		
		local changed_item, new = ArkInventory.ScanChanged( i, h, sb, count )

		if changed_item or i.loc_id == nil then
		
			i["loc_id"] = loc_id
			i["bag_id"] = bag_id
			i["slot_id"] = slot_id
			
			i["h"] = h
			i["count"] = count
			i["sb"] = sb
			
			i["q"] = select( 3, ArkInventory.ItemInfoGet( h ) ) or 1
			i["new"] = new
		
			i["cat"] = nil
			i["catdef"] = nil

			if h then
				local id = ArkInventory.TooltipItemID( h )
				ArkInventory.Global.Cache.ItemCount[id] = nil
			end
			
			ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
			ArkInventory:SendMessage( "LISTEN_CHANGER_UPDATE_BUCKET", loc_id )
			
		end
		
		--ArkInventory.Output( { "slot=[", slot_id, "], item=[", i.h, "]" } )
	
	end
	
	cp.location[loc_id].slot_count = bag.count
	
	--local m0 = string.format( "%.3f", ArkInventory.MemoryUsed() - m1 )
	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "Scan( ", loc_id, "-", bag_id, " ) =  ", m0 } )
	
end

function ArkInventory.ScanMail()

	--local m1 = ArkInventory.MemoryUsed( true )

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "ScanMail() start" } )
	
	local bliz_id = ArkInventory.Const.Offset.Mail + 1
	
	local loc_id, bag_id = ArkInventory.BagID_Internal( bliz_id )

	-- mailbox can be scanned from anywhere, just uses data from when it was last opened
	if ArkInventory.Global.Mode.Mail == false then
		--ArkInventory.Output( { RED_FONT_COLOR_CODE, "aborted scan of mailbox, not at mailbox" } )
		return
	end
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( { RED_FONT_COLOR_CODE, "aborted scan of bag id [", bliz_id, "], location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] is not being monitored" } )
		return
	end

	
	--ArkInventory.Output( { GREEN_FONT_COLOR_CODE, "scaning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", bliz_id, "]" } )
	
	local cp = ArkInventory.Global.Me
	
	local bag = cp.location[loc_id].bag[bag_id]
	
	local old_count = bag.count

	bag.count = 0
	bag.empty = 0 --GetContainerNumFreeSlots( bliz_id )
	bag.type = ArkInventory.BagType( bliz_id )
	bag.status = ArkInventory.Const.Bag.Status.Unknown
	
	local slot_id = 0
	
	for msg_id = 1, GetInboxNumItems() do
	
		--ArkInventory.Output( { "scanning message ", msg_id } )
		
		local hasItem = select( 8, GetInboxHeaderInfo( msg_id ) )
		
		if hasItem then
		
			--ArkInventory.Output( { "message ", msg_id, " has item(s)" } )
			
			for attachment_id = 1, ATTACHMENTS_MAX_RECEIVE do
				
				local name, _, count, _, quality = GetInboxItem( msg_id, attachment_id )
				
				if name ~= nil then

					--ArkInventory.Output( { "message ", msg_id, ", attachment ", attachment_id, " = ", name, " x ", count, " / (", { GetInboxItemLink( msg_id, attachment_id ) }, ")" } )
					
					slot_id = slot_id + 1
					
					if not bag.slot[slot_id] then
						bag.slot[slot_id] = { }
					end
					
					local i = bag.slot[slot_id]
					
					local h = GetInboxItemLink( msg_id, attachment_id )
					local sb = false
					
					if h then
						bag.count = bag.count + 1
					end
					
					local changed_item, new = ArkInventory.ScanChanged( i, h, sb, count )
					
					if changed_item or i.loc_id == nil then
						
						i["loc_id"] = loc_id
						i["bag_id"] = bag_id
						i["slot_id"] = slot_id
						
						i["h"] = h
						i["count"] = count
						i["sb"] = sb
						
						i["q"] = quality
						i["new"] = new
					
						i["cat"] = nil
						i["catdef"] = nil
						
						if h then
							local id = ArkInventory.TooltipItemID( h )
							ArkInventory.Global.Cache.ItemCount[id] = nil
						end
						
					end					
					
				end
			
			end
		
		end
		
	end
	
	
	-- remove unwanted slots
	if old_count > bag.count then
		for slot_id = bag.count + 1, old_count do
			bag.slot[slot_id] = nil
		end
	end

	
	if old_count ~= bag.count then
		cp.location[loc_id].slot_count = ArkInventory.Table.Sum( cp.location[loc_id].bag, function( a ) return a.count end )
		ArkInventory:SendMessage( "LISTEN_STORAGE_EVENT", ArkInventory.Const.Event.BagUpdate, loc_id, bag_id, ArkInventory.Const.Window.Draw.Recalculate )
	end

	--local m0 = string.format( "%.3f", ArkInventory.MemoryUsed() - m1 )
	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "Scan( ", loc_id, "-", bag_id, " ) =  ", m0 } )
	
end

function ArkInventory.ScanChanged( oi, h, sb, count, use )

	-- check for changes

	if not oi then
		--  the old slot doesnt exist - new bag is larger
		--ArkInventory.Output( { "tainted, bag=", bag_id, ", slot=", i.slot_id, ", new slot" } )
		return true, ArkInventory.Const.Slot.New.No
	end
	
	if h and not oi.h then
		-- item added to empty slot
		--ArkInventory.Output( { "tainted, bag=", bag_id, ", slot=", i.slot_id, ", item added" } )
		return true, ArkInventory.Const.Slot.New.Yes
	end
	
	if not h and oi.h then
		-- item removed, slot is now empty
		--ArkInventory.Output( { "tainted, bag=", bag_id, ", slot=", i.slot_id, ", item removed" } )
		return true, ArkInventory.Const.Slot.New.No
	end
	
	if h and oi.h and h ~= oi.h then
		-- different item
		--ArkInventory.Output( { "tainted, bag=", bag_id, ", slot=", i.slot_id, ", item changed" } )
		return true, ArkInventory.Const.Slot.New.Yes
	end
	
	if ( sb and not oi.sb ) or ( not sb and oi.sb ) then
		-- soulbound changed
		--ArkInventory.Output( { "tainted, bag=", bag_id, ", slot=", i.slot_id, ", soulbound changed" } )
		return true, ArkInventory.Const.Slot.New.Yes
	end
	
	if h and oi.h and count and oi.count and count ~= oi.count then
		-- same item, count has changed
		if count > oi.count then
			--ArkInventory.Output( { "tainted, bag=", bag_id, ", slot=", i.slot_id, ", increased" } )
			return true, ArkInventory.Const.Slot.New.Inc
		else
			--ArkInventory.Output( { "tainted, bag=", bag_id, ", slot=", i.slot_id, ", decreased" } )
			return true, ArkInventory.Const.Slot.New.Dec
		end
		
	end
	
	if h and oi.h and use and oi.use and use ~= oi.use then
		return true, ArkInventory.Const.Slot.New.No
	end
	
	return false --, ArkInventory.Const.Slot.New.No
	
end

function ArkInventory.OfflineDataCleanup()
--[[
	--ArkInventory.Output( { "OfflineDataCleanup() start" } )
	
	local cp = ArkInventory.Global.Me
	
	for loc_id in ipairs( ArkInventory.Global.Location ) do
	
		if not cp.location[loc_id].isOffline then
			
			local d = ArkInventory.db.global.cache.realm[cp.realm].faction[cp.faction].character[cp.name]
			
			if d.location[loc_id] then
			--ArkInventory.Output( { "cleanup of ", ArkInventory.Global.Location[loc_id].Name, " data for [", cp.display, "]" } )
				ArkInventory.Table.Clean( d.location, loc_id, true )
			end
			
		end
		
	end

	--ArkInventory.Output( { "OfflineDataCleanup() end" } )
]]--
end


function ArkInventory.ObjectInfoName( h )
	local x = select( 3, ArkInventory.ObjectInfo( h ) ) or strmatch( "%[(.+)%]", i.h ) or "!"
	return x
end

function ArkInventory.ObjectInfoTexture( h )
	local x = select( 4, ArkInventory.ObjectInfo( h ) )
	return x
end

function ArkInventory.ObjectInfoQuality( h )
	local x = select( 5, ArkInventory.ObjectInfo( h ) ) or 0
	return x
end

function ArkInventory.ObjectInfo( h )
	
	if h == nil or type( h ) ~= "string" then
		return
	end
	
	local class, v1, v2 = ArkInventory.ObjectStringDecode( h )
	
	if class == "item" then
	
		local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture = GetItemInfo( h )
		
		if itemTexture == nil then
			itemTexture = GetItemIcon( h )
		end
		
		return class, itemLink, itemName, itemTexture, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc
		
	elseif class == "empty" then
		
		return
		
	elseif class == "spell" then
		
		local name, _, texture = GetSpellInfo( v1 )
		local link = GetSpellLink( v1 )
		
		return class, link, name, texture, 1
		
	elseif class == "token" then
		
		local link, name, texture
		local quality = 1
		
		if v1 == 0 then --Item based
			
			local h = select( 2, GetItemInfo( v2 ) )
			name, texture, quality = select( 3, ArkInventory.ObjectInfo( h ) )
			
		elseif v1 == 1 then --Arena points
		
			name = ARENA_POINTS
			texture = [[Interface\PVPFrame\PVP-ArenaPoints-Icon]]
			
		elseif v1 == 2 then --Honor points
		
			name = HONOR_POINTS
			local factionGroup = UnitFactionGroup( "player" )
			texture = string.format( "Interface\\AddOns\\ArkInventory\\Images\\Honor-%s.tga", factionGroup )
			
		end
		
		link = string.format( "|H%s:%s:%s|h", class, v1, v2 )
		
		return class, link, name, texture, quality, v1, v2
		
	else
		
		assert( "unknown class [" .. class .. "]" )
		
	end
	
end


function ArkInventory.ObjectStringDecode( h )
	
	-- item:itemId:enchantId:jewelId1:jewelId2:jewelId3:jewelId4:suffixId:uniqueId:currentCharacterLevel
	-- spell:spellID
	-- token:tokenType:itemId
	
	local s = strmatch( ( h or "" ), "|H(.-)|h" ) or ""
	local class, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10 = strsplit( ":", s )
	
	class = string.lower( class or "" )
	if class == "" then
		class = "empty"
	end
	
	v1 = tonumber( v1 ) or 0
	v2 = tonumber( v2 ) or 0
	v3 = tonumber( v3 ) or 0
	v4 = tonumber( v4 ) or 0
	v5 = tonumber( v5 ) or 0
	v6 = tonumber( v6 ) or 0
	v7 = tonumber( v7 ) or 0
	v8 = tonumber( v8 ) or 0
	v9 = tonumber( v9 ) or 0
	v10 = tonumber( v10 ) or 0
	
	return class, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
	
end

function ArkInventory.ObjectStringDecodeItem( h )
	
	local h = h
	if type( h ) == "number" then
		h = string.format( "|Hitem:%i|h", h )
	end
	
	local class, id, enchant, j1, j2, j3, j4, suffix, unique = ArkInventory.ObjectStringDecode( h )
	
	if class == "item" then
		return id, suffix, enchant, j1, j2, j3, j4
	end
	
end


function ArkInventory.ItemStringDecode( h )
	
	local class, id, enchant, j1, j2, j3, j4, suffix, unique, clvl
	
	if type( h ) == "number" then
		id = h
	elseif type( h ) == "string" then
		-- item:itemId:enchantId:jewelId1:jewelId2:jewelId3:jewelId4:suffixId:uniqueId:currentCharacterLevel
		--id, enchant, j1, j2, j3, j4, suffix, unique, clvl = strmatch( ( h or "" ), "item:(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(%-?%d+):(.+)|h" )

		local itemString = strmatch( ( h or "" ), "|H(.+)|h" ) or ""
		class, id, enchant, j1, j2, j3, j4, suffix, unique, clvl = strsplit( ":", itemString )

	end
	
	id = tonumber( id ) or 0
	suffix = tonumber( suffix ) or 0
	enchant = tonumber( enchant ) or 0
	unique = tonumber( unique ) or 0
	enchant = tonumber( enchant ) or 0
	j1 = tonumber( j1 ) or 0
	j2 = tonumber( j2 ) or 0
	j3 = tonumber( j3 ) or 0
	j4 = tonumber( j4 ) or 0
	clvl = tonumber( clvl ) or 0
	
	return id, suffix, enchant, j1, j2, j3, j4
	
end

function ArkInventory.VendorPriceScan()

	if not ArkInventory.Global.Mode.Merchant then
		return
	end

	local bags = { }
	
	table.insert( bags, BACKPACK_CONTAINER )
	for x = 1, NUM_BAG_SLOTS do
		table.insert( bags, x )
	end
	table.insert( bags, KEYRING_CONTAINER )
	
	for _, bliz_id in ipairs( bags ) do
	
		local bag_size = GetContainerNumSlots( bliz_id )
		
		for slot_id = 1, bag_size do
		
			local h = GetContainerItemLink( bliz_id, slot_id )
	
			if h then
				
				-- hyperlinks do not work, can only use SetBagItem
				ArkInventory.Global.Tooltip.Vendor:SetBagItem( bliz_id, slot_id )
			
				local moneyFrame = ArkInventory.Global.Tooltip.Vendor:GetMoneyFrame()
			
				if moneyFrame then
			
					-- needs to check for durability?
			
					local _, count = GetContainerItemInfo( bliz_id, slot_id )
					local price = moneyFrame.staticMoney / count
					local id = ArkInventory.ItemStringDecode( h )
					ArkInventory.db.global.vendor.price[id] = price
					moneyFrame.staticMoney = 0
			
					--ArkInventory.Output( { "bag=", bliz_id, ", slot=", slot_id, ", item=", id, ", count=", count, ", copper=", price } )
					
				end
			
			end
			
		
		end
	
	end

end

local originalGetSellValue = GetSellValue
function GetSellValue( item )

	local id = ArkInventory.ItemStringDecode( item )
	if id == 0 then
		return nil
	end

	return id and ( ArkInventory.db.global.vendor.price[id] or originalGetSellValue and originalGetSellValue( id ) )
	
end

function ArkInventory.SkillsUpdate()

	-- cannot do this if the skill window is opened
	if SkillFrame:IsVisible() then
		return
	end

	local good = false
	local cp = ArkInventory.Global.Me.info
	
	--ArkInventory.Output( "GetNumSkillLines() = " .. GetNumSkillLines() )
	
	cp.skills = { }
	
	for j = 1, GetNumSkillLines() do
	
		local name, isHeader, isExpanded = GetSkillLineInfo( j )
		--ArkInventory.Output( { "line [", j, "] = ( ", name, ", ", isHeader, " )" } )
		
		if isHeader ~= nil then

			if not isExpanded then
				ExpandSkillHeader( 0 )
				return
			else
				if name == ArkInventory.Localise["WOW_SKILL_HEADER_PRIMARY"] or name == ArkInventory.Localise["WOW_SKILL_HEADER_SECONDARY"] then
					--ArkInventory.Output( "header = " .. name )
					good = true
				else
					good = false
				end
			end
			
		else
		
			if good then
				--ArkInventory.Output( "skill = " .. name )
				if ArkInventory.Localise:HasReverseTranslation( name ) then
					local skill = strmatch( ArkInventory.Localise:GetReverseTranslation( name ), "WOW_SKILL_(.+)" )
					tinsert( cp.skills, skill )
				end
			end
			
		end
		
	end

	ArkInventory.Global.Cache.Default = { }
	ArkInventory.LocationSetValue( nil, "resort", true )
	
end

function ArkInventory.InventoryIDGet( loc_id, bag_id )
	
	local inv_id = nil
	
	local bliz_id = ArkInventory.BagID_Blizzard( loc_id, bag_id )
	
	if bliz_id == nil then
		return nil
	end
	
	if loc_id == ArkInventory.Const.Location.Bag and bag_id > 1 then
		inv_id = ContainerIDToInventoryID( bliz_id )
	elseif loc_id == ArkInventory.Const.Location.Bank and bag_id > 1 then
		inv_id = BankButtonIDToInvSlotID( bliz_id, 1 )
	end
	
	return inv_id
	
end


function ArkInventory.TooltipItemID( h )
	local id, suffix = ArkInventory.ItemStringDecode( h )
	if id ~= 0 then
		return string.format( "%s:%s", id, suffix )
	end
end

function ArkInventory.ItemCountGet( search_id, just_me )
	
	local search_id = ArkInventory.TooltipItemID( search_id )
	if search_id == nil then
		return nil
	end

	if ArkInventory.Global.Cache.ItemCount[search_id] == nil then
		
		local player = UnitName( "player" )
		local d = { }

--		[name] = {
--			["vault"] = boolean,
--			["location"] = {
--				[loc_id] = count,
--			},
--			["total"] = 0,
--		},
	
		local cp = ArkInventory.Global.Me
		
		for pid, pd in ArkInventory.spairs( ArkInventory.db.global.player.realm[cp.info.realm].faction[cp.info.faction].name ) do
			
			if not just_me or ( just_me and pd.info.name == player ) then
			
				for l, ld in pairs( pd.location ) do
				
					--ArkInventory.Output( { "scanning location [", l, "] for item [", search_id, "]" } )
					local c = 0
					
					for b, bd in pairs( ld.bag ) do
						for s, sd in pairs( bd.slot ) do
							if sd and sd.h and search_id == ArkInventory.TooltipItemID( sd.h ) then
								--ArkInventory.Output( { "found [", bag.slot[s].count, "] in bag [", b, "] slot [", s, "]" } )
								c = c + sd.count
							end
						end
					end
					
					if c > 0 then
					
						if not d[pd.info.name] then
							d[pd.info.name] = { ["vault"] = false, ["location"] = { }, ["total"] = 0 }
						end
						
						if l == ArkInventory.Const.Location.Vault then
							d[pd.info.name].vault = true
						end
						
						d[pd.info.name].location[l] = c
						d[pd.info.name].total = d[pd.info.name].total + d[pd.info.name].location[l]
						
					end
					
				end
				
			end
			
		end
		
		table.sort( d )
		ArkInventory.Global.Cache.ItemCount[search_id] = d
		
	end
	
	return ArkInventory.Global.Cache.ItemCount[search_id]
	
end
