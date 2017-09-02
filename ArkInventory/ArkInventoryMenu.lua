
function ArkInventory.MenuMainOpen( frame )

	if not frame then
		frame = this
	end

	if ArkInventory.Lib.DewDrop:IsOpen( this ) then
	
		ArkInventory.Lib.DewDrop:Close()
	
	else

		local loc_id = frame.ARK_Data.loc_id
		local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	
		local base_options = { type = "group", args = {} }
		ArkInventory.Lib.DewDrop:InjectAceOptionsTable( ArkInventory, base_options )
	
		local anchorpoints = {
			[ArkInventory.Const.Anchor.TopRight] = ArkInventory.Localise["GENERIC_TOPRIGHT"],
			[ArkInventory.Const.Anchor.BottomRight] = ArkInventory.Localise["GENERIC_BOTTOMRIGHT"],
			[ArkInventory.Const.Anchor.BottomLeft] = ArkInventory.Localise["GENERIC_BOTTOMLEFT"],
			[ArkInventory.Const.Anchor.TopLeft] = ArkInventory.Localise["GENERIC_TOPLEFT"],
		}

		local x, p, rp
		x = this:GetLeft() + ( this:GetRight() - this:GetLeft() ) / 2
		if ( x >= ( GetScreenWidth() / 2 ) ) then
			p = "TOPRIGHT"
			rp = "TOPLEFT"
		else
			p = "TOPLEFT"
			rp = "TOPRIGHT"
		end
	
		ArkInventory.Lib.DewDrop:Open( this,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
				
				if level == 1 then
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Const.Program.Name,
						"isTitle", true,
						"textHeight", 14
					)
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Global.Version,
						"nonClickable", true
					)

					ArkInventory.Lib.DewDrop:AddLine()
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["OPT_CONFIG"],
						"closeWhenClicked", true,
						"func", function()
							ArkInventory.Lib.Dialog:Open( ArkInventory.Const.Frame.Options.Internal )
						end
					)
--[[
					if ArkInventory.LocationOptionGet( loc_id, { "framehide", "header" } ) then
					
						ArkInventory.Lib.DewDrop:AddLine()
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_SWITCH_CHARACTER"],
							"hasArrow", true,
							"value", "SWITCH_CHARACTER"
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_SWITCH_LOCATION"],
							"hasArrow", true,
							"value", "SWITCH_LOCATION"
						)
						
					end
					
					ArkInventory.Lib.DewDrop:AddLine()
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["OPT_ASSIGN_SETTINGS"],
						"hasArrow", true,
						"value", "SETTINGS"
					)
					
					ArkInventory.Lib.DewDrop:AddLine()
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MOD_MENU_MAIN_WINDOW"],
						"hasArrow", true,
						"value", "WINDOW"
					)
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MOD_MENU_MAIN_BARS"],
						"hasArrow", true,
						"value", "BARS"
					)
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MOD_MENU_MAIN_ITEMS"],
						"hasArrow", true,
						"value", "ITEMS"
					)
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MOD_MENU_MAIN_SORTING"],
						"hasArrow", true,
						"value", "SORTING"
					)

					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MOD_MENU_MAIN_EMPTY"],
						"hasArrow", true,
						"value", "EMPTY"
					)
					
					ArkInventory.Lib.DewDrop:AddLine()
					
					if loc_id == ArkInventory.Const.Location.Bag then
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["OPT_AUTO"],
							"hasArrow", true,
							"value", "AUTO"
						)
					end
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MOD_MENU_MAIN_TOOLTIP"],
						"hasArrow", true,
						"value", "TOOLTIP"
					)
]]--
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MOD_MENU_MAIN_ACTIONS"],
						"hasArrow", true,
						"value", "ACTIONS"
					)
