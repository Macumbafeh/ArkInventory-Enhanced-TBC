
function ArkInventory.TooltipAddCustom( frame )
	
	if ArkInventory.Global.Mode.Combat then
		return
	end
	
	if not frame or not frame["GetItem"] then
		return
	end
	--ArkInventory.Output( { "TooltipAddCustom( ", frame:GetName(), " )" } )

	local h = select( 2, frame:GetItem() )
	
	if h == nil then
		return
	end

	if ArkInventory.db.global.option.tooltip.add.empty then
		ArkInventory.TooltipAddEmptyLine( frame )
	end
	
	if ArkInventory.db.global.option.tooltip.add.vendor then
		ArkInventory.TooltipAddVendor( frame, h )
	end
	
	if ArkInventory.db.global.option.tooltip.add.count then
		ArkInventory.TooltipAddItemCount( frame, h )
	end

	frame:Show()
	
end

function ArkInventory.TooltipAddEmptyLine( frame )
	frame:AddLine( " ", 1, 1, 1, 0 )
end

function ArkInventory.TooltipAddItemCount( frame, h )
	
	local tt = ArkInventory.TooltipItemCountGet( h )
	if tt then
		local tc = ArkInventory.db.global.option.tooltip.colour.count
		frame:AddLine( tt, tc.r, tc.g, tc.b, 0 )
	end

end

function ArkInventory.TooltipAddVendor( frame, h )

	if ArkInventory.Global.Mode.Merchant then
		return
	end

	local price_per = GetSellValue( h )
	
	local tc = ArkInventory.db.global.option.tooltip.colour.vendor
	
	if price_per == nil then
	
		--frame:AddDoubleLine( ArkInventory.Localise["TOOLTIP_VENDOR"], ArkInventory.Localise["STATUS_NO_DATA"], tc.r, tc.g, tc.b, tc.r, tc.g, tc.b )
		return
		
	elseif price_per == 0 then
	
		if not ArkInventory.Global.Mode.Merchant then
			--frame:AddLine( ITEM_UNSELLABLE, tc.r, tc.g, tc.b )
			ArkInventory.TooltipSetMoneyText( frame, 0, string.format( "%s:", ArkInventory.Localise["TOOLTIP_VENDOR"] ), tc.r, tc.g, tc.b )
		end
		
	elseif price_per > 0 then
	
		local count = 1
		
		if frame:GetOwner() and frame:GetOwner().count ~= nil then
		
			count = tonumber( frame:GetOwner().count )
			
			if type( count ) ~= "number" then
				count = 1
			end
			
			if count < 1 then
				count = 1
			end

		end
		
		local price = price_per * count
	
		ArkInventory.TooltipSetMoneyText( frame, price, string.format( "%s: (x%d)", ArkInventory.Localise["TOOLTIP_VENDOR"], count ), tc.r, tc.g, tc.b )
	
	else

		return
	
	end
	
end

function ArkInventory.TooltipItemCountGet( search_id )
	
	local tc = ArkInventory.ItemCountGet( search_id, ArkInventory.db.global.option.tooltip.me )
	if tc == nil then
		return nil
	end
	
	local n = UnitName( "player" )

	local item_count_total = 0
	
	local character_count = 0
	local character_entries = { }
	
	local guild_count = 0
	local guild_entries = { }

	for cn, cd in pairs( tc ) do

		local item_count_character = 0
		local item_count_guild = 0
		
		local location_entries = { }

		if cd.location then
			
			for l, lc in pairs( cd.location ) do
				
				if lc > 0 then
					
					if l == ArkInventory.Const.Location.Vault then
						tinsert( location_entries, string.format( "(%s)", ArkInventory.Global.Location[l].Name ) )
						item_count_guild = item_count_guild + lc
					else
						tinsert( location_entries, string.format( "(%s %s)", ArkInventory.Global.Location[l].Name, lc ) )
						item_count_character = item_count_character + lc
					end
					
				end
				
			end
			
			if item_count_character > 0 then

				local me = ""
				if cn == n then
					me = ArkInventory.Localise["TOOLTIP_COUNT_ME"]
				end

				tinsert( character_entries, string.format( "%s%s: %s %s", me, cn, item_count_character, table.concat( location_entries, ", " ) ) )
				character_count = character_count + 1
				item_count_total = item_count_total + item_count_character
				
			end
			
			if item_count_guild > 0 then
				tinsert( guild_entries, string.format( "%s: %s %s", cn, item_count_guild, table.concat( location_entries, ", " ) ) )
				guild_count = guild_count + 1
			end
			
		end
		
	end

	if item_count_total > 0 or guild_count > 0 then
	
		local c = ""
		local g = ""
	
		if character_count > 1 then
			--table.sort( character_entries )
			c = string.format( "%s\n%s: %s", table.concat( character_entries, "\n" ), ArkInventory.Localise["TOOLTIP_TOTAL"], item_count_total )
		else
			c = table.concat( character_entries, "\n" )
		end
		
		if guild_count > 0 then
			--table.sort( guild_entries )
			g = string.format( "%s\n", table.concat( guild_entries, "\n" ) )
		end
		
		return string.format( "%s%s", g, c )
		
	else
		
		return nil
		
	end
	
end
