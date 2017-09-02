local basepath = ArkInventory.Options.Internal
local path = basepath

function ArkInventory.InitOptions( )

	local cp = ArkInventory.Global.Me
	local player_id = cp.info.player_id

	local anchorpoints = {
		[ArkInventory.Const.Anchor.TopRight] = ArkInventory.Localise["GENERIC_TOPRIGHT"],
		[ArkInventory.Const.Anchor.BottomRight] = ArkInventory.Localise["GENERIC_BOTTOMRIGHT"],
		[ArkInventory.Const.Anchor.BottomLeft] = ArkInventory.Localise["GENERIC_BOTTOMLEFT"],
		[ArkInventory.Const.Anchor.TopLeft] = ArkInventory.Localise["GENERIC_TOPLEFT"],
	}

	ArkInventory.Options.Blizzard.args = {
		version = {
			order = 1,
			name = ArkInventory.Global.Version,
			type = "description",
		},
		notes = {
			order = 2,
			name = function( ) 
				local t = GetAddOnMetadata( ArkInventory.Const.Program.Name, "Notes-" .. GetLocale() ) or ""
				if t == "" then
					t = GetAddOnMetadata( ArkInventory.Const.Program.Name, "Notes" ) or ""
				end
				return t or ""
			end,
			type = "description",
		},
		config = {
			order = 3,
			name = ArkInventory.Localise["OPT_CONFIG"],
			desc = ArkInventory.Localise["OPT_CONFIG_TEXT"],
			type = "execute",
			func = function( )
				ArkInventory.Lib.Dialog:Open( ArkInventory.Const.Frame.Options.Internal )
			end,
		},
		enabled = {
			order = 4,
			name = ArkInventory.Localise["GENERIC_ENABLED"],
			type = "toggle",
			get = function( info )
				return ArkInventory:IsEnabled()
			end,
			set = function( info, v )
				if v then
					ArkInventory:Enable()
				else
					ArkInventory:Disable()
				end
			end,
		},
	}

	path.args = {
	
		version = {
			cmdHidden = true,
			order = 1,
			name = ArkInventory.Global.Version,
			type = "description",
		},
		
		notes = {
			cmdHidden = true,
			order = 2,
			name = function( ) 
				local t = GetAddOnMetadata( ArkInventory.Const.Program.Name, "Notes-" .. GetLocale() ) or ""
				if t == "" then
					t = GetAddOnMetadata( ArkInventory.Const.Program.Name, "Notes" ) or ""
				end
				return t or ""
			end,
			type = "description",
		},
		
		system = {
			cmdHidden = true,
			order = 10,
			name = ArkInventory.Localise["OPT_SYSTEM"],
			desc = ArkInventory.Localise["OPT_SYSTEM_TEXT"],
			type = "group",
			args = {
				enabled = {
					order = 2,
					name = ArkInventory.Localise["GENERIC_ENABLED"],
					type = "toggle",
					get = function( info )
						return ArkInventory:IsEnabled()
					end,
					set = function( info, v )
						if v then
							ArkInventory:Enable()
						else
							ArkInventory:Disable()
						end
					end,
				},
				font = {
					order = 3,
					type = "select",
					name = ArkInventory.Localise["GENERIC_FONT"],
					desc = ArkInventory.Localise["MOD_MENU_MAIN_FONT_TEXT"],
					values = function( )
						local t = { }
						for _, fontName in pairs( ArkInventory.Lib.SharedMedia:List( "font" ) ) do
							t[fontName] = fontName
						end
						return t
					end,
					get = function( info )
						return ArkInventory.db.profile.option.font.name or ArkInventory.Const.Font.Face
					end,
					set = function( info, v )
						ArkInventory.db.profile.option.font.name = v
						ArkInventory.SetFontAll( )
					end,
				},
--[[
				actions = {
					order = 4,
					name = ArkInventory.Localise["MOD_MENU_MAIN_ACTIONS"],
					type = "group",
					inline = true,
					args = { },
				},
]]--
				tooltip = {
					cmdHidden = true,
					order = 5,
					name = ArkInventory.Localise["MOD_MENU_MAIN_TOOLTIP"],
					type = "group",
					inline = true,
					args = {
						enabled = {
							order = 1,
							name = ArkInventory.Localise["GENERIC_ENABLED"],
							desc = ArkInventory.Localise["MOD_MENU_MAIN_TOOLTIP_ENABLE_TEXT"],
							type = "toggle",
							get = function( info )
								return ArkInventory.db.global.option.tooltip.show
							end,
							set = function( info, v )
								ArkInventory.db.global.option.tooltip.show = v
							end,
						},
						empty = {
							order = 2,
							name = ArkInventory.Localise["MOD_MENU_MAIN_TOOLTIP_EMPTY_ADD"],
							type = "group",
							inline = true,
							args = {
								enabled = {
									order = 1,
									name = ArkInventory.Localise["GENERIC_ENABLED"],
									desc = ArkInventory.Localise["MOD_MENU_MAIN_TOOLTIP_EMPTY_ADD_TEXT"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.global.option.tooltip.add.empty
									end,
									set = function( info, v )
										ArkInventory.db.global.option.tooltip.add.empty = v
									end,
								},
							},
						},
						count = {
							order = 3,
							name = ArkInventory.Localise["MOD_MENU_MAIN_TOOLTIP_ITEMCOUNT_ADD"],
							type = "group",
							inline = true,
							args = {
								enabled = {
									order = 1,
									name = ArkInventory.Localise["GENERIC_ENABLED"],
									desc = ArkInventory.Localise["MOD_MENU_MAIN_TOOLTIP_ITEMCOUNT_ADD_TEXT"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.global.option.tooltip.add.count
									end,
									set = function( info, v )
										ArkInventory.db.global.option.tooltip.add.count = v
									end,
								},
								me = {
									order = 2,
									name = ArkInventory.Localise["MOD_MENU_MAIN_TOOLTIP_SELF_ONLY"],
									desc = ArkInventory.Localise["MOD_MENU_MAIN_TOOLTIP_SELF_ONLY_TEXT"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.global.option.tooltip.me
									end,
									set = function( info, v )
										ArkInventory.db.global.option.tooltip.me = v
										ArkInventory.Global.Cache.ItemCount = { }
									end,
								},
								color = {
									order = 3,
									name = ArkInventory.Localise["GENERIC_COLOUR"],
									desc = ArkInventory.Localise["MOD_MENU_MAIN_TOOLTIP_ITEMCOUNT_COLOUR_TEXT"],
									type = "color",
									hasAlpha = false,
									get = function( info )
										local r = ArkInventory.db.global.option.tooltip.colour.count.r
										local g = ArkInventory.db.global.option.tooltip.colour.count.g
										local b = ArkInventory.db.global.option.tooltip.colour.count.b
										return r, g, b
									end,
									set = function( info, r, g, b )
										ArkInventory.db.global.option.tooltip.colour.count.r = r
										ArkInventory.db.global.option.tooltip.colour.count.g = g
										ArkInventory.db.global.option.tooltip.colour.count.b = b
									end,
								},
							},
						},
						vendor = {
							order = 4,
							name = ArkInventory.Localise["MOD_MENU_MAIN_TOOLTIP_VENDOR_ADD"],
							type = "group",
							inline = true,
							args = {
								enabled = {
									order = 1,
									name = ArkInventory.Localise["GENERIC_ENABLED"],
									desc = ArkInventory.Localise["MOD_MENU_MAIN_TOOLTIP_VENDOR_ADD_TEXT"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.global.option.tooltip.add.vendor
									end,
									set = function( info, v )
										ArkInventory.db.global.option.tooltip.add.vendor = v
									end,
								},
								color = {
									order = 2,
									name = ArkInventory.Localise["GENERIC_COLOUR"],
									desc = ArkInventory.Localise["MOD_MENU_MAIN_TOOLTIP_VENDOR_COLOUR_TEXT"],
									type = "color",
									hasAlpha = false,
									get = function( info )
										local r = ArkInventory.db.global.option.tooltip.colour.vendor.r
										local g = ArkInventory.db.global.option.tooltip.colour.vendor.g
										local b = ArkInventory.db.global.option.tooltip.colour.vendor.b
										return r, g, b
									end,
									set = function( info, r, g, b )
										ArkInventory.db.global.option.tooltip.colour.vendor.r = r
										ArkInventory.db.global.option.tooltip.colour.vendor.g = g
										ArkInventory.db.global.option.tooltip.colour.vendor.b = b
									end,
								},
							},
						},
					},
				},
				bugfix = {
					cmdHidden = true,
					order = 100,
					name = ArkInventory.Localise["OPT_SYSTEM_BUGFIX"],
					type = "group",
					inline = true,
					args = {
						framelevel = {
							name = ArkInventory.Localise["OPT_SYSTEM_BUGFIX_FRAMELEVEL"],
							type = "group",
							inline = true,
							args = {
								desc = {
									order = 1,
									name = ArkInventory.Localise["OPT_SYSTEM_BUGFIX_FRAMELEVEL_TEXT"],
									type = "description",
								},
								enabled = {
									order = 2,
									name = ArkInventory.Localise["GENERIC_ENABLED"],
									desc = ArkInventory.Localise["OPT_SYSTEM_BUGFIX_TEXT"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.global.option.bugfix.enable
									end,
									set = function( info, v )
										ArkInventory.db.global.option.bugfix.enable = v
									end,
								},
								alert = {
									order = 3,
									name = ArkInventory.Localise["GENERIC_ALERT"],
									desc = ArkInventory.Localise["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_TEXT"],
									type = "select",
									disabled = function( )
										return not ArkInventory.db.global.option.bugfix.enable
									end,
									values = function( )
										local t = { }
										t[0] = ArkInventory.Localise["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE0"]
										t[1] = ArkInventory.Localise["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE1"]
										t[2] = ArkInventory.Localise["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE2"]
										return t
									end,
									get = function( info )
										return ArkInventory.db.global.option.bugfix.alert or 0
									end,
									set = function( info, v )
										ArkInventory.db.global.option.bugfix.alert = v
										ArkInventory.Output( { ArkInventory.Localise["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT"], " = ", ArkInventory.Localise[string.format("OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE%s", v)] } )
									end,
								},
							},
						},
					},
				},
			},
		},
		
		auto = {
			cmdHidden = true,
			order = 30,
			name = ArkInventory.Localise["OPT_AUTO"],
			type = "group",
			args = {
				auto_open = {
					order = 1,
					type = "multiselect",
					name = string.format( ArkInventory.Localise["OPT_AUTO_OPEN"], ArkInventory.Const.Program.Name, ArkInventory.Localise["LOCATION_BAG"] ),
					values = function( )
						local t = { }
						t[1] = ArkInventory.Localise["OPT_AUTO_OPEN_BANK"]
						t[2] = ArkInventory.Localise["OPT_AUTO_OPEN_VAULT"]
						t[3] = ArkInventory.Localise["OPT_AUTO_OPEN_MAIL"]
						t[4] = ArkInventory.Localise["OPT_AUTO_OPEN_MERCHANT"]
						t[5] = ArkInventory.Localise["OPT_AUTO_OPEN_TRADE"]
						t[6] = ArkInventory.Localise["OPT_AUTO_OPEN_AUCTION"]
						return t
					end,
					get = function( info, k )
						if k == 1 then
							return ArkInventory.db.global.option.auto.open.bank
						elseif k == 2 then
							return ArkInventory.db.global.option.auto.open.vault
						elseif k == 3 then
							return ArkInventory.db.global.option.auto.open.mail
						elseif k == 4 then
							return ArkInventory.db.global.option.auto.open.merchant
						elseif k == 5 then
							return ArkInventory.db.global.option.auto.open.trade
						elseif k == 6 then
							return ArkInventory.db.global.option.auto.open.auction
						else
							return false
						end
					end,
					set = function( info, k, v )
						if k == 1 then
							ArkInventory.db.global.option.auto.open.bank = v
						elseif k == 2 then
							ArkInventory.db.global.option.auto.open.vault = v
						elseif k == 3 then
							ArkInventory.db.global.option.auto.open.mail = v
						elseif k == 4 then
							ArkInventory.db.global.option.auto.open.merchant = v
						elseif k == 5 then
							ArkInventory.db.global.option.auto.open.trade = v
						elseif k == 6 then
							ArkInventory.db.global.option.auto.open.auction = v
						else
							return false
						end
					end,
				},
				auto_close = {
					order = 2,
					type = "multiselect",
					name = string.format( ArkInventory.Localise["OPT_AUTO_CLOSE"], ArkInventory.Const.Program.Name, ArkInventory.Localise["LOCATION_BAG"] ),
					values = function( )
						local t = { }
						t[1] = ArkInventory.Localise["OPT_AUTO_CLOSE_BANK"]
						t[2] = ArkInventory.Localise["OPT_AUTO_CLOSE_VAULT"]
						t[3] = ArkInventory.Localise["OPT_AUTO_CLOSE_MAIL"]
						t[4] = ArkInventory.Localise["OPT_AUTO_CLOSE_MERCHANT"]
						t[5] = ArkInventory.Localise["OPT_AUTO_CLOSE_TRADE"]
						t[6] = ArkInventory.Localise["OPT_AUTO_CLOSE_AUCTION"]
						t[7] = ArkInventory.Localise["OPT_AUTO_CLOSE_COMBAT"]
						return t
					end,
					get = function( info, k )
						if k == 1 then
							return ArkInventory.db.global.option.auto.close.bank
						elseif k == 2 then
							return ArkInventory.db.global.option.auto.close.vault
						elseif k == 3 then
							return ArkInventory.db.global.option.auto.close.mail
						elseif k == 4 then
							return ArkInventory.db.global.option.auto.close.merchant
						elseif k == 5 then
							return ArkInventory.db.global.option.auto.close.trade
						elseif k == 6 then
							return ArkInventory.db.global.option.auto.close.auction
						elseif k == 7 then
							return ArkInventory.db.global.option.auto.close.combat
						else
							return false
						end
					end,
					set = function( info, k, v )
						if k == 1 then
							ArkInventory.db.global.option.auto.close.bank = v
						elseif k == 2 then
							ArkInventory.db.global.option.auto.close.vault = v
						elseif k == 3 then
							ArkInventory.db.global.option.auto.close.mail = v
						elseif k == 4 then
							ArkInventory.db.global.option.auto.close.merchant = v
						elseif k == 5 then
							ArkInventory.db.global.option.auto.close.trade = v
						elseif k == 6 then
							ArkInventory.db.global.option.auto.close.auction = v
						elseif k == 7 then
							ArkInventory.db.global.option.auto.close.combat = v
						else
							return false
						end
					end,
				},
			},
		},
		
		control = {
			cmdHidden = true,
			order = 40,
			name = ArkInventory.Localise["OPT_CONTROL"],
			type = "group",
			childGroups = "select",
			args = { }, -- computed 
		},
		
		settings = {
			cmdHidden = true,
			order = 60,
			name = ArkInventory.Localise["OPT_LOCATION_SETTINGS"],
			type = "group",
			childGroups = "select",
			args = { }, -- computed
		},
		
		debug = {
			cmdHidden = true,
			order = 70,
			name = function()
				return ArkInventory.Localise["MOD_MENU_MAIN_DEBUG"]
			end,
			type = "group",
			hidden = true,
			args = {
				locale = {
					order = 1,
					name = "locale",
					type = "select",
					values = function( )
						return {
							["enUS"] = "English [enUS]",
							["deDE"] = "German [deDE]",
							["esES"] = "Spanish [esES]",
							["frFR"] = "French [frFR]",
							["koKR"] = "Korean [koKR]",
							["zhCN"] = "Chinese [zhCN]",
							["zhTW"] = "Chinese [zhTW]",
							["ruRU"] = "Russian [ruRU]",
						}
					end,
					get = function( info )
						return ArkInventory.Localise:GetLocale()
					end,
					set = function( info, v )
						ArkInventory.Localise:SetLocale( v )
						ArkInventory.InitOptions( )
					end,
				},
			},
		},
		
		profiles = LibStub( "AceDBOptions-3.0" ):GetOptionsTable( ArkInventory.db ),

	}
	
	--path.args.profiles.cmdHidden = true
	
	path = basepath.args.control.args
	for k, loc_data in ipairs( ArkInventory.Global.Location ) do
	
		path[loc_data.Internal] = {
			order = k,
			type = "group",
			name = loc_data.Name,
			args = {
				monitor = {
					order = 1,
					type = "toggle",
					name = ArkInventory.Localise["OPT_CONTROL_MONITOR"],
					desc = string.format( ArkInventory.Localise["OPT_CONTROL_MONITOR_TEXT"], loc_data.Name, cp.info.name ),
					disabled = not ArkInventory.Global.Location[k].canPurge,
					get = function( info )
						return ArkInventory.db.global.player.data[player_id].monitor[k]
					end,
					set = function( info, v )
						ArkInventory.db.global.player.data[player_id].monitor[k] = v
					end,
				},
				save = {
					order = 2,
					type = "toggle",
					name = ArkInventory.Localise["OPT_CONTROL_SAVE"],
					desc = string.format( ArkInventory.Localise["OPT_CONTROL_SAVE_TEXT"], loc_data.Name, cp.info.name ),
					disabled = false,
					get = function( info )
						return ArkInventory.db.global.player.data[player_id].save[k]
					end,
					set = function( info, v )
						ArkInventory.db.global.player.data[player_id].save[k] = v
					end,
				},
				control = {
					order = 3,
					type = "toggle",
					name = ArkInventory.Localise["OPT_CONTROL_CONTROL"],
					desc = string.format( ArkInventory.Localise["OPT_CONTROL_CONTROL_TEXT"], ArkInventory.Const.Program.Name, loc_data.Name ),
					disabled = not ArkInventory.Global.Location[k].canOverride,
					get = function( info )
						return ArkInventory.db.global.player.data[player_id].control[k]
					end,
					set = function( info, v )
						ArkInventory.db.global.player.data[player_id].control[k] = v
					end,
				},
				anchor = {
					order = 4,
					name = ArkInventory.Localise["GENERIC_ANCHOR"],
					desc = string.format( ArkInventory.Localise["GENERIC_ANCHOR_TEXT1"], loc_data.Name ),
					type = "select",
					values = function( )
						return anchorpoints
					end,
					get = function( info )
						return ArkInventory.LocationOptionGet( k, { "anchor", k, "point" } )
					end,
					set = function( info, v )
						if ArkInventory.LocationOptionGet( k, { "anchor", k, "point" } ) ~= v then
							ArkInventory.LocationOptionSet( k, { "anchor", k, "point" }, v )
							ArkInventory.Frame_Main_Anchor_Set( k )
						end
					end,
				},
				locked = {
					order = 5,
					type = "toggle",
					name = ArkInventory.Localise["GENERIC_LOCK"],
					desc = string.format( ArkInventory.Localise["MOD_MENU_MAIN_WINDOW_ANCHOR_LOCK_TEXT"], loc_data.Name ),
					get = function( info )
						return ArkInventory.LocationOptionGet( k, { "anchor", k, "locked" } )
					end,
					set = function( info, v )
						ArkInventory.LocationOptionSet( k, { "anchor", k, "locked" }, v )
						ArkInventory.Frame_Main_Anchor_Set( k )
					end,
				},
				settings = {
					order = 6,
					type = "select",
					name = ArkInventory.Localise["OPT_ASSIGN_SETTINGS"],
					desc = string.format( ArkInventory.Localise["OPT_ASSIGN_SETTINGS_TEXT"], loc_data.Name ),
					values = function( )
						local t = { }
						for k2, d2 in ipairs( ArkInventory.Global.Location ) do
							if ArkInventory.Global.Location[k2].canView then
								t[k2] = d2.Name
							end
						end
						return t
					end,
					get = function( info )
						return ArkInventory.db.profile.option.use[k]
					end,
					set = function( info, v )
						ArkInventory.db.profile.option.use[k] = v
						ArkInventory.InitOptionsSettings( )
						ArkInventory.Frame_Main_Generate( k, ArkInventory.Const.Window.Draw.Init )
					end,
				},
			},
		}
	end
	
	ArkInventory.InitOptionsSettings( )

--[[
	path = basepath.args.system.args
	for k, v in pairs( ArkInventory.Const.Actions ) do

		path[ArkInventory.SanitiseOptionName( v.Name )] = {
			order = k,
			type = "execute",
			name = v.Name,
			func = v.Scripts.OnClick,
		}
		
	end
]]--
	
	-- slash commands
	basepath.args.config = {
		guiHidden = true,
		order = 1000,
		name = ArkInventory.Localise["OPT_CONFIG"],
		desc = ArkInventory.Localise["OPT_CONFIG_TEXT"],
		type = "execute",
		func = function( )
			ArkInventory.Lib.Dialog:Open( ArkInventory.Const.Frame.Options.Internal )
		end,
	}
	
	basepath.args.restack = {
		guiHidden = true,
		order = 1000,
		type = "execute",
		name = ArkInventory.Localise["RESTACK"],
		desc = ArkInventory.Localise["RESTACK_TEXT"],
		func = function( )
			ArkInventory.Restack()
		end,
	}

	basepath.args.cache = {
		guiHidden = true,
		order = 1000,
		name = ArkInventory.Localise["SLASH_CACHE"],
		desc = ArkInventory.Localise["SLASH_CACHE_TEXT"],
		type = "group",
		args = {
			erase = {
				name = ArkInventory.Localise["SLASH_CACHE_ERASE"],
				desc = ArkInventory.Localise["SLASH_CACHE_ERASE_TEXT"],
				type = "group",
				args = {
					confirm = {
						name = ArkInventory.Localise["SLASH_CACHE_ERASE_CONFIRM"],
						desc = ArkInventory.Localise["SLASH_CACHE_ERASE_CONFIRM_TEXT"],
						type = "execute",
						func = function( )
							ArkInventory.EraseSavedData( )
						end,
					},
				},
			},
		},
	}

	basepath.args.db = {
		guiHidden = true,
		order = 1000,
		name = ArkInventory.Localise["SLASH_DB"],
		desc = ArkInventory.Localise["SLASH_DB_TEXT"],
		type = "group",
		args = {
			reset = {
				name = ArkInventory.Localise["SLASH_DB_RESET"],
				desc = ArkInventory.Localise["SLASH_DB_RESET_TEXT"],
				type = "group",
				args = {
					confirm = {
						name = ArkInventory.Localise["SLASH_DB_RESET_CONFIRM"],
						desc = ArkInventory.Localise["SLASH_DB_RESET_CONFIRM_TEXT"],
						type = "execute",
						func = function( )
							ArkInventory.DatabaseReset( )
						end,
					},
				},
			},
		},
	}

end
 
function ArkInventory.InitOptionsSettings( )
	
	local anchorpoints = {
		[ArkInventory.Const.Anchor.TopRight] = ArkInventory.Localise["GENERIC_TOPRIGHT"],
		[ArkInventory.Const.Anchor.BottomRight] = ArkInventory.Localise["GENERIC_BOTTOMRIGHT"],
		[ArkInventory.Const.Anchor.BottomLeft] = ArkInventory.Localise["GENERIC_BOTTOMLEFT"],
		[ArkInventory.Const.Anchor.TopLeft] = ArkInventory.Localise["GENERIC_TOPLEFT"],
	}
	local borderDefault = "Tooltip"
	local borderCustom = "Custom"
	
	
	path = basepath.args.settings.args
	
	for loc_id, loc_data in pairs( ArkInventory.Global.Location ) do
		
		if loc_data.canView then
			
			local t = {
				
				window = {
					order = 1,
					name = ArkInventory.Localise["MOD_MENU_MAIN_WINDOW"],
					type = "group",
					args = {
						hidden = {
							order = 10,
							name = ArkInventory.Localise["MOD_MENU_MAIN_HIDDEN"],
							type = "group",
							inline = true,
							args = {
								title = {
									order = 1,
									type = "toggle",
									name = ArkInventory.Localise["MOD_MENU_MAIN_HIDDEN_TITLE"],
									get = function( info )
										return ArkInventory.LocationOptionGet( loc_id, { "framehide", "header" } )
									end,
									set = function( info, v )
										ArkInventory.LocationOptionSet( loc_id, { "framehide", "header" }, v )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Init )
									end,
								},
								search = {
									order = 2,
									type = "toggle",
									name = ArkInventory.Localise["MOD_MENU_MAIN_HIDDEN_SEARCH"],
									desc = string.format( ArkInventory.Localise["MOD_MENU_MAIN_HIDDEN_SEARCH_TEXT"], loc_data.Name ),
									disabled = function( )
										return not ArkInventory.Global.Location[loc_id].canSearch
									end,
									get = function( info )
										return ArkInventory.LocationOptionGet( loc_id, { "framehide", "search" } )
									end,
									set = function( info, v )
										ArkInventory.Global.Location[loc_id].filter = nil
										ArkInventory.LocationOptionSet( loc_id, { "framehide", "search" }, v )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Init )
									end,
								},								
								changer = {
									order = 3,
									type = "toggle",
									name = ArkInventory.Localise["MOD_MENU_MAIN_HIDDEN_CHANGER"],
									disabled = function( )
										return not ArkInventory.Global.Location[loc_id].hasChanger
									end,
									get = function( info )
										return ArkInventory.LocationOptionGet( loc_id, { "framehide", "changer" } )
									end,
									set = function( info, v )
										ArkInventory.LocationOptionSet( loc_id, { "framehide", "changer" }, v )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Init )
									end,
								},
								status = {
									order = 4,
									type = "toggle",
									name = ArkInventory.Localise["MOD_MENU_MAIN_HIDDEN_STATUS"],
									get = function( info )
										return ArkInventory.LocationOptionGet( loc_id, { "framehide", "status" } )
									end,
									set = function( info, v )
										ArkInventory.LocationOptionSet( loc_id, { "framehide", "status" }, v )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Init )
									end,
								},
							},
						},
						scale = {
							order = 30,
							name = ArkInventory.Localise["GENERIC_SCALE"],
							desc = ArkInventory.Localise["MOD_MENU_MAIN_WINDOW_SCALE_TEXT"],
							type = "range",
							min = 0.4,
							max = 2,
							step = 0.05,
							isPercent = true,
							get = function( info )
								return ArkInventory.LocationOptionGet( loc_id, { "window", "scale" } )
							end,
							set = function( info, v )
								if ArkInventory.LocationOptionGet( loc_id, { "window", "scale" } ) ~= v then
									ArkInventory.LocationOptionSet( loc_id, { "window", "scale" }, v )
									ArkInventory.Frame_Main_Scale_All( )
								end
							end,
						},
						padding = {
							order = 40,
							name = ArkInventory.Localise["GENERIC_PADDING"],
							desc = ArkInventory.Localise["MOD_MENU_MAIN_WINDOW_PADDING_TEXT"],
							type = "range",
							min = 4,
							max = 32,
							step = 1,
							get = function( info )
								return ArkInventory.LocationOptionGet( loc_id, { "window", "pad" } )
							end,
							set = function( info, v )
								if v ~= ArkInventory.LocationOptionGet( loc_id, { "window", "pad" } ) then
									ArkInventory.LocationOptionSet( loc_id, { "window", "pad" }, v )
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
								end
							end,
						},
						width = {
							order = 50,
							name = ArkInventory.Localise["GENERIC_WIDTH"],
							desc = ArkInventory.Localise["MOD_MENU_MAIN_WINDOW_WIDTH_TEXT"],
							type = "range",
							min = 6,
							max = 40,
							step = 1,
							get = function( info )
								return ArkInventory.LocationOptionGet( loc_id, { "window", "width" } )
							end,
							set = function( info, v )
								if v ~= ArkInventory.LocationOptionGet( loc_id, { "window", "width" } ) then
									ArkInventory.LocationOptionSet( loc_id, { "window", "width" }, v )
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
								end
							end,
						},
						bgcolor = {
							order = 60,
							name = ArkInventory.Localise["GENERIC_BACKGROUND_COLOUR"],
							desc = ArkInventory.Localise["MOD_MENU_MAIN_WINDOW_BACKGROUND_COLOR_TEXT"],
							type = "color",
							hasAlpha = true,
							get = function( info )
								local r = ArkInventory.LocationOptionGet( loc_id, { "window", "colour", "background", "r" } )
								local g = ArkInventory.LocationOptionGet( loc_id, { "window", "colour", "background", "g" } )
								local b = ArkInventory.LocationOptionGet( loc_id, { "window", "colour", "background", "b" } )
								local a = ArkInventory.LocationOptionGet( loc_id, { "window", "colour", "background", "a" } )
								return r, g, b, a
							end,
							set = function( info, r, g, b, a )
								ArkInventory.LocationOptionSet( loc_id, { "window", "colour", "background", "r" }, r )
								ArkInventory.LocationOptionSet( loc_id, { "window", "colour", "background", "g" }, g )
								ArkInventory.LocationOptionSet( loc_id, { "window", "colour", "background", "b" }, b )
								ArkInventory.LocationOptionSet( loc_id, { "window", "colour", "background", "a" }, a )
								ArkInventory.Frame_Main_Paint_All( )
							end,
						},
						bag_highlight = {
							order = 70,
							name = ArkInventory.Localise["MOD_MENU_MAIN_WINDOW_BAGHIGHLIGHT_COLOR"],
							desc = ArkInventory.Localise["MOD_MENU_MAIN_WINDOW_BAGHIGHLIGHT_COLOR_TEXT"],
							type = "color",
							hasAlpha = false,
							get = function( info )
								local r = ArkInventory.LocationOptionGet( loc_id, { "window", "colour", "baghighlight", "r" } )
								local g = ArkInventory.LocationOptionGet( loc_id, { "window", "colour", "baghighlight", "g" } )
								local b = ArkInventory.LocationOptionGet( loc_id, { "window", "colour", "baghighlight", "b" } )
								return r, g, b
							end,
							set = function( info, r, g, b )
								ArkInventory.LocationOptionSet( loc_id, { "window", "colour", "baghighlight", "r" }, r )
								ArkInventory.LocationOptionSet( loc_id, { "window", "colour", "baghighlight", "g" }, g )
								ArkInventory.LocationOptionSet( loc_id, { "window", "colour", "baghighlight", "b" }, b )
								ArkInventory.Frame_Main_Paint_All( )
							end,
						},
						border = {
							order = 80,
							name = ArkInventory.Localise["GENERIC_BORDER"],
							type = "group",
							inline = true,
							args = {
								show = {
									order = 1,
									type = "toggle",
									name = ArkInventory.Localise["GENERIC_SHOW"],
									desc = ArkInventory.Localise["MOD_MENU_MAIN_WINDOW_BORDER_SHOW_TEXT"],
									get = function( info )
										return ArkInventory.LocationOptionGet( loc_id, { "window", "border", "show" } )
									end,
									set = function( info, v )
										ArkInventory.LocationOptionSet( loc_id, { "window", "border", "show" }, v )
										ArkInventory.Frame_Main_Paint_All( )
									end,
								},
								color = {
									order = 2,
									name = ArkInventory.Localise["GENERIC_COLOUR"],
									desc = ArkInventory.Localise["MOD_MENU_MAIN_WINDOW_BORDER_COLOR_TEXT"],
									type = "color",
									disabled = function( )
										return not ArkInventory.LocationOptionGet( loc_id, { "window", "border", "show" } )
									end,
									hasAlpha = false,
									get = function( info )
										local r = ArkInventory.LocationOptionGet( loc_id, { "window", "colour", "border", "r" } )
										local g = ArkInventory.LocationOptionGet( loc_id, { "window", "colour", "border", "g" } )
										local b = ArkInventory.LocationOptionGet( loc_id, { "window", "colour", "border", "b" } )
										return r, g, b
									end,
									set = function( info, r, g, b )
										ArkInventory.LocationOptionSet( loc_id, { "window", "colour", "border", "r" }, r )
										ArkInventory.LocationOptionSet( loc_id, { "window", "colour", "border", "g" }, g )
										ArkInventory.LocationOptionSet( loc_id, { "window", "colour", "border", "b" }, b )
										ArkInventory.Frame_Main_Paint_All( )
									end,
								},
								style = {
									order = 3,
									name = ArkInventory.Localise["GENERIC_STYLE"],
									desc = ArkInventory.Localise["MOD_MENU_MAIN_WINDOW_BORDER_STYLE_TEXT"],
									type = "select",
									disabled = function( )
										return not ArkInventory.LocationOptionGet( loc_id, { "window", "border", "show" } )
									end,
									values = function( )
										local t = { }
										for k, v in pairs( ArkInventory.Const.Texture.Border ) do
											t[k] = k
										end
										return t
									end,
									get = function( info )
										return ArkInventory.LocationOptionGet( loc_id, { "window", "border", "style" } ) or borderDefault
									end,
									set = function( info, v )
										ArkInventory.LocationOptionSet( loc_id, { "window", "border", "style" }, v )
										ArkInventory.Frame_Main_Paint_All( )
									end,
								},
								file = {
									order = 11,
									name = ArkInventory.Localise["GENERIC_TEXTURE"],
									desc = "???",
									type = "input",
									disabled = function( )
										return not ArkInventory.LocationOptionGet( loc_id, { "window", "border", "show" } )
									end,
									hidden = function( )
										return ArkInventory.LocationOptionGet( loc_id, { "window", "border", "style" } ) ~= borderCustom
									end,
									get = function( info )
										local border = ArkInventory.LocationOptionGet( loc_id, { "window", "border", "style" } )
										return ArkInventory.LocationOptionGet( loc_id, { "window", "border", "file" } ) or ArkInventory.Const.Texture.Border[borderDefault].file
									end,
									set = function( info, v )
										ArkInventory.LocationOptionSet( loc_id, { "window", "border", "file" }, v )
										ArkInventory.Frame_Main_Paint_All( )
									end,
								},
								size = {
									order = 12,
									name = ArkInventory.Localise["GENERIC_HEIGHT"],
									desc = "???",
									type = "input",
									disabled = function( )
										return not ArkInventory.LocationOptionGet( loc_id, { "window", "border", "show" } )
									end,
									hidden = function( )
										return ArkInventory.LocationOptionGet( loc_id, { "window", "border", "style" } ) ~= borderCustom
									end,
									get = function( info )
										return string.format( "%i", ArkInventory.LocationOptionGet( loc_id, { "window", "border", "size" } ) or ArkInventory.Const.Texture.Border[borderDefault].size )
									end,
									set = function( info, v )
										ArkInventory.LocationOptionSet( loc_id, { "window", "border", "size" }, tonumber( v ) )
										ArkInventory.Frame_Main_Paint_All( )
									end,
								},
								scale = {
									order = 14,
									name = ArkInventory.Localise["GENERIC_SCALE"],
									desc = ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_BORDER_SCALE_TEXT"],
									type = "range",
									disabled = function( )
										return not ArkInventory.LocationOptionGet( loc_id, { "window", "border", "show" } )
									end,
									hidden = function( )
										return ArkInventory.LocationOptionGet( loc_id, { "window", "border", "style" } ) ~= borderCustom
									end,
									min = 0.25,
									max = 4,
									step = 0.05,
									get = function( info )
										return ArkInventory.LocationOptionGet( loc_id, { "window", "border", "scale" } ) or 1
									end,
									set = function( info, v )
										if ArkInventory.LocationOptionGet( loc_id, { "window", "border", "scale" } ) ~= v then
											ArkInventory.LocationOptionSet( loc_id, { "window", "border", "scale" }, v )
											ArkInventory.Frame_Main_Paint_All( )
										end
									end,
								},
							},
						},
						empty = {
							order = 90,
							name = ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_SHOW"],
							type = "group",
							inline = true,
							args = {
								show = {
									order = 1,
									name = ArkInventory.Localise["GENERIC_SHOW"],
									desc = ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_SHOW_TEXT"],
									type = "toggle",
									get = function( info )
										return ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "show" } )
									end,
									set = function( info, v )
										ArkInventory.LocationOptionSet( loc_id, { "slot", "empty", "show" }, v )
										ArkInventory.ItemCategoryReload( nil, true )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								color = {
									order = 2,
									name = ArkInventory.Localise["GENERIC_COLOUR"],
									desc = ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_SHOW_COLOUR_TEXT"],
									type = "color",
									disabled = function( )
										return not ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "show" } )
									end,
									hasAlpha = false,
									get = function( info )
										local r = ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "colour", "r" } )
										local g = ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "colour", "g" } )
										local b = ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "colour", "b" } )
										return r, g, b, a
									end,
									set = function( info, r, g, b, a )
										ArkInventory.LocationOptionSet( loc_id, { "slot", "empty", "colour", "r" }, r )
										ArkInventory.LocationOptionSet( loc_id, { "slot", "empty", "colour", "g" }, g )
										ArkInventory.LocationOptionSet( loc_id, { "slot", "empty", "colour", "b" }, b )
										
										ArkInventory.Frame_Changer_Update( ArkInventory.Const.Location.Bag )
										ArkInventory.Frame_Changer_Update( ArkInventory.Const.Location.Bank )
										ArkInventory.Frame_Changer_Update( ArkInventory.Const.Location.Vault )
									end,
								},
							},
						},
					},
				},
				
				bars = {
					order = 2,
					name = ArkInventory.Localise["MOD_MENU_MAIN_BARS"],
					type = "group",
					args = {
						anchor = {
							order = 10,
							name = ArkInventory.Localise["GENERIC_ANCHOR"],
							desc = string.format( ArkInventory.Localise["GENERIC_ANCHOR_TEXT2"], ArkInventory.Localise["MOD_MENU_MAIN_BARS"], "" ),
							type = "select",
							values = function( )
								return anchorpoints
							end,
							get = function( info )
								return ArkInventory.LocationOptionGet( loc_id, { "bar", "anchor" } )
							end,
							set = function( info, v )
								if ArkInventory.LocationOptionGet( loc_id, { "bar", "anchor" } ) ~= v then
									ArkInventory.LocationOptionSet( loc_id, { "bar", "anchor" }, v )
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
								end
							end,
						},
						per_bar = {
							order = 20,
							name = ArkInventory.Localise["MOD_MENU_MAIN_BARS_PER_ROW"],
							desc = ArkInventory.Localise["MOD_MENU_MAIN_BARS_PER_ROW_TEXT"],
							type = "range",
							min = 1,
							max = 16,
							step = 1,
							get = function( info )
								return ArkInventory.LocationOptionGet( loc_id, { "bar", "per" } )
							end,
							set = function( info, v )
								if ArkInventory.LocationOptionGet( loc_id, { "bar", "per" } ) ~= v then
									ArkInventory.LocationOptionSet( loc_id, { "bar", "per" }, v )
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
								end
							end,
						},
						bgcolor = {
							order = 30,
							name = ArkInventory.Localise["GENERIC_BACKGROUND_COLOUR"],
							desc = ArkInventory.Localise["MOD_MENU_MAIN_BARS_BACKGROUND_TEXT"],
							type = "color",
							hasAlpha = true,
							get = function( info )
								local r = ArkInventory.LocationOptionGet( loc_id, { "bar", "colour", "background", "r" } )
								local g = ArkInventory.LocationOptionGet( loc_id, { "bar", "colour", "background", "g" } )
								local b = ArkInventory.LocationOptionGet( loc_id, { "bar", "colour", "background", "b" } )
								local a = ArkInventory.LocationOptionGet( loc_id, { "bar", "colour", "background", "a" } )
								return r, g, b, a
							end,
							set = function( info, r, g, b, a )
								ArkInventory.LocationOptionSet( loc_id, { "bar", "colour", "background", "r" }, r )
								ArkInventory.LocationOptionSet( loc_id, { "bar", "colour", "background", "g" }, g )
								ArkInventory.LocationOptionSet( loc_id, { "bar", "colour", "background", "b" }, b )
								ArkInventory.LocationOptionSet( loc_id, { "bar", "colour", "background", "a" }, a )
								ArkInventory.Frame_Bar_Paint_All( )
							end,
						},
						compact = {
							order = 40,
							name = ArkInventory.Localise["MOD_MENU_MAIN_BARS_COMPACT"],
							desc = ArkInventory.Localise["MOD_MENU_MAIN_BARS_COMPACT_TEXT"],
							type = "toggle",
							get = function( info )
								return ArkInventory.LocationOptionGet( loc_id, { "bar", "compact" } )
							end,
							set = function( info, v )
								ArkInventory.LocationOptionSet( loc_id, { "bar", "compact" }, v )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end,
						},
						empty = {
							order = 50,
							name = ArkInventory.Localise["MOD_MENU_MAIN_BARS_SHOW_EMPTY"],
							desc = ArkInventory.Localise["MOD_MENU_MAIN_BARS_SHOW_EMPTY_TEXT"],
							type = "toggle",
							get = function( info )
								return ArkInventory.LocationOptionGet( loc_id, { "bar", "showempty" } )
							end,
							set = function( info, v )
								ArkInventory.LocationOptionSet( loc_id, { "bar", "showempty" }, v )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end,
						},
						padding = {
							order= 60,
							name = ArkInventory.Localise["GENERIC_PADDING"],
							type = "group",
							inline = true,
							args = {
								internal = {
									order = 1,
									name = ArkInventory.Localise["GENERIC_INTERNAL"],
									desc = ArkInventory.Localise["MOD_MENU_MAIN_BARS_PADDING_INTERNAL_TEXT"],
									type = "range",
									min = 4,
									max = 32,
									step = 1,
									get = function( info )
										return ArkInventory.LocationOptionGet( loc_id, { "bar", "pad", "internal" } )
									end,
									set = function( info, v )
										if ArkInventory.LocationOptionGet( loc_id, { "bar", "pad", "internal" } ) ~= v then
											ArkInventory.LocationOptionSet( loc_id, { "bar", "pad", "internal" }, v )
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
								external = {
									order = 2,
									name = ArkInventory.Localise["GENERIC_EXTERNAL"],
									desc = ArkInventory.Localise["MOD_MENU_MAIN_BARS_PADDING_EXTERNAL_TEXT"],
									type = "range",
									min = 0,
									max = 32,
									step = 1,
									get = function( info )
										return ArkInventory.LocationOptionGet( loc_id, { "bar", "pad", "external" } )
									end,
									set = function( info, v )
										if ArkInventory.LocationOptionGet( loc_id, { "bar", "pad", "external" } ) ~= v then
											ArkInventory.LocationOptionSet( loc_id, { "bar", "pad", "external" }, v )
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
							},
						},
						border = {
							order = 80,
							name = ArkInventory.Localise["GENERIC_BORDER"],
							type = "group",
							inline = true,
							args = {
								show = {
									order = 1,
									type = "toggle",
									name = ArkInventory.Localise["GENERIC_SHOW"],
									desc = ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_BORDER_SHOW_TEXT"],
									get = function( info )
										return ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "show" } )
									end,
									set = function( info, v )
										ArkInventory.LocationOptionSet( loc_id, { "bar", "border", "show" }, v )
										ArkInventory.Frame_Bar_Paint_All( )
									end,
								},
								color = {
									order = 2,
									name = ArkInventory.Localise["GENERIC_COLOUR"],
									desc = ArkInventory.Localise["MOD_MENU_MAIN_BARS_BORDER_COLOUR_TEXT"],
									type = "color",
									disabled = function( )
										return not ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "show" } )
									end,
									hasAlpha = false,
									get = function( info )
										local r = ArkInventory.LocationOptionGet( loc_id, { "bar", "colour", "border", "r" } )
										local g = ArkInventory.LocationOptionGet( loc_id, { "bar", "colour", "border", "g" } )
										local b = ArkInventory.LocationOptionGet( loc_id, { "bar", "colour", "border", "b" } )
										return r, g, b
									end,
									set = function( info, r, g, b )
										ArkInventory.LocationOptionSet( loc_id, { "bar", "colour", "border", "r" }, r )
										ArkInventory.LocationOptionSet( loc_id, { "bar", "colour", "border", "g" }, g )
										ArkInventory.LocationOptionSet( loc_id, { "bar", "colour", "border", "b" }, b )
										ArkInventory.Frame_Bar_Paint_All( )
									end,
								},
								style = {
									order = 3,
									name = ArkInventory.Localise["GENERIC_STYLE"],
									desc = ArkInventory.Localise["MOD_MENU_MAIN_BARS_BORDER_STYLE_TEXT"],
									type = "select",
									disabled = function( )
										return not ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "show" } )
									end,
									values = function( )
										local t = { }
										for k, v in pairs( ArkInventory.Const.Texture.Border ) do
											t[k] = k
										end
										return t
									end,
									get = function( info )
										return ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "style" } ) or borderDefault
									end,
									set = function( info, v )
										ArkInventory.LocationOptionSet( loc_id, { "bar", "border", "style" }, v )
										ArkInventory.Frame_Bar_Paint_All( )
									end,
								},
								file = {
									order = 4,
									name = ArkInventory.Localise["GENERIC_TEXTURE"],
									type = "input",
									disabled = function( )
										return not ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "show" } )
									end,
									hidden = function( )
										return ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "style" } ) ~= borderCustom
									end,
									get = function( info )
										return ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "file" } ) or ArkInventory.Const.Texture.Border[borderDefault].file
									end,
									set = function( info, v )
										ArkInventory.LocationOptionSet( loc_id, { "bar", "border", "file" }, v )
										ArkInventory.Frame_Bar_Paint_All( )
									end,
								},
								size = {
									order = 5,
									name = ArkInventory.Localise["GENERIC_HEIGHT"],
									type = "input",
									disabled = function( )
										return not ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "show" } )
									end,
									hidden = function( )
										return ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "style" } ) ~= borderCustom
									end,
									get = function( info )
										return string.format( "%i", ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "size" } ) or ArkInventory.Const.Texture.Border[borderDefault].size )
									end,
									set = function( info, v )
										ArkInventory.LocationOptionSet( loc_id, { "bar", "border", "size" }, tonumber( v ) )
										ArkInventory.Frame_Bar_Paint_All( )
									end,
								},
								scale = {
									order = 7,
									name = ArkInventory.Localise["GENERIC_SCALE"],
									type = "range",
									disabled = function( )
										return not ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "show" } )
									end,
									hidden = function( )
										return ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "style" } ) ~= borderCustom
									end,
									min = 0.25,
									max = 4,
									step = 0.05,
									get = function( info )
										return ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "scale" } ) or 1
									end,
									set = function( info, v )
										if ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "scale" } ) ~= v then
											ArkInventory.LocationOptionSet( loc_id, { "bar", "border", "scale" }, v )
											ArkInventory.Frame_Bar_Paint_All( )
										end
									end,
								},
							},
						},
						name = {
							order = 90,
							name = ArkInventory.Localise["MOD_MENU_MAIN_BARS_NAME"],
							type = "group",
							inline = true,
							args = {
								show = {
									order = 1,
									type = "toggle",
									name = ArkInventory.Localise["GENERIC_SHOW"],
									desc = ArkInventory.Localise["MOD_MENU_MAIN_BARS_NAME_SHOW_TEXT"],
									get = function( info )
										return ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "show" } )
									end,
									set = function( info, v )
										ArkInventory.LocationOptionSet( loc_id, { "bar", "name", "show" }, v )
										ArkInventory.Frame_Bar_Paint_All( )
									end,
								},
								color = {
									order = 2,
									name = ArkInventory.Localise["GENERIC_COLOUR"],
									desc = ArkInventory.Localise["MOD_MENU_MAIN_BARS_NAME_COLOUR_TEXT"],
									type = "color",
									disabled = function( )
										return not ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "show" } )
									end,
									hasAlpha = false,
									get = function( info )
										local r = ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "colour", "r" } )
										local g = ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "colour", "g" } )
										local b = ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "colour", "b" } )
										return r, g, b
									end,
									set = function( info, r, g, b )
										ArkInventory.LocationOptionSet( loc_id, { "bar", "name", "colour", "r" }, r )
										ArkInventory.LocationOptionSet( loc_id, { "bar", "name", "colour", "g" }, g )
										ArkInventory.LocationOptionSet( loc_id, { "bar", "name", "colour", "b" }, b )
										ArkInventory.Frame_Bar_Paint_All( )
									end,
								},
							},
						},
					},
				},
				
				items = {
					order = 3,
					name = ArkInventory.Localise["MOD_MENU_MAIN_ITEMS"],
					type = "group",
					args = {
						anchor = {
							order = 10,
							name = ArkInventory.Localise["GENERIC_ANCHOR"],
							desc = string.format( ArkInventory.Localise["GENERIC_ANCHOR_TEXT2"], ArkInventory.Localise["MOD_MENU_MAIN_ITEMS"], "" ),
							type = "select",
							values = function( )
								return anchorpoints
							end,
							get = function( info )
								return ArkInventory.LocationOptionGet( loc_id, { "bar", "anchor" } )
							end,
							set = function( info, v )
								if ArkInventory.LocationOptionGet( loc_id, { "bar", "anchor" } ) ~= v then
									ArkInventory.LocationOptionSet( loc_id, { "bar", "anchor" }, v )
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
								end
							end,
						},
						padding = {
							order = 20,
							name = ArkInventory.Localise["GENERIC_PADDING"],
							desc = ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_PADDING_TEXT"],
							type = "range",
							min = 1,
							max = 16,
							step = 1,
							get = function( info )
								return ArkInventory.LocationOptionGet( loc_id, { "slot", "pad" } )
							end,
							set = function( info, v )
								if ArkInventory.LocationOptionGet( loc_id, { "slot", "pad" } ) ~= v then
									ArkInventory.LocationOptionSet( loc_id, { "slot", "pad" }, v )
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
								end
							end,
						},
						hidden = {
							order = 30,
							name = ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_HIDDEN"],
							desc = ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_HIDDEN_TEXT"],
							type = "toggle",
							get = function( info )
								return ArkInventory.LocationOptionGet( loc_id, { "slot", "ignorehidden" } )
							end,
							set = function( info, v )
								ArkInventory.LocationOptionSet( loc_id, { "slot", "ignorehidden" }, v )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end,
						},
						fade = {
							order = 40,
							name = ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_FADE"],
							desc = ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_FADE_TEXT"],
							type = "toggle",
							get = function( info )
								return ArkInventory.LocationOptionGet( loc_id, { "slot", "offline", "fade" } )
							end,
							set = function( info, v )
								ArkInventory.LocationOptionSet( loc_id, { "slot", "offline", "fade" }, v )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
							end,
						},
						tint = {
							order = 50,
							name = ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_TINT_USABLE"],
							desc = ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_TINT_USABLE_TEXT"],
							type = "toggle",
							get = function( info )
								return ArkInventory.LocationOptionGet( loc_id, { "slot", "unusable", "tint" } )
							end,
							set = function( info, v )
								ArkInventory.LocationOptionSet( loc_id, { "slot", "unusable", "tint" }, v )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
							end,
						},
						border = {
							order = 60,
							name = ArkInventory.Localise["GENERIC_BORDER"],
							type = "group",
							inline = true,
							args = {
								show = {
									order = 1,
									name = ArkInventory.Localise["GENERIC_SHOW"],
									desc = ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_BORDER_SHOW_TEXT"],
									type = "toggle",
									get = function( info )
										return ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "show" } )
									end,
									set = function( info, v )
										ArkInventory.LocationOptionSet( loc_id, { "slot", "border", "show" }, v )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								rarity = {
									order = 2,
									name = ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_BORDER_RARITY"],
									desc = ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_BORDER_RARITY_TEXT"],
									type = "toggle",
									disabled = function( )
										return not ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "show" } )
									end,
									get = function( info )
										return ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "rarity" } )
									end,
									set = function( info, v )
										ArkInventory.LocationOptionSet( loc_id, { "slot", "border", "rarity" }, v )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								style = {
									order = 3,
									name = ArkInventory.Localise["GENERIC_STYLE"],
									desc = ArkInventory.Localise["MOD_MENU_MAIN_ITEMS_BORDER_STYLE_TEXT"],
									type = "select",
									disabled = function( )
										return not ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "show" } )
									end,
									values = function( )
										local t = { }
										for k, v in pairs( ArkInventory.Const.Texture.Border ) do
											t[k] = k
										end
										return t
									end,
									get = function( info )
										return ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "style" } ) or borderDefault
									end,
									set = function( info, v )
										ArkInventory.LocationOptionSet( loc_id, { "slot", "border", "style" }, v )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								file = {
									order = 4,
									name = ArkInventory.Localise["GENERIC_TEXTURE"],
									type = "input",
									disabled = function( )
										return not ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "show" } )
									end,
									hidden = function( )
										return ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "style" } ) ~= borderCustom
									end,
									get = function( info )
										return ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "file" } ) or ArkInventory.Const.Texture.Border[borderDefault].file
									end,
									set = function( info, v )
										ArkInventory.LocationOptionSet( loc_id, { "slot", "border", "file" }, v )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								size = {
									order = 5,
									name = ArkInventory.Localise["GENERIC_HEIGHT"],
									type = "input",
									disabled = function( )
										return not ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "show" } )
									end,
									hidden = function( )
										return ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "style" } ) ~= borderCustom
									end,
									get = function( info )
										return string.format( "%i", ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "size" } ) or ArkInventory.Const.Texture.Border[borderDefault].size )
									end,
									set = function( info, v )
										ArkInventory.LocationOptionSet( loc_id, { "slot", "border", "size" }, tonumber( v ) )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								offset = {
									order = 6,
									name = "offset",
									type = "input",
									disabled = function( )
										return not ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "show" } )
									end,
									hidden = function( )
										return ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "style" } ) ~= borderCustom
									end,
									get = function( info )
										return string.format( "%i", ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "offset" } ) or ArkInventory.Const.Texture.Border[borderDefault].offset  )
									end,
									set = function( info, v )
										ArkInventory.LocationOptionSet( loc_id, { "slot", "border", "offset" }, tonumber( v ) )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								scale = {
									order = 7,
									name = ArkInventory.Localise["GENERIC_SCALE"],
									type = "range",
									disabled = function( )
										return not ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "show" } )
									end,
									hidden = function( )
										return ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "style" } ) ~= borderCustom
									end,
									min = 0.25,
									max = 4,
									step = 0.05,
									get = function( info )
										return ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "scale" } ) or 1
									end,
									set = function( info, v )
										if ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "scale" } ) ~= v then
											ArkInventory.LocationOptionSet( loc_id, { "slot", "border", "scale" }, v )
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
										end
									end,
								},
							},
						},
					},
				},
				
				sorting = {
					order = 4,
					name = ArkInventory.Localise["MOD_MENU_MAIN_SORTING"],
					type = "group",
					args = {
						open = {
							order = 1,
							name = ArkInventory.Localise["MOD_MENU_MAIN_SORTING_OPEN"],
							desc = ArkInventory.Localise["MOD_MENU_MAIN_SORTING_OPEN_TEXT"],
							type = "toggle",
							get = function( info )
								return ArkInventory.LocationOptionGet( loc_id, { "sort", "open" } )
							end,
							set = function( info, v )
								ArkInventory.LocationOptionSet( loc_id, { "sort", "open" }, v )
							end,
						},
						instant = {
							order = 2,
							name = ArkInventory.Localise["MOD_MENU_MAIN_SORTING_INSTANT"],
							desc = ArkInventory.Localise["MOD_MENU_MAIN_SORTING_INSTANT_TEXT"],
							type = "toggle",
							get = function( info )
								return ArkInventory.LocationOptionGet( loc_id, { "sort", "instant" } )
							end,
							set = function( info, v )
								ArkInventory.LocationOptionSet( loc_id, { "sort", "instant" }, v )
							end,
						},
						style = {
							order = 3,
							name = ArkInventory.Localise["GENERIC_STYLE"],
							type = "select",
							values = function( )
								local t = { }
									t[1] = ArkInventory.Localise["MOD_MENU_MAIN_SORTING_BAGSLOT"]
									t[2] = ArkInventory.Localise["MOD_MENU_MAIN_SORTING_USER"]
								return t
							end,
							get = function( info )
								local v = ArkInventory.LocationOptionGet( loc_id, { "sort", "bagslot" } )
								if v then
									v = 1
								else
									v = 2
								end
								return v
							end,
							set = function( info, v )
								local v = v
								if v == 1 then
									v = true
								else
									v = false
								end
								ArkInventory.LocationOptionSet( loc_id, { "sort", "bagslot" }, v )
								ArkInventory.LocationSetValue( nil, "resort", true )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
							end,
						},
						order = {
							order = 4,
							name = ArkInventory.Localise["MOD_MENU_MAIN_SORTING_ORDER"],
							type = "group",
							inline = true,
							hidden = function( )
								return ArkInventory.LocationOptionGet( loc_id, { "sort", "bagslot" } )
							end,
							args = { },
						},
					},
				},
				
				empty = {
					order = 5,
					name = ArkInventory.Localise["MOD_MENU_MAIN_EMPTY"],
					type = "group",
					args = {
						icon = {
							order = 10,
							name = ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_ICON"],
							desc = ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_ICON_TEXT"],
							type = "toggle",
							get = function( info )
								return ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "icon" } )
							end,
							set = function( info, v )
								ArkInventory.LocationOptionSet( loc_id, { "slot", "empty", "icon" }, v )
								ArkInventory.Frame_Item_Empty_Paint_All( )
							end,
						},
						clump = {
							order = 20,
							name = ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_CLUMP"],
							desc = ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_CLUMP_TEXT"],
							type = "toggle",
							get = function( info )
								return ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "clump" } )
							end,
							set = function( info, v )
								ArkInventory.LocationOptionSet( loc_id, { "slot", "empty", "clump" }, v )
								ArkInventory.ItemCacheClear()
								ArkInventory.ItemCategoryReload( nil, true )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end,
						},
						border = {
							order = 30,
							name = ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_BORDER"],
							desc = ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_BORDER_TEXT"],
							type = "toggle",
							get = function( info )
								return ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "border" } )
							end,
							set = function( info, v )
								ArkInventory.LocationOptionSet( loc_id, { "slot", "empty", "border" }, v )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
							end,
						},
						color = {
							order = 40,
							name = ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_COLOUR"],
							desc = ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_COLOUR_TEXT"],
							type = "group",
							inline = true,
							args = { },
						},
					},
				},
				
			}
			
			ArkInventory.InitOptionsEmptySlotColours( t.empty.args.color.args, loc_id )
			ArkInventory.InitOptionsSorting( t.sorting.args.order.args, loc_id )
			
			path[loc_data.Internal] = {
				order = k,
				type = "group",
				name = loc_data.Name,
				args = t,
			}
			
		end
		
	end
	
 end
 
 function ArkInventory.InitOptionsEmptySlotColours( t, loc_id )
	
	for k, v in pairs( ArkInventory.Const.Slot.Data ) do
		if not v.hide then
			local key = string.format( "border%i", k )
			t[key] = {
				order = 300,
				name = v.long,
				desc = function( )
					return string.format( ArkInventory.Localise["MOD_MENU_MAIN_EMPTY_COLOUR_TEXT2"], v.long )
				end,
				type = "color",
				hasAlpha = false,
				get = function( info )
					local r = ArkInventory.LocationOptionGet( loc_id, { "slot", "data", k, "colour", "r" } )
					local g = ArkInventory.LocationOptionGet( loc_id, { "slot", "data", k, "colour", "g" } )
					local b = ArkInventory.LocationOptionGet( loc_id, { "slot", "data", k, "colour", "b" } )
					return r, g, b
				end,
				set = function( info, r, g, b )
					ArkInventory.LocationOptionSet( loc_id, { "slot", "data", k, "colour", "r" }, r )
					ArkInventory.LocationOptionSet( loc_id, { "slot", "data", k, "colour", "g" }, g )
					ArkInventory.LocationOptionSet( loc_id, { "slot", "data", k, "colour", "b" }, b )
					ArkInventory.Frame_Item_Empty_Paint_All( )
				end,
			}
		end
	end
	