--[[
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["GENERIC_FONT"],
						"hasArrow", true,
						"value", "GLOBAL_FONT"
					)
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["OPT_CONTROL"],
						"hasArrow", true,
						"value", "LOCATION_STATUS"
					)
					
					--ArkInventory.Lib.DewDrop:AddLine()
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MOD_MENU_MAIN_DEBUG"],
						"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_DEBUG"],
						"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_DEBUG_TEXT"],
						"hidden", true,
						"checked", ArkInventory.Const.Debug,
						"func", function()
							ArkInventory.Const.Debug = not ArkInventory.Const.Debug
						end
					)
					
					ArkInventory.Lib.DewDrop:AddLine()
]]--
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MOD_MENU_MAIN_CUSTOM_CATEGORIES"],
						"hasArrow", true,
						"value", "CUSTOM_CATEGORIES"
					)
					
					ArkInventory.Lib.DewDrop:AddLine()
					-- leaves space on the end for the base options
					
				end
				
				
				if level == 2 and value then
				
					local setting_name = " [" .. GREEN_FONT_COLOR_CODE .. string.upper( ArkInventory.Global.Location[ArkInventory.db.profile.option.use[loc_id]].Name ) .. FONT_COLOR_CODE_CLOSE .. "]"
					
					
					if value == "PROFILER" then

						ArkInventory.Lib.DewDrop:AddLine(
							"text", "PROFILER",
							"isTitle", true,
							"textHeight", 12
						)
						
						ArkInventory.Lib.DewDrop:AddLine()
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", "ResetCPUUsage",
							"func", function()
								ResetCPUUsage()
							end
						)

						ArkInventory.Lib.DewDrop:AddLine(
							"text", "UpdateAddOnCPUUsage",
							"func", function()
								UpdateAddOnCPUUsage()
							end
						)
					
					end
					
					
					if value == "SETTINGS" then

						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["OPT_ASSIGN_SETTINGS"] ),
							"isTitle", true,
							"textHeight", 12
						)
						ArkInventory.Lib.DewDrop:AddLine()

						for set_id, loc in ipairs( ArkInventory.Global.Location ) do
							if ArkInventory.Global.Location[set_id].canView then
								ArkInventory.Lib.DewDrop:AddLine(
									"text", loc.Name,
									"tooltipTitle", ArkInventory.Localise["OPT_ASSIGN_SETTINGS"],
									"tooltipText", string.format( ArkInventory.Localise["OPT_ASSIGN_SETTINGS_LOCATION_TEXT"], loc.Name, ArkInventory.Global.Location[loc_id].Name ),
									"isRadio", true,
									"checked", ArkInventory.db.profile.option.use[loc_id] == set_id,
									"closeWhenClicked", true,
									"func", function()
										ArkInventory.db.profile.option.use[loc_id] = set_id
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
									end
								)
							end
						end

					end
					
					
					if value == "GLOBAL_FONT" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["GENERIC_FONT"] ),
							"isTitle", true,
							"textHeight", 12
						)
						ArkInventory.Lib.DewDrop:AddLine()
						
						for _, fontName in pairs( ArkInventory.Lib.SharedMedia:List( "font" ) ) do
							ArkInventory.Lib.DewDrop:AddLine(
								"text", fontName,
								"tooltipTitle", ArkInventory.Localise["GENERIC_FONT"],
								"tooltipText", string.format( ArkInventory.Localise["MOD_MENU_MAIN_FONT_TEXT"], fontName ),
								"checked", fontName == ArkInventory.db.profile.option.font.name,
								"func", function()
									ArkInventory.SetFontAll( fontName )
								end
							)
						end
						
					end
					
					
					if value == "WINDOW" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["MOD_MENU_MAIN_WINDOW"] ) .. setting_name,
							"isTitle", true,
							"textHeight", 12
						)
						ArkInventory.Lib.DewDrop:AddLine()

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_HIDDEN"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_HIDDEN"],
							--"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_HIDDEN_TEXT"],
							"hasArrow", true,
							"value", "WINDOW_HIDDEN"
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_ANCHOR"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_ANCHOR"],
							"tooltipText", ArkInventory.Localise["GENERIC_ANCHOR_TEXT1"],
							"hasArrow", true,
							"value", "WINDOW_ANCHOR"
						)

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_SCALE"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_SCALE"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_WINDOW_SCALE_TEXT"],
							"hasArrow", true,
							"hasSlider", true,
							"sliderIsPercent", true,
							"sliderValue", ArkInventory.LocationOptionGet( loc_id, { "window", "scale" } ),
							"sliderMin", 0.4,
							"sliderMax", 2,
							"sliderStep", 0.05,
							"sliderFunc", function( v )
								if v ~= ArkInventory.LocationOptionGet( loc_id, { "window", "scale" } ) then
									ArkInventory.LocationOptionSet( loc_id, { "window", "scale" }, v )
									ArkInventory.Frame_Main_Scale_All()
								end
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_PADDING"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_PADDING"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_WINDOW_PADDING_TEXT"],
							"hasArrow", true,
							"hasSlider", true,
							"sliderValue", ArkInventory.LocationOptionGet( loc_id, { "window", "pad" } ),
							"sliderMin", 4,
							"sliderMax", 32,
							"sliderStep", 1,
							"sliderFunc", function( v )
								if v ~= ArkInventory.LocationOptionGet( loc_id, { "window", "pad" } ) then
									ArkInventory.LocationOptionSet( loc_id, { "window", "pad" }, v )
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
								end
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_WIDTH"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_WIDTH"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_WINDOW_WIDTH_TEXT"],
							"hasArrow", true,
							"hasSlider", true,
							"sliderValue", ArkInventory.LocationOptionGet( loc_id, { "window", "width" } ),
							"sliderMin", 6,
							"sliderMax", 40,
							"sliderStep", 1,
							"sliderFunc", function( v )
								if v ~= ArkInventory.LocationOptionGet( loc_id, { "window", "width" } ) then
									ArkInventory.LocationOptionSet( loc_id, { "window", "width" }, v )
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
								end
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_BACKGROUND_COLOUR"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_BACKGROUND_COLOUR"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_WINDOW_BACKGROUND_COLOR_TEXT"],
							"hasColorSwatch", true,
							"hasOpacity", true,
							"r", ArkInventory.LocationOptionGet( loc_id, { "window", "colour", "background", "r" } ),
							"g", ArkInventory.LocationOptionGet( loc_id, { "window", "colour", "background", "g" } ),
							"b", ArkInventory.LocationOptionGet( loc_id, { "window", "colour", "background", "b" } ),
							"opacity", ArkInventory.LocationOptionGet( loc_id, { "window", "colour", "background", "a" } ),
							"colorFunc", function( r, g, b, a )
								ArkInventory.LocationOptionSet( loc_id, { "window", "colour", "background", "r" }, r )
								ArkInventory.LocationOptionSet( loc_id, { "window", "colour", "background", "g" }, g )
								ArkInventory.LocationOptionSet( loc_id, { "window", "colour", "background", "b" }, b )
								ArkInventory.LocationOptionSet( loc_id, { "window", "colour", "background", "a" }, a )
								ArkInventory.Frame_Main_Paint_All()
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_BORDER"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_BORDER"],
							"tooltipText", ArkInventory.Localise["GENERIC_BORDER_TEXT"],
							"hasArrow", true,
							"value", "WINDOW_BORDER"
						)

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_WINDOW_BAGHIGHLIGHT_COLOR"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_WINDOW_BAGHIGHLIGHT_COLOR"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_WINDOW_BAGHIGHLIGHT_COLOR_TEXT"],
							"hasColorSwatch", true,
							"hasOpacity", false,
							"r", ArkInventory.LocationOptionGet( loc_id, { "window", "colour", "baghighlight", "r" } ),
							"g", ArkInventory.LocationOptionGet( loc_id, { "window", "colour", "baghighlight", "g" } ),
							"b", ArkInventory.LocationOptionGet( loc_id, { "window", "colour", "baghighlight", "b" } ),
							"colorFunc", function( r, g, b )
								ArkInventory.LocationOptionSet( loc_id, { "window", "colour", "baghighlight", "r" }, r )
								ArkInventory.LocationOptionSet( loc_id, { "window", "colour", "baghighlight", "g" }, g )
								ArkInventory.LocationOptionSet( loc_id, { "window", "colour", "baghighlight", "b" }, b )
							end
						)
					
					end
					
					
					if value == "BARS" then
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["MOD_MENU_MAIN_BARS"] ) .. setting_name,
							"isTitle", true,
							"textHeight", 12
						)

						ArkInventory.Lib.DewDrop:AddLine()
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_ANCHOR"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_ANCHOR"],
							"tooltipText", ArkInventory.Localise["GENERIC_ANCHOR_TEXT1"],
							"hasArrow", true,
							"value", "BAR_ANCHOR"
						)
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_BARS_PER_ROW"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_BARS_PER_ROW"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_BARS_PER_ROW_TEXT"],
							"hasArrow", true,
							"hasSlider", true,
							"sliderValue", ArkInventory.LocationOptionGet( loc_id, { "bar", "per" } ),
							"sliderMin", 1,
							"sliderMax", 16,
							"sliderStep", 1,
							"sliderFunc", function( v )
								if v ~= ArkInventory.LocationOptionGet( loc_id, { "bar", "per" } ) then
									ArkInventory.LocationOptionSet( loc_id, { "bar", "per" }, v )
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
								end
							end
						)
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_PADDING"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_PADDING"],
							"hasArrow", true,
							"value", "BAR_PADDING"
						)

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_BACKGROUND_COLOUR"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_BACKGROUND_COLOUR"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_BARS_BACKGROUND_TEXT"],
							"hasColorSwatch", true,
							"hasOpacity", true,
							"r", ArkInventory.LocationOptionGet( loc_id, { "bar", "colour", "background", "r" } ),
							"g", ArkInventory.LocationOptionGet( loc_id, { "bar", "colour", "background", "g" } ),
							"b", ArkInventory.LocationOptionGet( loc_id, { "bar", "colour", "background", "b" } ),
							"opacity", ArkInventory.LocationOptionGet( loc_id, { "bar", "colour", "background", "a" } ),
							"colorFunc", function( r, g, b, a )
								ArkInventory.LocationOptionSet( loc_id, { "bar", "colour", "background", "r" }, r )
								ArkInventory.LocationOptionSet( loc_id, { "bar", "colour", "background", "g" }, g )
								ArkInventory.LocationOptionSet( loc_id, { "bar", "colour", "background", "b" }, b )
								ArkInventory.LocationOptionSet( loc_id, { "bar", "colour", "background", "a" }, a )
								ArkInventory.Frame_Bar_Paint_All()
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_BORDER"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_BORDER"],
							"tooltipText", ArkInventory.Localise["GENERIC_BORDER_TEXT"],
							"hasArrow", true,
							"value", "BAR_BORDER"
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_BARS_COMPACT"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_BARS_COMPACT"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_BARS_COMPACT_TEXT"],
							"checked", ArkInventory.LocationOptionGet( loc_id, { "bar", "compact" } ),
							"func", function()
								ArkInventory.LocationOptionSet( loc_id, { "bar", "compact" }, not ArkInventory.LocationOptionGet( loc_id, { "bar", "compact" } ) )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_BARS_SHOW_EMPTY"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_BARS_SHOW_EMPTY"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_BARS_SHOW_EMPTY_TEXT"],
							"checked", ArkInventory.LocationOptionGet( loc_id, { "bar", "showempty" } ),
							"func", function()
								ArkInventory.LocationOptionSet( loc_id, { "bar", "showempty" }, not ArkInventory.LocationOptionGet( loc_id, { "bar", "showempty" } ) )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end
						)

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_BARS_NAME"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_BARS_NAME"],
							"hasArrow", true,
							"value", "BAR_NAMES"
						)
						
					end
					
					
					if value == "ITEMS" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["MOD_MENU_MAIN_ITEMS"] ) .. setting_name,
							"isTitle", true,
							"textHeight", 12
						)

						ArkInventory.Lib.DewDrop:AddLine()

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_ANCHOR"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_ANCHOR"],
							"tooltipText", ArkInventory.Localise["GENERIC_ANCHOR_TEXT1"],
							"hasArrow", true,
							"value", "ITEM_ANCHOR"
						)
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_PADDING"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_PADDING"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_PADDING_TEXT"],
							"hasArrow", true,
							"hasSlider", true,
							"sliderValue", ArkInventory.LocationOptionGet( loc_id, { "slot", "pad" } ),
							"sliderMin", 1,
							"sliderMax", 16,
							"sliderStep", 1,
							"sliderFunc", function( v )
								if ArkInventory.LocationOptionGet( loc_id, { "slot", "pad" } ) ~= v then
									ArkInventory.LocationOptionSet( loc_id, { "slot", "pad" }, v )
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
								end
							end
						)
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_BORDER"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_BORDER"],
							"tooltipText", ArkInventory.Localise["GENERIC_BORDER_TEXT"],
							"hasArrow", true,
							"value", "ITEM_BORDER"
						)
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_HIDDEN"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_HIDDEN"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_HIDDEN_TEXT"],
							"checked", ArkInventory.LocationOptionGet( loc_id, { "slot", "ignorehidden" } ),
							"func", function()
								ArkInventory.LocationOptionSet( loc_id, { "slot", "ignorehidden" }, not ArkInventory.LocationOptionGet( loc_id, { "slot", "ignorehidden" } ) )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end
						)
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_FADE"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_FADE"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_FADE_TEXT"],
							"checked", ArkInventory.LocationOptionGet( loc_id, { "slot", "offline", "fade" } ),
							"func", function()
								ArkInventory.LocationOptionSet( loc_id, { "slot", "offline", "fade" }, not ArkInventory.LocationOptionGet( loc_id, { "slot", "offline", "fade" } ) )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
							end
						)
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_TINT_USABLE"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_TINT_USABLE"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_TINT_USABLE_TEXT"],
							"checked", ArkInventory.LocationOptionGet( loc_id, { "slot", "unusable", "tint" } ),
							"func", function()
								ArkInventory.LocationOptionSet( loc_id, { "slot", "unusable", "tint" }, not ArkInventory.LocationOptionGet( loc_id, { "slot", "unusable", "tint" } ) )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
							end
						)

						
						ArkInventory.Lib.DewDrop:AddLine()
						ArkInventory.Lib.DewDrop:AddLine()

						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["MOD_MENU_MAIN_NEWITEM"] ),
							"isTitle", true,
							"textHeight", 12
						)
						ArkInventory.Lib.DewDrop:AddLine()
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_NEWITEM_SHOW"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_NEWITEM_SHOW"],
							"tooltipText", string.format( ArkInventory.Localise["MOD_MENU_MAIN_NEWITEM_SHOW_TEXT"], ArkInventory.Global.Location[loc_id].Name ),
							"checked", ArkInventory.LocationOptionGet( loc_id, { "slot", "new", "show" } ),
							"func", function()
								ArkInventory.LocationOptionSet( loc_id, { "slot", "new", "show" }, not ArkInventory.LocationOptionGet( loc_id, { "slot", "new", "show" } ) )
								ArkInventory.NewItemIndicator( loc_id )
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_COLOUR"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_COLOUR"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_NEWITEM_COLOUR_TEXT"],
							"hasColorSwatch", true,
							"disabled", not ArkInventory.LocationOptionGet( loc_id, { "slot", "new", "show" } ),
							"r", ArkInventory.LocationOptionGet( loc_id, { "slot", "new", "colour", "r" } ),
							"g", ArkInventory.LocationOptionGet( loc_id, { "slot", "new", "colour", "g" } ),
							"b", ArkInventory.LocationOptionGet( loc_id, { "slot", "new", "colour", "b" } ),
							"colorFunc", function( r, g, b )
								ArkInventory.LocationOptionSet( loc_id, { "slot", "new", "colour", "r" }, r )
								ArkInventory.LocationOptionSet( loc_id, { "slot", "new", "colour", "g" }, g )
								ArkInventory.LocationOptionSet( loc_id, { "slot", "new", "colour", "b" }, b )
								ArkInventory.NewItemIndicator( loc_id )
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_NEWITEM_RESET"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_NEWITEM_RESET"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_NEWITEM_RESET_TEXT"],
							"closeWhenClicked", true,
							"func", function()
								ArkInventory.NewItemReset( loc_id )
								ArkInventory.NewItemIndicator( loc_id )
							end
						)

					end
					
					
					if value == "SORTING" then

						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["MOD_MENU_MAIN_SORTING"] ) .. setting_name,
							"isTitle", true,
							"textHeight", 12
						)
						ArkInventory.Lib.DewDrop:AddLine()

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_SORTING_OPEN"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_SORTING_OPEN"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_SORTING_OPEN_TEXT"],
							"checked", ArkInventory.LocationOptionGet( loc_id, { "sort", "open" } ),
							"func", function()
								ArkInventory.LocationOptionSet( loc_id, { "sort", "open" }, not ArkInventory.LocationOptionGet( loc_id, { "sort", "open" } ) )
							end
						)
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_SORTING_INSTANT"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_SORTING_INSTANT"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_SORTING_INSTANT_TEXT"],
							"checked", ArkInventory.LocationOptionGet( loc_id, { "sort", "instant" } ),
							"func", function()
								ArkInventory.LocationOptionSet( loc_id, { "sort", "instant" }, not ArkInventory.LocationOptionGet( loc_id, { "sort", "instant" } ) )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
							end
						)
						ArkInventory.Lib.DewDrop:AddLine()
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_SORTING_BAGSLOT"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_SORTING_BAGSLOT"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_SORTING_BAGSLOT_TEXT"],
							"isRadio", true,
							"checked", ArkInventory.LocationOptionGet( loc_id, { "sort", "bagslot" } ),
							"func", function()
								ArkInventory.LocationOptionSet( loc_id, { "sort", "bagslot" }, not ArkInventory.LocationOptionGet( loc_id, { "sort", "bagslot" } ) )
								ArkInventory.LocationSetValue( nil, "resort", true )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
							end
						)
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_SORTING_USER"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_SORTING_USER"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_SORTING_USER_TEXT"],
							"isRadio", true,
							"checked", not ArkInventory.LocationOptionGet( loc_id, { "sort", "bagslot" } ),
							"func", function()
								ArkInventory.LocationOptionSet( loc_id, { "sort", "bagslot" }, not ArkInventory.LocationOptionGet( loc_id, { "sort", "bagslot" } ) )
								ArkInventory.LocationSetValue( nil, "resort", true )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
							end
						)

						ArkInventory.Lib.DewDrop:AddLine()
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["MOD_MENU_MAIN_SORTING_ORDER"] ),
							"isTitle", true,
							"textHeight", 12
						)
						
						local t = ArkInventory.LocationOptionGet( loc_id, { "sortorder" } )
						for k, v in ipairs( t ) do
						
							if ArkInventory.Const.SortKeys[v] then
							
								local checked = ArkInventory.LocationOptionGet( loc_id, { "sort", v } )
								local disabled = ArkInventory.LocationOptionGet( loc_id, { "sort", "bagslot" } )
								local n = ArkInventory.Localise["MOD_MENU_MAIN_SORTING_INCLUDE_" .. string.upper( v )]
								local tt_text = ArkInventory.Localise["MOD_MENU_MAIN_SORTING_INCLUDE_" .. string.upper( v ) .. "_TEXT"]
								
								if not disabled then
									if checked then
										n = GREEN_FONT_COLOR_CODE .. n .. FONT_COLOR_CODE_CLOSE
									else
										n = RED_FONT_COLOR_CODE .. n .. FONT_COLOR_CODE_CLOSE
										tt_text = tt_text .. "\n\n" .. RED_FONT_COLOR_CODE .. ArkInventory.Localise["MOD_MENU_MAIN_SORTING_NOT_INCLUDED"]
									end
								end
								
								ArkInventory.Lib.DewDrop:AddLine(
									"text", n,
									"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_SORTING_INCLUDE_" .. string.upper( v )],
									"tooltipText", tt_text,
									"checked", checked,
									"disabled", disabled,
									"hasArrow", not disabled,
									"value", "SORT_ORDER_" .. v,
									"func", function()
										ArkInventory.LocationOptionSet( loc_id, { "sort", v }, not checked )
										ArkInventory.LocationSetValue( nil, "resort", true )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
									end
								)
							end
						
						end
						
						ArkInventory.Lib.DewDrop:AddLine()
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_SORTING_INCLUDE_NAME_REVERSE"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_SORTING_INCLUDE_NAME_REVERSE"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_SORTING_INCLUDE_NAME_REVERSE_TEXT"],
							"checked", ArkInventory.LocationOptionGet( loc_id, { "sort", "reversed" } ),
							"disabled", ArkInventory.LocationOptionGet( loc_id, { "sort", "bagslot" } ) or not ArkInventory.LocationOptionGet( loc_id, { "sort", "name" } ),
							"func", function()
								ArkInventory.LocationOptionSet( loc_id, { "sort", "reversed" }, not ArkInventory.LocationOptionGet( loc_id, { "sort", "reversed" } ) )
								ArkInventory.LocationSetValue( nil, "resort", true )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine()
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_SORTING_ASCENDING"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_SORTING_ASCENDING"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_SORTING_ASCENDING_TEXT"],
							"checked", ArkInventory.LocationOptionGet( loc_id, { "sort", "ascending" } ),
							"disabled", ArkInventory.LocationOptionGet( loc_id, { "sort", "bagslot" } ),
							"func", function()
								ArkInventory.LocationOptionSet( loc_id, { "sort", "ascending" }, not ArkInventory.LocationOptionGet( loc_id, { "sort", "ascending" } ) )
								ArkInventory.LocationSetValue( nil, "resort", true )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
							end
						)

					end
					
					
					if value == "EMPTY" then

						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["MOD_MENU_MAIN_EMPTY"] ) .. setting_name,
							"isTitle", true,
							"textHeight", 12
						)

						ArkInventory.Lib.DewDrop:AddLine()
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_ICON"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_ICON"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_ICON_TEXT"],
							"checked", ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "icon" } ) == true,
							"func", function()
								ArkInventory.LocationOptionSet( loc_id, { "slot", "empty", "icon" }, not ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "icon" } ) )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_BORDER"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_BORDER"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_BORDER_TEXT"],
							"checked", ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "border" } ) == true,
							"func", function()
								ArkInventory.LocationOptionSet( loc_id, { "slot", "empty", "border" }, not ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "border" } ) )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_CLUMP"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_CLUMP"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_CLUMP_TEXT"],
							"checked", ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "clump" } ),
							"func", function()
								ArkInventory.LocationOptionSet( loc_id, { "slot", "empty", "clump" }, not ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "clump" } ) )
								ArkInventory.ItemCacheClear()
								ArkInventory.ItemCategoryReload( nil, true )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine()

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_COLOUR"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_COLOUR"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_COLOUR_TEXT"],
							"hasArrow", true,
							"value", "EMPTY_COLOUR"
						)

						ArkInventory.Lib.DewDrop:AddLine()

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_SHOW"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_SHOW"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_SHOW_TEXT"],
							"checked", ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "show" } ),
							"func", function()
								ArkInventory.LocationOptionSet( loc_id, { "slot", "empty", "show" }, not ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "show" } ) )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
							end
						)

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_COLOUR"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_COLOUR"],
							"tooltipText", ArkInventory.Localise["GENERIC_COLOUR"],
							"hasColorSwatch", true,
							"disabled", not ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "show" } ),
							"r", ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "colour", "r" } ),
							"g", ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "colour", "g" } ),
							"b", ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "colour", "b" } ),
							"colorFunc", function( r, g, b )
								ArkInventory.LocationOptionSet( loc_id, { "slot", "empty", "colour", "r" }, r )
								ArkInventory.LocationOptionSet( loc_id, { "slot", "empty", "colour", "g" }, g )
								ArkInventory.LocationOptionSet( loc_id, { "slot", "empty", "colour", "b" }, b )
								
								ArkInventory.Frame_Changer_Update( ArkInventory.Const.Location.Bag )
								ArkInventory.Frame_Changer_Update( ArkInventory.Const.Location.Bank )
								ArkInventory.Frame_Changer_Update( ArkInventory.Const.Location.Vault )
								
							end
						)
					
					end
					
					
					if value == "LOCATION_STATUS" then

						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["OPT_CONTROL"] ),
							"isTitle", true,
							"textHeight", 12
						)
						
						ArkInventory.Lib.DewDrop:AddLine()
						
						for x, loc in ipairs( ArkInventory.Global.Location ) do
							ArkInventory.Lib.DewDrop:AddLine(
								"text", loc.Name,
								"icon", loc.Texture,
								"tooltipTitle", loc.Name,
								--"tooltipText", string.format( ArkInventory.Localise["OPT_CONTROL_TEXT"], loc.Name, cp.info.name ),
								"hasArrow", true,
								"value", "LOCATION_STATUS_" .. x
							)
						end
						
					end
					
					
					if value == "AUTO" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["OPT_AUTO"] ),
							"isTitle", true,
							"textHeight", 12
						)
						ArkInventory.Lib.DewDrop:AddLine()
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.format( ArkInventory.Localise["OPT_AUTO_OPEN"], ArkInventory.Const.Program.Name, ArkInventory.Localise["LOCATION_BAG"] ),
							"hasArrow", true,
							"value", "AUTO_OPEN"
						)
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.format( ArkInventory.Localise["OPT_AUTO_CLOSE"], ArkInventory.Const.Program.Name, ArkInventory.Localise["LOCATION_BAG"] ),
							"hasArrow", true,
							"value", "AUTO_CLOSE"
						)

					end
					
					
					if value == "TOOLTIP" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["MOD_MENU_MAIN_TOOLTIP"] ),
							"isTitle", true,
							"textHeight", 12
						)
						ArkInventory.Lib.DewDrop:AddLine()
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_ENABLED"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_ENABLED"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_TOOLTIP_ENABLE_TEXT"],
							"checked", ArkInventory.db.global.option.tooltip.show,
							"func", function()
								ArkInventory.db.global.option.tooltip.show = not ArkInventory.db.global.option.tooltip.show
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine()
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_TOOLTIP_ITEMCOUNT_ADD"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_TOOLTIP_ITEMCOUNT_ADD"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_TOOLTIP_ITEMCOUNT_ADD_TEXT"],
							"checked", ArkInventory.db.global.option.tooltip.add.count,
							"func", function()
								ArkInventory.db.global.option.tooltip.add.count = not ArkInventory.db.global.option.tooltip.add.count
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_COLOUR"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_COLOUR"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_TOOLTIP_ITEMCOUNT_COLOUR_TEXT"],
							"hasColorSwatch", true,
							"r", ArkInventory.db.global.option.tooltip.colour.count.r,
							"g", ArkInventory.db.global.option.tooltip.colour.count.g,
							"b", ArkInventory.db.global.option.tooltip.colour.count.b,
							"colorFunc", function( r, g, b )
								ArkInventory.db.global.option.tooltip.colour.count.r = r
								ArkInventory.db.global.option.tooltip.colour.count.g = g
								ArkInventory.db.global.option.tooltip.colour.count.b = b
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine()
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_TOOLTIP_VENDOR_ADD"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_TOOLTIP_VENDOR_ADD"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_TOOLTIP_VENDOR_ADD_TEXT"],
							"checked", ArkInventory.db.global.option.tooltip.add.vendor,
							"func", function()
								ArkInventory.db.global.option.tooltip.add.vendor = not ArkInventory.db.global.option.tooltip.add.vendor
							end
						)

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_COLOUR"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_COLOUR"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_TOOLTIP_VENDOR_COLOUR_TEXT"],
							"hasColorSwatch", true,
							"r", ArkInventory.db.global.option.tooltip.colour.vendor.r,
							"g", ArkInventory.db.global.option.tooltip.colour.vendor.g,
							"b", ArkInventory.db.global.option.tooltip.colour.vendor.b,
							"colorFunc", function( r, g, b )
								ArkInventory.db.global.option.tooltip.colour.vendor.r = r
								ArkInventory.db.global.option.tooltip.colour.vendor.g = g
								ArkInventory.db.global.option.tooltip.colour.vendor.b = b
							end
						)

					end
					
					
					if value == "ACTIONS" then
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["MOD_MENU_MAIN_ACTIONS"] ),
							"isTitle", true,
							"textHeight", 12
						)
						
						ArkInventory.Lib.DewDrop:AddLine()
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_RELOAD"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_RELOAD"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_RELOAD_TEXT"],
							--"icon", ArkInventory.Const.Texture.Action.Refresh,
							"closeWhenClicked", true,
							"func", function()
								ArkInventory.ItemCacheClear()
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end
						)
						
					end
					
					
					
					
					if value == "CUSTOM_CATEGORIES" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["MOD_MENU_MAIN_CUSTOM_CATEGORIES"] ),
							"isTitle", true,
							"textHeight", 12
						)
						
						ArkInventory.Lib.DewDrop:AddLine()
						
						local t = ArkInventory.Const.Category.Type.Custom
	
						for k,v in pairs( ArkInventory.db.global.option.category[t].data ) do
						
							ArkInventory.Lib.DewDrop:AddLine(
								"text", v,
								"tooltipTitle", string.format( "CUSTOM_CATEGORY #%i: %s", k, v ),
								--"tooltipText", string.format( "CUSTOM_CATEGORY_TEXT #%i: %s", k, v ),
								"hasArrow", true,
								"value", "CUSTOM_CATEGORIES_" .. k
							)
						
						end
					
					
					end
					
					
				end
				
				
				if level == 3 and value then
				
					if strsub( value, 1, 16 ) == "LOCATION_STATUS_" then
					
						local x = tonumber( strmatch( value, "^LOCATION_STATUS_(.+)" ) )
						local cp = ArkInventory.Global.Me
						local player_id = cp.info.player_id
						local loc = ArkInventory.Global.Location[x]
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( loc.Name ),
							"isTitle", true,
							"textHeight", 12
						)
						
						ArkInventory.Lib.DewDrop:AddLine()

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["OPT_CONTROL_MONITOR"],
							"tooltipTitle", ArkInventory.Localise["OPT_CONTROL_MONITOR"],
							"tooltipText", string.format( ArkInventory.Localise["OPT_CONTROL_MONITOR_TEXT"], loc.Name, cp.info.name ),
							"checked", true, --ArkInventory.db.global.player.data[player_id].monitor[x],
							"disabled", not ArkInventory.Global.Location[x].canPurge,
							"func", function()
							--[[
								ArkInventory.db.global.player.data[player_id].monitor[x] = not ArkInventory.db.global.player.data[player_id].monitor[x]
								
								if ArkInventory.db.global.player.data[player_id].monitor[x] == false then
								
									-- disable all other choices
									
									ArkInventory.Frame_Main_Hide( x )
									
									ArkInventory.db.global.player.data[player_id].save[x] = false
									
									if ArkInventory.Global.Location[loc_id].canOverride and ArkInventory.db.global.player.data[player_id].control[x] then
										ArkInventory.LocationControlToggle( x )
									end

									ArkInventory.OfflineDataCleanup()
									
								else
								
									-- enable all other choices
									
									ArkInventory.db.global.player.data[player_id].save[x] = true
									
									if loc.canOverride and ArkInventory.db.global.player.data[player_id].control[x] == false then
										ArkInventory.LocationControlToggle( x )
									end

								end
								]]--
							end
						)
						
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["OPT_CONTROL_SAVE"],
							"tooltipTitle", ArkInventory.Localise["OPT_CONTROL_SAVE"],
							"disabled", false, --not ArkInventory.db.global.player.data[cp.player_id].monitor[x],
							"tooltipText", string.format( ArkInventory.Localise["OPT_CONTROL_SAVE_TEXT"], loc.Name, cp.info.name ),
							"checked", ArkInventory.db.global.player.data[player_id].save[x],
							"func", function()
								ArkInventory.db.global.player.data[player_id].save[x] = not ArkInventory.db.global.player.data[player_id].save[x]
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["OPT_CONTROL_CONTROL"],
							"tooltipTitle", ArkInventory.Localise["OPT_CONTROL_CONTROL"],
							"tooltipText", string.format( ArkInventory.Localise["OPT_CONTROL_CONTROL_TEXT"], ArkInventory.Const.Program.Name, loc.Name ),
							"disabled", not ArkInventory.Global.Location[loc_id].canOverride, --or not ArkInventory.db.global.player.data[cp.player_id].monitor[x],
							"checked", ArkInventory.db.global.player.data[player_id].control[x],
							"func", function()
								ArkInventory.LocationControlToggle( x )
							end
						)
						
						
					end
					
					
					if value == "WINDOW_HIDDEN" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["MOD_MENU_MAIN_HIDDEN"] ),
							"isTitle", true,
							"textHeight", 12
						)
						ArkInventory.Lib.DewDrop:AddLine()

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_HIDDEN_TITLE"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_HIDDEN_TITLE"],
							"tooltipText", string.format( ArkInventory.Localise["MOD_MENU_MAIN_HIDDEN_TITLE_TEXT"], ArkInventory.Const.Program.Name ),
							"checked", ArkInventory.LocationOptionGet( loc_id, { "framehide", "header" } ),
							"func", function()
								ArkInventory.LocationOptionSet( loc_id, { "framehide", "header" }, not ArkInventory.LocationOptionGet( loc_id, { "framehide", "header" } ) )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Init )
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_HIDDEN_CHANGER"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_HIDDEN_CHANGER"],
							"tooltipText", string.format( ArkInventory.Localise["MOD_MENU_MAIN_HIDDEN_CHANGER_TEXT"], ArkInventory.Const.Program.Name ),
							"checked", ArkInventory.LocationOptionGet( loc_id, { "framehide", "changer" } ),
							"disabled", not ArkInventory.Global.Location[loc_id].hasChanger,
							"func", function()
								ArkInventory.LocationOptionSet( loc_id, { "framehide", "changer" }, not ArkInventory.LocationOptionGet( loc_id, { "framehide", "changer" } ) )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Init )
							end
						)

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_HIDDEN_STATUS"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_HIDDEN_STATUS"],
							"tooltipText", string.format( ArkInventory.Localise["MOD_MENU_MAIN_HIDDEN_STATUS_TEXT"], ArkInventory.Const.Program.Name ),
							"checked", ArkInventory.LocationOptionGet( loc_id, { "framehide", "status" } ),
							"func", function()
								ArkInventory.LocationOptionSet( loc_id, { "framehide", "status" }, not ArkInventory.LocationOptionGet( loc_id, { "framehide", "status" } ) )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Init )
							end
						)
						
					end
					

					if value == "WINDOW_ANCHOR" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["GENERIC_ANCHOR"] ),
							"isTitle", true,
							"textHeight", 12
						)
						ArkInventory.Lib.DewDrop:AddLine()
						
						for a, n in ipairs( anchorpoints ) do
							ArkInventory.Lib.DewDrop:AddLine(
								"text", n,
								"tooltipTitle", n,
								"tooltipText", string.format( ArkInventory.Localise["GENERIC_ANCHOR_TEXT2"], ArkInventory.Localise["MOD_MENU_MAIN_WINDOW"], n ),
								"isRadio", true,
								"checked", ArkInventory.LocationOptionGet( loc_id, { "anchor", loc_id, "point" } ) == a,
								"func", function()
									if ArkInventory.LocationOptionGet( loc_id, { "anchor", loc_id, "point" } ) ~= a then
										ArkInventory.LocationOptionSet( loc_id, { "anchor", loc_id, "point" }, a )
										ArkInventory.Frame_Main_Anchor_Set( loc_id )
									end
								end
							)
						end
						
						ArkInventory.Lib.DewDrop:AddLine()
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_LOCK"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_LOCK"],
							"tooltipText", string.format( ArkInventory.Localise["MOD_MENU_MAIN_WINDOW_ANCHOR_LOCK_TEXT"], ArkInventory.Global.Location[loc_id].Name ),
							"checked", ArkInventory.LocationOptionGet( loc_id, { "anchor", loc_id, "locked" } ),
							"func", function()
								ArkInventory.LocationOptionSet( loc_id, { "anchor", loc_id, "locked" }, not ArkInventory.LocationOptionGet( loc_id, { "anchor", loc_id, "locked" } ) )
								ArkInventory.Frame_Main_Anchor_Set( loc_id )
							end
						)

					end

					
					if value == "WINDOW_BORDER" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["GENERIC_BORDER"] ),
							"isTitle", true,
							"textHeight", 12
						)
						ArkInventory.Lib.DewDrop:AddLine()

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_SHOW"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_SHOW"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_WINDOW_BORDER_SHOW_TEXT"],
							"checked", ArkInventory.LocationOptionGet( loc_id, { "window", "border", "show" } ),
							"func", function()
								ArkInventory.LocationOptionSet( loc_id, { "window", "border", "show" }, not ArkInventory.LocationOptionGet( loc_id, { "window", "border", "show" } ) )
								ArkInventory.Frame_Main_Paint_All()
							end
						)

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_COLOUR"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_COLOUR"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_WINDOW_BORDER_COLOR_TEXT"],
							"disabled", not ArkInventory.LocationOptionGet( loc_id, { "window", "border", "show" } ),
							"hasColorSwatch", true,
							"r", ArkInventory.LocationOptionGet( loc_id, { "window", "colour", "border", "r" } ),
							"g", ArkInventory.LocationOptionGet( loc_id, { "window", "colour", "border", "g" } ),
							"b", ArkInventory.LocationOptionGet( loc_id, { "window", "colour", "border", "b" } ),
							"colorFunc", function( r, g, b )
								ArkInventory.LocationOptionSet( loc_id, { "window", "colour", "border", "r" }, r )
								ArkInventory.LocationOptionSet( loc_id, { "window", "colour", "border", "g" }, g )
								ArkInventory.LocationOptionSet( loc_id, { "window", "colour", "border", "b" }, b )
								ArkInventory.Frame_Main_Paint_All()
							end
						)

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_TEXTURE"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_TEXTURE"],
							"tooltipText", ArkInventory.Localise["GENERIC_BORDER_TEXTURE_TEXT"],
							"hasArrow", true,
							"value", "WINDOW_BORDER_TEXTURE"
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_SCALE"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_SCALE"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_BORDER_SCALE_TEXT"],
							"hasArrow", true,
							"hasSlider", true,
							"sliderIsPercent", true,
							"sliderValue", ArkInventory.LocationOptionGet( loc_id, { "window", "border", "scale" } ) or 1,
							"sliderMin", 0.25,
							"sliderMax", 4,
							"sliderStep", 0.05,
							"sliderFunc", function( v )
								if ArkInventory.LocationOptionGet( loc_id, { "window", "border", "scale" } ) ~= v then
									ArkInventory.LocationOptionSet( loc_id, { "window", "border", "scale" }, v )
									ArkInventory.Frame_Main_Paint_All()
								end
							end
						)


					end
					

					
					if value == "BAR_PADDING" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["GENERIC_PADDING"] ), "isTitle", true, "textHeight", 12 )
						ArkInventory.Lib.DewDrop:AddLine()
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", "Internal",
							"tooltipTitle", "Internal Padding",
							"tooltipText", "the amount of space to add between the bars and the items",
							"hasArrow", true,
							"hasSlider", true,
							"sliderValue", ArkInventory.LocationOptionGet( loc_id, { "bar", "pad", "internal" } ),
							"sliderMin", 4,
							"sliderMax", 32,
							"sliderStep", 1,
							"sliderFunc", function( v )
								if v ~= ArkInventory.LocationOptionGet( loc_id, { "bar", "pad", "internal" } ) then
									ArkInventory.LocationOptionSet( loc_id, { "bar", "pad", "internal" }, v )
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
								end
							end
						)
						ArkInventory.Lib.DewDrop:AddLine(
							"text", "External",
							"tooltipTitle", "External Padding",
							"tooltipText", "the amount of space to add between bars",
							"hasArrow", true,
							"hasSlider", true,
							"sliderValue", ArkInventory.LocationOptionGet( loc_id, { "bar", "pad", "external" } ),
							"sliderMin", 0,
							"sliderMax", 32,
							"sliderStep", 1,
							"sliderFunc", function( v )
								if v ~= ArkInventory.LocationOptionGet( loc_id, { "bar", "pad", "external" } ) then
									ArkInventory.LocationOptionSet( loc_id, { "bar", "pad", "external" }, v )
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
								end
							end
						)
					end

					
					if value == "BAR_ANCHOR" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["GENERIC_ANCHOR"] ),
							"isTitle", true,
							"textHeight", 12
						)
						ArkInventory.Lib.DewDrop:AddLine()
						
						for a, n in ipairs( anchorpoints ) do
							ArkInventory.Lib.DewDrop:AddLine(
								"text", n,
								"tooltipTitle", n,
								"tooltipText", string.format( ArkInventory.Localise["GENERIC_ANCHOR_TEXT2"], ArkInventory.Localise["MOD_MENU_MAIN_BARS"], n ),
								"isRadio", true,
								"checked", ArkInventory.LocationOptionGet( loc_id, { "bar", "anchor" } ) == a,
								"func", function()
									if ArkInventory.LocationOptionGet( loc_id, { "bar", "anchor" } ) ~= a then
										ArkInventory.LocationOptionSet( loc_id, { "bar", "anchor" }, a )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									end
								end
							)
						end
				
					end
					
					
					if value == "BAR_BORDER" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["GENERIC_BORDER"] ),
							"isTitle", true,
							"textHeight", 12
						)
						ArkInventory.Lib.DewDrop:AddLine()

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_SHOW"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_SHOW"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_BORDER_SHOW_TEXT"],
							"checked", ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "show" } ),
							"func", function()
								ArkInventory.LocationOptionSet( loc_id, { "bar", "border", "show" }, not ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "show" } ) )
								ArkInventory.Frame_Bar_Paint_All()
							end
						)

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_COLOUR"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_COLOUR"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_BARS_BORDER_COLOUR_TEXT"],
							"disabled", not ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "show" } ),
							"hasColorSwatch", true,
							"r", ArkInventory.LocationOptionGet( loc_id, { "bar", "colour", "border", "r" } ),
							"g", ArkInventory.LocationOptionGet( loc_id, { "bar", "colour", "border", "g" } ),
							"b", ArkInventory.LocationOptionGet( loc_id, { "bar", "colour", "border", "b" } ),
							"colorFunc", function( r, g, b )
								ArkInventory.LocationOptionSet( loc_id, { "bar", "colour", "border", "r" }, r )
								ArkInventory.LocationOptionSet( loc_id, { "bar", "colour", "border", "g" }, g )
								ArkInventory.LocationOptionSet( loc_id, { "bar", "colour", "border", "b" }, b )
								ArkInventory.Frame_Bar_Paint_All()
							end
						)

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_TEXTURE"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_TEXTURE"],
							"tooltipText", ArkInventory.Localise["GENERIC_BORDER_TEXTURE_TEXT"],
							"hasArrow", true,
							"value", "BAR_BORDER_TEXTURE"
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_SCALE"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_SCALE"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_BORDER_SCALE_TEXT"],
							"hasArrow", true,
							"hasSlider", true,
							"sliderIsPercent", true,
							"sliderValue", ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "scale" } ) or 1,
							"sliderMin", 0.25,
							"sliderMax", 4,
							"sliderStep", 0.05,
							"sliderFunc", function( v )
								if ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "scale" } ) ~= v then
									ArkInventory.LocationOptionSet( loc_id, { "bar", "border", "scale" }, v )
									ArkInventory.Frame_Bar_Paint_All()
								end
							end
						)

					end


					if value == "BAR_NAMES" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["MOD_MENU_MAIN_BARS_NAME"] ),
							"isTitle", true,
							"textHeight", 12
						)
						ArkInventory.Lib.DewDrop:AddLine()

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_SHOW"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_SHOW"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_BARS_NAME_SHOW_TEXT"],
							"checked", ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "show" } ),
							"func", function()
								ArkInventory.LocationOptionSet( loc_id, { "bar", "name", "show" }, not ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "show" } ) )
								ArkInventory.Frame_Bar_Paint_All()
							end
						)

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_COLOUR"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_COLOUR"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_BARS_NAME_COLOUR_TEXT"],
							"disabled", not ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "show" } ),
							"hasColorSwatch", true,
							"r", ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "colour", "r" } ),
							"g", ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "colour", "g" } ),
							"b", ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "colour", "b" } ),
							"colorFunc", function( r, g, b )
								ArkInventory.LocationOptionSet( loc_id, { "bar", "name", "colour", "r" }, r )
								ArkInventory.LocationOptionSet( loc_id, { "bar", "name", "colour", "g" }, g )
								ArkInventory.LocationOptionSet( loc_id, { "bar", "name", "colour", "b" }, b )
								ArkInventory.Frame_Bar_Paint_All()
							end
						)

					end
					

					
					if value == "ITEM_ANCHOR" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["GENERIC_ANCHOR"] ),
							"isTitle", true,
							"textHeight", 12
						)
						ArkInventory.Lib.DewDrop:AddLine()
						
						for a, n in ipairs( anchorpoints ) do
							ArkInventory.Lib.DewDrop:AddLine(
								"text", n,
								"tooltipTitle", n,
								"tooltipText", string.format( ArkInventory.Localise["GENERIC_ANCHOR_TEXT2"], ArkInventory.Localise["MOD_MENU_MAIN_ITEMS"], n ),
								"isRadio", true,
								"checked", ArkInventory.LocationOptionGet( loc_id, { "slot", "anchor" } ) == a,
								"func", function()
									if ArkInventory.LocationOptionGet( loc_id, { "slot", "anchor" } ) ~= a then
										ArkInventory.LocationOptionSet( loc_id, { "slot", "anchor" }, a )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									end
								end
							)
						end
				
					end

					
					if value == "ITEM_BORDER" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["GENERIC_BORDER"] ),
							"isTitle", true,
							"textHeight", 12
						)
						ArkInventory.Lib.DewDrop:AddLine()

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_SHOW"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_SHOW"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_BORDER_SHOW_TEXT"],
							"checked", ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "show" } ),
							"func", function()
								ArkInventory.LocationOptionSet( loc_id, { "slot", "border", "show" }, not ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "show" } ) )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
							end
						)

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_BORDER_RARITY"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_BORDER_RARITY"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_BORDER_RARITY_TEXT"],
							"checked", ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "rarity" } ),
							"func", function()
								ArkInventory.LocationOptionSet( loc_id, { "slot", "border", "rarity" }, not ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "rarity" } ) )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
							end
						)

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_TEXTURE"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_TEXTURE"],
							"tooltipText", ArkInventory.Localise["GENERIC_BORDER_TEXTURE_TEXT"],
							"hasArrow", true,
							"value", "ITEM_BORDER_TEXTURE"
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_SCALE"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_SCALE"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_BORDER_SCALE_TEXT"],
							"hasArrow", true,
							"hasSlider", true,
							"sliderIsPercent", true,
							"sliderValue", ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "scale" } ) or 1,
							"sliderMin", 0.25,
							"sliderMax", 4,
							"sliderStep", 0.05,
							"sliderFunc", function( v )
								if ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "scale" } ) ~= v then
									ArkInventory.LocationOptionSet( loc_id, { "slot", "border", "scale" }, v )
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
								end
							end
						)

					end
					
					
					if value == "EMPTY_COLOUR" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_COLOUR"] ),
							"isTitle", true,
							"textHeight", 12
						)
						ArkInventory.Lib.DewDrop:AddLine()
						
						for k, v in ArkInventory.spairs( ArkInventory.LocationOptionGet( loc_id, { "slot", "data" } ), function(a,b) return ArkInventory.LocationOptionGet( loc_id, { "slot", "data", a, "long" } ) < ArkInventory.LocationOptionGet( loc_id, { "slot", "data", b, "long" } ) end ) do
							if not v.hide then
								ArkInventory.Lib.DewDrop:AddLine(
									"text", v.long,
									"hasColorSwatch", true,
									"r", ArkInventory.LocationOptionGet( loc_id, { "slot", "data", k, "colour", "r" } ),
									"g", ArkInventory.LocationOptionGet( loc_id, { "slot", "data", k, "colour", "g" } ),
									"b", ArkInventory.LocationOptionGet( loc_id, { "slot", "data", k, "colour", "b" } ),
									"colorFunc", function( r, g, b )
										ArkInventory.LocationOptionSet( loc_id, { "slot", "data", k, "colour", "r" }, r )
										ArkInventory.LocationOptionSet( loc_id, { "slot", "data", k, "colour", "g" }, g )
										ArkInventory.LocationOptionSet( loc_id, { "slot", "data", k, "colour", "b" }, b )
										ArkInventory.Frame_Item_Empty_Paint_All( )
									end
								)
							end
						end

					end

					
					if value == "AUTO_OPEN" then

						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( string.format( ArkInventory.Localise["OPT_AUTO_OPEN"], ArkInventory.Const.Program.Name, ArkInventory.Localise["LOCATION_BAG"] ) ),
							"isTitle", true,
							"textHeight", 12
						)
						ArkInventory.Lib.DewDrop:AddLine()
						
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["LOCATION_BANK"],
							"tooltipTitle", ArkInventory.Localise["LOCATION_BANK"],
							"tooltipText", string.format( ArkInventory.Localise["OPT_AUTO_OPEN_BANK"], ArkInventory.Const.Program.Name ),
							"checked", ArkInventory.db.global.option.auto.open.bank,
							"func", function()
								ArkInventory.db.global.option.auto.open.bank = not ArkInventory.db.global.option.auto.open.bank
							end
						)
						ArkInventory.Lib.DewDrop:AddLine(
							"text", GUILD_BANK,
							"tooltipTitle", GUILD_BANK,
							"tooltipText", string.format( ArkInventory.Localise["OPT_AUTO_OPEN_VAULT"], ArkInventory.Const.Program.Name ),
							"checked", ArkInventory.db.global.option.auto.open.vault,
							"func", function()
								ArkInventory.db.global.option.auto.open.vault = not ArkInventory.db.global.option.auto.open.vault
							end
						)
						ArkInventory.Lib.DewDrop:AddLine(
							"text", MAIL_LABEL,
							"tooltipTitle", MAIL_LABEL,
							"tooltipText", string.format( ArkInventory.Localise["OPT_AUTO_OPEN_MAIL"], ArkInventory.Const.Program.Name ),
							"checked", ArkInventory.db.global.option.auto.open.mail,
							"func", function()
								ArkInventory.db.global.option.auto.open.mail = not ArkInventory.db.global.option.auto.open.mail
							end
						)
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_AUTO_MERCHANT"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_AUTO_MERCHANT"],
							"tooltipText", string.format( ArkInventory.Localise["OPT_AUTO_OPEN_MAIL"], ArkInventory.Const.Program.Name ),
							"checked", ArkInventory.db.global.option.auto.open.merchant,
							"func", function()
								ArkInventory.db.global.option.auto.open.merchant = not ArkInventory.db.global.option.auto.open.merchant
							end
						)
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_AUTO_TRADE"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_AUTO_TRADE"],
							"tooltipText", string.format( ArkInventory.Localise["OPT_AUTO_OPEN_TRADE"], ArkInventory.Const.Program.Name ),
							"checked", ArkInventory.db.global.option.auto.open.trade,
							"func", function()
								ArkInventory.db.global.option.auto.open.trade = not ArkInventory.db.global.option.auto.open.trade
							end
						)
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_AUTO_AUCTION"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_AUTO_AUCTION"],
							"tooltipText", string.format( ArkInventory.Localise["OPT_AUTO_OPEN_AUCTION"], ArkInventory.Const.Program.Name ),
							"checked", ArkInventory.db.global.option.auto.open.auction,
							"func", function()
								ArkInventory.db.global.option.auto.open.auction = not ArkInventory.db.global.option.auto.open.auction
							end
						)
					
					end
					
					
					if value == "AUTO_CLOSE" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( string.format( ArkInventory.Localise["OPT_AUTO_CLOSE"], ArkInventory.Const.Program.Name, ArkInventory.Localise["LOCATION_BAG"] ) ),
							"isTitle", true,
							"textHeight", 12
						)
						ArkInventory.Lib.DewDrop:AddLine()
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["LOCATION_BANK"],
							"tooltipTitle", ArkInventory.Localise["LOCATION_BANK"],
							"tooltipText", string.format( ArkInventory.Localise["OPT_AUTO_CLOSE_BANK"], ArkInventory.Const.Program.Name ),
							"checked", ArkInventory.db.global.option.auto.close.bank,
							"func", function()
								ArkInventory.db.global.option.auto.close.bank = not ArkInventory.db.global.option.auto.close.bank
							end
						)
						ArkInventory.Lib.DewDrop:AddLine(
							"text", GUILD_BANK,
							"tooltipTitle", GUILD_BANK,
							"tooltipText", string.format( ArkInventory.Localise["OPT_AUTO_CLOSE_VAULT"], ArkInventory.Const.Program.Name ),
							"checked", ArkInventory.db.global.option.auto.close.vault,
							"func", function()
								ArkInventory.db.global.option.auto.close.vault = not ArkInventory.db.global.option.auto.close.vault
							end
						)
						ArkInventory.Lib.DewDrop:AddLine(
							"text", MAIL_LABEL,
							"tooltipTitle", MAIL_LABEL,
							"tooltipText", string.format( ArkInventory.Localise["OPT_AUTO_CLOSE_MAIL"], ArkInventory.Const.Program.Name ),
							"checked", ArkInventory.db.global.option.auto.close.mail,
							"func", function()
								ArkInventory.db.global.option.auto.close.mail = not ArkInventory.db.global.option.auto.close.mail
							end
						)
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_AUTO_MERCHANT"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_AUTO_MERCHANT"],
							"tooltipText", string.format( ArkInventory.Localise["OPT_AUTO_CLOSE_MERCHANT"], ArkInventory.Const.Program.Name ),
							"checked", ArkInventory.db.global.option.auto.close.merchant,
							"func", function()
								ArkInventory.db.global.option.auto.close.merchant = not ArkInventory.db.global.option.auto.close.merchant
							end
						)
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_AUTO_TRADE"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_AUTO_TRADE"],
							"tooltipText", string.format( ArkInventory.Localise["OPT_AUTO_CLOSE_TRADE"], ArkInventory.Const.Program.Name ),
							"checked", ArkInventory.db.global.option.auto.close.trade,
							"func", function()
								ArkInventory.db.global.option.auto.close.trade = not ArkInventory.db.global.option.auto.close.trade
							end
						)
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_AUTO_AUCTION"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_AUTO_AUCTION"],
							"tooltipText", string.format( ArkInventory.Localise["OPT_AUTO_CLOSE_AUCTION"], ArkInventory.Const.Program.Name ),
							"checked", ArkInventory.db.global.option.auto.close.auction,
							"func", function()
								ArkInventory.db.global.option.auto.close.auction = not ArkInventory.db.global.option.auto.close.auction
							end
						)
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_AUTO_COMBAT"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_AUTO_COMBAT"],
							"tooltipText", string.format( ArkInventory.Localise["OPT_AUTO_CLOSE_COMBAT"], ArkInventory.Const.Program.Name ),
							"checked", ArkInventory.db.global.option.auto.close.combat,
							"func", function()
								ArkInventory.db.global.option.auto.close.combat = not ArkInventory.db.global.option.auto.close.combat
							end
						)
						
					end

					
					if strsub( value, 1, 11 ) == "SORT_ORDER_" then

						local k = strmatch( value, "^SORT_ORDER_(.+)" )
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["MOD_MENU_MAIN_SORTING_INCLUDE_" .. string.upper( k )] ),
							"isTitle", true,
							"textHeight", 12
						)
						ArkInventory.Lib.DewDrop:AddLine()
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_SORTING_MOVE_UP"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_SORTING_MOVE_UP"],
							"tooltipText", string.format( ArkInventory.Localise["MOD_MENU_MAIN_SORTING_MOVE_UP_TEXT"], LIGHTYELLOW_FONT_COLOR_CODE .. ArkInventory.Localise["MOD_MENU_MAIN_SORTING_INCLUDE_" .. string.upper( k )] .. FONT_COLOR_CODE_CLOSE ),
							"func", function()
								ArkInventory.ItemSortKeyMoveUp( loc_id, k )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
							end
						)

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_MAIN_SORTING_MOVE_DOWN"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_SORTING_MOVE_DOWN"],
							"tooltipText", string.format( ArkInventory.Localise["MOD_MENU_MAIN_SORTING_MOVE_DOWN_TEXT"], LIGHTYELLOW_FONT_COLOR_CODE .. ArkInventory.Localise["MOD_MENU_MAIN_SORTING_INCLUDE_" .. string.upper( k )] .. FONT_COLOR_CODE_CLOSE ),
							"func", function()
								ArkInventory.ItemSortKeyMoveDown( loc_id, k )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
							end
						)	
						
					end
					
				end
				
				
				if level == 4 and value then
				
					if value == "WINDOW_BORDER_TEXTURE" then

						local t = ""
						local default = "Tooltip"
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["GENERIC_TEXTURE"] ),
							"isTitle", true,
							"textHeight", 12
						)
						ArkInventory.Lib.DewDrop:AddLine()

						t = ArkInventory.LocationOptionGet( loc_id, { "window", "border", "file" } ) or ArkInventory.Const.Texture.Border[default].file
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.format( "%s: %s", ArkInventory.Localise["GENERIC_FILE"], t ),
							"tooltipTitle", ArkInventory.Localise["GENERIC_FILE"],
							"tooltipText", ArkInventory.Localise["GENERIC_BORDER_TEXTURE_FILE_TEXT"],
							"hasArrow", true,
							"hasEditBox", true,
							"editBoxText", t,
							"editBoxFunc", function( v )
								ArkInventory.LocationOptionSet( loc_id, { "window", "border", "file" }, v )
								ArkInventory.LocationOptionSet( loc_id, { "window", "border", "scale" }, 1 )
								ArkInventory.Frame_Main_Paint_All()
							end
						)
						
						t = ArkInventory.LocationOptionGet( loc_id, { "window", "border", "size" } ) or ArkInventory.Const.Texture.Border[default].size
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.format( "%s: %s", ArkInventory.Localise["GENERIC_HEIGHT"], t ),
							"tooltipTitle", ArkInventory.Localise["GENERIC_HEIGHT"],
							"tooltipText", ArkInventory.Localise["GENERIC_BORDER_TEXTURE_HEIGHT_TEXT"],
							"hasArrow", true,
							"hasEditBox", true,
							"editBoxText", t,
							"editBoxValidateFunc", function( v )
								return not string.find( v, "%D" )
							end,
							"editBoxFunc", function( v )
								ArkInventory.LocationOptionSet( loc_id, { "window", "border", "size" }, tonumber( v ) )
								ArkInventory.Frame_Main_Paint_All()
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine()
						ArkInventory.Lib.DewDrop:AddLine(
							"text", "Default Styles",
							"isTitle", true
						)
						
						local styles = { }
						for style in pairs( ArkInventory.Const.Texture.Border ) do
							table.insert( styles, style )
						end
						table.sort( styles )
						
						for _, style in pairs( styles ) do
						
							ArkInventory.Lib.DewDrop:AddLine(
								"text", style,
								"func", function()
									ArkInventory.LocationOptionSet( loc_id, { "window", "border", "file" }, ArkInventory.Const.Texture.Border[style].file )
									ArkInventory.LocationOptionSet( loc_id, { "window", "border", "size" }, ArkInventory.Const.Texture.Border[style].size )
									ArkInventory.LocationOptionSet( loc_id, { "window", "border", "scale" }, 1 )
									ArkInventory.Frame_Main_Paint_All()
								end
							)
							
						end
						
					end


					if value == "BAR_BORDER_TEXTURE" then

						local t = ""
						local default = "Tooltip"
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["GENERIC_TEXTURE"] ),
							"isTitle", true,
							"textHeight", 12
						)
						ArkInventory.Lib.DewDrop:AddLine()

						t = ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "file" } ) or ArkInventory.Const.Texture.Border[default].file
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.format( "%s: %s", ArkInventory.Localise["GENERIC_FILE"], t ),
							"tooltipTitle", ArkInventory.Localise["GENERIC_FILE"],
							"tooltipText", ArkInventory.Localise["GENERIC_BORDER_TEXTURE_FILE_TEXT"],
							"hasArrow", true,
							"hasEditBox", true,
							"editBoxText", t,
							"editBoxFunc", function( v )
								ArkInventory.LocationOptionSet( loc_id, { "bar", "border", "file" }, v )
								ArkInventory.LocationOptionSet( loc_id, { "bar", "border", "scale" }, 1 )
								ArkInventory.Frame_Bar_Paint_All()
							end
						)
						
						t = ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "size" } ) or ArkInventory.Const.Texture.Border[default].size
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.format( "%s: %s", ArkInventory.Localise["GENERIC_HEIGHT"], t ),
							"tooltipTitle", ArkInventory.Localise["GENERIC_HEIGHT"],
							"tooltipText", ArkInventory.Localise["GENERIC_BORDER_TEXTURE_HEIGHT_TEXT"],
							"hasArrow", true,
							"hasEditBox", true,
							"editBoxText", t,
							"editBoxValidateFunc", function( v )
								return not string.find( v, "%D" )
							end,
							"editBoxFunc", function( v )
								ArkInventory.LocationOptionSet( loc_id, { "bar", "border", "size" }, tonumber( v ) )
								ArkInventory.Frame_Bar_Paint_All()
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine()
						ArkInventory.Lib.DewDrop:AddLine(
							"text", "Default Styles",
							"isTitle", true
						)
						
						local styles = { }
						for style in pairs( ArkInventory.Const.Texture.Border ) do
							table.insert( styles, style )
						end
						table.sort( styles )
						
						for _, style in pairs( styles ) do
						
							ArkInventory.Lib.DewDrop:AddLine(
								"text", style,
								"func", function()
									ArkInventory.LocationOptionSet( loc_id, { "bar", "border", "file" }, ArkInventory.Const.Texture.Border[style].file )
									ArkInventory.LocationOptionSet( loc_id, { "bar", "border", "size" }, ArkInventory.Const.Texture.Border[style].size )
									ArkInventory.LocationOptionSet( loc_id, { "bar", "border", "scale" }, 1 )
									ArkInventory.Frame_Bar_Paint_All()
								end
							)
							
						end
						
					end


					if value == "ITEM_BORDER_TEXTURE" then

						local t = ""
						local default = "Tooltip"
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["GENERIC_TEXTURE"] ),
							"isTitle", true,
							"textHeight", 12
						)
						ArkInventory.Lib.DewDrop:AddLine()

						t = ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "file" } ) or ArkInventory.Const.Texture.Border[default].file
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.format( "%s: %s", ArkInventory.Localise["GENERIC_FILE"], t ),
							"tooltipTitle", ArkInventory.Localise["GENERIC_FILE"],
							"tooltipText", ArkInventory.Localise["GENERIC_BORDER_TEXTURE_FILE_TEXT"],
							"hasArrow", true,
							"hasEditBox", true,
							"editBoxText", t,
							"editBoxFunc", function( v )
								ArkInventory.LocationOptionSet( loc_id, { "slot", "border", "file" }, v )
								ArkInventory.LocationOptionSet( loc_id, { "slot", "border", "scale" }, 1 )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
							end
						)
						
						t = ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "size" } ) or ArkInventory.Const.Texture.Border[default].size
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.format( "%s: %s", ArkInventory.Localise["GENERIC_HEIGHT"], t ),
							"tooltipTitle", ArkInventory.Localise["GENERIC_HEIGHT"],
							"tooltipText", ArkInventory.Localise["GENERIC_BORDER_TEXTURE_HEIGHT_TEXT"],
							"hasArrow", true,
							"hasEditBox", true,
							"editBoxText", t,
							"editBoxValidateFunc", function( v )
								return not string.find( v, "%D" )
							end,
							"editBoxFunc", function( v )
								ArkInventory.LocationOptionSet( loc_id, { "slot", "border", "size" }, tonumber( v ) )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
							end
						)
						
						t = ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "offset" } ) or ArkInventory.Const.Texture.Border[default].offset
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.format( "%s: %s", ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_BORDER_TEXTURE_OFFSET"], t ),
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_BORDER_TEXTURE_OFFSET"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_BORDER_TEXTURE_OFFSET_TEXT"],
							"hasArrow", true,
							"hasEditBox", true,
							"editBoxText", t,
							"editBoxValidateFunc", function( v )
								return not string.find( v, "%D" )
							end,
							"editBoxFunc", function( v )
								ArkInventory.LocationOptionSet( loc_id, { "slot", "border", "offset" }, tonumber( v ) )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
							end
						)

						
						ArkInventory.Lib.DewDrop:AddLine()
						ArkInventory.Lib.DewDrop:AddLine(
							"text", "Default Styles",
							"isTitle", true
						)
						
						local styles = { }
						for style in pairs( ArkInventory.Const.Texture.Border ) do
							table.insert( styles, style )
						end
						table.sort( styles )
						
						for _, style in pairs( styles ) do
						
							ArkInventory.Lib.DewDrop:AddLine(
								"text", style,
								"func", function()
									ArkInventory.LocationOptionSet( loc_id, { "slot", "border", "file" }, ArkInventory.Const.Texture.Border[style].file )
									ArkInventory.LocationOptionSet( loc_id, { "slot", "border", "size" }, ArkInventory.Const.Texture.Border[style].size )
									ArkInventory.LocationOptionSet( loc_id, { "slot", "border", "offset" }, ArkInventory.Const.Texture.Border[style].offset )
									ArkInventory.LocationOptionSet( loc_id, { "slot", "border", "scale" }, 1 )
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
								end
							)
							
						end
						
					end
					
				end
				
				
				
				if value and strsub( value, 1, 16 ) == "SWITCH_CHARACTER" then
					ArkInventory.MenuSwitchCharacter( frame, level - 1, value )
				end

				if value and value == "SWITCH_LOCATION" then
					ArkInventory.MenuSwitchLocation( )
				end
				
				
				
				
				-- try to add the base options (will fail where it's not supposed to exist so this is safe to use this way albeit crude)
				ArkInventory.Lib.DewDrop:FeedAceOptionsTable( base_options )
				
				if level == 1 then
				
					ArkInventory.Lib.DewDrop:AddLine()
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["GENERIC_CLOSE_MENU"],
						"closeWhenClicked", true
					)

				end

			end
			
		)

	end
	
	
	
