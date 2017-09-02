
function ArkInventory.CategoryRenumber_145_200( cat_old, cat_new )

	if ArkInventory.db.profile.option["global"] and ArkInventory.db.profile.option.global["category"] and ArkInventory.db.profile.option.global.category["item"] then
		for item_id, cat_id in pairs( ArkInventory.db.profile.option.global.category.item ) do
			if cat_id == cat_old then
				ArkInventory.db.profile.option.global.category.item[item_id] = cat_new
			end
		end
	end

	for loc_id in pairs( ArkInventory.Global.Location ) do
		if ArkInventory.db.profile.option["local"] and ArkInventory.db.profile.option["local"][loc_id] and ArkInventory.db.profile.option["local"][loc_id]["category"] then
			for cat_id, bar_id in pairs( ArkInventory.db.profile.option["local"][loc_id]["category"] ) do
				if cat_id == cat_old then
					ArkInventory.db.profile.option["local"][loc_id]["category"][cat_new] = bar_id
					ArkInventory.db.profile.option["local"][loc_id]["category"][cat_id] = nil
				end
			end
		end
	end

end

function ArkInventory.CategoryRenumber_300( cat_old, cat_new )

	for _, loc in pairs( ArkInventory.db.profile.option.location ) do
		
		for k, v in pairs( loc.category ) do
		
			if v == cat_old then
				loc.category[k] = cat_new
			end
			
		end
		
	end
	
end

function ArkInventory.ConvertLocalToLocation()

	if ArkInventory.db.profile.option["local"] ~= nil then
		
		for loc_id in ipairs( ArkInventory.Global.Location ) do

			local a = ArkInventory.db.profile.option["local"][loc_id]	
				if a then
					ArkInventory.ConvertLocalOption( loc_id, a )
				end
			end
		
		ArkInventory.db.profile.option["local"] = nil
		
	end

end