end

function ArkInventory.InitOptionsSorting( t, loc_id )

	local s = ArkInventory.LocationOptionGet( loc_id, { "sortorder" } )

	for k, sv in pairs( s ) do
		if ArkInventory.Const.SortKeys[sv] then
			
			local key = string.format( "order%i", k )
			t[key] = {
				order = k,
				name = function( )
					local checked = ArkInventory.LocationOptionGet( loc_id, { "sort", sv } )
					local n = ArkInventory.Localise["MOD_MENU_MAIN_SORTING_INCLUDE_" .. string.upper( sv )]
					if checked then
						n = GREEN_FONT_COLOR_CODE .. n .. FONT_COLOR_CODE_CLOSE
					else
						n = RED_FONT_COLOR_CODE .. n .. FONT_COLOR_CODE_CLOSE
					end
					return ""
				end,
				type = "group",
				inline = true,
				args = {
					enabled = {
						order = 1,
						name = function( )
							local checked = ArkInventory.LocationOptionGet( loc_id, { "sort", sv } )
							local n = ArkInventory.Localise["MOD_MENU_MAIN_SORTING_INCLUDE_" .. string.upper( sv )]
							if checked then
								n = GREEN_FONT_COLOR_CODE .. n .. FONT_COLOR_CODE_CLOSE
							else
								n = RED_FONT_COLOR_CODE .. n .. FONT_COLOR_CODE_CLOSE
							end
							return n
							--ArkInventory.Localise["GENERIC_ENABLED"],
						end,
						desc = function( )
							local checked = ArkInventory.LocationOptionGet( loc_id, { "sort", sv } )
							local n = ArkInventory.Localise["MOD_MENU_MAIN_SORTING_INCLUDE_" .. string.upper( sv ) .. "_TEXT"]
							if not checked then
								n = n .. "\n\n" .. RED_FONT_COLOR_CODE .. ArkInventory.Localise["MOD_MENU_MAIN_SORTING_NOT_INCLUDED"]
							end
							return n
						end,
						type = "toggle",
						get = function( info )
							return ArkInventory.LocationOptionGet( loc_id, { "sort", sv } )
						end,
						set = function( info, v )
							ArkInventory.LocationOptionSet( loc_id, { "sort", sv }, v )
							ArkInventory.LocationSetValue( nil, "resort", true )
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
						end,
					},
					up = {
						order = 2,
						name = ArkInventory.Localise["MOD_MENU_MAIN_SORTING_MOVE_UP"],
						desc = string.format( ArkInventory.Localise["MOD_MENU_MAIN_SORTING_MOVE_UP_TEXT"], LIGHTYELLOW_FONT_COLOR_CODE .. ArkInventory.Localise["MOD_MENU_MAIN_SORTING_INCLUDE_" .. string.upper( sv )] .. FONT_COLOR_CODE_CLOSE ),
						type = "execute",
						func = function( )
							ArkInventory.ItemSortKeyMoveUp( loc_id, sv )
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
							ArkInventory.InitOptionsSorting( t, loc_id )
						end,
					},
					down = {
						order = 3,
						name = ArkInventory.Localise["MOD_MENU_MAIN_SORTING_MOVE_DOWN"],
						desc = string.format( ArkInventory.Localise["MOD_MENU_MAIN_SORTING_MOVE_DOWN_TEXT"], LIGHTYELLOW_FONT_COLOR_CODE .. ArkInventory.Localise["MOD_MENU_MAIN_SORTING_INCLUDE_" .. string.upper( sv )] .. FONT_COLOR_CODE_CLOSE ),
						type = "execute",
						func = function( )
							ArkInventory.ItemSortKeyMoveDown( loc_id, sv )
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
							ArkInventory.InitOptionsSorting( t, loc_id )
						end,
					},
				},
			}
		end
	end

end

function ArkInventory.SanitiseOptionName( v )

	local v = v
	
	if ArkInventory.Localise:HasTranslation( v ) or ArkInventory.Localise:HasBaseTranslation( v ) then
		v = ArkInventory.Localise[v]
	end
	
	v = string.gsub( v, " ", "-" )
	
	return v
	
end


--[[
	SlashCommandOptions = {
		type = "group",
		args = {
	
			ui = {
				type = "group",
				name = ArkInventory.Localise["SLASH_UI"],
				desc = ArkInventory.Localise["SLASH_UI_TEXT"],
				args = {
					reset = {
						type = "execute",
						name = ArkInventory.Localise["SLASH_UI_RESET"],
						desc = ArkInventory.Localise["SLASH_UI_RESET_TEXT"],
						func = function()
							for loc_id in ipairs( ArkInventory.Global.Location ) do
								getfenv()[ArkInventory.Const.Frame.Main.Name .. loc_id]:SetPoint( "CENTER", UiParent, "CENTER" )
							end
							ArkInventory.Output( { GREEN_FONT_COLOR_CODE, ArkInventory.Localise["SLASH_UI_RESET_COMPLETE_TEXT"] } )
						end
					},
				},
			},
			
			

		},
	},

]]--

	