end

function ArkInventory.MenuBarOpen( frame )

	if not frame then
		frame = this
	end

	if ArkInventory.Lib.DewDrop:IsOpen( this ) then

		ArkInventory.Lib.DewDrop:Close()
		
	else

		local loc_id = frame.ARK_Data.loc_id
		local bar_id = frame.ARK_Data.bar_id
		local bar_name = ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "label", bar_id } ) or ""
		local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
		
		
		local x, p, rp
		x = this:GetLeft() + ( this:GetRight() - this:GetLeft() ) / 2
		if ( x >= ( GetScreenWidth() / 2 ) ) then
			p = "TOPRIGHT"
			rp = "TOPLEFT"
		else
			p = "TOPLEFT"
			rp = "TOPRIGHT"
		end
	
		local category = {
			["type"] = { "SYSTEM", "CONSUMABLE", "TRADE_GOODS", "SKILL", "CLASS", "EMPTY", "CUSTOM", "RULE", },
		}
		
		ArkInventory.Lib.DewDrop:Open( this,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
			
				if level == 1 then
				
					ArkInventory.Lib.DewDrop:AddLine(
						"text", string.upper( string.format( ArkInventory.Localise["MOD_MENU_BAR_INFORMATION_TITLE"], bar_id ) ),
						"isTitle", true,
						"textHeight", 12
					)

					ArkInventory.Lib.DewDrop:AddLine()
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MOD_MENU_BAR_CATEGORY_CURRENT"] .. ":",
						"isTitle", true
					)
					
					local has_entries = false
					for _, v in ipairs( category.type ) do
						if ArkInventory.Category_Bar_HasEntries( loc_id, bar_id, v ) then
							has_entries = true
							ArkInventory.Lib.DewDrop:AddLine(
								"text", ArkInventory.Localise["CATEGORY_" .. v],
								"hasArrow", true,
								"value", "CATEGORY_CURRENT_" .. v
							)
						end
					end
					
					if not has_entries then
						ArkInventory.Lib.DewDrop:AddLine(
							"text", "none assigned",
							"disabled", true
						)
					end

					ArkInventory.Lib.DewDrop:AddLine()
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MOD_MENU_BAR_CATEGORY_ASSIGN"] .. ":",
						"isTitle", true
					)
					for _, v in ipairs( category.type ) do
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["CATEGORY_" .. v],
							"hasArrow", true,
							"value", "CATEGORY_ASSIGN_" .. v
						)
					end
					
					ArkInventory.Lib.DewDrop:AddLine()
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MOD_MENU_BAR_OPTIONS"],
						"hasArrow", true,
						"value", "BAR_OPTIONS"
					)
					
					ArkInventory.Lib.DewDrop:AddLine()
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["GENERIC_CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
				
				
				if level == 2 and value then

					if strsub( value, 1, 17 ) == "CATEGORY_CURRENT_" then

						local cat_type = strmatch( value, "^CATEGORY_CURRENT_(.+)" )
				
						if cat_type ~= nil then
					
							ArkInventory.Lib.DewDrop:AddLine(
								"text", ArkInventory.Localise["CATEGORY_" .. cat_type],
								"isTitle", true,
								"textHeight", 12
							)

							ArkInventory.Lib.DewDrop:AddLine()
							local has_entries = false
							for _, cat in ArkInventory.spairs( ArkInventory.Global.Category, function(a,b) return ArkInventory.Global.Category[a].fullname < ArkInventory.Global.Category[b].fullname end ) do

								local t = cat.type_code
								local cat_bar, def_bar = ArkInventory.Category_Location_Get( loc_id, cat.id )
								
								if abs( cat_bar ) == bar_id and not def_bar then
							
									if t == "RULE" then
										local _, cat_code = ArkInventory.CategoryCodeSplit( cat.id )
										if not ArkInventory.db.profile.option.rule[cat_code] then
											t = "DO_NOT_USE" -- don't display disabled rules
										end
									end
						
									if cat_type == t then
		
										local tag_colour = GREEN_FONT_COLOR_CODE
										if cat_bar < 0 then
											tag_colour = RED_FONT_COLOR_CODE
										end
		
										has_entries = true
										ArkInventory.Lib.DewDrop:AddLine(
											"text", tag_colour .. cat.name,
											"tooltipTitle", cat.fullname,
											"hasArrow", true,
											"value", "CATEGORY_CURRENT_OPTION_" .. cat.id
										)
										
									end
						
								end
	
							end
							
							if not has_entries then
								ArkInventory.Lib.DewDrop:AddLine(
									"text", "none assigned",
									"disabled", true
								)
							end
							
						end

					end

					
					if strsub( value, 1, 16 ) == "CATEGORY_ASSIGN_" then
					
						local cat_type = strmatch( value, "^CATEGORY_ASSIGN_(.+)" )
				
						if cat_type ~= nil then
					
							ArkInventory.Lib.DewDrop:AddLine(
								"text", ArkInventory.Localise["CATEGORY_" .. cat_type],
								"isTitle", true,
								"textHeight", 12
							)

							ArkInventory.Lib.DewDrop:AddLine()
							for _, cat in ArkInventory.spairs( ArkInventory.Global.Category, function(a,b) return ArkInventory.Global.Category[a].fullname < ArkInventory.Global.Category[b].fullname end ) do

								local t = cat.type_code
								local cat_bar, def_bar = ArkInventory.Category_Location_Get( loc_id, cat.id )
							
								if abs( cat_bar ) == bar_id and not def_bar then
									t = "DO_NOT_USE" -- change the category so it doesn't display
								end

								if t == "RULE" then
									local _, cat_code = ArkInventory.CategoryCodeSplit( cat.id )
									if not ArkInventory.db.profile.option.rule[cat_code] then
										t = "DO_NOT_USE" -- don't display disabled rules
									end
								end
								
								if cat_type == t then
	
									local n = cat.name
	
									if not def_bar then
										-- category is assigned to a bar - show the user where
										n = LIGHTYELLOW_FONT_COLOR_CODE .. cat.name .. GREEN_FONT_COLOR_CODE .. "  [" .. ArkInventory.Category_Location_Get( loc_id, cat.id ) .. "]" .. FONT_COLOR_CODE_CLOSE
									end
	
									ArkInventory.Lib.DewDrop:AddLine(
										"text", n,
										"tooltipTitle", ArkInventory.Localise["MOD_MENU_BAR_CATEGORY"],
										"tooltipText", string.format( ArkInventory.Localise["MOD_MENU_BAR_CATEGORY_TEXT"], cat.fullname ),
										"func", function()
											ArkInventory.Category_Location_Set( loc_id, cat.id, bar_id )
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									)
								end
	
							end
							
						end
						
					end

					
					if value == "BAR_OPTIONS" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["MOD_MENU_BAR_OPTIONS"] ),
							"isTitle", true,
							"textHeight", 12
						)
						
						ArkInventory.Lib.DewDrop:AddLine()
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.format( "%s: %s", ArkInventory.Localise["MOD_MENU_MAIN_BARS_NAME"], bar_name ),
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_MAIN_BARS_NAME"],
							--"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_BARS_NAME_TEXT"],
							"hasArrow", true,
							"hasEditBox", true,
							"editBoxText", bar_name,
							"editBoxFunc", function( v )
								bar_name = string.trim( v )
								ArkInventory.LocationOptionSet( loc_id, { "bar", "name", "label", bar_id }, bar_name )
								ArkInventory.Frame_Bar_Paint_All()
								ArkInventory.Lib.DewDrop:Close()
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine()
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_BAR_CLEAR"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_BAR_CLEAR"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_BAR_CLEAR_TEXT"],
							"closeWhenClicked", true,
							"func", function()
								ArkInventory.Category_Bar_Clear( loc_id, bar_id )
								ArkInventory.Frame_Bar_Label_Clear( loc_id, bar_id )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end
						)
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_BAR_INSERT"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_BAR_INSERT"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_BAR_INSERT_TEXT"],
							"closeWhenClicked", true,
							"func", function()
								ArkInventory.Category_Bar_Insert( loc_id, bar_id )
								ArkInventory.Frame_Bar_Label_Insert( loc_id, bar_id )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end
						)
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_BAR_REMOVE"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_BAR_REMOVE"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_BAR_REMOVE_TEXT"],
							"closeWhenClicked", true,
							"func", function()
								ArkInventory.Category_Bar_Remove( loc_id, bar_id )
								ArkInventory.Frame_Bar_Label_Remove( loc_id, bar_id )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_BAR_MOVE_UP"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_BAR_MOVE_UP"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_BAR_MOVE_UP_TEXT"],
							"closeWhenClicked", true,
							"func", function()
								ArkInventory.Category_Bar_Up( loc_id, bar_id )
								ArkInventory.Frame_Bar_Label_Up( loc_id, bar_id )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_BAR_MOVE_DOWN"],
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_BAR_MOVE_DOWN"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_BAR_MOVE_DOWN_TEXT"],
							"disabled", bar_id < 2,
							"closeWhenClicked", true,
							"func", function()
								ArkInventory.Category_Bar_Down( loc_id, bar_id )
								ArkInventory.Frame_Bar_Label_Down( loc_id, bar_id )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end
						)
					
					end
					
				end

				
				if level == 3 and value then
				
					if strsub( value, 1, 24 ) == "CATEGORY_CURRENT_OPTION_" then
					
						local cat_id = strmatch( value, "^CATEGORY_CURRENT_OPTION_(.+)" )
				
						if cat_id ~= nil then
					
							local cat = ArkInventory.Global.Category[cat_id]
						
							ArkInventory.Lib.DewDrop:AddLine(
								"text", cat.fullname,
								"isTitle", true,
								"textHeight", 12
							)

							ArkInventory.Lib.DewDrop:AddLine()
							
							local cv = ArkInventory.Category_Location_Get( loc_id, cat_id )
							local ch = false
							
							if cv < 0 then
								ch = true
								cv = abs( cv )
							end
							
							ArkInventory.Lib.DewDrop:AddLine(
								"text", string.format( ArkInventory.Localise["MOD_MENU_ITEM_MOVE"], LIGHTYELLOW_FONT_COLOR_CODE .. cat.fullname .. FONT_COLOR_CODE_CLOSE ),
								"hasArrow", true,
								"hasSlider", true,
								"sliderValue", cv,
								"sliderMin", 1,
								"sliderMax", ArkInventory.Global.Location[loc_id].Layout.bar_count + 1,
								"sliderStep", 1,
								"sliderFunc", function( nv )
									if cv ~= nv then
										if ch then
											nv = 0 - nv
										end
										ArkInventory.Category_Location_Set( loc_id, cat_id, nv )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									end
								end
							)

							ArkInventory.Lib.DewDrop:AddLine()
							ArkInventory.Lib.DewDrop:AddLine(
								"text", ArkInventory.Localise["MOD_MENU_BAR_CATEGORY_REMOVE"],
								"tooltipTitle", ArkInventory.Localise["MOD_MENU_BAR_CATEGORY_REMOVE"],
								"tooltipText", string.format( ArkInventory.Localise["MOD_MENU_BAR_CATEGORY_REMOVE_TEXT"], cat.fullname, bar_id ),
								"func", function()
									ArkInventory.Category_Location_Set( loc_id, cat_id, nil )
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
								end
							)

							ArkInventory.Lib.DewDrop:AddLine(
								"text", ArkInventory.Localise["MOD_MENU_BAR_CATEGORY_HIDDEN"],
								"tooltipTitle", ArkInventory.Localise["MOD_MENU_BAR_CATEGORY_HIDDEN"],
								"tooltipText", ArkInventory.Localise["MOD_MENU_BAR_CATEGORY_HIDDEN_TEXT"],
								"checked", ArkInventory.Category_Hidden_Check( loc_id, cat_id ),
								"func", function()
									ArkInventory.Category_Hidden_Toggle( loc_id, cat_id )
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
								end
							)
					
						end
						
					end

				
				end
				
			end
		)

	end
	