function ArkInventory.ConvertLocalOption( loc_id, value, path )

	if path == nil then
		path = {}
	end
		
	if type( value ) == "table" then
		
		for k, v in pairs( value ) do
		
			tinsert( path, k )
			--ArkInventory.Output( { "loc_id=", loc_id, ", k=[", k, "]" } )
			ArkInventory.ConvertLocalOption( loc_id, v, path )
			v = nil
			tremove( path, #path )
			
		end
	
	else
	
		--ArkInventory.Output( { "Set( ", loc_id, ", ", path, ", ", value, " )" } )
		ArkInventory.LocationOptionSetReal( loc_id, path, value )
		
	end

end

function ArkInventory.ConvertAceDB2ToAceDB3( )
	
	-- converts acount to global
	if ARKINVDB and ARKINVDB.account then
		ARKINVDB.global = ARKINVDB.account
		ARKINVDB.account = nil
	end
	
end




function ArkInventory.ConvertOldOptions( )

	local upgrade_version = 0

	if not ArkInventory.db.profile.option["version"] then
		ArkInventory.db.profile.option["version"] = upgrade_version
	end

	
	upgrade_version = 1
	if ArkInventory.db.profile.option.version < upgrade_version then

		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], ArkInventory.db:GetCurrentProfile(), upgrade_version ) )
		
		-- don't store data in char db any more
		--ArkInventory:ResetDB( "char" )
	
		-- moved the background colour option
		if ArkInventory.db.profile.option["window"] and ArkInventory.db.profile.option.window["background"] then
			ArkInventory.db.profile.option.window.colour.background = ArkInventory.db.profile.option.window.background
			ArkInventory.db.profile.option.window.background = nil
		end
	
		-- moved the close on combat option
		if ArkInventory.db.profile.option["window"] and ArkInventory.db.profile.option.window["combat"] then
			ArkInventory.db.profile.option.window["auto"]["close"]["combat"] = ArkInventory.db.profile.option.window.combat
			ArkInventory.db.profile.option.window.combat = nil
		end

		-- moved the slot sort options
		if ArkInventory.db.profile.option["slot"] and ArkInventory.db.profile.option.slot["sort"] then
			ArkInventory.db.profile.option["sort"]["type"] = ArkInventory.db.profile.option.slot.sort
			ArkInventory.db.profile.option.slot.sort = nil
		end
	
		if ArkInventory.db.profile.option["category"] and ArkInventory.db.profile.option.category["item"] then
			-- new id format
			local new_cat = { }
			local new_key = nil
			for k, v in pairs( ArkInventory.db.profile.option.category.item ) do
		
				new_key = k
	
				if strmatch( k, "^%-?%d+$" ) then -- original format, just the number
				
					-- adding suffix and soulbound
					new_key = k .. ".0.0.0"
				
				elseif strmatch( k, "^%-?%d+.%-?%d+.%-?%d+$" ) then -- second format id.suffix.soulbound
			
					-- moving soulbound and adding enchant
					local v1, v2, v3 = strmatch( k, "^(%-?%d+).(%-?%d+).(%-?%d+)" )
					new_key = v1 .. "." .. v3 .. "." .. v2 .. ".0"
				
				end
		
				-- id . soulbound . suffix . enchant
				new_cat[new_key] = v
			end
			ArkInventory.db.profile.option["category"]["item"] = new_cat
		end


		-- individual window widths
		if ArkInventory.db.profile.option["window"] and ArkInventory.db.profile.option.window["col"] and type( ArkInventory.db.profile.option.window.col ) == "number" then
			ArkInventory.db.profile.option.window.col = {
				[ArkInventory.Const.Location.Bag] = ArkInventory.db.profile.option.window.col,
			}
		end

		-- move the default category to it's new id (so it can be hidden)
		if ArkInventory.db.profile.option["category"] and ArkInventory.db.profile.option.category["location"] and ArkInventory.db.profile.option.category.location[0] then
			ArkInventory.db.profile.option.category.location[ArkInventory.Const.Categories.Default] = ArkInventory.db.profile.option.category.location[0]
			ArkInventory.db.profile.option.category.location[0] = nil
		end
		
		ArkInventory.db.profile.option.version = upgrade_version
		ArkInventory.db.global.option.version = upgrade_version
	
	end
	
	
	upgrade_version = 1.3
	if ArkInventory.db.profile.option.version < upgrade_version then
	
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], ArkInventory.db:GetCurrentProfile(), upgrade_version ) )
	
		if not ArkInventory.db.profile.option["global"] then
			ArkInventory.db.profile.option["global"] = { }
		end

		if not ArkInventory.db.profile.option.global["category"] then
			ArkInventory.db.profile.option.global["category"] = { }
		end
		
		if ArkInventory.db.profile.option["window"] then
	
			if ArkInventory.db.profile.option.window["scale"] then
				ArkInventory.db.profile.option["local"][ArkInventory.Const.Location.Bag]["window"]["scale"] = ArkInventory.db.profile.option.window.scale
				ArkInventory.db.profile.option.window.scale = nil
			end
			
			if ArkInventory.db.profile.option.window["col"] then
	
				if ArkInventory.db.profile.option.window.col[ArkInventory.Const.Location.Bag] then
					ArkInventory.db.profile.option["local"][ArkInventory.Const.Location.Bag]["window"]["width"] = ArkInventory.db.profile.option.window.col[ArkInventory.Const.Location.Bag]
					ArkInventory.db.profile.option.window.col[ArkInventory.Const.Location.Bag] = nil
				end
	
				if ArkInventory.db.profile.option.window.col[ArkInventory.Const.Location.Bank] then
					ArkInventory.db.profile.option["local"][ArkInventory.Const.Location.Bank]["window"]["width"] = ArkInventory.db.profile.option.window.col[ArkInventory.Const.Location.Bank]
					ArkInventory.db.profile.option.window.col[ArkInventory.Const.Location.Bank] = nil
				end
	
				if ArkInventory.db.profile.option.window.col[ArkInventory.Const.Location.Key] then
					ArkInventory.db.profile.option["local"][ArkInventory.Const.Location.Key]["window"]["width"] = ArkInventory.db.profile.option.window.col[ArkInventory.Const.Location.Key]
					ArkInventory.db.profile.option.window.col[ArkInventory.Const.Location.Key] = nil
				end
	
				ArkInventory.db.profile.option.window.col = nil
			
			end

			if ArkInventory.db.profile.option.window["border"] then
				ArkInventory.db.profile.option["local"][ArkInventory.Const.Location.Bag]["window"]["border"] = ArkInventory.db.profile.option.window.border
				ArkInventory.db.profile.option.window.border = nil
			end

			if ArkInventory.db.profile.option.window["colour"] then
				ArkInventory.db.profile.option["local"][ArkInventory.Const.Location.Bag]["window"]["colour"] = ArkInventory.db.profile.option.window.colour
				ArkInventory.db.profile.option.window.colour = nil
			end

			if ArkInventory.db.profile.option.window["ignorehidden"] then
				ArkInventory.db.profile.option["local"][ArkInventory.Const.Location.Bag]["slot"]["ignorehidden"] = ArkInventory.db.profile.option.window.ignorehidden
				ArkInventory.db.profile.option.window.ignorehidden = nil
			end
			
			if ArkInventory.db.profile.option.window["auto"] then
				ArkInventory.db.profile.option.global["auto"] = ArkInventory.db.profile.option.window.auto
				ArkInventory.db.profile.option.window.auto = nil
			end
	
			if ArkInventory.db.profile.option.window["framehide"] then
				ArkInventory.db.profile.option.global["framehide"] = ArkInventory.db.profile.option.window.framehide
				ArkInventory.db.profile.option.window.framehide = nil
			end

			ArkInventory.db.profile.option.window["width"] = nil
			ArkInventory.db.profile.option.window["hideblizzard"] = nil

		end
		
		ArkInventory.db.profile.option["window"] = nil
		
		if ArkInventory.db.profile.option["bar"] then
			ArkInventory.db.profile.option["local"][ArkInventory.Const.Location.Bag]["bar"] = ArkInventory.db.profile.option.bar
			ArkInventory.db.profile.option.bar = nil
		end
	
		if ArkInventory.db.profile.option["slot"] then
			ArkInventory.db.profile.option["local"][ArkInventory.Const.Location.Bag]["slot"] = ArkInventory.db.profile.option.slot
			ArkInventory.db.profile.option.slot = nil
		end
	
		if ArkInventory.db.profile.option["sort"] then
			ArkInventory.db.profile.option["local"][ArkInventory.Const.Location.Bag]["sort"] = ArkInventory.db.profile.option.sort
			ArkInventory.db.profile.option.sort = nil
		end
	
		if ArkInventory.db.profile.option["category"] then
				
			if ArkInventory.db.profile.option.category["custom"] then
				ArkInventory.db.profile.option.global["category"]["custom"] = ArkInventory.db.profile.option.category.custom
				ArkInventory.db.profile.option.category.custom = nil
			end
			
			if ArkInventory.db.profile.option.category["next"] then
				ArkInventory.db.profile.option.global["category"]["next"] = ArkInventory.db.profile.option.category.next
				ArkInventory.db.profile.option.category.next = nil
			end
					
			if ArkInventory.db.profile.option.category["item"] then
			
				for k, v in pairs( ArkInventory.db.profile.option.category.item ) do
					if v == 0 then
						ArkInventory.db.profile.option.category.item[k] = nil
					end
				end
			
				ArkInventory.db.profile.option.global["category"]["item"] = ArkInventory.db.profile.option.category.item
				ArkInventory.db.profile.option.category.item = nil
			end
	
			if ArkInventory.db.profile.option.category["location"] then
				ArkInventory.db.profile.option["local"][ArkInventory.Const.Location.Bag]["category"] = ArkInventory.db.profile.option.category.location
				ArkInventory.db.profile.option.category.location = nil
			end
			
			--ArkInventory.db.profile.option.category = nil
			
		end
			
		if ArkInventory.db.profile.option["offline"] then
			ArkInventory.db.profile.option.offline = nil
		end
	
		ArkInventory.db.profile.option["sync"] = nil

		ArkInventory.db.profile.option.version = upgrade_version
		ArkInventory.db.global.option.version = upgrade_version
		
	end

	
	upgrade_version = 1.4
	if ArkInventory.db.profile.option.version < upgrade_version then

		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], ArkInventory.db:GetCurrentProfile(), upgrade_version ) )
		
		-- categories 36, 37, 38 need to be relocated to 25
		if ArkInventory.db.profile.option["global"] and ArkInventory.db.profile.option.global["category"] and ArkInventory.db.profile.option.global.category["item"] then
			for k, v in pairs( ArkInventory.db.profile.option.global.category.item ) do
				if v == 36 or v == 37 or v == 38 then
					ArkInventory.db.profile.option.global.category.item[k] = 25
				end
			end
		end

		ArkInventory.db.profile.option.version = upgrade_version
		ArkInventory.db.global.option.version = upgrade_version
	
	end

	
	upgrade_version = 2
	if ArkInventory.db.profile.option.version < upgrade_version then

		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], ArkInventory.db:GetCurrentProfile(), upgrade_version ) )
		
		if ArkInventory.db.profile.option["global"] then
		
			if ArkInventory.db.profile.option.global["remember"] then
				ArkInventory.db.profile.option.global.remember["bank"] = nil
				ArkInventory.db.profile.option.global.remember["alt"] = nil
				ArkInventory.db.profile.option.global.remember = nil
			end
		
			if ArkInventory.db.profile.option.global["auto"] then
				if ArkInventory.db.profile.option.global.auto["open"] then
					ArkInventory.db.profile.option.global.auto.open["bank"] = nil
					ArkInventory.db.profile.option.global.auto.open["mail"] = nil
					ArkInventory.db.profile.option.global.auto.open["trade"] = nil
					ArkInventory.db.profile.option.global.auto.open["merchant"] = nil
					ArkInventory.db.profile.option.global.auto.open["auction"] = nil
					ArkInventory.db.profile.option.global.auto.open = nil
				end
			
				if ArkInventory.db.profile.option.global.auto["close"] then
					ArkInventory.db.profile.option.global.auto.close["bank"] = nil
					ArkInventory.db.profile.option.global.auto.close["mail"] = nil
					ArkInventory.db.profile.option.global.auto.close["trade"] = nil
					ArkInventory.db.profile.option.global.auto.close["merchant"] = nil
					ArkInventory.db.profile.option.global.auto.close["auction"] = nil
					ArkInventory.db.profile.option.global.auto.close["combat"] = nil
					ArkInventory.db.profile.option.global.auto.close = nil
				end
				
				ArkInventory.db.profile.option.global.auto = nil
			
			end
		
			if ArkInventory.db.profile.option.global["framehide"] then
				ArkInventory.db.profile.option.global.framehide["blizzard"] = nil
				ArkInventory.db.profile.option.global.framehide["status"] = nil
				ArkInventory.db.profile.option.global.framehide["header"] = nil
				ArkInventory.db.profile.option.global.framehide["changer"] = nil
				ArkInventory.db.profile.option.global.framehide = nil
			end
	
			if ArkInventory.db.profile.option.global["useglobal"] then
				ArkInventory.db.profile.option.useglobal = ArkInventory.db.profile.option.global.useglobal
				ArkInventory.db.profile.option.global.useglobal = nil
			end
			
			if ArkInventory.db.profile.option.global["category"] then
	
				local rule_id
				local item_id
				local cat_id
				local sep = "!"
				local cat_rule = sep
		
				if ArkInventory.db.profile.option.global.category["next"] then
					ArkInventory.db.profile.option.global.category.next = nil
				end
			
				if ArkInventory.db.profile.option.global.category["pt"] then
				
					-- move pt categorires to rules
					di = 0
					for cat_id, cat_name in ArkInventory.spairs( ArkInventory.db.profile.option.global.category.pt, function(a,b) return ArkInventory.db.profile.option.global.category.pt[a] > ArkInventory.db.profile.option.global.category.pt[b] end ) do
				
						d = { ["enabled"] = true, ["order"] = 1000 + di, ["name"] = "converted pt " .. cat_name, ["formula"] = "pt( " .. cat_name .. " )" }
						rule_id = ArkInventory.db.global.option.nextrule
						ArkInventory.RuleEntryAdd( rule_id, d )
						--ArkInventory.Output( { "moved pt category [", cat_id, "] to rule [", rule_id, "]" } )
						di = di + 1
			
						-- erase the pt category
						ArkInventory.db.profile.option.global.category.pt[cat_id] = nil
				
						-- bars that had the old number assigned need to use the new rule number
						for loc_id in pairs( ArkInventory.Global.Location ) do
							if ArkInventory.db.profile.option["local"][loc_id]["category"] then
								bar_id = ArkInventory.db.profile.option["local"][loc_id]["category"][cat_id]
								if bar_id then
									ArkInventory.db.profile.option["local"][loc_id]["rule"][rule_id] = bar_id
								end
								ArkInventory.db.profile.option["local"][loc_id]["category"][cat_id] = nil
							end
						end
				
					end
				
					ArkInventory.db.profile.option.global.category.pt = nil
				
				end
		
				if ArkInventory.db.profile.option.global.category["custom"] then
			
					-- move custom categorires to rules
					for cat_id, cat_name in pairs( ArkInventory.db.profile.option.global.category.custom ) do
						d = { ["enabled"] = true, ["order"] = 500, ["name"] = "converted custom " .. cat_name, ["formula"] = "false" }
						rule_id = ArkInventory.db.global.option.nextrule
						cat_rule = cat_rule .. cat_id .. "=" .. rule_id .. sep
						ArkInventory.RuleEntryAdd( rule_id, d )
						--ArkInventory.Output( { "moved custom category [", cat_id, "] to rule [", rule_id, "]" } )
		
						ArkInventory.db.profile.option.global.category.custom[cat_id] = nil
					
						for loc_id in pairs( ArkInventory.Global.Location ) do
							if ArkInventory.db.profile.option["local"][loc_id]["category"] then
								bar_id = ArkInventory.db.profile.option["local"][loc_id]["category"][cat_id]
								if bar_id then
									ArkInventory.db.profile.option["local"][loc_id]["rule"][rule_id] = bar_id
								end
								ArkInventory.db.profile.option["local"][loc_id]["category"][cat_id] = nil
							end
						end
			
					end
				
					ArkInventory.db.profile.option.global.category.custom = nil
				
				end

				-- remove any remaining negative categories assigned to bars - deleted custom categories
				for loc_id in pairs( ArkInventory.Global.Location ) do
					if ArkInventory.db.profile.option["local"] and ArkInventory.db.profile.option["local"][loc_id] and ArkInventory.db.profile.option["local"][loc_id]["category"] then
						for cat_id, bar_id in pairs( ArkInventory.db.profile.option["local"][loc_id]["category"] ) do
							if cat_id < 0 then
								ArkInventory.db.profile.option["local"][loc_id]["category"][cat_id] = nil
							end
						end
					end
				end

		
				-- convert to new system category numbers
				ArkInventory.CategoryRenumber_145_200( 1, -402 )
				ArkInventory.CategoryRenumber_145_200( 11, -403 )
				ArkInventory.CategoryRenumber_145_200( 12, -404 )
				ArkInventory.CategoryRenumber_145_200( 13, -405 )
				ArkInventory.CategoryRenumber_145_200( 14, -406 )
				ArkInventory.CategoryRenumber_145_200( 15, -407 )
				ArkInventory.CategoryRenumber_145_200( 16, -408 )
				ArkInventory.CategoryRenumber_145_200( 17, -409 )
				ArkInventory.CategoryRenumber_145_200( 18, -410 )
				ArkInventory.CategoryRenumber_145_200( 19, -411 )
				ArkInventory.CategoryRenumber_145_200( 20, -412 )
				ArkInventory.CategoryRenumber_145_200( 22, -413 )
				ArkInventory.CategoryRenumber_145_200( 23, -414 )
				ArkInventory.CategoryRenumber_145_200( 24, -415 )
				ArkInventory.CategoryRenumber_145_200( 25, -416 )
				ArkInventory.CategoryRenumber_145_200( 26, -417 )
				ArkInventory.CategoryRenumber_145_200( 27, -418 )
				ArkInventory.CategoryRenumber_145_200( 28, -419 )
				ArkInventory.CategoryRenumber_145_200( 29, -420 )
				ArkInventory.CategoryRenumber_145_200( 32, -421 )
				ArkInventory.CategoryRenumber_145_200( 33, -422 )
				ArkInventory.CategoryRenumber_145_200( 34, -423 )
				ArkInventory.CategoryRenumber_145_200( 35, -901 )
				ArkInventory.CategoryRenumber_145_200( 39, -424 )
				ArkInventory.CategoryRenumber_145_200( 40, -902 )
				ArkInventory.CategoryRenumber_145_200( 50, -401 )
				ArkInventory.CategoryRenumber_145_200( 51, -425 )
				ArkInventory.CategoryRenumber_145_200( 51, -426 )
				ArkInventory.CategoryRenumber_145_200( 53, -427 )
				ArkInventory.CategoryRenumber_145_200( 54, -428 )
				
				ArkInventory.CategoryRenumber_145_200( 101, -108 )
				ArkInventory.CategoryRenumber_145_200( 102, -107 )
				ArkInventory.CategoryRenumber_145_200( 103, -111 )
				ArkInventory.CategoryRenumber_145_200( 104, -112 )
				ArkInventory.CategoryRenumber_145_200( 105, -101 )
				ArkInventory.CategoryRenumber_145_200( 106, -102 )
				ArkInventory.CategoryRenumber_145_200( 107, -103 )
				ArkInventory.CategoryRenumber_145_200( 108, -104 )
				ArkInventory.CategoryRenumber_145_200( 109, -110 )
				ArkInventory.CategoryRenumber_145_200( 110, -113 )
				ArkInventory.CategoryRenumber_145_200( 111, -105 )
				ArkInventory.CategoryRenumber_145_200( 112, -106 )
				ArkInventory.CategoryRenumber_145_200( 113, -109 )
		
				ArkInventory.CategoryRenumber_145_200( 201, -201 )
				ArkInventory.CategoryRenumber_145_200( 202, -202 )
				ArkInventory.CategoryRenumber_145_200( 203, -203 )
				ArkInventory.CategoryRenumber_145_200( 204, -204 )
				ArkInventory.CategoryRenumber_145_200( 205, -205 )
				ArkInventory.CategoryRenumber_145_200( 206, -206 )
				ArkInventory.CategoryRenumber_145_200( 207, -207 )
				ArkInventory.CategoryRenumber_145_200( 208, -208 )
				ArkInventory.CategoryRenumber_145_200( 209, -209 )
	
				ArkInventory.CategoryRenumber_145_200( 301, -301 )
				ArkInventory.CategoryRenumber_145_200( 2, -302 )
				ArkInventory.CategoryRenumber_145_200( 3, -303 )
				ArkInventory.CategoryRenumber_145_200( 4, -310 )
				ArkInventory.CategoryRenumber_145_200( 5, -304 )
				ArkInventory.CategoryRenumber_145_200( 6, -305 )
				ArkInventory.CategoryRenumber_145_200( 7, -306 )
				ArkInventory.CategoryRenumber_145_200( 8, -307 )
				ArkInventory.CategoryRenumber_145_200( 9, -308 )
				ArkInventory.CategoryRenumber_145_200( 10, -309 )
				ArkInventory.CategoryRenumber_145_200( 30, -310 )
				ArkInventory.CategoryRenumber_145_200( 31, -311 )
				ArkInventory.CategoryRenumber_145_200( 302, -312 )
				
				if not ArkInventory.db.profile.option["category"] then
					ArkInventory.db.profile.option["category"] = { }  -- why i have to do this i have no idea, acedb is supposed to take care of it??????
				end

				-- move the item system category assignments (not using rules for these)			
				if ArkInventory.db.profile.option.global.category["item"] then
					
					for k, cat_id in pairs( ArkInventory.db.profile.option.global.category.item ) do
						-- 1.45 format = id . soulbound . suffix . enchant
						nk1, nk2, nk3, nk4 = strmatch( k, "^(%-?%d+)%.(%-?%d+)%.(%-?%d+)%.(%-?%d+)$" )
						if nk1 and nk2 and nk3 and nk4 then
							-- 2.00 format = id : enchant : suffix : soulbound
							item_id = tostring( nk1 .. ":" .. nk4 .. ":" .. nk3 .. ":" .. nk2 )
							--ArkInventory.Output( { "moving [", k, "] to [", item_id, "] value is [", cat_id, "]" } )
							ArkInventory.db.profile.option.category[item_id] = cat_id
						else
							--ArkInventory.Output( { "item id [", k, "] is invalid and has been ignored" } )
						end
						ArkInventory.db.profile.option.global.category.item[k] = nil
					end
					--ArkInventory.db.profile.option.global.category.item = nil

				end
	
				-- move system category bar assignments to the new rule bar assignments location
				for loc_id in pairs( ArkInventory.Global.Location ) do
					if ArkInventory.db.profile.option["local"] and ArkInventory.db.profile.option["local"][loc_id] then
						for k, v in pairs( ArkInventory.db.profile.option["local"][loc_id]["category"] ) do
							if k < 0 then
								ArkInventory.db.profile.option["local"][loc_id]["rule"][k] = v
								ArkInventory.db.profile.option["local"][loc_id]["category"][k] = nil
							end
						end
						
					end
				end
					
				ArkInventory.db.profile.option.global.category = nil
				
			end
			
			ArkInventory.db.profile.option.global = nil
			
		end
	
		ArkInventory.db.profile.option.version = upgrade_version
		ArkInventory.db.global.option.version = upgrade_version
	
	end


	upgrade_version = 2.08
	if ArkInventory.db.profile.option.version < upgrade_version then
	
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], ArkInventory.db:GetCurrentProfile(), upgrade_version ) )
		
		-- cleans up the enabled/disabled value on the rules for this profile
		for k, v in pairs( ArkInventory.db.profile.option.rule ) do
			if v then
				ArkInventory.db.profile.option.rule[k] = true
			else
				ArkInventory.db.profile.option.rule[k] = nil
			end
		end


		-- move the categories back from ["rule"] to ["category"]
		for loc_id in pairs( ArkInventory.Global.Location ) do
		
			if ArkInventory.db.profile.option["local"] and ArkInventory.db.profile.option["local"][loc_id] and ArkInventory.db.profile.option["local"][loc_id]["rule"] then

				if not ArkInventory.db.profile.option["local"][loc_id]["category"] then
					ArkInventory.db.profile.option["local"][loc_id]["category"] = { }
				end

				for k, v in pairs( ArkInventory.db.profile.option["local"][loc_id]["rule"] ) do
					ArkInventory.db.profile.option["local"][loc_id]["category"][k] = v
					ArkInventory.db.profile.option["local"][loc_id]["rule"][k] = nil
				end
			end
		end
		
		ArkInventory.db.profile.option.version = upgrade_version
		ArkInventory.db.global.option.version = upgrade_version
	
	end



	upgrade_version = 2.11
	if ArkInventory.db.profile.option.version < upgrade_version then
	
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], ArkInventory.db:GetCurrentProfile(), upgrade_version ) )

		if ArkInventory.db.profile.option.useglobal == true then
		
			for loc_id, loc in pairs( ArkInventory.Global.Location ) do
				ArkInventory.db.profile.option.use[loc_id] = ArkInventory.Const.Location.Bag
			end
			
		else
		
			for loc_id, loc in pairs( ArkInventory.Global.Location ) do
				ArkInventory.db.profile.option.use[loc_id] = loc_id
			end
		
		end

		ArkInventory.db.profile.option.useglobal = true

		
		for loc_id in pairs( ArkInventory.Global.Location ) do
			if ArkInventory.db.profile.option["local"] and ArkInventory.db.profile.option["local"][loc_id] then
				local v = ArkInventory.db.profile.option["local"][loc_id]["anchor"]
				ArkInventory.db.profile.option["local"][loc_id]["anchor"] = { ["x"] = -2, ["y"] = -2, ["point"] = v }
			end
		end

		
		ArkInventory.db.profile.option.version = upgrade_version
		ArkInventory.db.global.option.version = upgrade_version

	end



	upgrade_version = 2.12
	if ArkInventory.db.profile.option.version < upgrade_version then
	
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], ArkInventory.db:GetCurrentProfile(), upgrade_version ) )

		if ArkInventory.db.global.option["framehide"] ~= nil then
			ArkInventory.db.global.option.framehide = nil
		end
			
		for loc_id in ipairs( ArkInventory.Global.Location ) do
			if ArkInventory.db.profile.option["local"] and ArkInventory.db.profile.option["local"][loc_id] and ArkInventory.db.profile.option["local"][loc_id]["anchor"] then
				ArkInventory.db.profile.option["local"][loc_id]["anchor"]["x"] = nil
				ArkInventory.db.profile.option["local"][loc_id]["anchor"]["y"] = nil
			end
		end
		
		ArkInventory.db.profile.option.version = upgrade_version
		ArkInventory.db.global.option.version = upgrade_version

	end
	


	upgrade_version = 2.13
	if ArkInventory.db.profile.option.version < upgrade_version then
	
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], ArkInventory.db:GetCurrentProfile(), upgrade_version ) )

		-- ai framehide option moved to profile+settings, blizzard framehide moved to account.control
		if ArkInventory.db.global.option["framehide"] ~= nil then
			ArkInventory.db.global.option.framehide = nil
		end

		-- newitem option moved to profile+settings
		if ArkInventory.db.global.option["newitem"] ~= nil then
			ArkInventory.db.global.option.newitem = nil
		end
		
		if ArkInventory.db.profile.option["local"] then

			-- bank and keyring locations swapped
			if ArkInventory.db.profile.option["local"][2] then
				ArkInventory.db.profile.option["local"][9] = ArkInventory.db.profile.option["local"][2]
				ArkInventory.db.profile.option["local"][2] = nil
			end
			
			if ArkInventory.db.profile.option["local"][3] then
				ArkInventory.db.profile.option["local"][2] = ArkInventory.db.profile.option["local"][3]
				ArkInventory.db.profile.option["local"][3] = nil
			end

			if ArkInventory.db.profile.option["local"][9] then
				ArkInventory.db.profile.option["local"][3] = ArkInventory.db.profile.option["local"][9]
				ArkInventory.db.profile.option["local"][9] = nil
			end
			

			-- convert item id's in categories
			if ArkInventory.db.profile.option["category"] then
				ncat = { }
				for k, v in pairs( ArkInventory.db.profile.option.category ) do
					local id, enchant, suffix, soulbound = strsplit( ":", k )
					if not ( soulbound == nil or id == nil ) then
						local nk = string.format( "%s:%s", soulbound, id )
						ncat[nk] = v
					end
				end
				ArkInventory.db.profile.option.category = ncat
			end
		
			for loc_id, ld in pairs( ArkInventory.db.profile.option["local"] ) do
			
				-- anchors moved to profile+settings
				if ld["window"] and ld.window["anchor"] then
					ld.window.anchor = nil
				end
				
			end

			-- local renamed to location
			ArkInventory.ConvertLocalToLocation()
			
		end
		
		ArkInventory.db.profile.option.version = upgrade_version
		ArkInventory.db.global.option.version = upgrade_version

	end

	
	
	upgrade_version = 2.26
	if ArkInventory.db.profile.option.version < upgrade_version then
	
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], ArkInventory.db:GetCurrentProfile(), upgrade_version ) )

		for loc_id in pairs( ArkInventory.Global.Location ) do

			if type( ArkInventory.db.profile.option.location[loc_id].window.border ) ~= "table" then
				x = { ["show"] = ArkInventory.db.profile.option.location[loc_id].window.border }
				ArkInventory.db.profile.option.location[loc_id].window.border = x
			end
			
			if type( ArkInventory.db.profile.option.location[loc_id].bar.border ) ~= "table" then
				x = { ["show"] = ArkInventory.db.profile.option.location[loc_id].bar.border }
				ArkInventory.db.profile.option.location[loc_id].bar.border = x
			end
			
			if type( ArkInventory.db.profile.option.location[loc_id].slot.border ) ~= "table" then
				x = { ["show"] = true, ["rarity"] = ArkInventory.db.profile.option.location[loc_id].slot.border }
				ArkInventory.db.profile.option.location[loc_id].slot.border = x
			end

		end
		
		ArkInventory.db.profile.option.version = upgrade_version
		ArkInventory.db.global.option.version = upgrade_version

	end

	

	upgrade_version = 3.00
	if ArkInventory.db.profile.option.version < upgrade_version then
	
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], ArkInventory.db:GetCurrentProfile(), upgrade_version ) )
	
		ArkInventory.db.global.cache = nil
		
		for k, v in pairs( ArkInventory.db.profile.option.category ) do
			if type( v ) == "number" then
				ArkInventory.db.profile.option.category[k] = ArkInventory.CategoryCodeJoin( ArkInventory.Const.Category.Type.System, abs( v ) )
			end
		end
		
		local t
		for _, loc in pairs( ArkInventory.db.profile.option.location ) do
		
			t = { }
			
			for k, v in pairs( loc.category ) do
				if type( k ) == "number" then
					if k < 0 then
						local id = ArkInventory.CategoryCodeJoin( ArkInventory.Const.Category.Type.System, abs( k ) )
						t[id] = v
					else
						local id = ArkInventory.CategoryCodeJoin( ArkInventory.Const.Category.Type.Rule, k )
						t[id] = v
					end
					loc.category[k] = nil
				end
			end
			
			for k, v in pairs( t ) do
				loc.category[k] = v
			end
			
		end
		
		
		ArkInventory.db.profile.option.version = upgrade_version

	end

	if ArkInventory.db.global.vendor.version < upgrade_version then
	
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_GLOBAL"], "vendor", upgrade_version ) )

			for k, v in pairs( ArkInventory.db.global.vendor ) do
				if type( k ) == "number" then
					ArkInventory.db.global.vendor.price[k] = v
					ArkInventory.db.global.vendor[k] = nil
				end
			end
		
		ArkInventory.db.global.vendor.version = upgrade_version

	end
	
	if ArkInventory.db.global.player.version < upgrade_version then
	
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_GLOBAL"], "player", upgrade_version ) )
	
		for _, pd in pairs( ArkInventory.db.global.player.data ) do
		
			pd.info = nil
			
			if type( pd.offline ) == "table" then
				for k in pairs( pd.offline ) do
					pd["save"][k] = pd.offline[k]
					pd.offline[k] = nil
				end
			end
			
		end

		ArkInventory.EraseSavedData()
		
		ArkInventory.db.global.player.version = upgrade_version
	
	end
	
	if ArkInventory.db.global.option.version < upgrade_version then
	
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_GLOBAL"], "rule", upgrade_version ) )
	
		if ArkInventory.db.global.option.rule then
		
			for k, v in pairs( ArkInventory.db.global.option.rule ) do
				ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data[k] = v
				ArkInventory.db.global.option.rule[k] = nil
			end
			
			ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].next = ArkInventory.db.global.option.nextrule
			ArkInventory.db.global.option.nextrule = nil
			
		end
		
		ArkInventory.db.global.option.version = upgrade_version
	
	end
	
	upgrade_version = 3.0004
	if ArkInventory.db.profile.option.version < upgrade_version then
	
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], ArkInventory.db:GetCurrentProfile(), upgrade_version ) )
		
		-- convert category 415 (mount) to 114 (riding)
		local cat_old = ArkInventory.CategoryCodeJoin( ArkInventory.Const.Category.Type.System, 415 )
		local cat_new = ArkInventory.CategoryCodeJoin( ArkInventory.Const.Category.Type.System, 114 )
		ArkInventory.CategoryRenumber_300( cat_old, cat_new )
		
		
		ArkInventory.db.profile.option.version = upgrade_version
	
	end
	
	upgrade_version = 3.0005
	if ArkInventory.db.global.option.version < upgrade_version then
	
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_GLOBAL"], "option", upgrade_version ) )
		
		ArkInventory.db.global.option.bugfix.alert = ArkInventory.db.global.option.bugfix_alert_framelevel
		
		
		ArkInventory.db.profile.option.version = upgrade_version
	
	end
	
	
	
	
	ArkInventory.db.profile.option.category["0:0"] = nil
	
	-- update all rules to ensure they are compiled and not damaged (and in case we change anything in the rule code)
	for k, v in pairs( ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data ) do
		--if not v.damaged then
			v["enabled"] = ArkInventory.db.profile.option.rule[k]
			ArkInventory.RuleEntryEdit( k, v )
		--end
	end
	
	-- check sort keys
	ArkInventory.SortKeyCheck()
	
	
	-- set version to current mod version

	upgrade_version = ArkInventory.Const.Program.Version

	ArkInventory.db.profile.option.version = upgrade_version

	ArkInventory.db.global.option.version = upgrade_version
	ArkInventory.db.global.vendor.version = upgrade_version
	ArkInventory.db.global.player.version = upgrade_version

	
end
