function ArkInventory.Frame_Search_Hide()
	ARKINV_Search:Hide()
end
	
function ArkInventory.Frame_Search_Show()
	ARKINV_Search:Show()
end

function ArkInventory.Frame_Search_Toggle()

	if ARKINV_Search:IsVisible() then
		ARKINV_Search:Hide()
	else
		ARKINV_Search:Show()
	end
	
end


function ArkInventory.Frame_Search_Paint()

	local frame = ARKINV_Search

	-- scale
	frame:SetScale( ArkInventory.db.profile.option.ui.search.scale or 1 )
	
	-- background
	
	-- border
	for _, z in pairs( { frame:GetChildren() } ) do
	
		if ArkInventory.db.profile.option.ui.search.border.show then
		
			local default = "Tooltip"
		
			local file = ArkInventory.db.profile.option.ui.search.border.file or ArkInventory.Const.Texture.Border[default].file
			local size = ArkInventory.db.profile.option.ui.search.border.size or ArkInventory.Const.Texture.Border[default].size
			local scale = ArkInventory.db.profile.option.ui.search.border.scale or 1
			z:SetBackdrop( { ["edgeFile"] = file, ["edgeSize"] = size * scale } )
			
			local colour = ArkInventory.db.profile.option.ui.search.border.colour
			z:SetBackdropBorderColor( colour.r, colour.g, colour.b, 1 )
			
		else
		
			z:SetBackdrop( { ["edgeFile"] = "" } )
			
		end
		
	end

	
	-- font
	ArkInventory.SetFontFrame( frame, ArkInventory.db.profile.option.ui.search.font.name )
	
	-- title
	obj = getfenv()[frame:GetName() .. "TitleWho"]

	t = string.format( "%s: %s %s", ArkInventory.Localise["MOD_MENU_MAIN_SEARCH"], ArkInventory.Const.Program.Name, ArkInventory.Global.Version )

	obj:SetText( t )
	
end