end

function ArkInventory.MenuItemOpen( frame )

	if not frame then
		frame = this
	end

	if ArkInventory.Global.Mode.Edit == false then
		return
	end

	if ArkInventory.Lib.DewDrop:IsOpen( this ) then
	
		ArkInventory.Lib.DewDrop:Close()
		
	else

		local loc_id = frame.ARK_Data.loc_id
		local bag_id = frame.ARK_Data.bag_id
		local bliz_id = ArkInventory.BagID_Blizzard( loc_id, bag_id )
		local slot_id = frame.ARK_Data.slot_id
		local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
		local i = ArkInventory.Frame_Item_GetDB( frame )
		
		local isEmpty = false
		if not i or i.h == nil then
			isEmpty = true
		end
	
	
		local x, p, rp
		x = this:GetLeft() + ( this:GetRight() - this:GetLeft() ) / 2
		if ( x >= ( GetScreenWidth() / 2 ) ) then
			p = "TOPRIGHT"
			rp = "TOPLEFT"
		else
			p = "TOPLEFT"
			rp = "TOPRIGHT"
		end
	
		local ic = select( 4, GetItemQualityColor( i.q ) )
		local cat0, cat1, cat2 = ArkInventory.ItemCategoryGet( i )
		local bar_id = abs( ArkInventory.Category_Location_Get( loc_id, cat0 ) )
		
		local categories = { "SYSTEM", "CONSUMABLE", "TRADE_GOODS", "SKILL", "CLASS", "EMPTY", "CUSTOM", }
		
		cat0 = ArkInventory.Global.Category[cat0]
		
		if cat1 then
			cat1 = ArkInventory.Global.Category[cat1]
		end
		
		cat2 = ArkInventory.Global.Category[cat2]
		
		ArkInventory.Lib.DewDrop:Open( this,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
			
				if level == 1 then

					ArkInventory.Lib.DewDrop:AddLine(
						"text", string.upper( ArkInventory.Localise["MOD_MENU_ITEM_INFORMATION_TITLE"] ) .. ":",
						"isTitle", true,
						"textHeight", 12
					)
					ArkInventory.Lib.DewDrop:AddLine()
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MOD_MENU_ITEM_ITEM"] .. ": " .. ic .. ( ArkInventory.ItemGetName( i.h ) or "" )
					)
					
					ArkInventory.Lib.DewDrop:AddLine()
					if cat1 then
					
						-- item has a category, that means it's been specifically assigned away from the default
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_ITEM_CURRENT_ASSIGNMENT"] .. ": " .. GREEN_FONT_COLOR_CODE .. cat1.fullname .. FONT_COLOR_CODE_CLOSE,
							"notClickable", true
						)
						
						ArkInventory.Lib.DewDrop:AddLine()
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_ITEM_DEFAULT_ASSIGNMENT"] .. ": " .. LIGHTYELLOW_FONT_COLOR_CODE .. cat2.fullname .. FONT_COLOR_CODE_CLOSE,
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_ITEM_DEFAULT_RESET"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_ITEM_DEFAULT_RESET_TEXT"],
							"closeWhenClicked", true,
							"func", function()
								ArkInventory.ItemCategorySet( i, nil )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end
						)
					
					else
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_ITEM_DEFAULT_ASSIGNMENT"] .. ": " .. LIGHTYELLOW_FONT_COLOR_CODE .. cat2.fullname .. FONT_COLOR_CODE_CLOSE,
							"notClickable", true
						)
					
					end
					
					ArkInventory.Lib.DewDrop:AddLine()
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MOD_MENU_ITEM_ASSIGN_CHOICES"] .. ":",
						"isTitle", true
					)
					for _, v in ipairs( categories ) do
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["CATEGORY_" .. v],
							"disabled", isEmpty,
							"hasArrow", true,
							"tooltipTitle", ArkInventory.Localise["MOD_MENU_ITEM_ASSIGN_THIS"],
							"tooltipText", ArkInventory.Localise["MOD_MENU_ITEM_ASSIGN_THIS_TEXT"],
							"value", "CATEGORY_ASSIGN_" .. v
						)
					end
					
					ArkInventory.Lib.DewDrop:AddLine()
					ArkInventory.Lib.DewDrop:AddLine(
						"text", string.format( ArkInventory.Localise["MOD_MENU_ITEM_MOVE"], LIGHTYELLOW_FONT_COLOR_CODE .. cat0.fullname .. FONT_COLOR_CODE_CLOSE ),
						"hasArrow", true,
						"hasSlider", true,
						"sliderValue", ArkInventory.Category_Location_Get( loc_id, cat0.id ),
						"sliderMin", 1,
						"sliderMax", ArkInventory.Global.Location[loc_id].Layout.bar_count + 1,
						"sliderStep", 1,
						"sliderFunc", function( v )
							if ArkInventory.Category_Location_Get( loc_id, cat0.id ) ~= v then
								ArkInventory.Category_Location_Set( loc_id, cat0.id, v )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end
						end
					)
					
					ArkInventory.Lib.DewDrop:AddLine()
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MOD_MENU_ITEM_DEBUG"],
						"hasArrow", true,
						"value", "DEBUG_INFO"
					)
					
					ArkInventory.Lib.DewDrop:AddLine()
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["GENERIC_CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
				
				
				if level == 2 and value then
				
					if value == "ITEM_RULE_ADD" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["MOD_MENU_ITEM_RULE_ADD"] ),
							"isTitle", true,
							"textHeight", 12
						)
						
						ArkInventory.Lib.DewDrop:AddLine()
						
						local n
						for _, v in ArkInventory.spairs( ArkInventory.Global.Category, function(a,b) return ArkInventory.Global.Category[a].order < ArkInventory.Global.Category[b].order end ) do
							if v.type_code == "RULE" and ArkInventory.db.profile.option.rule[v.id] and ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data[v.id].compiled and not ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data[v.id].damaged then
								
								local checked = ArkInventory.RuleAppliesToItem( v.id, i )
								
								if checked then
									n = GREEN_FONT_COLOR_CODE .. v.name .. FONT_COLOR_CODE_CLOSE
								else
									n = v.name
								end
								
								ArkInventory.Lib.DewDrop:AddLine(
									"text", n,
									"closeWhenClicked", true,
									"checked", checked,
									"func", function()
										ArkInventory.RuleItemAdd( v.id, i.h )
									end
								)
							end
						
						end
						
					end
				
					if value == "DEBUG_INFO" then

						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["MOD_MENU_ITEM_DEBUG"] ),
							"isTitle", true,
							"textHeight", 12
						)
						ArkInventory.Lib.DewDrop:AddLine()
						ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s (%s)", ArkInventory.Localise["MOD_MENU_ITEM_DEBUG_BAG"], LIGHTYELLOW_FONT_COLOR_CODE, bag_id, bliz_id ) )
						ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MOD_MENU_ITEM_DEBUG_SLOT"], LIGHTYELLOW_FONT_COLOR_CODE, slot_id ) )
						local bagtype = ArkInventory.Const.Slot.Data[ArkInventory.BagType( bliz_id )].type
						if bagtype then
							ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MOD_MENU_ITEM_DEBUG_BAG_TYPE"], LIGHTYELLOW_FONT_COLOR_CODE, bagtype ) )
						end
						
						ArkInventory.Lib.DewDrop:AddLine()
						local id = ArkInventory.ItemStringDecode( i.h )
						local cid = ArkInventory.ItemGetCacheIDCategory( i )
						ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MOD_MENU_ITEM_DEBUG_AI_ID_SHORT"], LIGHTYELLOW_FONT_COLOR_CODE, id ) )
						ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MOD_MENU_ITEM_DEBUG_AI_ID_CACHE"], LIGHTYELLOW_FONT_COLOR_CODE, cid ) )
						ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MOD_MENU_ITEM_DEBUG_AI_ID_CATEGORY"], LIGHTYELLOW_FONT_COLOR_CODE, cat0.id ) )
						
						if i.h then
							
							local inam, ilnk, irar, ilvl, imin, ityp, isub, icount, iloc, itxt = ArkInventory.ItemInfoGet( i.h )
							
							iloc = getfenv()[iloc]
							if not iloc then
								iloc = ""
							end
							
							ArkInventory.Lib.DewDrop:AddLine( )
							ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MOD_MENU_ITEM_DEBUG_NAME"], LIGHTYELLOW_FONT_COLOR_CODE, inam ) )
							ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s - %s", ArkInventory.Localise["MOD_MENU_ITEM_DEBUG_QUALITY"], LIGHTYELLOW_FONT_COLOR_CODE, irar, string.lower( getfenv()["ITEM_QUALITY" .. irar .. "_DESC"] ) ) )
							ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MOD_MENU_ITEM_DEBUG_LVL_ITEM"], LIGHTYELLOW_FONT_COLOR_CODE, ilvl ) )
							ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MOD_MENU_ITEM_DEBUG_LVL_USE"], LIGHTYELLOW_FONT_COLOR_CODE, imin ) )
							ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MOD_MENU_ITEM_DEBUG_TYPE"], LIGHTYELLOW_FONT_COLOR_CODE, ityp ) )
							ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MOD_MENU_ITEM_DEBUG_SUBTYPE"], LIGHTYELLOW_FONT_COLOR_CODE, isub ) )
							
							if iloc ~= "" then
								ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MOD_MENU_ITEM_DEBUG_LOCATION"], LIGHTYELLOW_FONT_COLOR_CODE, iloc ) )
							end
							
							ArkInventory.Lib.DewDrop:AddLine()
							
							ilnk = ArkInventory.ItemGetInternalString( ilnk )
							ArkInventory.Lib.DewDrop:AddLine(
								"text", string.format( "%s: %s%s", ArkInventory.Localise["MOD_MENU_ITEM_DEBUG_ID"], LIGHTYELLOW_FONT_COLOR_CODE, ilnk or "" ),
								"hasArrow", true,
								"hasEditBox", true,
								"editBoxText", ilnk or ""
							)
							ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MOD_MENU_ITEM_DEBUG_STACK"], LIGHTYELLOW_FONT_COLOR_CODE, icount ) )
							ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MOD_MENU_ITEM_DEBUG_TEXTURE"], LIGHTYELLOW_FONT_COLOR_CODE, itxt ) )
							local ifam = GetItemFamily( i.h )
							ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MOD_MENU_ITEM_DEBUG_FAMILY"], LIGHTYELLOW_FONT_COLOR_CODE, ifam ) )
							
							ArkInventory.Lib.DewDrop:AddLine()
							ArkInventory.Lib.DewDrop:AddLine(
								"text", ArkInventory.Localise["MOD_MENU_ITEM_DEBUG_PT"],
								"hasArrow", true,
								"tooltipTitle", ArkInventory.Localise["MOD_MENU_ITEM_DEBUG_PT"],
								"tooltipText", ArkInventory.Localise["MOD_MENU_ITEM_DEBUG_PT_TEXT"],
								"value", "DEBUG_INFO_PT"
							)
							
						end
						
						
					end
					
					if strsub( value, 1, 16 ) == "CATEGORY_ASSIGN_" then
					
						local k = strmatch( value, "CATEGORY_ASSIGN_(.+)" )
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["CATEGORY_" .. k],
							"isTitle", true,
							"textHeight", 12
						)
						
						ArkInventory.Lib.DewDrop:AddLine()
					
						for _, v in ArkInventory.spairs( ArkInventory.Global.Category, function(a,b) return ArkInventory.Global.Category[a].fullname < ArkInventory.Global.Category[b].fullname end ) do
					
							local t = v.type_code
							if v.id == cat0 then
								t = "DO_NOT_USE"
							end
							
							--ArkInventory.Output( "id=" .. cat.id .. ", type=[" .. cat.type .. "], value=[" .. value .. "]" )
							if k == t then
								--~~~~
								ArkInventory.Lib.DewDrop:AddLine(
									"text", v.name,
									"tooltipTitle", "Assign to Category",
									"tooltipText", "assign this item to " .. v.fullname, --~~~~ check this
									"closeWhenClicked", true,
									"func", function()
										ArkInventory.ItemCategorySet( i, v.id )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									end
								)
							
							end
							
						end
						
						if k == "CUSTOM" then
						
							ArkInventory.Lib.DewDrop:AddLine()
							
							ArkInventory.Lib.DewDrop:AddLine(
								"text", ArkInventory.Localise["MOD_MENU_ITEM_CUSTOM_NEW"],
								"hasArrow", true,
								"hasEditBox", true,
								"editBoxText", "",
								"closeWhenClicked", true,
								"editBoxFunc", function( v )
									ArkInventory.CategoryCustomAdd( v )
								end
							)
							
						end
						
					end
					
				end

				
				if level == 3 and value then
				
					if value == "DEBUG_INFO_PT" then

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MOD_MENU_ITEM_DEBUG_PT_TITLE"] .. ":",
							"isTitle", true,
							"textHeight", 12
						)
					
						ArkInventory.Lib.DewDrop:AddLine()
					
						--local pt_set = ArkInventory.Lib.PeriodicTable:ItemSearch( i.h )
						local pt_set = ArkInventory.PTItemSearch( i.h )
						
						if not pt_set then
						
							ArkInventory.Lib.DewDrop:AddLine( "text", LIGHTYELLOW_FONT_COLOR_CODE .. ArkInventory.Localise["MOD_MENU_ITEM_DEBUG_PT_NONE"] )
						
						else
						
							for k, v in pairs( pt_set ) do
								ArkInventory.Lib.DewDrop:AddLine(
									"text", v,
									"hasArrow", true,
									"hasEditBox", true,
									"editBoxText", v
								)
							end
							
						end

					end
				
				end
				
			end
		)
		
	end
	
