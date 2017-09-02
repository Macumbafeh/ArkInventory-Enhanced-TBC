local function RestackFindPartial( loc_id, cb, cs, id )

	if loc_id == ArkInventory.Const.Location.Vault then
		
		--ArkInventory.Output( { "RestackFindPartial( ", loc_id, ", ", cb, ", ", cs, ", ", id, " )" } )
		
		for slot_id = cs, MAX_GUILDBANK_SLOTS_PER_TAB do
		
			if slot_id ~= cs then
				
				local h = GetGuildBankItemLink( cb, slot_id )
				
				if h then
					
					local item_id = ArkInventory.ItemStringDecode( h )
					
					if item_id == id then
					
						local _, count = GetGuildBankItemInfo( cb, slot_id )
						local stack = select( 8, ArkInventory.ItemInfoGet( h ) )
						
						if count < stack then
							--ArkInventory.Output( { "found match for partial stack at ", slot_id } )
							return true, slot_id, count
						end
						
					end
					
				end
				
			end
			
		end
		
	else
		
		for _, bag_id in pairs( ArkInventory.Global.Location[loc_id].Bags ) do
			
			for slot_id = 1, GetContainerNumSlots( bag_id ) do
				
				if not ( bag_id == cb and slot_id == cs ) then
					
					local h = GetContainerItemLink( bag_id, slot_id )
					
					if h then
						
						local item_id = ArkInventory.ItemStringDecode( h )
						
						if item_id == id then
							
							local _, count, locked = GetContainerItemInfo( bag_id, slot_id )
							local stack = select( 8, ArkInventory.ItemInfoGet( h ) )
						
							if count < stack then
								--ArkInventory.OutputOutput( "found match for partial stack at " .. bag_id .. "." .. slot_id )
								return true, bag_id, slot_id, count
							end
							
						end
						
					end
					
				end
				
			end
			
		end
		
	end

	--ArkInventory.Output( "no other partial stacks found" )
	return false

end

local function RestackFindSpecial( loc_id, ct )

	if loc_id == ArkInventory.Const.Location.Vault then
		return false
	end
	
	for _, bag_id in pairs( ArkInventory.Global.Location[loc_id].Bags ) do
	
		local _, bt = GetContainerNumFreeSlots( bag_id )
		
		-- only match items in normal bags to move them to profession bags
		if bt == 0 then
		
			for slot_id = 1, GetContainerNumSlots( bag_id ) do

				--ArkInventory.Output( { "checking for special item in bag=[", bag_id, "], slot=[", slot_id, "]" } )
			
				local h = GetContainerItemLink( bag_id, slot_id )
				
				if h then
				
					local it = GetItemFamily( h )
					
					if bit.band( it, ct ) > 0 then
						--ArkInventory.Output( { "found match for special slot at [", bag_id, ".", slot_id, "], it=[", it, "], ct=[", ct, "]" } )
						return true, bag_id, slot_id
					end
					
				end
				
			end
			
		end
		
	end

	--ArkInventory.Output( "no items found for special slot" )
	return false

end

local function RestackBags( loc_id )

	local changed = false
	
	for _, bag_id in pairs( ArkInventory.Global.Location[loc_id].Bags ) do
		
		for slot_id = 1, GetContainerNumSlots( bag_id ) do
			
			--ArkInventory.Output( "checking bag " .. bag_id .. ", slot " .. slot_id )
			
			local _, count, locked
			
			while true do
				
				_, count, locked = GetContainerItemInfo( bag_id, slot_id )
				
				if locked then
					--ArkInventory.Output( "yielding - primary is locked" )
					coroutine.yield()
					--ArkInventory.Output( "resumed" )
				else
					break
				end
				
			end
			
			local h = GetContainerItemLink( bag_id, slot_id )
		
			if h then
				
				local item_id = ArkInventory.ItemStringDecode( h )
				local stack = select( 8, ArkInventory.ItemInfoGet( h ) )
				
				if count < stack then
					
					--ArkInventory.Output( "partial stack of item " .. h .. " found at " .. bag_id .. "." .. slot_id )
					local locked, ok, pb, ps, pc
					
					while true do
						
						ok, pb, ps, pc = RestackFindPartial( loc_id, bag_id, slot_id, item_id )
						
						if ok then
							locked = select( 3, GetContainerItemInfo( pb, ps ) )
						else
							locked = false
						end
						
						if locked then
							--ArkInventory.Output( "yielding - secondary is locked" )
							coroutine.yield()
							--ArkInventory.Output( "resumed" )
						else
							break
						end
						
					end
					
					if ok then
					
						--ArkInventory.Output( { "merging ", pb, ".", ps, " (", pc, ") with ", bag_id, ".", slot_id, " (", count, ")" } )
						
						ClearCursor()
						PickupContainerItem( pb, ps )
						PickupContainerItem( bag_id, slot_id )
						ClearCursor()
						
						changed = true
					
					end
					
				end
				
			end
			
		end
		
	end
	
	return changed
	
end