function ArkInventory.Frame_Search_Build_Row()

	local f = this:GetName()
	
	local x
	local sz = 18
	
	-- item icon
	x = getfenv()[f .. "T1"]
	x:ClearAllPoints()
	x:SetWidth( sz )
	x:SetHeight( sz )
	x:SetPoint( "LEFT", 17, 0 )
	x:Show()

	-- item name
	x = getfenv()[f .. "C1"]
	x:ClearAllPoints()
	x:SetWidth( 250 )
	x:SetPoint( "LEFT", f .. "T1", "RIGHT", 12, 0 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetPoint( "RIGHT", -5, 0 )
	x:SetTextColor( 1, 1, 1, 1 )
	x:SetJustifyH( "LEFT", 0, 0 )
	x:Show()


--[[
	-- location icon
	x = getfenv()[f .. "T2"]
	x:ClearAllPoints()
	x:SetWidth( sz )
	x:SetHeight( sz )
	x:SetPoint( "RIGHT", f, "RIGHT", -5, 0 )
	x:Show()

	-- count
	x = getfenv()[f .. "C3"]
	x:ClearAllPoints()
	x:SetWidth( 75 )
	x:SetPoint( "RIGHT", f .. "T2", "LEFT", -12, 0 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetJustifyH( "RIGHT", 0, 0 )
	x:Show()

	-- who
	x = getfenv()[f .. "C2"]
	x:ClearAllPoints()
	x:SetPoint( "LEFT", f .. "C1", "RIGHT", 5, 0 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetPoint( "RIGHT", f .. "C3", "LEFT", -5, 0 )
	x:SetTextColor( 1, 1, 1, 1 )
	x:SetJustifyH( "LEFT", 0, 0 )
	x:Show()
]]--

end

function ArkInventory.Frame_Search_Build_Table( f )

	if not f or type( f ) ~= "string" then f = this:GetName() end

	local p = getfenv()[f]
	if not p then
		ArkInventory.Output( { RED_FONT_COLOR_CODE, "OOPS: Invalid value at ArkInventory.Frame_Search_Build_Table( [", f, "] )" } )
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

function ArkInventory.Frame_Search_Table_Row_OnClick( frame )

	h = getfenv()[this:GetName() .. "Id"]:GetText()
	if HandleModifiedItemClick( h ) then
		return
	end
	
end

function ArkInventory.Frame_Search_Table_Reset( f )

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

function ArkInventory.Frame_Search_Table_Refresh_old( f )

	if not f then
		f = this:GetParent():GetParent():GetParent():GetName()
	end

	-- ArkInventory.Print( "Frame_Search_Table_Refresh( " .. ArkInventory.nilStringText( f ) .. " ), " .. this:GetName() )

	local p = getfenv()[f]
	if not p then
		ArkInventory.Output( { RED_FONT_COLOR_CODE, "OOPS: Invalid widget name at Frame_Search_Table_Refresh( ", f, " )" } )
		return
	end
	
	f = f .. "View"
	
	local ft = f .. "Table"
	local fs = f .. "Search"

	local height = tonumber( getfenv()[ft .. "RowHeight"]:GetText() )
	local rows = tonumber( getfenv()[ft .. "NumRows"]:GetText() )

	local line
	local lineplusoffset
	
	ArkInventory.Frame_Search_Table_Reset( f )

	-- collect all valid items
	local filter = getfenv()[fs .. "Filter"]:GetText()
	--ArkInventory.Print( "filter = [" .. filter .. "]" )

	local inv = { }
	
	local realm = GetRealmName()
	local faction = UnitFactionGroup( "player" )

	local apd = ArkInventory.db.global.player.data	

	for _, pd in ArkInventory.spairs( apd ) do

		if pd.info.realm == realm and pd.info.faction == faction then
			
			local pl = ArkInventory.db.global.cache.realm[pd.info.realm].faction[pd.info.faction].character[pd.info.name]
			
			if pl and pl.location then
			
				local me = false
				if pd.info.player_id == ArkInventory.Global.Me.info.player_id then
					me = true
				end

				for l, ld in pairs( pl.location ) do
				
					if ld.active then
						for b, bd in pairs( ld.bag ) do
							for s, sd in pairs( bd.slot ) do
							
								if sd.h then
								
									local item_name = string.match( sd.h, "%[(.+)%]" )
									local ignore = false
		
									if filter ~= "" then
										if not string.find( string.lower( item_name or "" ), string.lower( filter ) ) then
											ignore = true
										end
									end
		
									if not ignore then
									
										local id = ArkInventory.TooltipItemID( sd.h )
										
										if not inv[id] then
											inv[id] = { ["sorted"]=item_name, ["h"]=sd.h }
--										else
--											inv[id].count = inv[id].count + sd.count
										end
										
									end
								
								end
							end
						end
					end
					
				end
				
			end
			
		end
		
	end


	
	local t = { }
	local tc = 0
	
	for i in pairs( inv ) do
		tc = tc + 1
		t[tc] = inv[i]
	end
	
	
	--table.insert( t, { ["sorted"]=format( "%s!%s!%04i", pd.info.player_id, item_name, l ), ["h"]=sd.h, ["who"]=pd.info.name, ["loc_id"]=l, ["item_name"]=item_name, ["item_texture"]=item_texture, ["item_count"]=sd.count } )
	--tc = tc + 1

	
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
			
			getfenv()[linename .. "Id"]:SetText( r.h )

			getfenv()[linename .. "T1"]:SetTexture( ArkInventory.ItemGetTexture( r.h ) )
			
			--getfenv()[linename .. "T2"]:SetTexture( ArkInventory.Global.Location[r.loc_id].Texture )

			getfenv()[linename .. "C1"]:SetText( r.h )

			--getfenv()[linename .. "C2"]:SetText( r.who )

			--c = string.format( r.count )
			--getfenv()[linename .. "C3"]:SetText( c )

			getfenv()[linename]:Show()
			
		else
		
			getfenv()[linename .. "Id"]:SetText( "" )
			getfenv()[linename]:Hide()
			
		end
	end

	-- ~~~~ clean table t
	
end

function ArkInventory.Frame_Search_Table_Refresh( f )

	if not f then
		f = this:GetParent():GetParent():GetParent():GetName()
	end
	
--	if type( f ) == "table" then
--		f = f:GetParent():GetParent():GetParent():GetName()
--	end
	
	--ArkInventory.Output( { "Frame_Search_Table_Refresh( ", f, " ), ", this:GetName() } )
	
	local p = getfenv()[f]
	if not p then
		ArkInventory.Output( { RED_FONT_COLOR_CODE, "OOPS: Invalid widget name at Frame_Search_Table_Refresh( ", f, " )" } )
		return
	end
	
	f = f .. "View"
	
	local ft = f .. "Table"
	local fs = f .. "Search"

	local height = tonumber( getfenv()[ft .. "RowHeight"]:GetText() )
	local rows = tonumber( getfenv()[ft .. "NumRows"]:GetText() )

	local line
	local lineplusoffset
	
	ArkInventory.Frame_Search_Table_Reset( f )

	-- collect all valid items
	local filter = getfenv()[fs .. "Filter"]:GetText()
	--ArkInventory.Print( "filter = [" .. filter .. "]" )

	local inv = { }
	
	local cp = ArkInventory.Global.Me

	for p, pd in ArkInventory.spairs( ArkInventory.db.global.player.realm[cp.info.realm].faction[cp.info.faction].name ) do
	
		for l, ld in pairs( pd.location ) do
			
			for b, bd in pairs( ld.bag ) do
			
				for s, sd in pairs( bd.slot ) do
					
					if sd.h then
						
						local item_name = string.match( sd.h, "%[(.+)%]" )
						local ignore = false
		
						if filter ~= "" then
							if not string.find( string.lower( item_name or "" ), string.lower( filter ) ) then
								ignore = true
							end
						end
		
						if not ignore then
							
							local id = ArkInventory.TooltipItemID( sd.h )
							
							if not inv[id] then
								inv[id] = { ["sorted"]=item_name, ["h"]=sd.h }
							end
							
						end
						
					end
					
				end
				
			end
			
		end
		
	end


	
	local t = { }
	local tc = 0
	
	for i in pairs( inv ) do
		tc = tc + 1
		t[tc] = inv[i]
	end
	
	
	--table.insert( t, { ["sorted"]=format( "%s!%s!%04i", pd.info.player_id, item_name, l ), ["h"]=sd.h, ["who"]=pd.info.name, ["loc_id"]=l, ["item_name"]=item_name, ["item_texture"]=item_texture, ["item_count"]=sd.count } )
	--tc = tc + 1

	
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
			
			getfenv()[linename .. "Id"]:SetText( r.h )

			getfenv()[linename .. "T1"]:SetTexture( ArkInventory.ItemGetTexture( r.h ) )
			
			getfenv()[linename .. "C1"]:SetText( r.h )

			getfenv()[linename]:Show()
			
		else
		
			getfenv()[linename .. "Id"]:SetText( "" )
			getfenv()[linename]:Hide()
			
		end
	end

	-- ~~~~ clean table t
	
end

function ArkInventory_Frame_Search_Table_Refresh()
	ArkInventory.Frame_Search_Table_Refresh()
end