end


function ArkInventory.MenuBagOpen( frame )

	if not frame then
		frame = this
	end

	if ArkInventory.Lib.DewDrop:IsOpen( this ) then
	
		ArkInventory.Lib.DewDrop:Close()
		
	else

		local loc_id = frame.ARK_Data.loc_id
		local bag_id = frame.ARK_Data.bag_id
		local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
		local player_id = cp.info.player_id
		
		local bag = cp.location[loc_id].bag[bag_id]
		
		local x, p, rp
		x = this:GetLeft() + ( this:GetRight() - this:GetLeft() ) / 2
		if ( x >= ( GetScreenWidth() / 2 ) ) then
			p = "TOPRIGHT"
			rp = "BOTTOMLEFT"
		else
			p = "TOPLEFT"
			rp = "BOTTOMRIGHT"
		end
	
		ArkInventory.Lib.DewDrop:Open( this,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
			
				if level == 1 then

					ArkInventory.Lib.DewDrop:AddLine(
						--"text", string.upper( string.format( ArkInventory.Localise["MOD_MENU_BAG_TITLE"], bag_id ) ),
						"text", string.upper( ArkInventory.Localise["MOD_MENU_BAG_TITLE"] ),
						"isTitle", true,
						"icon", bag.texture,
						"textHeight", 12
					)
					ArkInventory.Lib.DewDrop:AddLine()
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MOD_MENU_BAG_SHOW"],
						"tooltipTitle", ArkInventory.Localise["MOD_MENU_BAG_SHOW"],
						"tooltipText", ArkInventory.Localise["MOD_MENU_BAG_SHOW_TEXT"],
						"checked", ArkInventory.db.global.player.data[player_id].display[loc_id].bag[bag_id],
						"func", function()
							ArkInventory.db.global.player.data[player_id].display[loc_id].bag[bag_id] = not ArkInventory.db.global.player.data[player_id].display[loc_id].bag[bag_id]
							ArkInventory.Lib.DewDrop:Close()
							ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)

					ArkInventory.Lib.DewDrop:AddLine()
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MOD_MENU_BAG_ISOLATE"],
						"tooltipTitle", ArkInventory.Localise["MOD_MENU_BAG_ISOLATE"],
						"tooltipText", ArkInventory.Localise["MOD_MENU_BAG_ISOLATE_TEXT"],
						"func", function()
							for x in pairs( ArkInventory.Global.Location[loc_id].Bags ) do
								if x == bag_id then
									ArkInventory.db.global.player.data[player_id].display[loc_id].bag[x] = true
								else
									ArkInventory.db.global.player.data[player_id].display[loc_id].bag[x] = false
								end
							end
							ArkInventory.Lib.DewDrop:Close()
							ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)

					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MOD_MENU_BAG_SHOWALL"],
						"tooltipTitle", ArkInventory.Localise["MOD_MENU_BAG_SHOWALL"],
						"tooltipText", ArkInventory.Localise["MOD_MENU_BAG_SHOWALL_TEXT"],
						"func", function()
							for x in pairs( ArkInventory.Global.Location[loc_id].Bags ) do
								ArkInventory.db.global.player.data[player_id].display[loc_id].bag[x] = true
							end
							ArkInventory.Lib.DewDrop:Close()
							ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)
					
				end

			end
		)
		
	end
	