local function RestackVault( )

	local loc_id = ArkInventory.Const.Location.Vault
	local bag_id = GetCurrentGuildBankTab( )
	
	local _, _, isViewable, canDeposit = GetGuildBankTabInfo( bag_id )
	
	if not ( IsGuildLeader() or ( isViewable and canDeposit ) ) then
		ArkInventory.Output( string.format( ArkInventory.Localise["RESTACK_FAIL_ACCESS"], GUILD_BANK, bag_id ) )
		return
	end
	
	for slot_id = 1, MAX_GUILDBANK_SLOTS_PER_TAB do

		--ArkInventory.Output( { "checking slot [", slot_id, "]" } )
		
		local _, count, locked
		
		while true do
			
			_, count, locked = GetGuildBankItemInfo( bag_id, slot_id )
			
			if locked then
				--ArkInventory.Output( "yielding - primary is locked" )
				coroutine.yield()
				--ArkInventory.Output( "resumed" )
			else
				break
			end
			
		end
		
		local h = GetGuildBankItemLink( bag_id, slot_id )
		
		--ArkInventory.Output( { "slot=[", slot_id, "] count=[", count, "] locked=[", locked, "] item=", h } )

		if h then
		
			local item_id = ArkInventory.ItemStringDecode( h )
			local stack = select( 8, ArkInventory.ItemInfoGet( h ) )
			
			if count < stack then
				
				--ArkInventory.Output( { "partial stack of ", h, " found at ", slot_id, " (", count, ")" } )
				local locked, ok, ps, pc
				
				while true do
					
					ok, ps, pc = RestackFindPartial( loc_id, bag_id, slot_id, item_id )
					
					if ok then
						locked = select( 3, GetGuildBankItemInfo( bag_id, ps ) )
					else
						locked = false
					end
				
					if locked then
						--ArkInventory.Output( "yielding - partial is locked" )
						coroutine.yield()
						--ArkInventory.Output( "resumed" )
					else
						break
					end
					
				end
					
				if ok then
				
					--ArkInventory.Output( { "merging ", ps, " (", pc, ") with ", slot_id, " (", count, ")" } )
					
					ClearCursor()
					PickupGuildBankItem( bag_id, ps )
					PickupGuildBankItem( bag_id, slot_id )
					ClearCursor()
					
					--ArkInventory.Output( "yielding - pending vault update - because it's not updated instantly" )
					coroutine.yield()
					--ArkInventory.Output( "resumed" )
					
					return true
				
				end
				
			end
		
		end
		
	end
	
	return false
	
end


local function RestackRun( )

	-- DO NOT USE CACHED DATA FOR RESTACKING, PULL THE DATA DIRECTLY FROM WOW AGAIN, THE UI WILL CATCH UP

	for loc_id in pairs( ArkInventory.Global.Location ) do
	
		if ArkInventory.Global.Location[loc_id].canRestack and not ArkInventory.Global.Location[loc_id].isOffline then
			
			local changed = true

			if loc_id == ArkInventory.Const.Location.Vault then
				
				while changed == true do
					changed = RestackVault( )
				end
				
			else
				
				while changed == true do
					changed = RestackBags( loc_id )
				end
				
				
				-- move items into appropriate bag types with empty slots
				for _, bag_id in pairs( ArkInventory.Global.Location[loc_id].Bags ) do
			
					local _, bt = GetContainerNumFreeSlots( bag_id )
					--ArkInventory.Output( { "bag=[", bag_id, "], type=[", bt, "]" } )
					
					if bt ~= 0 then
						
						for slot_id = 1, GetContainerNumSlots( bag_id ) do
							
							--ArkInventory.Output( { "checking bag=[", bag_id, "], slot=[", slot_id, "]" } )
							
							while true do
								
								local locked = select( 3, GetContainerItemInfo( bag_id, slot_id ) )
								
								if locked then
									--ArkInventory.Output( "yielding - primary is locked" )
									coroutine.yield()
									--ArkInventory.Output( "resumed" )
								else
									break
								end
								
							end
							
							if not GetContainerItemLink( bag_id, slot_id ) then
								
								local locked, ok, sb, ss
								--ArkInventory.Output( { "empty special slot at [", bag_id, ".", slot_id, "]" } )
								
								while true do
									
									ok, sb, ss = RestackFindSpecial( loc_id, bt )
									
									if ok then
										locked = select( 3, GetContainerItemInfo( sb, ss ) )
									else
										locked = false
									end
									
									if locked then
										-- empty slots should never be locked but you never know
										--ArkInventory.Output( "yielding - secondary is locked" )
										coroutine.yield()
										--ArkInventory.Output( "resumed" )
									else
										break
									end
									
								end
								
								if ok then
									
									--ArkInventory.Output( { "moving ", h, " from ", sb, ".", ss, " to special slot ", bag_id, ".", slot_id } )
									
									ClearCursor()
									PickupContainerItem( sb, ss )
									PickupContainerItem( bag_id, slot_id )
									ClearCursor()
									
								end
								
							end
							
						end
						
					end
					
				end
				
			end
		
		end
		
	end
	
	ArkInventory.Output( { ArkInventory.Localise["RESTACK"], ": ", ArkInventory.Localise["RESTACK_COMPLETE"] } )
	
end

function ArkInventory.RestackResume( )

	--ArkInventory.Output( "RestackResume" )
	
	if type( ArkInventory.Global.Thread.Restack ) == "thread" and coroutine.status( ArkInventory.Global.Thread.Restack ) == "suspended" then

		-- resume current thread
		coroutine.resume( ArkInventory.Global.Thread.Restack )
		
	end
	
end

function ArkInventory.Restack( )

	if type( ArkInventory.Global.Thread.Restack ) ~= "thread" or coroutine.status( ArkInventory.Global.Thread.Restack ) == "dead" then
	
		-- thread not active, create a new one
		ArkInventory.Output( { ArkInventory.Localise["RESTACK"], ": ", ArkInventory.Localise["RESTACK_START"] } )
		ArkInventory.Global.Thread.Restack = coroutine.create(
			function ()
				RestackRun( )
			end
		)
		coroutine.resume( ArkInventory.Global.Thread.Restack )
	
	else

		-- restack already in progress
		ArkInventory.Output( { RED_FONT_COLOR_CODE, ArkInventory.Localise["RESTACK_FAIL_WAIT"] } )
		
	end
	
end