end

function ArkInventory.MenuVaultTabOpen( frame )

	if not frame then
		frame = this
	end

	if ArkInventory.Lib.DewDrop:IsOpen( this ) then
	
		ArkInventory.Lib.DewDrop:Close()
		
	else

		local loc_id = frame.ARK_Data.loc_id
		local bag_id = frame.ARK_Data.bag_id
		local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
		local bag = cp.location[loc_id].bag[bag_id]
		local button = getfenv()[ArkInventory.Const.Frame.Main.Name .. loc_id .. ArkInventory.Const.Frame.Changer.Name .. "WindowBag" .. bag_id]

		
		local x, p, rp
		x = this:GetLeft() + ( this:GetRight() - this:GetLeft() ) / 2
		if ( x >= ( GetScreenWidth() / 2 ) ) then
			p = "TOPRIGHT"
			rp = "TOPLEFT"
		else
			p = "TOPLEFT"
			rp = "TOPRIGHT"
		end
	
		ArkInventory.Lib.DewDrop:Open( this,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
			
				if level == 1 then
				
					ArkInventory.Lib.DewDrop:AddLine(
						"text", string.upper( string.format( "%s: %s", GUILD_BANK, string.format( GUILDBANK_TAB_NUMBER, bag_id ) ) ),
						"isTitle", true,
						"icon", bag.texture,
						"textHeight", 12
					)
					
					ArkInventory.Lib.DewDrop:AddLine()
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", string.upper( bag.name ),
						"isTitle", true,
						"textHeight", 12
					)
					
					ArkInventory.Lib.DewDrop:AddLine()
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", "request tab data",
						"closeWhenClicked", true,
						"func", function()
							ArkInventory.QueryVault( tab_id )
						end
					)
					
					ArkInventory.Lib.DewDrop:AddLine()
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", "mode: " .. GUILD_BANK,
						"closeWhenClicked", true,
						"disabled", GuildBankFrame.mode == "bank",
						"func", function()
							GuildBankFrame.mode = "bank"
							ArkInventory.Frame_Changer_Vault_Tab_OnClick( button, "LeftButton" )
							ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", "mode: " .. GUILD_BANK_LOG,
						"closeWhenClicked", true,
						"disabled", GuildBankFrame.mode == "log",
						"func", function()
							GuildBankFrame.mode = "log"
							ArkInventory.Frame_Changer_Vault_Tab_OnClick( button, "LeftButton" )
							ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", "mode: " .. GUILD_BANK_MONEY_LOG,
						"closeWhenClicked", true,
						"disabled", GuildBankFrame.mode == "moneylog",
						"func", function()
							GuildBankFrame.mode = "moneylog"
							ArkInventory.Frame_Changer_Vault_Tab_OnClick( button, "LeftButton" )
							ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)
					
					if IsGuildLeader() then
					
						ArkInventory.Lib.DewDrop:AddLine()
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", "change name or icon",
							"closeWhenClicked", true,
							"func", function()
								SetCurrentGuildBankTab( bag_id )
								GuildBankPopupFrame:Show()
								GuildBankPopupFrame_Update( bag_id )
							end
						)
						
					end
					
					ArkInventory.Lib.DewDrop:AddLine()
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["GENERIC_CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
			
			end
			
		)
		
	end
	
end


function ArkInventory.MenuSearchOpen( frame )

	if not frame then
		frame = this
	end

	if ArkInventory.Lib.DewDrop:IsOpen( this ) then
	
		ArkInventory.Lib.DewDrop:Close()
	
	else

		local base_options = { type = "group", args = {} }
		ArkInventory.Lib.DewDrop:InjectAceOptionsTable( ArkInventory, base_options )
	
		local x, p, rp
		x = this:GetLeft() + ( this:GetRight() - this:GetLeft() ) / 2
		if ( x >= ( GetScreenWidth() / 2 ) ) then
			p = "TOPRIGHT"
			rp = "TOPLEFT"
		else
			p = "TOPLEFT"
			rp = "TOPRIGHT"
		end
	
		ArkInventory.Lib.DewDrop:Open( this,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
			
				if level == 1 then
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", string.upper( ArkInventory.Localise["MOD_MENU_MAIN_SEARCH"] ),
						"isTitle", true,
						"textHeight", 14
					)
					
					ArkInventory.Lib.DewDrop:AddLine()

					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["GENERIC_SCALE"],
						"tooltipTitle", ArkInventory.Localise["GENERIC_SCALE"],
						"hasArrow", true,
						"hasSlider", true,
						"sliderIsPercent", true,
						"sliderValue", ArkInventory.db.profile.option.ui.search.scale,
						"sliderMin", 0.4,
						"sliderMax", 2,
						"sliderStep", 0.05,
						"sliderFunc", function( v )
							if v ~= ArkInventory.db.profile.option.ui.search.scale then
								ArkInventory.db.profile.option.ui.search.scale = v
								ArkInventory.Frame_Search_Paint()
							end
						end
					)

					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["GENERIC_FONT"],
						"hasArrow", true,
						"value", "SEARCH_FONT_FACE"
					)

					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["GENERIC_BORDER"],
						"hasArrow", true,
						"value", "SEARCH_BORDER"
					)
					
				end


				if level == 2 and value then
				
					if value == "SEARCH_FONT_FACE" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["GENERIC_FONT"] ),
							"isTitle", true,
							"textHeight", 12
						)
						
						ArkInventory.Lib.DewDrop:AddLine()
						
						for _, fontName in pairs( ArkInventory.Lib.SharedMedia:List( "font" ) ) do
							ArkInventory.Lib.DewDrop:AddLine(
								"text", fontName,
								"tooltipTitle", ArkInventory.Localise["GENERIC_FONT"],
								--"tooltipText", string.format( ArkInventory.Localise["MOD_MENU_MAIN_FONT_TEXT"], fontName ),
								"checked", ArkInventory.db.profile.option.ui.search.font.name == fontName,
								"func", function()
									ArkInventory.db.profile.option.ui.search.font.name = fontName
									ArkInventory.Frame_Search_Paint()
								end
							)
						end
						
					end


					if value == "SEARCH_BORDER" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["GENERIC_BORDER"] ),
							"isTitle", true,
							"textHeight", 12
						)
						ArkInventory.Lib.DewDrop:AddLine()

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_SHOW"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_SHOW"],
							--"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_WINDOW_BORDER_SHOW_TEXT"],
							"checked", ArkInventory.db.profile.option.ui.search.border.show,
							"func", function()
								ArkInventory.db.profile.option.ui.search.border.show = not ArkInventory.db.profile.option.ui.search.border.show
								ArkInventory.Frame_Search_Paint()
							end
						)

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_COLOUR"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_COLOUR"],
							--"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_WINDOW_BORDER_COLOR_TEXT"],
							"disabled", not ArkInventory.db.profile.option.ui.search.border.show,
							"hasColorSwatch", true,
							"r", ArkInventory.db.profile.option.ui.search.border.colour.r,
							"g", ArkInventory.db.profile.option.ui.search.border.colour.g,
							"b", ArkInventory.db.profile.option.ui.search.border.colour.b,
							"colorFunc", function( r, g, b )
								ArkInventory.db.profile.option.ui.search.border.colour.r = r
								ArkInventory.db.profile.option.ui.search.border.colour.g = g
								ArkInventory.db.profile.option.ui.search.border.colour.b = b
								ArkInventory.Frame_Search_Paint()
							end
						)

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_TEXTURE"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_TEXTURE"],
							--"tooltipText", ArkInventory.Localise["GENERIC_BORDER_TEXTURE_TEXT"],
							"hasArrow", true,
							"value", "SEARCH_BORDER_TEXTURE"
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_SCALE"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_SCALE"],
							--"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_BORDER_SCALE_TEXT"],
							"hasArrow", true,
							"hasSlider", true,
							"sliderIsPercent", true,
							"sliderValue", ArkInventory.db.profile.option.ui.search.border.scale or 1,
							"sliderMin", 0.25,
							"sliderMax", 4,
							"sliderStep", 0.05,
							"sliderFunc", function( v )
								if ArkInventory.db.profile.option.ui.search.border.scale ~= v then
									ArkInventory.db.profile.option.ui.search.border.scale = v
									ArkInventory.Frame_Search_Paint()
								end
							end
						)


					end

					
				end



				if level == 3 and value then
				
					if value == "SEARCH_BORDER_TEXTURE" then

						local t = ""
						local default = "Tooltip"
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["GENERIC_TEXTURE"] ),
							"isTitle", true,
							"textHeight", 12
						)
						
						ArkInventory.Lib.DewDrop:AddLine()

						t = ArkInventory.db.profile.option.ui.search.file or ArkInventory.Const.Texture.Border[default].file
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.format( "%s: %s", ArkInventory.Localise["GENERIC_FILE"], t ),
							"tooltipTitle", ArkInventory.Localise["GENERIC_FILE"],
							"tooltipText", ArkInventory.Localise["GENERIC_BORDER_TEXTURE_FILE_TEXT"],
							"hasArrow", true,
							"hasEditBox", true,
							"editBoxText", t,
							"editBoxFunc", function( v )
								ArkInventory.db.profile.option.ui.search.border.file = v
								ArkInventory.db.profile.option.ui.search.border.scale = 1
								ArkInventory.Frame_Search_Paint()
							end
						)
						
						t = ArkInventory.db.profile.option.ui.search.border.size or ArkInventory.Const.Texture.Border[default].size
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.format( "%s: %s", ArkInventory.Localise["GENERIC_HEIGHT"], t ),
							"tooltipTitle", ArkInventory.Localise["GENERIC_HEIGHT"],
							"tooltipText", ArkInventory.Localise["GENERIC_BORDER_TEXTURE_HEIGHT_TEXT"],
							"hasArrow", true,
							"hasEditBox", true,
							"editBoxText", t,
							"editBoxValidateFunc", function( v )
								return not string.find( v, "%D" )
							end,
							"editBoxFunc", function( v )
								ArkInventory.db.profile.option.ui.search.border.size = tonumber( v )
								ArkInventory.Frame_Search_Paint()
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine()
						ArkInventory.Lib.DewDrop:AddLine(
							"text", "Default Styles",
							"isTitle", true
						)
						
						local styles = { }
						for style in pairs( ArkInventory.Const.Texture.Border ) do
							table.insert( styles, style )
						end
						table.sort( styles )
						
						for _, style in pairs( styles ) do
						
							ArkInventory.Lib.DewDrop:AddLine(
								"text", style,
								"func", function()
									ArkInventory.db.profile.option.ui.search.border.file = ArkInventory.Const.Texture.Border[style].file
									ArkInventory.db.profile.option.ui.search.border.size = ArkInventory.Const.Texture.Border[style].size
									ArkInventory.db.profile.option.ui.search.border.scale = 1
									ArkInventory.Frame_Search_Paint()
								end
							)
							
						end
						
					end

				end

				
				
				if level == 1 then
					ArkInventory.Lib.DewDrop:AddLine()
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["GENERIC_CLOSE_MENU"],
						"closeWhenClicked", true
					)
				end

			end
			
		)

	end
	
	
	
end


function ArkInventory.MenuRulesOpen( frame )

	if not frame then
		frame = this
	end

	if ArkInventory.Lib.DewDrop:IsOpen( this ) then
	
		ArkInventory.Lib.DewDrop:Close()
	
	else

		local base_options = { type = "group", args = {} }
		ArkInventory.Lib.DewDrop:InjectAceOptionsTable( ArkInventory, base_options )
	
		local x, p, rp
		x = this:GetLeft() + ( this:GetRight() - this:GetLeft() ) / 2
		if ( x >= ( GetScreenWidth() / 2 ) ) then
			p = "TOPRIGHT"
			rp = "TOPLEFT"
		else
			p = "TOPLEFT"
			rp = "TOPRIGHT"
		end
	
		ArkInventory.Lib.DewDrop:Open( this,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
			
				if level == 1 then
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", string.upper( ArkInventory.Localise["MOD_MENU_MAIN_RULES"] ),
						"isTitle", true,
						"textHeight", 14
					)
					
					ArkInventory.Lib.DewDrop:AddLine()

					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["GENERIC_SCALE"],
						"tooltipTitle", ArkInventory.Localise["GENERIC_SCALE"],
						"hasArrow", true,
						"hasSlider", true,
						"sliderIsPercent", true,
						"sliderValue", ArkInventory.db.profile.option.ui.rules.scale,
						"sliderMin", 0.4,
						"sliderMax", 2,
						"sliderStep", 0.05,
						"sliderFunc", function( v )
							if v ~= ArkInventory.db.profile.option.ui.rules.scale then
								ArkInventory.db.profile.option.ui.rules.scale = v
								ArkInventory.Frame_Rules_Paint()
							end
						end
					)

					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["GENERIC_FONT"],
						"hasArrow", true,
						"value", "RULES_FONT_FACE"
					)

					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["GENERIC_BORDER"],
						"hasArrow", true,
						"value", "RULES_BORDER"
					)

					ArkInventory.Lib.DewDrop:AddLine()

					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MOD_MENU_RULE_SHOWDISABLED"],
						"tooltipTitle", ArkInventory.Localise["MOD_MENU_RULE_SHOWDISABLED"],
						"tooltipText", ArkInventory.Localise["MOD_MENU_RULE_SHOWDISABLED_TEXT"],
						"checked", ArkInventory.db.global.option.showdisabled,
						"closeWhenClicked", true,
						"func", function()
							ArkInventory.db.global.option.showdisabled = not ArkInventory.db.global.option.showdisabled,
							ArkInventory.Frame_Rules_Table_Reset( "ARKINV_RulesFrameView" )
							ArkInventory.Frame_Rules_Table_Refresh( "ARKINV_RulesFrame" )
						end
					)
					
				end


				if level == 2 and value then
				
					if value == "RULES_FONT_FACE" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["GENERIC_FONT"] ),
							"isTitle", true,
							"textHeight", 12
						)
						
						ArkInventory.Lib.DewDrop:AddLine()
						
						for _, fontName in pairs( ArkInventory.Lib.SharedMedia:List( "font" ) ) do
							ArkInventory.Lib.DewDrop:AddLine(
								"text", fontName,
								"tooltipTitle", ArkInventory.Localise["GENERIC_FONT"],
								--"tooltipText", string.format( ArkInventory.Localise["MOD_MENU_MAIN_FONT_TEXT"], fontName ),
								"checked", ArkInventory.db.profile.option.ui.rules.font.name == fontName,
								"func", function()
									ArkInventory.db.profile.option.ui.rules.font.name = fontName
									ArkInventory.Frame_Rules_Paint()
								end
							)
						end
						
					end


					if value == "RULES_BORDER" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["GENERIC_BORDER"] ),
							"isTitle", true,
							"textHeight", 12
						)
						ArkInventory.Lib.DewDrop:AddLine()

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_SHOW"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_SHOW"],
							--"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_WINDOW_BORDER_SHOW_TEXT"],
							"checked", ArkInventory.db.profile.option.ui.rules.border.show,
							"func", function()
								ArkInventory.db.profile.option.ui.rules.border.show = not ArkInventory.db.profile.option.ui.rules.border.show
								ArkInventory.Frame_Rules_Paint()
							end
						)

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_COLOUR"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_COLOUR"],
							--"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_WINDOW_BORDER_COLOR_TEXT"],
							"disabled", not ArkInventory.db.profile.option.ui.rules.border.show,
							"hasColorSwatch", true,
							"r", ArkInventory.db.profile.option.ui.rules.border.colour.r,
							"g", ArkInventory.db.profile.option.ui.rules.border.colour.g,
							"b", ArkInventory.db.profile.option.ui.rules.border.colour.b,
							"colorFunc", function( r, g, b )
								ArkInventory.db.profile.option.ui.rules.border.colour.r = r
								ArkInventory.db.profile.option.ui.rules.border.colour.g = g
								ArkInventory.db.profile.option.ui.rules.border.colour.b = b
								ArkInventory.Frame_Rules_Paint()
							end
						)

						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_TEXTURE"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_TEXTURE"],
							--"tooltipText", ArkInventory.Localise["GENERIC_BORDER_TEXTURE_TEXT"],
							"hasArrow", true,
							"value", "RULES_BORDER_TEXTURE"
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["GENERIC_SCALE"],
							"tooltipTitle", ArkInventory.Localise["GENERIC_SCALE"],
							--"tooltipText", ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_BORDER_SCALE_TEXT"],
							"hasArrow", true,
							"hasSlider", true,
							"sliderIsPercent", true,
							"sliderValue", ArkInventory.db.profile.option.ui.rules.border.scale or 1,
							"sliderMin", 0.25,
							"sliderMax", 4,
							"sliderStep", 0.05,
							"sliderFunc", function( v )
								if ArkInventory.db.profile.option.ui.rules.border.scale ~= v then
									ArkInventory.db.profile.option.ui.rules.border.scale = v
									ArkInventory.Frame_Rules_Paint()
								end
							end
						)


					end

					
				end



				if level == 3 and value then
				
					if value == "RULES_BORDER_TEXTURE" then

						local t = ""
						local default = "Tooltip"
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.upper( ArkInventory.Localise["GENERIC_TEXTURE"] ),
							"isTitle", true,
							"textHeight", 12
						)
						
						ArkInventory.Lib.DewDrop:AddLine()

						t = ArkInventory.db.profile.option.ui.rules.file or ArkInventory.Const.Texture.Border[default].file
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.format( "%s: %s", ArkInventory.Localise["GENERIC_FILE"], t ),
							"tooltipTitle", ArkInventory.Localise["GENERIC_FILE"],
							"tooltipText", ArkInventory.Localise["GENERIC_BORDER_TEXTURE_FILE_TEXT"],
							"hasArrow", true,
							"hasEditBox", true,
							"editBoxText", t,
							"editBoxFunc", function( v )
								ArkInventory.db.profile.option.ui.rules.border.file = v
								ArkInventory.db.profile.option.ui.rules.border.scale = 1
								ArkInventory.Frame_Rules_Paint()
							end
						)
						
						t = ArkInventory.db.profile.option.ui.rules.border.size or ArkInventory.Const.Texture.Border[default].size
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.format( "%s: %s", ArkInventory.Localise["GENERIC_HEIGHT"], t ),
							"tooltipTitle", ArkInventory.Localise["GENERIC_HEIGHT"],
							"tooltipText", ArkInventory.Localise["GENERIC_BORDER_TEXTURE_HEIGHT_TEXT"],
							"hasArrow", true,
							"hasEditBox", true,
							"editBoxText", t,
							"editBoxValidateFunc", function( v )
								return not string.find( v, "%D" )
							end,
							"editBoxFunc", function( v )
								ArkInventory.db.profile.option.ui.rules.border.size = tonumber( v )
								ArkInventory.Frame_Rules_Paint()
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine()
						ArkInventory.Lib.DewDrop:AddLine(
							"text", "Default Styles",
							"isTitle", true
						)
						
						local styles = { }
						for style in pairs( ArkInventory.Const.Texture.Border ) do
							table.insert( styles, style )
						end
						table.sort( styles )
						
						for _, style in pairs( styles ) do
						
							ArkInventory.Lib.DewDrop:AddLine(
								"text", style,
								"func", function()
									ArkInventory.db.profile.option.ui.rules.border.file = ArkInventory.Const.Texture.Border[style].file
									ArkInventory.db.profile.option.ui.rules.border.size = ArkInventory.Const.Texture.Border[style].size
									ArkInventory.db.profile.option.ui.rules.border.scale = 1
									ArkInventory.Frame_Rules_Paint()
								end
							)
							
						end
						
					end

				end

				
				if level == 1 then
					ArkInventory.Lib.DewDrop:AddLine()
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["GENERIC_CLOSE_MENU"],
						"closeWhenClicked", true
					)
				end

			end
			
		)

	end
	
	
	
end



function ArkInventory.MenuSwitchLocation( )

	ArkInventory.Lib.DewDrop:AddLine(
		"text", string.upper( ArkInventory.Localise["MOD_MENU_MAIN_SWITCH_LOCATION"] ),
		"isTitle", true,
		"textHeight", 12
	)
	
	ArkInventory.Lib.DewDrop:AddLine()

	for set_id, loc in ipairs( ArkInventory.Global.Location ) do
		if ArkInventory.Global.Location[set_id].canView then
			ArkInventory.Lib.DewDrop:AddLine(
				"text", loc.Name,
				"tooltipTitle", loc.Name,
				"tooltipText", string.format( ArkInventory.Localise["MOD_MENU_MAIN_SWITCH_LOCATION_TEXT"], loc.Name ),
				"icon", loc.Texture,
				"closeWhenClicked", true,
				"func", function()
					ArkInventory.Frame_Main_Toggle( set_id )
				end
			)
		end
	end
	
end

function ArkInventory.MenuSwitchLocationOpen( frame )

	if not frame then
		frame = this
	end

	if ArkInventory.Lib.DewDrop:IsOpen( this ) then
	
		ArkInventory.Lib.DewDrop:Close()
	
	else

		local x, p, rp
		x = this:GetLeft() + ( this:GetRight() - this:GetLeft() ) / 2
		if ( x >= ( GetScreenWidth() / 2 ) ) then
			p = "TOPRIGHT"
			rp = "BOTTOMLEFT"
		else
			p = "TOPLEFT"
			rp = "BOTTOMRIGHT"
		end
	
		ArkInventory.Lib.DewDrop:Open( this,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
				ArkInventory.MenuSwitchLocation( )
			end
		)

	end
	
end

function ArkInventory.MenuSwitchCharacter( frame, level, value )

	local loc_id = frame.ARK_Data.loc_id
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	
	if level == 1 then
	
		ArkInventory.Lib.DewDrop:AddLine(
			"text", string.upper( ArkInventory.Localise["GENERIC_REALM"] ),
			"isTitle", true,
			"textHeight", 12
		)
		
		ArkInventory.Lib.DewDrop:AddLine()
		
		for r in ArkInventory.spairs( ArkInventory.db.global.player.realm, function(a,b) return a < b end ) do
			
			ArkInventory.Lib.DewDrop:AddLine(
				"text", r,
				"hasArrow", true,
				"value", ( "SWITCH_CHARACTER_REALM_" .. r )
			)
			
		end
		
	end
	
	if level == 2 and value then
	
		local r = strmatch( value, "^SWITCH_CHARACTER_REALM_(.+)" )

		ArkInventory.Lib.DewDrop:AddLine(
			"text", string.upper( CHARACTER ),
			"isTitle", true,
			"textHeight", 12
		)
		
		for f in ArkInventory.spairs( ArkInventory.db.global.player.realm[r].faction, function(a,b) return a < b end ) do
			
			ArkInventory.Lib.DewDrop:AddLine()
			
			ArkInventory.Lib.DewDrop:AddLine(
				"text", f,
				"isTitle", true
			)
			
			local count = 0
		
			for n in ArkInventory.spairs( ArkInventory.db.global.player.realm[r].faction[f].name, function(a,b) return a < b end ) do
			
				local player_id = ArkInventory.PlayerIDGenerate( r, f, n )
				local tp = ArkInventory.PlayerInfoGet( player_id )
				
				local show = false
				
				if loc_id ~= ArkInventory.Const.Location.Vault then
				
					if string.sub( n, 1, 1 ) ~= ArkInventory.Const.GuildTag then
						show = true
					end
							
				else
				
					tp = ArkInventory.PlayerInfoGet( tp.info.guild_id )
					
					if string.sub( n, 1, 1 ) == ArkInventory.Const.GuildTag then
						show = true
					end
				
				end
				
				if not tp or tp.location[loc_id].slot_count == 0 then
					show = false
				end
				
				if show then
				
					count = count + 1
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.DisplayName4( tp ),
						--"tooltipTitle", "",
						--"tooltipText", "",
						"hasArrow", true,
						"isRadio", true,
						"checked", cp.info.player_id == tp.info.player_id,
						"closeWhenClicked", true,
						"func", function()
							ArkInventory.Frame_Main_Show( loc_id, tp.info.player_id )
						end,
						"value", ( "SWITCH_CHARACTER_SWITCH_" .. tp.info.player_id )
					)
					
				end
				
			end
			
			
			if count == 0 then
			
				ArkInventory.Lib.DewDrop:AddLine(
					"text", "no data availale",
					--"tooltipTitle", "",
					--"tooltipText", "",
					"disabled", true
				)
	
			end
			
		end
		
	end
	
	if level == 3 and value then

		local player_id = strmatch( value, "^SWITCH_CHARACTER_SWITCH_(.+)" )
		local tp = ArkInventory.PlayerInfoGet( player_id )
		
		ArkInventory.Lib.DewDrop:AddLine(
			"text", string.upper( ArkInventory.DisplayName4( tp ) ),
			"isTitle", true,
			"textHeight", 12
		)
		
		ArkInventory.Lib.DewDrop:AddLine()
		
		ArkInventory.Lib.DewDrop:AddLine(
			"text", string.format( ArkInventory.Localise["MOD_MENU_MAIN_SWITCH_CHARACTER_ERASE"], ArkInventory.Global.Location[loc_id].Name ),
			"tooltipTitle", string.format( ArkInventory.Localise["MOD_MENU_MAIN_SWITCH_CHARACTER_ERASE"], ArkInventory.Global.Location[loc_id].Name ),
			"tooltipText", RED_FONT_COLOR_CODE .. string.format( ArkInventory.Localise["MOD_MENU_MAIN_SWITCH_CHARACTER_ERASE_TEXT"], ArkInventory.Global.Location[loc_id].Name, ArkInventory.DisplayName1( tp.info ) ),
			"closeWhenClicked", true,
			"func", function()
				ArkInventory.Frame_Main_Hide( loc_id )
				ArkInventory.EraseSavedData( tp.info.player_id, loc_id )
			end
		)
		
		ArkInventory.Lib.DewDrop:AddLine()
		
		ArkInventory.Lib.DewDrop:AddLine(
			"text", string.format( ArkInventory.Localise["MOD_MENU_MAIN_SWITCH_CHARACTER_ERASE"], ArkInventory.Localise["LOCATION_ALL"] ),
			"tooltipTitle", string.format( ArkInventory.Localise["MOD_MENU_MAIN_SWITCH_CHARACTER_ERASE"], ArkInventory.Localise["LOCATION_ALL"] ),
			"tooltipText", RED_FONT_COLOR_CODE .. string.format( ArkInventory.Localise["MOD_MENU_MAIN_SWITCH_CHARACTER_ERASE_TEXT"], ArkInventory.Localise["LOCATION_ALL"], ArkInventory.DisplayName1( tp.info ) ),
			"closeWhenClicked", true,
			"func", function()
				ArkInventory.Frame_Main_Hide()
				ArkInventory.EraseSavedData( tp.info.player_id )
			end
		)
	
	end

end
	

function ArkInventory.MenuSwitchCharacterOpen( frame )

	if not frame then
		frame = this
	end

	if ArkInventory.Lib.DewDrop:IsOpen( this ) then
	
		ArkInventory.Lib.DewDrop:Close()
	
	else

		local base_options = { type = "group", args = {} }
		ArkInventory.Lib.DewDrop:InjectAceOptionsTable( ArkInventory, base_options )
	
		local x, p, rp
		x = this:GetLeft() + ( this:GetRight() - this:GetLeft() ) / 2
		if ( x >= ( GetScreenWidth() / 2 ) ) then
			p = "TOPRIGHT"
			rp = "BOTTOMLEFT"
		else
			p = "TOPLEFT"
			rp = "BOTTOMRIGHT"
		end
	
		ArkInventory.Lib.DewDrop:Open( this,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )

				ArkInventory.MenuSwitchCharacter( frame, level, value )
			
				if level == 1 then
					ArkInventory.Lib.DewDrop:AddLine()
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["GENERIC_CLOSE_MENU"],
						"closeWhenClicked", true
					)
				end

			end
			
		)

	end
	
end
