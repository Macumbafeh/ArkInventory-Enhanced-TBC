-- load required libraries for disembedded
LoadAddOn( "Ace3" )
LoadAddOn( "Ace2" )
LoadAddOn( "Dewdrop-2.0" )
LoadAddOn( "LibPeriodicTable-3.1" )
LoadAddOn( "LibSharedMedia-3.0" )

ArkInventory = LibStub( "AceAddon-3.0" ):NewAddon( "ArkInventory", "AceConsole-3.0", "AceHook-3.0", "AceEvent-3.0", "AceBucket-3.0" )

ArkInventory.Localise = AceLibrary( "AceLocale-2.2" ):new( "ArkInventory" )

ArkInventory.Lib = { -- libraries live here
	PeriodicTable = LibStub( "LibPeriodicTable-3.1" ),
	DewDrop = LibStub( "Dewdrop-2.0" ),
	SharedMedia = LibStub( "LibSharedMedia-3.0" ),
	Config = LibStub( "AceConfig-3.0" ),
	Dialog = LibStub( "AceConfigDialog-3.0" ),
}

ArkInventory.db = { }

ArkInventory.Table = { } -- table functions live here, coded elsewhere

ArkInventory.Const = { -- constants
	
	TOC = select( 4, GetBuildInfo( ) ) or 0,
	
	Program = {
		Name = "ArkInventory",
		Version = 3.0109,
		UIVersion = "3.01.09",
		--Beta = "2008-xx-xx-xx-xx-Beta",
	},

	Frame = {
		Main = {
			Name = "ARKINV_Frame",
		},
		Title = {
			Name = "Title",
			Height = 58,
		},
		Container = {
			Name = "Container",
		},
		Log = {
			Name = "Log",
		},
		Changer = {
			Name = "Changer",
			Height = 58,
		},
		Status = {
			Name = "Status",
			Height = 40,
		},
		Search = {
			Name = "Search",
			Height = 40,
		},
		Scrolling = {
			List = "List",
			ScrollBar = "ScrollBar",
		},
		Options = {
			Internal = "ArkInventory",
			Blizzard = "ArkInventoryConfigBlizzard",
		},
	},
	
	Debug = false,
	
	Profiler = false,

	Event = {
		BagUpdate = 1,
		--ObjectLock = 2,
		--PlayerMoney = 3,
		--GuildMoney = 4,
		--TabInfo = 5,
		--SkillUpdate = 6,
		--ItemUpdate = 7,
	},

	Location = {
		Bag = 1,
		Key = 2,
		Bank = 3,
		Vault = 4,
		Mail = 5,
		Wearing = 6,
	},

	Offset = {
		Vault = 1000,
		Mail = 2000,
		Wearing = 3000,
	},

	Bag = {
		Status = { -- these need to be negative values and do not use -1 (false)
			Unknown = -2,
			Active = -3,
			Empty = -4,
			Purchase = -5,
		},
	},

	Slot = {
	
		Type = { -- slot type numbers, do not change this order, just add new ones to the end of the list
			Unknown = 0,
			Bag = 1,
			Key = 3,
			Soulshard = 5,
			Herb = 6,
			Enchanting = 7,
			Engineering = 8,
			Gem = 9,
			Mining = 10,
			Bullet = 11,
			Arrow = 12,
			Leatherworking = 13,
			Wearing = 14,
			Mail = 15,
			Inscription = 16,
		},

		New = {
			No = false,
			Yes = 1,
			Inc = 2,
			Dec = 3,
		},
	
		DefaultColour = { r = 0.3, g = 0.3, b = 0.3 },
		
		Data = { },
		
	},

	Anchor = {
		BottomRight = 1,
		BottomLeft = 2,
		TopLeft = 3,
		TopRight = 4,
	},
	
	Direction = {
		Horizontal = 1,
		Vertical = 2,
	},
	
	Window = {
	
		Offset = 9, -- hardcoded padding size for gap inside container
		
		Min = {
			Rows = 1,
			Columns = 6,
			Width = 400,
			Height = 40,
		},
		
		Draw = {
			Init = 0, -- first time
			Recalculate = 1, -- calculate
			Resort = 1, -- sort
			Refresh = 3, -- item changes
			None = 4, -- nothing
		},

	},

	Font = {
		Face = [[Friz Quadrata TT]],
		Size = 12,
	},

	Fade = 0.6,
	GuildTag = "+",

	BAR_DEFAULT_COLOUR = { r = 0.0, g = 0.0, b = 0.4, a = 0.4 },

	InventorySlotName = { "HeadSlot", "NeckSlot", "ShoulderSlot", "BackSlot", "ChestSlot", "ShirtSlot", "TabardSlot", "WristSlot", "HandsSlot", "WaistSlot", "LegsSlot", "FeetSlot", "Finger0Slot", "Finger1Slot", "Trinket0Slot", "Trinket1Slot", "MainHandSlot", "SecondaryHandSlot", "RangedSlot" },

	Category = {
	
		Type = {
			System = 1,
			Custom = 2,
			Rule = 3,
		},
		
		Code = {
			System = { -- do NOT change the indicies - if you have to then see the ConvertOldOptions() function to remap it
				[401] = "CATEGORY_DEFAULT",
				[402] = "CATEGORY_TRASH",
				[403] = "CATEGORY_SOULBOUND",
				[405] = "CATEGORY_CONTAINER",
				[406] = "WOW_ITEM_TYPE_KEY",
				[407] = "WOW_ITEM_TYPE_MISC",
				[408] = "WOW_ITEM_TYPE_MISC_REAGENT",
				[409] = "WOW_ITEM_TYPE_RECIPE",
				[410] = "CATEGORY_PROJECTILE",
				[411] = "WOW_ITEM_TYPE_QUEST",
				[413] = "CATEGORY_SOULSHARD",
				[414] = "CATEGORY_EQUIPMENT",
				--[415] = "CATEGORY_MOUNT",
				[416] = "CATEGORY_EQUIPMENT_SOULBOUND",
				[421] = "CATEGORY_PROJECTILE_BULLET",
				[422] = "CATEGORY_PROJECTILE_ARROW",
				[423] = "WOW_ITEM_TYPE_MISC_PET",
				[428] = "CATEGORY_REPUTATION",
				[429] = "CATEGORY_UNKNOWN",
				[434] = "WOW_ITEM_TYPE_GEM",
			},
			Consumable = {
				[404] = "CATEGORY_CONSUMABLE",
				[417] = "CATEGORY_CONSUMABLE_FOOD",
				[418] = "CATEGORY_CONSUMABLE_DRINK",
				[419] = "CATEGORY_CONSUMABLE_POTION_MANA",
				[420] = "CATEGORY_CONSUMABLE_POTION_HEAL",
				[424] = "WOW_ITEM_TYPE_CONSUMABLE_POTION",
				[430] = "WOW_ITEM_TYPE_CONSUMABLE_ELIXIR",
				[431] = "WOW_ITEM_TYPE_CONSUMABLE_FLASK",
				[432] = "WOW_ITEM_TYPE_CONSUMABLE_BANDAGE",
				[433] = "WOW_ITEM_TYPE_CONSUMABLE_SCROLL",
				[435] = "CATEGORY_CONSUMABLE_ELIXIR_BATTLE",
				[436] = "CATEGORY_CONSUMABLE_ELIXIR_GUARDIAN",
				[437] = "WOW_ITEM_TYPE_CONSUMABLE_FOOD_AND_DRINK",
			},
			Trade = {
				[412] = "CATEGORY_TRADE_GOODS",
				[425] = "WOW_ITEM_TYPE_TRADE_GOODS_DEVICES",
				[426] = "WOW_ITEM_TYPE_TRADE_GOODS_EXPLOSIVES",
				[427] = "WOW_ITEM_TYPE_TRADE_GOODS_PARTS",
				[501] = "WOW_ITEM_TYPE_TRADE_GOODS_HERB",
				[502] = "WOW_ITEM_TYPE_TRADE_GOODS_CLOTH",
				[503] = "WOW_ITEM_TYPE_TRADE_GOODS_ELEMENTAL",
				[504] = "WOW_ITEM_TYPE_TRADE_GOODS_LEATHER",
				[505] = "WOW_ITEM_TYPE_TRADE_GOODS_MEAT",
				[506] = "WOW_ITEM_TYPE_TRADE_GOODS_METAL_AND_STONE",
				[507] = "WOW_ITEM_TYPE_TRADE_GOODS_MATERIALS",
				[508] = "WOW_ITEM_TYPE_TRADE_GOODS_ENCHANTMENT_ARMOR",
				[509] = "WOW_ITEM_TYPE_TRADE_GOODS_ENCHANTMENT_WEAPON",
			},
			Skill = { -- do NOT change the indicies
				[101] = "WOW_SKILL_ALCHEMY",
				[102] = "WOW_SKILL_BLACKSMITHING",
				[103] = "WOW_SKILL_COOKING",
				[104] = "WOW_SKILL_ENGINEERING",
				[105] = "WOW_SKILL_ENCHANTING",
				[106] = "WOW_SKILL_FIRST_AID",
				[107] = "WOW_SKILL_FISHING",
				[108] = "WOW_SKILL_HERBALISM",
				[109] = "WOW_SKILL_JEWELCRAFTING",
				[110] = "WOW_SKILL_LEATHERWORKING",
				[111] = "WOW_SKILL_MINING",
				[112] = "WOW_SKILL_SKINNING",
				[113] = "WOW_SKILL_TAILORING",
				[114] = "WOW_SKILL_RIDING",
				[115] = "WOW_SKILL_INSCRIPTION",
			},
			Class = { -- do NOT change the indicies
				[201] = "WOW_CLASS_DRUID",
				[202] = "WOW_CLASS_HUNTER",
				[203] = "WOW_CLASS_MAGE",
				[204] = "WOW_CLASS_PALADIN",
				[205] = "WOW_CLASS_PRIEST",
				[206] = "WOW_CLASS_ROGUE",
				[207] = "WOW_CLASS_SHAMAN",
				[208] = "WOW_CLASS_WARLOCK",
				[209] = "WOW_CLASS_WARRIOR",
				[210] = "WOW_CLASS_DEATHKNIGHT",
			},
			Empty = { -- do NOT change the indicies
				[312] = "CATEGORY_EMPTY_UNKNOWN",
				[301] = "CATEGORY_EMPTY",
				[302] = "CATEGORY_EMPTY_BAG",
				[303] = "CATEGORY_EMPTY_KEY",
				[304] = "CATEGORY_EMPTY_SOULSHARD",
				[305] = "CATEGORY_EMPTY_HERB",
				[306] = "CATEGORY_EMPTY_ENCHANTING",
				[307] = "CATEGORY_EMPTY_ENGINEERING",
				[308] = "CATEGORY_EMPTY_GEM",
				[309] = "CATEGORY_EMPTY_MINING",
				[312] = "CATEGORY_EMPTY_LEATHERWORKING",
				[310] = "CATEGORY_EMPTY_PROJECTILE_BULLET",
				[311] = "CATEGORY_EMPTY_PROJECTILE_ARROW",
			},
			Other = { -- do NOT change the indicies - if you have to then see the ConvertOldOptions() function to remap it
				[901] = "CATEGORY_CORE_MATS",
				[902] = "CATEGORY_CONSUMABLE_FOOD_PET",
			},
		},
		
	},
	
	Texture = {
		Missing = [[Interface\Icons\Temp]],
		Empty = {
			Item = [[Interface\PaperDoll\UI-Backpack-EmptySlot]], -- [[Interface\PaperDoll\UI-Backpack-EmptySlot]]
			Ammo = [[Interface\paperDoll\UI-PaperDoll-Slot-Ammo]], -- [[Interface\paperDoll\UI-PaperDoll-Slot-Ammo]]
			Bag = [[Interface\PaperDoll\UI-PaperDoll-Slot-Bag]], -- [[Interface\PaperDoll\UI-PaperDoll-Slot-Bag]]
		},
		Border = {
			["Tooltip"] = {
				["file"] = [[Interface\Tooltips\UI-Tooltip-Border]],
				["size"] = 16,
				["offset"] = 3,
			},
			["Dialog Box"] = {
				["file"] = [[Interface\DialogFrame\UI-DialogBox-Border]],
				["size"] = 32,
				["offset"] = 9,
			},
			["Solid"] = {
				["file"] = [[Interface\AddOns\ArkInventory\Images\BorderPlain2.tga]],
				["size"] = 8,
				["offset"] = 2,
			},
			["Minimap"] = {
				["file"] = [[Interface\Minimap\TooltipBackdrop]],
				["size"] = 16,
				["offset"] = 5,
			},
			["Custom"] = {
				["file"] = "",
				["size"] = 16,
				["offset"] = 0,
			},
		},
	},
	
	Actions = {
		[11] = {
			Texture = [[Interface\Icons\Trade_Engineering]],
			Name = ArkInventory.Localise["MOD_MENU_MAIN_EDITMODE"],
			Scripts = {
				OnClick = function()
					ArkInventory.ToggleEditMode()
				end,
				OnEnter = function()
					ArkInventory.GameTooltipSetText( this, ArkInventory.Localise["MOD_MENU_MAIN_EDITMODE"] )
				end,
			},
		},
		[12] = {
			Texture = [[Interface\Icons\INV_Misc_Book_10]], --Interface\Icons\INV_Gizmo_02    INV_Misc_Note_05
			Name = ArkInventory.Localise["MOD_MENU_MAIN_RULES"],
			Scripts = {
				OnClick = function()
					ArkInventory.Frame_Rules_Toggle()
				end,
				OnEnter = function()
					ArkInventory.GameTooltipSetText( this, ArkInventory.Localise["MOD_MENU_MAIN_RULES"] )
				end,
			},
		},
		[13] = {
			Texture = [[Interface\Minimap\Tracking\None]], --Interface\Icons\INV_Misc_EngGizmos_20
			Name = ArkInventory.Localise["MOD_MENU_MAIN_SEARCH"],
			Scripts = {
				OnClick = function()
					ArkInventory.Frame_Search_Toggle()
				end,
				OnEnter = function()
					ArkInventory.GameTooltipSetText( this, ArkInventory.Localise["MOD_MENU_MAIN_SEARCH"] )
				end,
			},
		},
		[14] = {
			Texture = [[Interface\Icons\INV_Misc_GroupLooking]],
			Name = ArkInventory.Localise["MOD_MENU_MAIN_SWITCH_CHARACTER"],
			Scripts = {
				OnClick = function()
					ArkInventory.MenuSwitchCharacterOpen( this:GetParent():GetParent() )
				end,
				OnEnter = function()
					ArkInventory.GameTooltipSetText( this, ArkInventory.Localise["MOD_MENU_MAIN_SWITCH_CHARACTER"] )
				end,
			},
		},
		[21] = {
			Texture = [[Interface\Icons\INV_Helmet_47]],
			Name = ArkInventory.Localise["MOD_MENU_MAIN_SWITCH_LOCATION"],
			Scripts = {
				OnClick = function()
					ArkInventory.MenuSwitchLocationOpen( )
				end,
				OnEnter = function()
					ArkInventory.GameTooltipSetText( this, ArkInventory.Localise["MOD_MENU_MAIN_SWITCH_LOCATION"] )
				end,
			},
		},
		[22] = {
			Texture = [[Interface\Icons\Spell_Shadow_DestructiveSoul]],
			Name = ArkInventory.Localise["RESTACK"],
			Scripts = {
				OnClick = function()
					ArkInventory.Restack()
				end,
				OnEnter = function()
					ArkInventory.GameTooltipSetText( this, ArkInventory.Localise["RESTACK"] )
				end,
			},
		},
		[23] = {
			Texture = [[Interface\Icons\INV_Misc_EngGizmos_17]],
			Name = ArkInventory.Localise["MOD_MENU_MAIN_BAGCHANGE"],
			Scripts = {
				OnClick = function()
					ArkInventory.ToggleChanger( this:GetParent():GetParent():GetID() )
				end,
				OnEnter = function()
					ArkInventory.GameTooltipSetText( this, ArkInventory.Localise["MOD_MENU_MAIN_BAGCHANGE"] )
				end,
			},
		},
		[24] = {
			Texture = [[Interface\Icons\Spell_Frost_Stun]],
			Name = ArkInventory.Localise["MOD_MENU_MAIN_REFRESH"],
			Scripts = {
				OnClick = function()
					ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
				end,
				OnEnter = function()
					ArkInventory.GameTooltipSetText( this, ArkInventory.Localise["MOD_MENU_MAIN_REFRESH"] )
				end,
			},
		},
	},
	
	SortKeys = {
		category = true,
		location = true,
		itemuselevel = true,
		itemstatlevel = true,
		itemtype = true,
		quality = true,
		name = true,
		vendorprice = false,
	},

	Skills = "ALCHEMY,BLACKSMITHING,ENCHANTING,ENGINEERING,JEWELCRAFTING,INSCRIPTION,LEATHERWORKING,TAILORING,HERBALISM,MINING,SKINNING,COOKING,FIRST_AID,FISHING,RIDING", -- primary build, primary collect, secondary
	
	--Classes = "DRUID,HUNTER,MAGE,PALADIN,PRIEST,ROGUE,SHAMAN,WARLOCK,WARRIOR,DEATHKNIGHT",
	
	DatabaseDefaults = {
		["profile"] = { },
		["global"] = { },
	},
	
}

ArkInventory.Const.Slot.Data = {
	[ArkInventory.Const.Slot.Type.Unknown] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_UNKNOWN"],
		["long"] = ArkInventory.Localise["CATEGORY_EMPTY_UNKNOWN"],
		["colour"] = { r = 1.0, g = 0.0, b = 0.0 }, -- red
	},
	[ArkInventory.Const.Slot.Type.Key] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_KEY"],
		["long"] = ArkInventory.Localise["CATEGORY_EMPTY_KEY"],
		["colour"] = { r = 1.0, g = 1.0, b = 0.0 }, -- yellow,
	},
	[ArkInventory.Const.Slot.Type.Bag] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_BAG"],
		["long"] = ArkInventory.Localise["CATEGORY_EMPTY_BAG"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_BAG"],
		["colour"] = ArkInventory.Const.Slot.DefaultColour,
	},
	[ArkInventory.Const.Slot.Type.Soulshard] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_SOULSHARD"],
		["long"] = ArkInventory.Localise["CATEGORY_EMPTY_SOULSHARD"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_SOULSHARD"],
		["colour"] = { r = 1.0, g = 0.0, b = 1.0 }, -- magenta
	},
	[ArkInventory.Const.Slot.Type.Herb] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_HERB"],
		["long"] = ArkInventory.Localise["CATEGORY_EMPTY_HERB"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_HERB"],
		["colour"] = { r = 0.0, g = 1.0, b = 0.0 }, -- green
	},
	[ArkInventory.Const.Slot.Type.Enchanting] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_ENCHANTING"],
		["long"] = ArkInventory.Localise["CATEGORY_EMPTY_ENCHANTING"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_ENCHANTING"],
		["colour"] = { r = 0.0, g = 0.0, b = 1.0 }, -- blue
	},
	[ArkInventory.Const.Slot.Type.Engineering] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_ENGINEERING"],
		["long"] = ArkInventory.Localise["CATEGORY_EMPTY_ENGINEERING"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_ENGINEERING"],
		["colour"] = ArkInventory.Const.Slot.DefaultColour,
	},
	[ArkInventory.Const.Slot.Type.Gem] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_GEM"],
		["long"] = ArkInventory.Localise["CATEGORY_EMPTY_GEM"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_GEM"],
		["colour"] = ArkInventory.Const.Slot.DefaultColour,
	},
	[ArkInventory.Const.Slot.Type.Mining] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_MINING"],
		["long"] = ArkInventory.Localise["CATEGORY_EMPTY_MINING"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_MINING"],
		["colour"] = ArkInventory.Const.Slot.DefaultColour,
	},
	[ArkInventory.Const.Slot.Type.Leatherworking] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_LEATHERWORKING"],
		["long"] = ArkInventory.Localise["CATEGORY_EMPTY_LEATHERWORKING"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_LEATHERWORKING"],
		["colour"] = ArkInventory.Const.Slot.DefaultColour,
	},
	[ArkInventory.Const.Slot.Type.Inscription] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_INSCRIPTION"],
		["long"] = ArkInventory.Localise["CATEGORY_EMPTY_INSCRIPTION"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_INSCRIPTION"],
		["colour"] = ArkInventory.Const.Slot.DefaultColour,
	},
	[ArkInventory.Const.Slot.Type.Bullet] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_PROJECTILE_BULLET"],
		["long"] = ArkInventory.Localise["CATEGORY_EMPTY_PROJECTILE_BULLET"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_QUIVER_BULLET"],
		["texture"] = ArkInventory.Const.Texture.Empty.Ammo,
		["colour"] = { r = 1.0, g = 0.5, b = 0.15 }, -- orange
		["emptycolour"] = GREEN_FONT_COLOR_CODE, -- status text colour when no slots left
	},
	[ArkInventory.Const.Slot.Type.Arrow] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_PROJECTILE_ARROW"],
		["long"] = ArkInventory.Localise["CATEGORY_EMPTY_PROJECTILE_ARROW"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_QUIVER_ARROW"],
		["texture"] = ArkInventory.Const.Texture.Empty.Ammo,
		["colour"] = { r = 1.0, g = 0.5, b = 0.15 }, -- orange
		["emptycolour"] = GREEN_FONT_COLOR_CODE, -- status text colour when no slots left
	},
	[ArkInventory.Const.Slot.Type.Wearing] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_BAG"],
		["long"] = ArkInventory.Localise["CATEGORY_EMPTY_BAG"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_BAG"],
		["colour"] = ArkInventory.Const.Slot.DefaultColour,
		["hide"] = true,
	},
	[ArkInventory.Const.Slot.Type.Mail] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_BAG"],
		["long"] = ArkInventory.Localise["CATEGORY_EMPTY_BAG"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_BAG"],
		["colour"] = ArkInventory.Const.Slot.DefaultColour,
		["hide"] = true,
	},
}

ArkInventory.Global = { -- globals

	Version = "", --calculated

	Me = nil,

	Mode = {
		Bank = false,
		Vault = false,
		Mail = false,
		Merchant = false,

		Edit = false,
		Combat = false,
	},

	Tooltip = {
		Scan = nil,
		Vendor = nil,
		Rule = nil,
	},
	
	Category = { }, -- see CategoryGenerate() for how this gets populated

	Location = {
		
		[ArkInventory.Const.Location.Bag] = {
			Internal = "bag",
			Name = ArkInventory.Localise["LOCATION_BAG"],
			Texture = [[Interface\Icons\INV_Misc_Bag_07_Green]],
			bagCount = 1, -- actual value set in OnInitialize
			Bags = { },
			canRestack = true,
			hasChanger = true,
			canSearch = true,
			
			Layout = { },
			maxBar = 0,
			maxSlot = { },
			
			isOffline = false,
			canView = true,
			canOverride = true,
			
			drawState = ArkInventory.Const.Window.Draw.Init,
		},
		
		[ArkInventory.Const.Location.Key] = {
			Internal = "key",
			Name = KEYRING,
			Texture = [[Interface\ContainerFrame\KeyRing-Bag-Icon]], --Interface\Icons\INV_Misc_Key_03
			bagCount = 1,
			Bags = { },
			canRestack = true,
			hasChanger = nil,
			canSearch = false,

			Layout = { },
			maxBar = 0,
			maxSlot = { },
			
			isOffline = false,
			canView = true,
			canOverride = true,
			
			drawState = ArkInventory.Const.Window.Draw.Init,
		},
		
		[ArkInventory.Const.Location.Bank] = {
			Internal = "bank",
			Name = ArkInventory.Localise["LOCATION_BANK"],
			Texture = [[Interface\Icons\INV_Box_02]], --Interface\Minimap\Tracking\Banker
			bagCount = 1, -- actual value set in OnInitialize
			Bags = { },
			canRestack = true,
			hasChanger = true,
			canSearch = true,

			Layout = { },
			maxBar = 0,
			maxSlot = { },
			
			isOffline = true,
			canView = true,
			canOverride = true,
			canPurge = true,

			drawState = ArkInventory.Const.Window.Draw.Init,
		},
		
		[ArkInventory.Const.Location.Vault] = {
			Internal = "vault",
			Name = GUILD_BANK,
			Texture = [[Interface\Icons\INV_Misc_Coin_02]],
			bagCount = 1, -- actual value set in OnInitialize
			Bags = { },
			canRestack = true,
			hasChanger = true,
			canSearch = true,

			Layout = { },
			maxBar = 0,
			maxSlot = { },
			
			isOffline = true,
			canView = true,
			canOverride = true,
			canPurge = true,
			
			drawState = ArkInventory.Const.Window.Draw.Init,
			
			current_tab = 1,
			
		},
		
		[ArkInventory.Const.Location.Mail] = {
			Internal = "mail",
			Name = MAIL_LABEL,
			Texture = [[Interface\Minimap\Tracking\Mailbox]], --[[Interface\Icons\INV_Letter_01]]
			bagCount = 1,
			Bags = { },
			canRestack = nil,
			hasChanger = nil,
			canSearch = true,

			Layout = { },
			maxBar = 0,
			maxSlot = { },
			
			isOffline = true,
			canView = true,
			canOverride = nil,
			canPurge = true,
			
			drawState = ArkInventory.Const.Window.Draw.Init,
		},
		
		[ArkInventory.Const.Location.Wearing] = {
			Internal = "wearing",
			Name = ArkInventory.Localise["LOCATION_WEARING"],
			Texture = [[Interface\Icons\INV_Boots_05]],
			bagCount = 1,
			Bags = { },
			canRestack = nil,
			hasChanger = nil,

			Layout = { },
			maxBar = 0,
			maxSlot = { },
	
			isOffline = false,
			canView = true,
			canOverride = nil,

			drawState = ArkInventory.Const.Window.Draw.Init,
		},
	
	},

	Cache = {
		ItemCount = { }, -- key generated via TooltipItemID( h )
		Default = { }, -- key generated via ItemGetCacheIDCategory( i )
		Rule = { }, -- key generated via ItemGetCacheIDRule( i )
	},
	
	BAG_SLOT_SIZE = 32,

	Thread = {
		Restack = nil,
	},
	
	Options = {
		Location = ArkInventory.Const.Location.Bag,
	},
	
}

ArkInventory.Config = { }

ArkInventory.Options = {
	Blizzard = {
		type = "group",
		childGroups = "tree",
		name = ArkInventory.Const.Program.Name,
	},
	Internal = {
		type = "group",
		childGroups = "tree",
		name = ArkInventory.Const.Program.Name,
	},
}



-- Binding Variables
BINDING_HEADER_ARKINV = ArkInventory.Const.Program.Name
BINDING_NAME_ARKINV_TOGGLE_BAG = ArkInventory.Localise["LOCATION_BAG"]
BINDING_NAME_ARKINV_TOGGLE_BANK = ArkInventory.Localise["LOCATION_BANK"]
BINDING_NAME_ARKINV_TOGGLE_KEY = KEYRING
BINDING_NAME_ARKINV_TOGGLE_VAULT = GUILD_BANK
BINDING_NAME_ARKINV_TOGGLE_MAIL = MAIL_LABEL
BINDING_NAME_ARKINV_TOGGLE_WEARING = ArkInventory.Localise["LOCATION_WEARING"]
BINDING_NAME_ARKINV_TOGGLE_EDIT = ArkInventory.Localise["MOD_MENU_MAIN_EDITMODE"]
BINDING_NAME_ARKINV_TOGGLE_RULES = ArkInventory.Localise["MOD_MENU_MAIN_RULES"]
BINDING_NAME_ARKINV_TOGGLE_SEARCH = ArkInventory.Localise["MOD_MENU_MAIN_SEARCH"]
BINDING_NAME_ARKINV_RESTACK = ArkInventory.Localise["RESTACK"]
BINDING_NAME_ARKINV_MENU = ArkInventory.Localise["MOD_FRAME_MENU"]
BINDING_NAME_ARKINV_CONFIG = ArkInventory.Localise["OPT_CONFIG_TEXT"]

ArkInventory.Const.DatabaseDefaults.profile = {
	["option"] = {
		["version"] = 0,
		["category"] = { }, -- ["item id"] = category number to put the item in
		["rule"] = {
			["*"] = false,
		},
		["use"] = {
			["*"] = ArkInventory.Const.Location.Bag,
		},
		["location"] = {
			["*"] = {
				["window"] = {
					["scale"] = 1,
					["width"] = 16,
					["border"] = {
						["style"] = nil,
						["show"] = true,
						["file"] = nil,
						["size"] = nil,
					},
					["colour"] = {
						["background"] = {
							["r"] = 0,
							["g"] = 0,
							["b"] = 0,
							["a"] = 0.75,
						},
						["border"] = {
							["r"] = 1,
							["g"] = 1,
							["b"] = 1,
						},
						["baghighlight"] = {
							["r"] = 0,
							["g"] = 1,
							["b"] = 0,
						},
					},
					["pad"] = 8,
				},
				["bar"] = {
					["per"] = 5,
					["pad"] = {
						["internal"] = 8,
						["external"] = 8,
					},
					["border"] = {
						["style"] = nil,
						["show"] = true,
						["file"] = nil,
						["size"] = nil,
					},
					["colour"] = {
						["background"] = ArkInventory.Const.BAR_DEFAULT_COLOUR,
						["border"] = ArkInventory.Const.BAR_DEFAULT_COLOUR,
					},
					["showempty"] = false,
					["anchor"] = ArkInventory.Const.Anchor.BottomRight,
					["compact"] = false,
					["hide"] = false,
					["name"] = {
						["show"] = true,
						["colour"] = {
							["r"] = 1,
							["b"] = 1,
							["g"] = 1,
						},
						["label"] = {
							["*"] = "",
						},
					},
				},
				["slot"] = {
					["empty"] = {
						["alpha"] = 0.1,
						["icon"] = true,
						["border"] = true,
						["clump"] = false,
						["show"] = true,
						["colour"] = {
							["r"] = 1,
							["g"] = 1,
							["b"] = 1,
						},
					},
					["data"] = ArkInventory.Const.Slot.Data,
					["pad"] = 4,
					["border"] = {
						["style"] = nil,
						["show"] = true,
						["rarity"] = true,
						["file"] = nil,
						["size"] = nil,
						["offset"] = nil,
					},
					["ignorehidden"] = false,
					["anchor"] = ArkInventory.Const.Anchor.BottomRight,
					["new"] = {
						["show"] = false,
						["colour"] = {
							["r"] = 1,
							["g"] = 1,
							["b"] = 1,
						},
					},
					["offline"] = {
						["fade"] = true,
					},
					["unusable"] = {
						["tint"] = false,
					},
				},
				["sort"] = {
					["ascending"] = true,
					["bagslot"] = true,
					["instant"] = false,
					["open"] = true,
					["reversed"] = false,
					["category"] = false,
					["location"] = false,
					["itemuselevel"] = false,
					["itemstatlevel"] = false,
					["itemtype"] = false,
					["quality"] = false,
					["name"] = false,
					--["vendorprice"] = false,
				},
				["sortorder"] = { },
				["category"] = {
					["*"] = nil, -- [category number] = bar number to put rule on
				}, 
				["framehide"] = {
					["*"] = false,
				},
				["anchor"] = {
					["*"] = {
						["point"] = ArkInventory.Const.Anchor.TopRight,
						["locked"] = false,
						["t"] = 0,
						["b"] = 0,
						["l"] = 0,
						["r"] = 0,
					},
				},
			},
		},
		["font"] = {
			["name"] = nil,
			["size"] = 0,
		},
		["ui"] = {
			["search"] = {
				["scale"] = 1,
				["font"] = {
					["name"] = nil,
				},
				["border"] = {
					["show"] = true,
					["file"] = nil,
					["size"] = nil,
					["scale"] = nil,
					["colour"] = {
						["r"] = 1,
						["g"] = 1,
						["b"] = 1,
					},
				},
			},
			["rules"] = {
				["scale"] = 1,
				["font"] = {
					["name"] = nil,
				},
				["border"] = {
					["show"] = true,
					["file"] = nil,
					["size"] = nil,
					["scale"] = nil,
					["colour"] = {
						["r"] = 1,
						["g"] = 1,
						["b"] = 1,
					},
				},
			},
		},
	},
}

ArkInventory.Const.DatabaseDefaults.global = {
	["option"] = {
		["version"] = 0,
		["auto"] = {
			["open"] = {
				["*"] = true,
			},
			["close"] = {
				["*"] = true,
			},
		},
		["category"] = {
			["*"] = {
				["data"] = {
					["*"] = nil, -- [rule number] = { rule data }
				},
				["next"] = 1,
			},
		},
		["showdisabled"] = true,
		["bugfix"] = {
			["enable"] = false,
			["alert"] = 2,
		},
		["tooltip"] = {
			["show"] = true, -- show tooltips for items
			["me"] = false, -- only show my data
			["add"] = { -- things to add to the tooltip
				["empty"] = false, -- empty line / seperator
				["count"] = true, -- item count
				["vendor"] = true, -- vendor price
			},
			["colour"] = {
				["count"] =  {
					["r"] = 1,
					["g"] = 0.5,
					["b"] = 0.15,
				},
				["vendor"] =  {
					["r"] = 0.5,
					["g"] = 0.5,
					["b"] = 0.5,
				},
			},
		},
	},
	["vendor"] = {
		["version"] = 0,
		["price"] = {
			["*"] = nil, -- item id = vendor price
		},
	},
	["player"] = {
		["version"] = 0,
		["data"] = {
			["*"] = { -- player id
				["monitor"] = {
					["*"] = true,
				},
				["save"] = {
					["*"] = true,
				},
				["control"] = { -- which locations to take control of
					[ArkInventory.Const.Location.Bag] = true,
					[ArkInventory.Const.Location.Bank] = true,
					[ArkInventory.Const.Location.Key] = true,
					[ArkInventory.Const.Location.Vault] = true,
					["*"] = false,
				},
				["display"] = {
					["*"] = {
						["bag"] = {
							["*"] = true,
						},
					}
				},
			},
		},
		["realm"] = {
			["*"] = {
				["faction"] = {
					["*"] = {
						["name"] = {
							["*"] = {
								["info"] = {
									["*"] = nil,
								},
								["location"] = {
									["*"] = {
										["slot_count"] = 0,
										["bag"] = {
											["*"] = {
												["status"] = ArkInventory.Const.Bag.Status.Unknown,
												["texture"] = nil,
												["h"] = nil,
												["type"] = ArkInventory.Const.Slot.Type.Unknown,
												["count"] = 0,
												["empty"] = 0,
												["slot"] = {
													["*"] = nil,
												},
											},
										},
									},
								},
							},
						},
					},
				},
			},
		},
	},
}


function ArkInventory.OnInitialize()

	-- Called when the addon is loaded

	--ArkInventory.Output( { LIGHTYELLOW_FONT_COLOR_CODE, "OnInitialize" } )

	--ArkInventory.Localise:SetLocale( "frFR" )
	
	ArkInventory.StartupChecks()
	
--	if ArkInventory.Const.TOC >= 30000 then
--		ArkInventory.Const.Program.Beta = ArkInventory.Const.Program.Beta .. "-WotLK"
--	end
	
	ArkInventory.Global.Version = string.format( "v%s", ArkInventory.Const.Program.UIVersion )
	if ArkInventory.Const.Program.Beta then
		ArkInventory.Global.Version = string.format( "%s %s(%s)%s", ArkInventory.Global.Version, RED_FONT_COLOR_CODE, ArkInventory.Const.Program.Beta or "unknown beta version", FONT_COLOR_CODE_CLOSE )
	end

	ArkInventory.ConvertAceDB2ToAceDB3( )

	-- load database
	ArkInventory.db = LibStub( "AceDB-3.0" ):New( "ARKINVDB", ArkInventory.Const.DatabaseDefaults, "Default" )
	
	-- load guild bank ui
	if not IsAddOnLoaded( "Blizzard_GuildBankUI" ) then
		LoadAddOn( "Blizzard_GuildBankUI" )
	end

	ArkInventory.Lib.Config:RegisterOptionsTable( ArkInventory.Const.Frame.Options.Internal, ArkInventory.Options.Internal, { "arkinventory", "arkinv", "ai" } )
	ArkInventory.Lib.Dialog:SetDefaultSize( ArkInventory.Const.Frame.Options.Internal, 1000, 600 )
	ArkInventory.Lib.Config:RegisterOptionsTable( ArkInventory.Const.Frame.Options.Blizzard, ArkInventory.Options.Blizzard )
	ArkInventory.Lib.Dialog:AddToBlizOptions( ArkInventory.Const.Frame.Options.Blizzard, ArkInventory.Const.Program.Name )

	ArkInventory.Global.Tooltip.Scan = ArkCoreScanTooltip_Class:new( "ARKINV_ScanTooltip" )	
	ArkInventory.Global.Tooltip.Vendor = ArkCoreScanTooltip_Class:new( "ARKINV_VendorTooltip" )
	ArkInventory.Global.Tooltip.Rule = ArkCoreScanTooltip_Class:new( "ARKINV_RuleTooltip" )
	
	local loc_id
	
	-- bags
	loc_id = ArkInventory.Const.Location.Bag
	ArkInventory.Global.Location[loc_id].bagCount = NUM_BAG_SLOTS + 1
	table.insert( ArkInventory.Global.Location[loc_id].Bags, BACKPACK_CONTAINER )
	--ArkInventory.Output( { "added bag ", BACKPACK_CONTAINER, " to ", ArkInventory.Global.Location[loc_id].Name } )
	for x = 1, NUM_BAG_SLOTS do
		table.insert( ArkInventory.Global.Location[loc_id].Bags, x )
		--ArkInventory.Output( { "added bag ", x, " to ", ArkInventory.Global.Location[loc_id].Name } )
	end

	-- keyring
	loc_id = ArkInventory.Const.Location.Key
	table.insert( ArkInventory.Global.Location[loc_id].Bags, KEYRING_CONTAINER )
	--ArkInventory.Output( { "added bag ", KEYRING_CONTAINER, " to ", ArkInventory.Global.Location[loc_id].Name } )
	
	-- bank
	loc_id = ArkInventory.Const.Location.Bank
	ArkInventory.Global.Location[loc_id].bagCount = NUM_BANKBAGSLOTS + 1
	table.insert( ArkInventory.Global.Location[loc_id].Bags, BANK_CONTAINER )
	--ArkInventory.Output( { "added bag ", BANK_CONTAINER, " to ", ArkInventory.Global.Location[loc_id].Name } )
	for x = NUM_BAG_SLOTS + 1, NUM_BAG_SLOTS + NUM_BANKBAGSLOTS do
		table.insert( ArkInventory.Global.Location[loc_id].Bags, x )
		--ArkInventory.Output( { "added bag ", x, " to ", ArkInventory.Global.Location[loc_id].Name } )
	end

	-- vault
	loc_id = ArkInventory.Const.Location.Vault
	ArkInventory.Global.Location[loc_id].bagCount = MAX_GUILDBANK_TABS
	for x = 1, MAX_GUILDBANK_TABS do
		table.insert( ArkInventory.Global.Location[loc_id].Bags, ArkInventory.Const.Offset.Vault + x )
	end
	
	-- mail
	table.insert( ArkInventory.Global.Location[ArkInventory.Const.Location.Mail].Bags, ArkInventory.Const.Offset.Mail + 1 )
	
	-- wearing
	table.insert( ArkInventory.Global.Location[ArkInventory.Const.Location.Wearing].Bags, ArkInventory.Const.Offset.Wearing + 1 )
	
	
	ArkInventory.PlayerInfoSet()
	
	ArkInventory.InitOptions()
	
end

function ArkInventory.OnEnable()


--[[
	for z in pairs( ITEM_QUALITY_COLORS ) do
		if z >= 0 then
			local d = getfenv()[string.format( "ITEM_QUALITY%d_DESC", z )]
			ArkInventory.Output( { "Item Quality ", z, "=[", d, "]" } )
		end
	end
]]--

	-- Called when the addon is enabled

	ArkInventory.ConvertOldOptions()
	
	ArkInventory.CategoryGenerate()
	
	ArkInventory.BlizzardAPIHooks()

	-- tag all locations as changed
	ArkInventory.LocationSetValue( nil, "changed", true )
	
	-- tag all locations as needing resorting/recategorisation
	ArkInventory.LocationSetValue( nil, "resort", true )
	
	-- init location player_id
	ArkInventory.LocationSetValue( nil, "player_id", ArkInventory.Global.Me.info.player_id )


	-- register events
	
	ArkInventory:RegisterMessage( "LISTEN_STORAGE_EVENT" )

	ArkInventory:RegisterEvent( "PLAYER_ENTERING_WORLD", "LISTEN_PLAYER_ENTER" ) -- not really needed but seems to fix a bug where ace doesnt seem to init again
	ArkInventory:RegisterEvent( "PLAYER_LEAVING_WORLD", "LISTEN_PLAYER_LEAVE" ) --when the player logs out or the UI is reloaded.
	ArkInventory:RegisterEvent( "PLAYER_MONEY", "LISTEN_PLAYER_MONEY" )
	ArkInventory:RegisterEvent( "SKILL_LINES_CHANGED", "LISTEN_PLAYER_SKILLS" ) -- triggered when you gain or lose a skill, skillup, collapse/expand a skill header
	
	ArkInventory:RegisterEvent( "PLAYER_REGEN_DISABLED", "LISTEN_COMBAT_ENTER" ) -- player about to enter combat
	ArkInventory:RegisterEvent( "PLAYER_REGEN_ENABLED", "LISTEN_COMBAT_LEAVE" ) -- player left combat

	ArkInventory:RegisterBucketMessage( "LISTEN_BAG_UPDATE_BUCKET", 0.5 )
	ArkInventory:RegisterEvent( "BAG_UPDATE", "LISTEN_BAG_UPDATE" )
	ArkInventory:RegisterEvent( "ITEM_LOCK_CHANGED", "LISTEN_BAG_LOCK" )

	ArkInventory:RegisterBucketMessage( "LISTEN_CHANGER_UPDATE_BUCKET", 1 )
	
	ArkInventory:RegisterEvent( "BANKFRAME_OPENED", "LISTEN_BANK_ENTER" )
	ArkInventory:RegisterEvent( "BANKFRAME_CLOSED", "LISTEN_BANK_LEAVE" )
	ArkInventory:RegisterEvent( "PLAYERBANKSLOTS_CHANGED", "LISTEN_BANK_UPDATE" ) -- a bag_update event for the bank (-1)
	ArkInventory:RegisterEvent( "PLAYERBANKBAGSLOTS_CHANGED", "LISTEN_BANK_SLOT" ) -- triggered when you purchase a new bank bag slot

	ArkInventory:RegisterEvent( "GUILDBANKFRAME_OPENED", "LISTEN_VAULT_ENTER" )
	ArkInventory:RegisterEvent( "GUILDBANKFRAME_CLOSED", "LISTEN_VAULT_LEAVE" )
	ArkInventory:RegisterBucketMessage( "LISTEN_VAULT_UPDATE_BUCKET", 1 )
	ArkInventory:RegisterBucketMessage( "LISTEN_VAULT_RESTACK_BUCKET", 3 )
	ArkInventory:RegisterEvent( "GUILDBANKBAGSLOTS_CHANGED", "LISTEN_VAULT_UPDATE" )
	ArkInventory:RegisterEvent( "GUILDBANK_ITEM_LOCK_CHANGED", "LISTEN_VAULT_LOCK" )
	ArkInventory:RegisterEvent( "GUILDBANK_UPDATE_MONEY", "LISTEN_VAULT_MONEY" )
	ArkInventory:RegisterEvent( "GUILDBANK_UPDATE_TABS", "LISTEN_VAULT_TABS" )
	ArkInventory:RegisterEvent( "GUILDBANKLOG_UPDATE", "LISTEN_VAULT_LOG" )

	ArkInventory:RegisterBucketMessage( "LISTEN_INVENTORY_CHANGE_BUCKET", 0.5 )
	ArkInventory:RegisterEvent( "UNIT_INVENTORY_CHANGED", "LISTEN_INVENTORY_CHANGE" )

	ArkInventory:RegisterEvent( "MAIL_SHOW", "LISTEN_MAIL_ENTER" )
	ArkInventory:RegisterEvent( "MAIL_CLOSED", "LISTEN_MAIL_LEAVE" )
	ArkInventory:RegisterBucketMessage( "LISTEN_MAIL_UPDATE_BUCKET", 0.5 )
	ArkInventory:RegisterEvent( "MAIL_INBOX_UPDATE", "LISTEN_MAIL_UPDATE" )
	
	ArkInventory:RegisterEvent( "TRADE_SHOW", "LISTEN_TRADE_ENTER" )
	ArkInventory:RegisterEvent( "TRADE_CLOSED", "LISTEN_TRADE_LEAVE" )

	ArkInventory:RegisterEvent( "AUCTION_HOUSE_SHOW", "LISTEN_AUCTION_ENTER" )
	ArkInventory:RegisterEvent( "AUCTION_HOUSE_CLOSED", "LISTEN_AUCTION_LEAVE" )

	ArkInventory:RegisterEvent( "MERCHANT_SHOW", "LISTEN_MERCHANT_ENTER" )
	ArkInventory:RegisterEvent( "MERCHANT_CLOSED", "LISTEN_MERCHANT_LEAVE" )

	ArkInventory.db.RegisterCallback( ArkInventory, "OnProfileChanged", "OnProfileChanged" )
	ArkInventory.db.RegisterCallback( ArkInventory, "OnProfileCopied", "OnProfileChanged" )
	ArkInventory.db.RegisterCallback( ArkInventory, "OnProfileReset", "OnProfileChanged" )
	ArkInventory.db.RegisterCallback( ArkInventory, "OnProfileDeleted", "OnProfileChanged" )
	ArkInventory.db.RegisterCallback( ArkInventory, "OnDatabaseReset", "OnProfileChanged" )
	
	ArkInventory.PlayerInfoSet()
	ArkInventory.ScanLocation()
	
	ArkInventory.Output( string.format( "%s %s", ArkInventory.Global.Version, ArkInventory.Localise["GENERIC_ENABLED"] ) )
	
end

function ArkInventory.OnDisable()

	ArkInventory.Frame_Main_Hide()
	
	ArkInventory.BlizzardAPIHooks( true )
	
	ArkInventory.Output( string.format( "%s %s", ArkInventory.Global.Version, ArkInventory.Localise["GENERIC_DISABLED"] ) )
	
end

function ArkInventory.DatabaseReset()

	-- /ai db reset confirm

	ArkInventory.Frame_Main_Hide()

	ArkInventory:ResetDB( "profile" )
	
	ArkInventory.Output( { GREEN_FONT_COLOR_CODE, ArkInventory.Localise["SLASH_DB_RESET_COMPLETE_TEXT"] } )
	
	ArkInventory.CategoryGenerate()
	ArkInventory.LocationSetValue( nil, "resort", true )
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )

end

function ArkInventory.nilStringEmpty( arg )
	if arg == nil then arg = "" end
	return tostring( arg )
end

function ArkInventory.nilStringText( arg )
	if arg == nil then arg = "nil" end
	return tostring( arg )
end

--function ArkInventory.round( n, dp )
--	local m = 10 ^ ( dp or 0 )
--	return math.floor( n * m + 0.5 ) / m
--end

function ArkInventory.ClassColourRGB( class )

	if not class then
		return
	end
	
	local c = RAID_CLASS_COLORS[class]
	
	if class == "GUILD" then
		c = { r = 1, g = 0.5, b = 0.15 }
	end
	
	if not c then
		return
	end
	
	c.r = c.r <= 1 and c.r >= 0 and c.r or 0
	c.g = c.g <= 1 and c.g >= 0 and c.g or 0
	c.b = c.b <= 1 and c.b >= 0 and c.b or 0
	
	return c

end

function ArkInventory.ClassColourCode( class )

	local c = ArkInventory.ClassColourRGB( class )
	
	if not c then
		return FONT_COLOR_CODE_CLOSE
	end
	
	return string.format( "|cff%02x%02x%02x", c.r * 255, c.g * 255, c.b * 255 )

end

	
function ArkInventory.Output( msg, debug_only )

	if debug_only and not ArkInventory.Const.Debug then
		return
	end

	if not DEFAULT_CHAT_FRAME then
		return
	end
	
	local txt = { }
	
	if msg == nil then
	
		tinsert( txt, "nil" )
	
	elseif type( msg ) == "table" then
	
		tinsert( txt, ArkInventory.Table.Concat( msg ) )
	
	else
	
		tinsert( txt, msg )
	
	end
	
	ArkInventory:Print( table.concat( txt ) )
	
end

function ArkInventory.PT_ItemInSets( item, setnames )

	if not item or not setnames then return false end

	for setname in string.gmatch( setnames, "[^,]+" ) do
		
		local r = ArkInventory.Lib.PeriodicTable:ItemInSet( item, strtrim( setname ) )
		if r then
			return true
		end
		
	end

	return false
	
end

function ArkInventory.ItemGetInternalString( h )
	local id, suffix, enchant, j1, j2, j3, j4 = ArkInventory.ItemStringDecode( h )
	return string.format( "%s:%s:%s:%s:%s:%s:%s", id, enchant, suffix, j1, j2, j3, j4 )
end

function ArkInventory.ItemGetCacheIDRule( i )

	local i = i or { }
	
	local soulbound = 0
	if i.sb then
		soulbound = 1
	end
	
	local itemString = ArkInventory.ItemGetInternalString( i.h )
	
	return string.format( "%i:%i:%i:%i:%s", i.loc_id or 0, i.bag_id or 0, i.slot_id or 0, soulbound, itemString )
	
end

function ArkInventory.ItemGetCacheIDCategory( i )

	local soulbound = 0
	
	if i.h then
		if i.sb then
			soulbound = 1
		end
	else
		-- empty slots
		local bliz_id = ArkInventory.BagID_Blizzard( i.loc_id, i.bag_id )
		soulbound = ArkInventory.BagType( bliz_id )
	end
	
	local id = ArkInventory.ItemStringDecode( i.h )
	
	return string.format( "%s:%s", soulbound, id )
	
end

function ArkInventory.LocationPlayerInfoGet( loc_id )

	if loc_id == nil or ArkInventory.Global.Location[loc_id].player_id == nil then
		ArkInventory.Output( { "player id not set for location (", loc_id, ")" } )
		assert( false, "code error" )
	end

	--ArkInventory.Output( { "LocationPlayerInfoGet( ", loc_id, " ) player id=[", ArkInventory.Global.Location[loc_id].player_id, "]" } )
	local cp = ArkInventory.PlayerInfoGet( ArkInventory.Global.Location[loc_id].player_id )
	
	if cp == nil then
		ArkInventory.Output( { "invalid player id (", player_id, ") at location (", loc_id, ")" } )
		assert( false, "code error" )
	end
	
	if loc_id == ArkInventory.Const.Location.Vault then
	
		local guild_id = cp.info.guild_id
		if guild_id then
			--ArkInventory.Output( { "shift to guild (", guild_id, ")" } )
			cp = ArkInventory.PlayerInfoGet( guild_id )

			if cp == nil then
				ArkInventory.Output( { "player id (", player_id, ") has an invalid guild id (", guild_id, ") at location (", loc_id, ")" } )
				assert( false, "code error" )
			end
		end
		
	end
	
	return cp
	
end

function ArkInventory.OnProfileChanged( )

    -- this is called every time your profile changes
	
	ArkInventory.Lib.DewDrop:Close()
	ArkInventory.Frame_Main_Hide()
	ArkInventory.Frame_Rules_Hide()

	ArkInventory.ConvertOldOptions()
	ArkInventory.ItemCacheClear()
	ArkInventory.PlayerInfoSet()
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Init )

end

function ArkInventory.ObjectLockChanged( loc_id, bag_id, slot_id )

	if slot_id == nil then
		
		ArkInventory.Frame_Changer_Secondary_Update_Lock( loc_id, bag_id )
		
	else
		
		local framename = ArkInventory.ContainerItemNameGet( loc_id, bag_id, slot_id )
		if framename then
			local frame = getfenv()[framename]
			ArkInventory.Frame_Item_Update_Lock( frame )
		end
		
	end
	
end

function ArkInventory.ItemSortKeyClear( loc_id )

	-- clear sort keys
	
	--local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	local Layout = ArkInventory.Global.Location[loc_id].Layout
	
	if not Layout.bar then
		return
	end
	
	for _, bar in pairs( Layout.bar ) do
		for _, item in pairs( bar.item ) do
			item.sortkey = nil
			item.cat = nil
		end
	end

end

function ArkInventory.ItemSortKeyGenerate( i )

	if not i then
		return nil
	end
	
	--ArkInventory.Output( { "ItemSortKeyGenerate( ", i, " )" } )
	
	local s = { }
	s["!bagslot"] = string.format( "%04i %04i", i.bag_id, i.slot_id )

	if not ArkInventory.LocationOptionGet( i.loc_id, { "sort", "bagslot" } ) then
	
		local t
		
		-- slot type (system)
		t = 0
		if not i.h then
			t = ArkInventory.BagType( i.bag_id )
		end
		s["!slottype"] = string.format( "%04i", t )


		-- item count (system)
		s["!count"] = string.format( "%04i", i.count )

	
		-- item name
		t = "!"
		if i.h and ArkInventory.LocationOptionGet( i.loc_id, { "sort", "name" } ) then
		
			t = ArkInventory.ItemGetName( i.h ) or strmatch( i.h, "%[(.+)%]" ) or "!"
		
			if ArkInventory.LocationOptionGet( i.loc_id, { "sort", "reversed" } ) then
				t = ArkInventory.ReverseName( t )
			end
			
		end
		s["name"] = t


		-- item quality
		t = 0
		if i.q and ArkInventory.LocationOptionGet( i.loc_id, { "sort", "quality" } ) then
			t = i.q
		end
		s["quality"] = string.format( "%02i", t )
		

		-- location
		t = "!"
		if i.h and ArkInventory.LocationOptionGet( i.loc_id, { "sort", "location" } ) then
		
			t = select( 9, ArkInventory.ItemInfoGet( i.h ) )
				
			if not t or t == "" then
				t = "!"
			else
				t = getfenv()[t]
			end

		end
		s["location"] = t

		
		-- item type / subtype
		local item_type = "!"
		local item_subtype = "!"
		
		if i.h and ArkInventory.LocationOptionGet( i.loc_id, { "sort", "itemtype" } ) then
		
			local _
		
			_, _, _, _, _, item_type, item_subtype = ArkInventory.ItemInfoGet( i.h )
				
			if not item_type or item_type == "" then
				item_type = "!"
			end
			
			if not item_subtype or item_subtype == "" then
				item_subtype = "!"
			end

		end
		s["itemtype"] = string.format( "%s %s", item_type, item_subtype )

		
		-- item (use) level
		t = 0
		if i.h and ArkInventory.LocationOptionGet( i.loc_id, { "sort", "itemuselevel" } ) then
			t = select( 5, ArkInventory.ItemInfoGet( i.h ) )
		end
		s["itemuselevel"] = string.format( "%04i", t or 0 )

		
		-- item (stat) level
		t = 0
		if i.h and ArkInventory.LocationOptionGet( i.loc_id, { "sort", "itemstatlevel" } ) then
			t = select( 4, ArkInventory.ItemInfoGet( i.h ) )
		end
		s["itemstatlevel"] = string.format( "%04i", t or 0 )

		-- vendor price
--[[
		t = 0
		if i.h and ArkInventory.LocationOptionGet( i.loc_id, { "sort", "vendorprice" } ) then
			local price_per = GetSellValue( i.h )
			if price_per > 0 then
				local count = i.count or 1
				local t = price_per * count
			end
		end
		s["vendorprice"] = string.format( "%08i", t or 0 )
]]--

		-- category
		local cat_type = 0
		local cat_code = 0
		local cat_order = 0
		
		if i.h and ArkInventory.LocationOptionGet( i.loc_id, { "sort", "category" } ) then
		
			local cat_id = i.cat or ArkInventory.ItemCategoryGet( i )
			
			cat_type, cat_code = ArkInventory.CategoryCodeSplit( cat_id )

			if cat_type == ArkInventory.Const.Category.Type.Rule then
				local cat = ArkInventory.db.global.option.category[cat_type].data[cat_code]
				if cat ~= nil then
					cat_order = cat.order
				end
			end
			
		end
		
		s["category"] = string.format( "%02i %04i %04i", cat_type, cat_order, cat_code )

	else
	
		--ArkInventory.Output( "bag sort" )
	
	end

	
	-- build sort key
	local sx = { }
	if ArkInventory.LocationOptionGet( i.loc_id, { "sort", "bagslot" } ) then
	
		tinsert( sx, s["!bagslot"] )
		
	else

		for k, v in ipairs( ArkInventory.LocationOptionGet( i.loc_id, { "sortorder" } ) ) do
			if s[v] then
				tinsert( sx, s[v] )
			end
		end
	
		tinsert( sx, s["!slottype"] )
		tinsert( sx, s["!count"] )
		tinsert( sx, s["!bagslot"] )

	end
	
	return table.concat( sx, " " )

end

function ArkInventory.ItemSortKeyMoveDown( loc_id, s )

	local p = false
	local t = ArkInventory.LocationOptionGet( loc_id, { "sortorder" } )
	
	for k, v in ipairs( t ) do
		if s == v then
			p = k
			break
		end
	end

	if not p then
		return
	end
	
	if not t[p+1] then
		-- already at the bottom
		return
	end
	
	local x, y = t[p + 1], t[p]
	t[p], t[p + 1] = x, y
	
end

function ArkInventory.ItemSortKeyMoveUp( loc_id, s )

	local p = false
	local t = ArkInventory.LocationOptionGet( loc_id, { "sortorder" } )
	
	for k, v in ipairs( t ) do
		if s == v then
			p = k
			break
		end
	end

	if not p or p == 1 then
		return
	end
	
	local x, y = t[p - 1], t[p]
	t[p], t[p - 1] = x, y
	
end

function ArkInventory.SortKeyCheck()

	for loc_id in ipairs( ArkInventory.Global.Location ) do
	
		local t = ArkInventory.LocationOptionGetReal( loc_id, { "sortorder" } )

		if type( t ) ~= "table" then
			t = { }
		end

		-- add mising keys
		for s in pairs( ArkInventory.Const.SortKeys ) do
			
			local ok = false
			
			for k, v in ipairs( t ) do
			
				if s == v then
					ok = true
					break
				end
			
			end
			
			if not ok then
				tinsert( t, s )
			end
			
		end
		
		-- remove old keys
		for k, v in ipairs( t ) do
			if not ArkInventory.Const.SortKeys[v] then
				tremove( t, k )
			end
		end

		ArkInventory.LocationOptionSetReal( loc_id, { "sortorder" }, t )
		
	end
	
end

function ArkInventory.NewItemIndicator( loc_id )
--[[
	c = getfenv()[ArkInventory.Const.Frame.Main.Name .. loc_id .. ArkInventory.Const.Frame.Container.Name]
	if c and c:IsVisible() then
	
		local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
		for _, bag_id in pairs( ArkInventory.Global.Location[loc_id].Bags ) do
		
			for slot_id in pairs( cp.location[loc_id].bag[bag_id].slot ) do
				s = getfenv()[c:GetName() .. "Bag" .. bag_id .. "Item" .. slot_id]
				if s and s:IsVisible() then
					ArkInventory.Frame_Item_Update_NewIndicator( s )
				end
			end
			
		end
		
	end
]]--
end

function ArkInventory.NewItemReset( loc_id )
--[[
	-- reset new item text
	
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	
	for bag_id, bag in pairs( cp.location[loc_id].bag ) do
		for slot_id, slot in pairs( bag.slot ) do
			slot.new = ArkInventory.Const.Slot.New.No --~~~~ check this still works
		end
	end
]]--
end

function ArkInventory.LocationSetValue( l, k, v )
	for loc_id in pairs( ArkInventory.Global.Location ) do
		if l == nil or l == loc_id then
			if ArkInventory.Global.Location[loc_id] then
				ArkInventory.Global.Location[loc_id][k] = v
			end
		end
	end
end


function ArkInventory.Category_Bar_Get( loc_id, cat_id )
	
	local cat_def = ArkInventory.CategoryGetSystemID( "CATEGORY_DEFAULT" )
	
	if cat_id == nil then
		cat_id = cat_def
	end
	
	local bar = ArkInventory.LocationOptionGet( loc_id, { "category", cat_id } )
		
	-- if it's the default category and the default is not on a bar then put it on bar 1
	if bar == nil and cat_id == cat_def then
		bar = 1
	end
	
	return bar
	
end

function ArkInventory.Category_Location_Set( loc_id, cat_id, bar_id )

	assert( cat_id ~= nil , "category is nil" )

	local cat_def = ArkInventory.CategoryGetSystemID( "CATEGORY_DEFAULT" )
	
	if cat_id ~= cat_def or bar_id ~= nil then
		ArkInventory.LocationOptionSet( loc_id, { "category", cat_id }, bar_id )
	end
	
end

function ArkInventory.Category_Location_Get( loc_id, cat_id )
	-- maps category id's to the bars they are assigned to
	
	if cat_id == nil then
		cat_id = ArkInventory.CategoryGetSystemID( "CATEGORY_UNKNOWN" )
	end	
	
	local bar = ArkInventory.Category_Bar_Get( loc_id, cat_id )
	--ArkInventory.Output( { "loc=[", loc_id, "], cat=[", cat_id, "], bar=[", bar, "]" } )
	
	if not bar then
		-- if this category hasn't been assigned to a bar then return the bar that DEFAULT is using
		local cat_def = ArkInventory.CategoryGetSystemID( "CATEGORY_DEFAULT" )
		return ArkInventory.Category_Bar_Get( loc_id, cat_def ), true
	else
		return bar, false
	end
end

function ArkInventory.Category_Hidden_Check( loc_id, cat_id )

	local bar = ArkInventory.Category_Bar_Get( loc_id, cat_id )
	
	if bar ~= nil and bar < 0 then
		return true
	else
		return false
	end

end

function ArkInventory.Category_Hidden_Toggle( loc_id, cat_id )
	ArkInventory.Category_Location_Set( loc_id, cat_id, 0 - ArkInventory.Category_Location_Get( loc_id, cat_id ) )
end

function ArkInventory.CategoryGenerate()

	local categories = {
		["SYSTEM"] = ArkInventory.Const.Category.Code.System,
		["CONSUMABLE"] = ArkInventory.Const.Category.Code.Consumable,
		["TRADE_GOODS"] = ArkInventory.Const.Category.Code.Trade,
		["SKILL"] = ArkInventory.Const.Category.Code.Skill,
		["CLASS"] = ArkInventory.Const.Category.Code.Class,
		["EMPTY"] = ArkInventory.Const.Category.Code.Empty,
		["OTHER"] = ArkInventory.Const.Category.Code.Other,
		["RULE"] = ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data,
		["CUSTOM"] = ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Custom].data,
	}
	
	local system, order, name, cat_id, cat_type, cat_code
	
	ArkInventory.Global.Category = { }

	for tn, d in pairs( categories ) do
	
		for k, v in pairs( d ) do

			if tn == "RULE" then
			
				cat_type = ArkInventory.Const.Category.Type.Rule
				cat_code = k
				
				system = nil
				order = ( v.order or 99999 ) + ( k / 10000 )
				name = string.format( "%04i. %s", k, ( v.name or "<no name>" ) )
				
			elseif tn == "CUSTOM" then
			
				cat_type = ArkInventory.Const.Category.Type.Custom
				cat_code = k
				
				system = nil
				order = 0
				name = v
				
			else
			
				cat_type = ArkInventory.Const.Category.Type.System
				cat_code = k
				
				system = v
				order = 0
				if ArkInventory.Localise:HasTranslation( v ) then
					name = ArkInventory.Localise[v]
				else
					name = v
				end
				
			end

			cat_id = ArkInventory.CategoryCodeJoin( cat_type, cat_code )
			
			assert( not ArkInventory.Global.Category[cat_id], "duplicate category id [" .. cat_id .. "]" )
			
			ArkInventory.Global.Category[cat_id] = {
				["id"] = cat_id,
				["system"] = system,
				["name"] = name,
				["fullname"] = string.format( "%s > %s", ArkInventory.Localise["CATEGORY_" .. tn], name ),
				["order"] = order,
				["type_code"] = tn,
				["type"] = ArkInventory.Localise["CATEGORY_" .. tn],
			}
			
		end
		
	end

end

function ArkInventory.CategoryCodeSplit( id )
	local cat_type, cat_code = strmatch( id, "(%d+)!(%d+)" )
	cat_type = tonumber( cat_type )
	cat_code = tonumber( cat_code )
	return cat_type, cat_code
end

function ArkInventory.CategoryCodeJoin( cat_type, cat_code )
	local id = string.format( "%i!%i", cat_type, cat_code )
	return id
end 

function ArkInventory.CategoryCustomAdd( name )
	local t = ArkInventory.Const.Category.Type.Custom
	ArkInventory.db.global.option.category[t].next = ArkInventory.db.global.option.category[t].next + 1
	ArkInventory.db.global.option.category[t].data[ArkInventory.db.global.option.category[t].next] = strtrim( name )
	--ArkInventory.Output( { GREEN_FONT_COLOR_CODE, "Added ", t, " category: ", name } )
	ArkInventory.CategoryGenerate()
end

function ArkInventory.CategoryCustomDelete( id, confirm )
	local t = ArkInventory.Const.Category.Type.Custom
	if confirm == "DELETE" then
		--ArkInventory.Output( { GREEN_FONT_COLOR_CODE, "Delete ", t, " category successful: ", ArkInventory.db.global.option.category[t].data[id], " has been deleted" } )
		ArkInventory.db.global.option.category[t].data[id] = nil
		ArkInventory.CategoryGenerate()
		ArkInventory.Lib.DewDrop:Close()
	else
		ArkInventory.Output( { RED_FONT_COLOR_CODE, "Delete category failed, confirmation not valid" } )
	end
end

function ArkInventory.CategoryCustomRename( id, name )
	local t = ArkInventory.Const.Category.Type.Custom
	--ArkInventory.Output( { "renamed ", t, " category ", id, " to [", name, "]" } )
	ArkInventory.db.global.option.category[t].data[id] = strtrim( name )
	ArkInventory.CategoryGenerate()
end

function ArkInventory.CategoryCustomRestore( category_id )
	local t = ArkInventory.Const.Category.Type.Custom
	local name = abs( category_id ) .. " (restored)"
	ArkInventory.db.global.option.category[t].data[id] = strtrim( name )
	--ArkInventory.Output( { GREEN_FONT_COLOR_CODE, "Restored ", t, " category: ", name } )
	ArkInventory.CategoryGenerate()
end


function ArkInventory.Category_Bar_Insert( loc_id, bar_id )

	for k, v in pairs( ArkInventory.LocationOptionGet( loc_id, { "category" } ) ) do
		if v >= bar_id then
			ArkInventory.Category_Location_Set( loc_id, k, ArkInventory.Category_Location_Get( loc_id, k ) + 1 )
		end
	end
	
end

function ArkInventory.Category_Bar_Remove( loc_id, bar_id )

	for k, v in pairs( ArkInventory.LocationOptionGet( loc_id, { "category" } ) ) do
	
		if v > bar_id then
		
			ArkInventory.Category_Location_Set( loc_id, k, ArkInventory.Category_Location_Get( loc_id, k ) - 1 )
			
		elseif v == bar_id then
			
			local cat_def = ArkInventory.CategoryGetSystemID( "CATEGORY_DEFAULT" )
			
			if k == cat_def then
				-- if the DEFAULT category was on the bar then move it to bar 1
				ArkInventory.Category_Location_Set( loc_id, k, 1 )
			else
				-- erase the location, setting it back to the same as DEFAULT
				ArkInventory.Category_Location_Set( loc_id, k, nil )
			end
			
		end
		
	end

end

function ArkInventory.Category_Bar_Clear( loc_id, bar_id )

	for k, v in pairs( ArkInventory.LocationOptionGet( loc_id, { "category" } ) ) do
		if v == bar_id then
			local cat_def = ArkInventory.CategoryGetSystemID( "CATEGORY_DEFAULT" )
			if k ~= cat_def then
				-- erase the location, setting it back to the same as DEFAULT
				ArkInventory.Category_Location_Set( loc_id, k, nil )
			end
		end
	end
	
end

function ArkInventory.Category_Bar_Up( loc_id, bar_id )

	if bar_id < 1 then
		return
	end

	ArkInventory.Category_Bar_Insert( loc_id, bar_id )

	for k, v in pairs( ArkInventory.LocationOptionGet( loc_id, { "category" } ) ) do
		if v == bar_id + 2 then
			ArkInventory.Category_Location_Set( loc_id, k, bar_id )
		end
	end
	
	ArkInventory.Category_Bar_Remove( loc_id, bar_id + 2 )

end

function ArkInventory.Category_Bar_Down( loc_id, bar_id )
	ArkInventory.Category_Bar_Up( loc_id, bar_id - 1 )
end

function ArkInventory.Category_Bar_HasEntries( loc_id, bar_id, cat_type )

	--ArkInventory.Output( { "loc=[", loc_id, "], bar=[", bar_id, "], type=[", cat_type, "]" } )

	for _, cat in ArkInventory.spairs( ArkInventory.Global.Category ) do

		local t = cat.type_code
		local cat_bar, def_bar = ArkInventory.Category_Location_Get( loc_id, cat.id )
		
		if abs( cat_bar ) == bar_id and not def_bar then
			
			if t == "RULE" and cat_type == t then
				local _, cat_code = ArkInventory.CategoryCodeSplit( cat.id )
				--ArkInventory.Output( { "rule=[", cat_code, "], enabled=[", ArkInventory.db.profile.option.rule[cat_code], "]" } )
				if not ArkInventory.db.profile.option.rule[cat_code] then
					t = "DO_NOT_USE" -- don't display disabled rules
				end
			end
			
			if cat_type == t then
				--ArkInventory.Output( "true" )
				return true
			end
		
		end
	
	end

	--ArkInventory.Output( "false" )
	
end


function ArkInventory.CategoryGetSystemID( cat_name )

	-- internal system category names only, if it doesnt exist you'll get the default instead

	--ArkInventory.Output( { "search=[", cat_name, "]" } )
	
	local cat_def
	
	for _, v in pairs( ArkInventory.Global.Category ) do
		
		--ArkInventory.Output( { "checking=[", v.system, "]" } )
		
		if cat_name == v.system then
			--ArkInventory.Output( { "found=[", cat_name, " = ", v.name, "] = [", v.id, "]" } )
			return v.id
			
		elseif v.system == "CATEGORY_DEFAULT" then
			--ArkInventory.Output( { "default found=[", v.name, "] = [", v.id, "]" } )
			cat_def = v.id
		end
		
	end
	
	--ArkInventory.Output( { "not found=[", cat_name, "] = using default[", cat_def, "]" } )
	return cat_def
	
end


function ArkInventory.ItemCategoryGetDefaultActual( i )

	-- local debuginfo = { ["m"]=gcinfo(), ["t"]=GetTime() }

	local info_name, _, info_rarity, _, _, info_type, info_subtype, _, info_location = ArkInventory.ItemInfoGet( i.h )

	-- no item info
	if info_rarity == nil then
		return nil
	end
	
	local cp = ArkInventory.Global.Me
	
	--ArkInventory.Output( { i.h, " = ", info_type } )
	
	-- trash
	if info_rarity == 0 then
		return ArkInventory.CategoryGetSystemID( "CATEGORY_TRASH" )
	end

	-- setup tooltip for scanning
	local bliz_id = ArkInventory.BagID_Blizzard( i.loc_id, i.bag_id )
	ArkInventory.Global.Tooltip.Scan:SetItem( bliz_id, i.slot_id )

	-- quest items (via type and tooltip)
	if info_type == ArkInventory.Localise["WOW_ITEM_TYPE_QUEST"] or ArkInventory.Global.Tooltip.Scan:Contains( ITEM_BIND_QUEST, false, true, true ) then
		return ArkInventory.CategoryGetSystemID( "WOW_ITEM_TYPE_QUEST" )
	end

	-- projectiles
	if info_location == "INVTYPE_AMMO" or info_type == ArkInventory.Localise["WOW_ITEM_TYPE_PROJECTILE"] then
	
		if info_subtype == ArkInventory.Localise["WOW_ITEM_TYPE_PROJECTILE_BULLET"] then
			return ArkInventory.CategoryGetSystemID( "CATEGORY_PROJECTILE_BULLET" )
		end
		
		if info_subtype == ArkInventory.Localise["WOW_ITEM_TYPE_PROJECTILE_ARROW"] then
			return ArkInventory.CategoryGetSystemID( "CATEGORY_PROJECTILE_ARROW" )
		end

		return ArkInventory.CategoryGetSystemID( "CATEGORY_PROJECTILE" )
		
	end
	
	-- bags / containers
	if info_location == "INVTYPE_BAG" or ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise["PT_CATEGORY_CONTAINER"] ) then
		return ArkInventory.CategoryGetSystemID( "CATEGORY_CONTAINER" )
	end

	-- equipment (armour, weapons, trinkets, tabards, etc, etc)
	if info_location ~= "" then
		if i.sb then
			return ArkInventory.CategoryGetSystemID( "CATEGORY_EQUIPMENT_SOULBOUND" )
		else
			return ArkInventory.CategoryGetSystemID( "CATEGORY_EQUIPMENT" )
		end
	end

	-- soul shards
	if ArkInventory.ItemStringDecode( i.h ) == 6265 or ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise["PT_CATEGORY_SOULSHARD"] ) then
		return ArkInventory.CategoryGetSystemID( "CATEGORY_SOULSHARD" )
	end

	-- keys
	if info_type == ArkInventory.Localise["WOW_ITEM_TYPE_KEY"] or ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise["PT_CATEGORY_KEY"] ) then
		return ArkInventory.CategoryGetSystemID( "WOW_ITEM_TYPE_KEY" )
	end
	
	-- class requirement via tooltip
	local ctext = "^" .. string.gsub( ITEM_CLASSES_ALLOWED, "%%s", "(.+)", 1 )
	local _, _, req = ArkInventory.Global.Tooltip.Scan:Find( ctext, false, true, true )
	if req then
		for w in pairs( RAID_CLASS_COLORS ) do
			local key = string.format( "WOW_CLASS_%s", w )
			if ArkInventory.Localise:HasTranslation( key ) then
				if strfind( req, ArkInventory.Localise[key] ) then
					return ArkInventory.CategoryGetSystemID( key )
				end
			end
		end
	end


	-- gems
	if info_type == ArkInventory.Localise["WOW_ITEM_TYPE_GEM"] then
		return ArkInventory.CategoryGetSystemID( "WOW_ITEM_TYPE_GEM" )
	end
	
	if info_type == ArkInventory.Localise["WOW_ITEM_TYPE_CONSUMABLE"] then
	
		if info_subtype == ArkInventory.Localise["WOW_ITEM_TYPE_CONSUMABLE_FOOD_AND_DRINK"] then
		
			if ArkInventory.Global.Tooltip.Scan:Contains( ArkInventory.Localise["WOW_ITEM_TOOLTIP_FOOD"] ) then
				return ArkInventory.CategoryGetSystemID( "CATEGORY_CONSUMABLE_FOOD" )
			end
			
			if ArkInventory.Global.Tooltip.Scan:Contains( ArkInventory.Localise["WOW_ITEM_TOOLTIP_DRINK"] ) then
				return ArkInventory.CategoryGetSystemID( "CATEGORY_CONSUMABLE_DRINK" )
			end
			
			if ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise["PT_CATEGORY_CONSUMABLE_FOOD"] ) then
				return ArkInventory.CategoryGetSystemID( "CATEGORY_CONSUMABLE_FOOD" )
			end
			
			if ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise["PT_CATEGORY_CONSUMABLE_DRINK"] ) then
				return ArkInventory.CategoryGetSystemID( "CATEGORY_CONSUMABLE_DRINK" )
			end
		
			return ArkInventory.CategoryGetSystemID( "WOW_ITEM_TYPE_CONSUMABLE_FOOD_AND_DRINK" )
			
		end
		
		if info_subtype == ArkInventory.Localise["WOW_ITEM_TYPE_CONSUMABLE_POTION"] then
			
			if ArkInventory.Global.Tooltip.Scan:Contains( ArkInventory.Localise["WOW_ITEM_TOOLTIP_POTION_HEAL"] ) or ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise["PT_CATEGORY_POTION_HEAL"] ) then
				return ArkInventory.CategoryGetSystemID( "CATEGORY_CONSUMABLE_POTION_HEAL" )
			end
			
			if ArkInventory.Global.Tooltip.Scan:Contains( ArkInventory.Localise["WOW_ITEM_TOOLTIP_POTION_MANA"] ) or ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise["PT_CATEGORY_POTION_MANA"] ) then
				return ArkInventory.CategoryGetSystemID( "CATEGORY_CONSUMABLE_POTION_MANA" )
			end
			
			return ArkInventory.CategoryGetSystemID( "WOW_ITEM_TYPE_CONSUMABLE_POTION" )
			
		end
		
		if info_subtype == ArkInventory.Localise["WOW_ITEM_TYPE_CONSUMABLE_ELIXIR"] then
		
			if ArkInventory.Global.Tooltip.Scan:Contains( ArkInventory.Localise["WOW_ITEM_TOOLTIP_ELIXIR_BATTLE"] ) then
				return ArkInventory.CategoryGetSystemID( "CATEGORY_CONSUMABLE_ELIXIR_BATTLE" )
			end
			
			if ArkInventory.Global.Tooltip.Scan:Contains( ArkInventory.Localise["WOW_ITEM_TOOLTIP_ELIXIR_GUARDIAN"] ) then
				return ArkInventory.CategoryGetSystemID( "CATEGORY_CONSUMABLE_ELIXIR_GUARDIAN" )
			end
			
			return ArkInventory.CategoryGetSystemID( "WOW_ITEM_TYPE_CONSUMABLE_ELIXIR" )
			
		end
		
		if info_subtype == ArkInventory.Localise["WOW_ITEM_TYPE_CONSUMABLE_FLASK"] then
			return ArkInventory.CategoryGetSystemID( "WOW_ITEM_TYPE_CONSUMABLE_FLASK" )
		end
		
		if info_subtype == ArkInventory.Localise["WOW_ITEM_TYPE_CONSUMABLE_BANDAGE"] then
			return ArkInventory.CategoryGetSystemID( "WOW_ITEM_TYPE_CONSUMABLE_BANDAGE" )
		end
		
		if info_subtype == ArkInventory.Localise["WOW_ITEM_TYPE_CONSUMABLE_SCROLL"] then
			return ArkInventory.CategoryGetSystemID( "WOW_ITEM_TYPE_CONSUMABLE_SCROLL" )
		end
		
	end

	if info_type == ArkInventory.Localise["WOW_ITEM_TYPE_TRADE_GOODS"] then

		local t = "DEVICES,EXPLOSIVES,PARTS,HERB,CLOTH,ELEMENTAL,LEATHER,MEAT,METAL_AND_STONE,MATERIALS,ENCHANTMENT_ARMOR,ENCHANTMENT_WEAPON"
		
		for w in string.gmatch( t, "[^,]+" ) do
			local key = string.format( "WOW_ITEM_TYPE_TRADE_GOODS_%s", w )
			if ArkInventory.Localise:HasTranslation( key ) then
				if info_subtype == ArkInventory.Localise[key] then
					return ArkInventory.CategoryGetSystemID( key )
				end
			end
		end
		
		if info_subtype == ArkInventory.Localise["WOW_SKILL_ENCHANTING"] then
			return ArkInventory.CategoryGetSystemID( "WOW_SKILL_ENCHANTING" )
		end
		
		if info_subtype == ArkInventory.Localise["WOW_SKILL_JEWELCRAFTING"] then
			return ArkInventory.CategoryGetSystemID( "WOW_SKILL_JEWELCRAFTING" )
		end
	
	end

	if info_type == ArkInventory.Localise["WOW_ITEM_TYPE_RECIPE"] then
		return ArkInventory.CategoryGetSystemID( "WOW_ITEM_TYPE_RECIPE" )
	end

	-- skill requirement (via tooltip)
	-- ITEM_MIN_SKILL = "Requires %1$s (%2$d)"; -- Required skill rank to use the item
	local ctext = string.gsub( ITEM_MIN_SKILL, "1%$", "", 1 )
	local ctext = string.gsub( ctext, "2%$", "", 1 )
	local ctext = string.gsub( ctext, "%%s", "(.+)", 1 )
	local ctext = "^" .. string.gsub( ctext, "%(%%d%)", "%%(%%d+%%)", 1 )
	--ArkInventory.Output( ctext )
	--local _, _, req = ArkInventory.Global.Tooltip.Scan:Find( ArkInventory.Localise["WOW_TOOLTIP_REQUIRES"], false, false, true )
	local _, _, req = ArkInventory.Global.Tooltip.Scan:Find( ctext, false, true, true )
	if req then
		for w in string.gmatch( ArkInventory.Const.Skills, "[^,]+" ) do
			local key = string.format( "WOW_SKILL_%s", w )
			if ArkInventory.Localise:HasTranslation( key ) then
				if strfind( req, ArkInventory.Localise[key] ) then
					return ArkInventory.CategoryGetSystemID( key )
				end
			end
		end
	end
	
	if info_type == ArkInventory.Localise["WOW_ITEM_TYPE_MISC"] then
	
		if info_subtype == ArkInventory.Localise["WOW_ITEM_TYPE_MISC_REAGENT"] then
			return ArkInventory.CategoryGetSystemID( "WOW_ITEM_TYPE_MISC_REAGENT" )
		end
		
		if info_subtype == ArkInventory.Localise["WOW_ITEM_TYPE_MISC_PET"] or ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise["PT_CATEGORY_VANITYPET"] ) then
			return ArkInventory.CategoryGetSystemID( "WOW_ITEM_TYPE_MISC_PET" )
		end
		
		-- mounts
		if info_subtype == ArkInventory.Localise["WOW_ITEM_TYPE_MISC_MOUNT"] or ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise["PT_CATEGORY_MOUNT"] ) then
			return ArkInventory.CategoryGetSystemID( "CATEGORY_SKILL_RIDING" )
		end
		
	end


	-- class via periodictable (check this characters class first)
	local key = string.format( "PT_CLASS_%s", cp.info.class )
	if ArkInventory.Localise:HasBaseTranslation( key ) then
		if ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise[key] ) then
			return ArkInventory.CategoryGetSystemID( "WOW_CLASS_" .. cp.info.class )
		end
	end

	-- class via periodictable (check all classes)
	for w in pairs( RAID_CLASS_COLORS ) do
		local key = string.format( "PT_CLASS_%s", w )
		if ArkInventory.Localise:HasBaseTranslation( key ) then
			if ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise[key] ) then
				return ArkInventory.CategoryGetSystemID( "WOW_CLASS_" .. w )
			end
		end
	end
	
	
	-- skill requirement - cycle through the users skills and allocate items to those profressions first
	for k, w in ipairs( cp.info.skills ) do
		local key = string.format( "PT_SKILL_%s", w )
		if ArkInventory.Localise:HasBaseTranslation( key ) then
			if ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise[key] ) then
				return ArkInventory.CategoryGetSystemID( "WOW_SKILL_" .. w )
			end
		end
	end

	-- skill requirement - do the rest
	for w in string.gmatch( ArkInventory.Const.Skills, "[^,]+" ) do
		local key = string.format( "PT_SKILL_%s", w )
		if ArkInventory.Localise:HasBaseTranslation( key ) then
			if ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise[key] ) then
				return ArkInventory.CategoryGetSystemID( "WOW_SKILL_" .. w )
			end
		end
	end

	
	-- reputation hand-ins
	if ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise["PT_CATEGORY_REPUTATION"] ) then
		return ArkInventory.CategoryGetSystemID( "CATEGORY_REPUTATION" )
	end

	-- quest items (via PT)
	if ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise["PT_CATEGORY_QUEST"] ) then
		return ArkInventory.CategoryGetSystemID( "WOW_ITEM_TYPE_QUEST" )
	end

	if info_type == ArkInventory.Localise["WOW_ITEM_TYPE_TRADE_GOODS"] then
		return ArkInventory.CategoryGetSystemID( "CATEGORY_TRADE_GOODS" )
	end

	if info_type == ArkInventory.Localise["WOW_ITEM_TYPE_CONSUMABLE"] then
		return ArkInventory.CategoryGetSystemID( "CATEGORY_CONSUMABLE" )
	end

	-- soulbound items
	if i.sb then
		return ArkInventory.CategoryGetSystemID( "CATEGORY_SOULBOUND" )
	end

	if info_type == ArkInventory.Localise["WOW_ITEM_TYPE_MISC"] then
		return ArkInventory.CategoryGetSystemID( "WOW_ITEM_TYPE_MISC" )
	end

	return ArkInventory.CategoryGetSystemID( "CATEGORY_DEFAULT" )
	
end

function ArkInventory.ItemCategoryGetDefaultEmpty( loc_id, bag_id )

	local clump = ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "clump" } )
	
	local bliz_id = ArkInventory.BagID_Blizzard( loc_id, bag_id )
	local bt = ArkInventory.BagType( bliz_id )
	
	--ArkInventory.Output( { "loc[", loc_id, "] bag[", bag_id, " / ", bliz_id, "] type[", bt, "]" } )
	
	if bt == ArkInventory.Const.Slot.Type.Bag then
		if clump then
			return ArkInventory.CategoryGetSystemID( "CATEGORY_EMPTY" )
		else
			return ArkInventory.CategoryGetSystemID( "CATEGORY_EMPTY_BAG" )
		end
	end
	
	if bt == ArkInventory.Const.Slot.Type.Bullet then
		if clump then
			return ArkInventory.CategoryGetSystemID( "CATEGORY_PROJECTILE_BULLET" )
		else
			return ArkInventory.CategoryGetSystemID( "CATEGORY_EMPTY_PROJECTILE_BULLET" )
		end
	end
	
	if bt == ArkInventory.Const.Slot.Type.Arrow then
		if clump then
			return ArkInventory.CategoryGetSystemID( "CATEGORY_PROJECTILE_ARROW" )
		else
			return ArkInventory.CategoryGetSystemID( "CATEGORY_EMPTY_PROJECTILE_ARROW" )
		end
	end
	
	if bt == ArkInventory.Const.Slot.Type.Key then
		if clump then
			return ArkInventory.CategoryGetSystemID( "WOW_ITEM_TYPE_KEY" )
		else
			return ArkInventory.CategoryGetSystemID( "CATEGORY_EMPTY_KEY" )
		end
	end
	
	if bt == ArkInventory.Const.Slot.Type.Soulshard then
		if clump then
			return ArkInventory.CategoryGetSystemID( "CATEGORY_SOULSHARD" )
		else
			return ArkInventory.CategoryGetSystemID( "CATEGORY_EMPTY_SOULSHARD" )
		end
	end
	
	if bt == ArkInventory.Const.Slot.Type.Herb then
		if clump then
			return ArkInventory.CategoryGetSystemID( "CATEGORY_SKILL_HERBALISM" )
		else
			return ArkInventory.CategoryGetSystemID( "CATEGORY_EMPTY_HERB" )
		end
	end
	
	if bt == ArkInventory.Const.Slot.Type.Enchanting then
		if clump then
			return ArkInventory.CategoryGetSystemID( "CATEGORY_SKILL_ENCHANTING" )
		else
			return ArkInventory.CategoryGetSystemID( "CATEGORY_EMPTY_ENCHANTING" )
		end
	end
	
	if bt == ArkInventory.Const.Slot.Type.Engineering then
		if clump then
			return ArkInventory.CategoryGetSystemID( "CATEGORY_SKILL_ENGINEERING" )
		else
			return ArkInventory.CategoryGetSystemID( "CATEGORY_EMPTY_ENGINEERING" )
		end
	end
	
	if bt == ArkInventory.Const.Slot.Type.Gem then
		if clump then
			return ArkInventory.CategoryGetSystemID( "CATEGORY_SKILL_JEWELCRAFTING" )
		else
			return ArkInventory.CategoryGetSystemID( "CATEGORY_EMPTY_GEM" )
		end
	end
	
	if bt == ArkInventory.Const.Slot.Type.Mining then
		if clump then
			return ArkInventory.CategoryGetSystemID( "CATEGORY_SKILL_MINING" )
		else
			return ArkInventory.CategoryGetSystemID( "CATEGORY_EMPTY_MINING" )
		end
	end
	
	if bt == ArkInventory.Const.Slot.Type.Leatherworking then
		if clump then
			return ArkInventory.CategoryGetSystemID( "CATEGORY_SKILL_LEATHERWORKING" )
		else
			return ArkInventory.CategoryGetSystemID( "CATEGORY_EMPTY_LEATHERWORKING" )
		end
	end

	if bt == ArkInventory.Const.Slot.Type.Inscription then
		if clump then
			return ArkInventory.CategoryGetSystemID( "CATEGORY_SKILL_INSCRIPTION" )
		else
			return ArkInventory.CategoryGetSystemID( "CATEGORY_EMPTY_INSCRIPTION" )
		end
	end

	
	if clump then
		return ArkInventory.CategoryGetSystemID( "CATEGORY_EMPTY" )
	else
		return ArkInventory.CategoryGetSystemID( "CATEGORY_EMPTY_UNKNOWN" )
	end
	
	ArkInventory.Output( "code failure, should never get here" )
	
end

function ArkInventory.ItemCategoryGetDefault( i )
	
	-- items cache id
	local id = ArkInventory.ItemGetCacheIDCategory( i )
	
	-- if the value has not been cached yet then get it and cache it
	if not ArkInventory.Global.Cache.Default[id] then
		if i.h then
			ArkInventory.Global.Cache.Default[id] = ArkInventory.ItemCategoryGetDefaultActual( i )
		else
			ArkInventory.Global.Cache.Default[id] = ArkInventory.ItemCategoryGetDefaultEmpty( i.loc_id, i.bag_id )
		end
	end
	
	return ArkInventory.Global.Cache.Default[id]
	
end


function ArkInventory.ItemCategoryGetRule( i, bt, bag_id, slot_id )

	-- local debuginfo = { ["m"]=gcinfo(), ["t"]=GetTime() }

	-- ArkInventory.Output( "ItemCategoryGetRule() start" )
	
	-- check rules
	local r = ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data
	
	for rulenum in ArkInventory.spairs( r, function(a,b) return r[a].order < r[b].order end ) do
		
		local a, em = ArkInventory.RuleAppliesToItem( rulenum, i )

		if em == nil then
		
			if a == true then
				local id = ArkInventory.CategoryCodeJoin( ArkInventory.Const.Category.Type.Rule, rulenum )
				return id
			end
		
		else
		
			ArkInventory.Output( { RED_FONT_COLOR_CODE, string.format( ArkInventory.Localise["RULE_DAMAGED"], rulenum ) } )
			
			ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data[rulenum].damaged = true
			
			ArkInventory.Output( em )
			
		end
		
	end
	
	-- ArkInventory.Output( "ItemCategoryGetRule() end", debuginfo )

	return nil
	
end

function ArkInventory.ItemCategoryGetPrimary( i )
	
	i["cat"] = nil
	
	-- ignore empty slots, they only have a default category
	if not i.h then
		return
	end

	local id
	
	-- items category cache id
	id = ArkInventory.ItemGetCacheIDCategory( i )
	
	-- manually assigned item to a category?
	if ArkInventory.db.profile.option.category[id] then
		i["cat"] = ArkInventory.db.profile.option.category[id]
		return
	end
	
	-- items rule cache id
	id = ArkInventory.ItemGetCacheIDRule( i )
	
	-- if the value has already been cached then use it
	if ArkInventory.Global.Cache.Rule[id] then
		i["cat"] = ArkInventory.Global.Cache.Rule[id]
		return
	end
	
	-- check for any rule that applies to the item
	local rs = ArkInventory.ItemCategoryGetRule( i )
	if rs then
		-- cache the result
		ArkInventory.Global.Cache.Rule[id] = rs
		i["cat"] = ArkInventory.Global.Cache.Rule[id]
		return
	end
	
end

function ArkInventory.ItemCategorySet( i, cat_id )

	-- set cat_id to nil to reset back to default
	
	local id = ArkInventory.ItemGetCacheIDCategory( i )
	ArkInventory.db.profile.option.category[id] = cat_id
	
	--i["cat"] = cat_id
	ArkInventory.ItemCategoryReload( nil, nil )
	
end

function ArkInventory.ItemCategoryReload( arg1, arg2 )

	-- reloads categories for all items for this character
	-- arg1 = location id
	-- arg2 = only reload empty slots
	
	for loc_id, location in pairs( ArkInventory.Global.Me.location ) do
		if arg1 == nil or arg1 == loc_id then
			for bag_id, bag in pairs( location.bag ) do
				for slot_id, i in pairs( bag.slot ) do
					if ( not arg2 ) or ( arg2 and i.h == nil ) then
						i["cat"] = nil
						ArkInventory.ItemCategoryGet( i )
					end
				end
			end
		end
	end

end

function ArkInventory.ItemCategoryGet( i )

	if not i.cat then
		ArkInventory.ItemCategoryGetPrimary( i )
	end
	
	local default = ArkInventory.ItemCategoryGetDefault( i )
	local unknown = ArkInventory.CategoryGetSystemID( "CATEGORY_UNKNOWN" )
	
	return i.cat or default or unknown, i.cat, default or unknown
	
end

function ArkInventory.ReverseName( n )

	if n and type( n ) == "string" then

		local s = { }

		for w in string.gmatch( n, "%S+" ) do
			tinsert( s, 1, w )
		end

		return table.concat( s, " " )
		
	end

end

function ArkInventory.ItemCacheClear()

	-- clear all rule information
	ArkInventory.Table.Clean( ArkInventory.Global.Cache.Rule )
	--ArkInventory.Global.Cache.Rule = { }
	
	ArkInventory.Table.Clean( ArkInventory.Global.Cache.Default )
	--ArkInventory.Global.Cache.Default = { }
	
	ArkInventory.CategoryGenerate() --zzzzzzzz still need this?
	ArkInventory.LocationSetValue( nil, "resort", true )
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
	
end

function ArkInventory.Frame_Main_DrawStatus( loc_id, level )

	if level == nil then
		level = ArkInventory.Const.Window.Draw.None
	end
		
	if ArkInventory.Global.Location[loc_id] and ArkInventory.Global.Location[loc_id].canView then
		if level < ArkInventory.Global.Location[loc_id].drawState then
			ArkInventory.Global.Location[loc_id].drawState = level
		end
	end
end

function ArkInventory.Frame_Main_Generate( location, drawstatus )
	
	for loc_id in ipairs( ArkInventory.Global.Location ) do
		
		if not location or loc_id == location then
			ArkInventory.Frame_Main_DrawStatus( loc_id, drawstatus )
			ArkInventory.Frame_Main_DrawLocation( loc_id )
		end
	
	end
	
end

function ArkInventory.Frame_Main_DrawLocation( loc_id )
	local frame = ArkInventory.Frame_Main_Get( loc_id )
	ArkInventory.Frame_Main_Draw( frame )
end



function ArkInventory.PutItemInBank()

	if CursorHasItem() then
		
		for x = 1, GetContainerNumSlots( BANK_CONTAINER ) do
			h = GetContainerItemLink( BANK_CONTAINER, x )
			if not h then
				if not PickupContainerItem( BANK_CONTAINER, x ) then
					ClearCursor()
				end
				return
			end
		end
		
		UIErrorsFrame:AddMessage( ERR_BAG_FULL, 1.0, 0.1, 0.1, 1.0 )
		ClearCursor()
		
	end
	
end

function ArkInventory.PutItemInGuildBank( tab_id )

	if CursorHasItem() then
		
		local loc_id = ArkInventory.Const.Location.Vault
		local _, _, _, canDeposit = GetGuildBankTabInfo( tab_id )

		if canDeposit then
		
			ArkInventory.Output( { "PutItemInGuildBank( ", tab_id, " )" } )
		
			local ctab = GetCurrentGuildBankTab()
		
			if tab_id ~= ctab then
				SetCurrentGuildBankTab( tab_id )
				ArkInventory.QueryVault( tab_id )
			end

			for x = 1, MAX_GUILDBANK_SLOTS_PER_TAB do
				h = GetGuildBankItemLink( tab_id, x )
				if not h then
					if not PickupGuildBankItem( tab_id, x ) then --AutoStoreGuildBankItem
						ClearCursor()
					end
					return
				end
			end
		
			UIErrorsFrame:AddMessage( ERR_BAG_FULL, 1.0, 0.1, 0.1, 1.0 )
			ClearCursor()
			
		end
		
	end
	
end

function ArkInventory.SetItemButtonStock( frame, count )
	
	if not frame then
		return
	end
	
	local obj = getfenv()[frame:GetName() .. "Stock"]
	if not obj then
		return
	end
	
	obj:SetText( "" )
	obj.numInStock = 0
	
	local loc_id = frame.ARK_Data.loc_id
	
	if ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "show" } ) then
	
		if count ~= nil and count > 0 then
			obj:SetText( count )
			obj.numInStock = count
		elseif count == 0 then
			obj:SetText( ArkInventory.Localise["STATUS_FULL"] )
		elseif count == ArkInventory.Const.Bag.Status.Purchase then
			obj:SetText( ArkInventory.Localise["STATUS_PURCHASE"] )
		elseif count == ArkInventory.Const.Bag.Status.Unknown then
			obj:SetText( ArkInventory.Localise["STATUS_NO_DATA"] )
		end
	
		local colour = ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "colour" } )
		obj:SetTextColor( colour.r, colour.g, colour.b )
		
		obj:Show()
		
	else
	
		obj:Hide()
		
	end
	
end

function ArkInventory.ValidFrame( frame, visible, db )

	if frame and frame.ARK_Data and frame.ARK_Data.loc_id then
		
		local res1 = true
		if db then
			local i = ArkInventory.Frame_Item_GetDB( frame )
			if i == nil then
				res1 = false
			end
		end
		
		local res2 = true
		if visible and not frame:IsVisible() then
			res2 = false
		end

		return res1 and res2
		
	end

	return false
	
end

function ArkInventory.Frame_Main_Get( loc_id )

	local framename = ArkInventory.Const.Frame.Main.Name .. loc_id
	local frame = getfenv()[framename]
	assert( frame, "xml element '" .. framename .. "' could not be found" )
	
	return frame

end
	
function ArkInventory.Frame_Main_Scale( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local loc_id = frame.ARK_Data.loc_id

	local old_scale = frame:GetScale()
	local new_scale = ArkInventory.LocationOptionGet( loc_id, { "window", "scale" } )
	local rescale
	
	if old_scale ~= new_scale then
		--rescale = old_scale / new_scale
		frame:SetScale( new_scale )
	end

	ArkInventory.Frame_Main_Anchor_Set( loc_id, rescale )

end
	
function ArkInventory.Frame_Main_Scale_All()
	for loc_id in ipairs( ArkInventory.Global.Location ) do
		frame = ArkInventory.Frame_Main_Get( loc_id )
		ArkInventory.Frame_Main_Scale( frame )
	end
end

function ArkInventory.Frame_Main_Offline( frame )
	
	local loc_id = frame.ARK_Data.loc_id
	
	--ArkInventory.Output( { "loc_playerid=[", ArkInventory.Global.Location[loc_id].player_id, "] player_id=[", ArkInventory.Global.Me.info.player_id, "] guild_id=[", ArkInventory.Global.Me.info.guild_id, "]" } )
	
	if ArkInventory.Global.Location[loc_id].player_id == ArkInventory.Global.Me.info.player_id or ArkInventory.Global.Location[loc_id].player_id == ArkInventory.Global.Me.info.guild_id then
	
		ArkInventory.Global.Location[loc_id].isOffline = false
		
		if loc_id == ArkInventory.Const.Location.Bank and ArkInventory.Global.Mode.Bank == false then
			ArkInventory.Global.Location[loc_id].isOffline = true
		end
		
		if loc_id == ArkInventory.Const.Location.Vault and ArkInventory.Global.Mode.Vault == false then
			ArkInventory.Global.Location[loc_id].isOffline = true
		end
		
		if loc_id == ArkInventory.Const.Location.Mail or loc_id == ArkInventory.Const.Location.Wearing then
			ArkInventory.Global.Location[loc_id].isOffline = true
		end
		
	else
	
		ArkInventory.Global.Location[loc_id].isOffline = true
		
	end
	
end

function ArkInventory.Frame_Main_Anchor_Set( loc_id, rescale )

	local frame = ArkInventory.Frame_Main_Get( loc_id )
	local anchor = ArkInventory.LocationOptionGet( loc_id, { "anchor", loc_id, "point" } )

	local t = ArkInventory.LocationOptionGet( loc_id, { "anchor", loc_id, "t" } ) * ( rescale or 1 )
	local b = ArkInventory.LocationOptionGet( loc_id, { "anchor", loc_id, "b" } ) * ( rescale or 1 )
	local l = ArkInventory.LocationOptionGet( loc_id, { "anchor", loc_id, "l" } ) * ( rescale or 1 )
	local r = ArkInventory.LocationOptionGet( loc_id, { "anchor", loc_id, "r" } ) * ( rescale or 1 )
	
	local f1 = getfenv()[frame:GetName() .. ArkInventory.Const.Frame.Title.Name]
	local f2 = getfenv()[frame:GetName() .. ArkInventory.Const.Frame.Search.Name]
	local f3 = getfenv()[frame:GetName() .. ArkInventory.Const.Frame.Container.Name]
	local f4 = getfenv()[frame:GetName() .. ArkInventory.Const.Frame.Changer.Name]
	local f5 = getfenv()[frame:GetName() .. ArkInventory.Const.Frame.Status.Name]
	
	frame:ClearAllPoints()
	f1:ClearAllPoints()
	f2:ClearAllPoints()
	f3:ClearAllPoints()
	f4:ClearAllPoints()
	f5:ClearAllPoints()

	if anchor == ArkInventory.Const.Anchor.BottomRight then
		
		frame:SetPoint( "BOTTOMRIGHT", nil, "BOTTOMLEFT", r, b )
		
		f5:SetPoint( "BOTTOMRIGHT", frame )
		f5:SetPoint( "LEFT", frame )
		
		f4:SetPoint( "BOTTOMRIGHT", f5, "TOPRIGHT", 0, -3 )
		f4:SetPoint( "LEFT", frame )
		
		f3:SetPoint( "BOTTOMRIGHT", f4, "TOPRIGHT", 0, -3 )
		f3:SetPoint( "LEFT", frame )
		
		f2:SetPoint( "BOTTOMRIGHT", f3, "TOPRIGHT", 0, -4 )
		f2:SetPoint( "LEFT", frame )

		f1:SetPoint( "BOTTOMRIGHT", f2, "TOPRIGHT", 0, -3 )
		f1:SetPoint( "LEFT", frame )

	elseif anchor == ArkInventory.Const.Anchor.BottomLeft then
	
		frame:SetPoint( "BOTTOMLEFT", nil, "BOTTOMLEFT", l, b )

		f5:SetPoint( "BOTTOMLEFT", frame )
		f5:SetPoint( "RIGHT", frame )
		
		f4:SetPoint( "BOTTOMLEFT", f5, "TOPLEFT", 0, -3 )
		f4:SetPoint( "RIGHT", frame )
		
		f3:SetPoint( "BOTTOMLEFT", f4, "TOPLEFT", 0, -3 )
		f3:SetPoint( "RIGHT", frame )
		
		f2:SetPoint( "BOTTOMLEFT", f3, "TOPLEFT", 0, -4 )
		f2:SetPoint( "RIGHT", frame )

		f1:SetPoint( "BOTTOMLEFT", f2, "TOPLEFT", 0, -3 )
		f1:SetPoint( "RIGHT", frame )

	elseif anchor == ArkInventory.Const.Anchor.TopLeft then
		
		frame:SetPoint( "TOPLEFT", nil, "BOTTOMLEFT", l, t )
		
		f1:SetPoint( "TOPLEFT", frame )
		f1:SetPoint( "RIGHT", frame )

		f2:SetPoint( "TOPLEFT", f1, "BOTTOMLEFT", 0, 3 )
		f2:SetPoint( "RIGHT", frame )

		f3:SetPoint( "TOPLEFT", f2, "BOTTOMLEFT", 0, 4 )
		f3:SetPoint( "RIGHT", frame )

		f4:SetPoint( "TOPLEFT", f3, "BOTTOMLEFT", 0, 3 )
		f4:SetPoint( "RIGHT", frame )
		
		f5:SetPoint( "TOPLEFT", f4, "BOTTOMLEFT", 0, 3 )
		f5:SetPoint( "RIGHT", frame )

	else -- anchor == ArkInventory.Const.Anchor.TopRight then
		
		frame:SetPoint( "TOPRIGHT", nil, "BOTTOMLEFT", r, t )
		
		f1:SetPoint( "TOPRIGHT", frame )
		f1:SetPoint( "LEFT", frame )
		
		f2:SetPoint( "TOPRIGHT", f1, "BOTTOMRIGHT", 0, 3 )
		f2:SetPoint( "LEFT", frame )
		
		f3:SetPoint( "TOPRIGHT", f2, "BOTTOMRIGHT", 0, 4 )
		f3:SetPoint( "LEFT", frame )
		
		f4:SetPoint( "TOPRIGHT", f3, "BOTTOMRIGHT", 0, 3 )
		f4:SetPoint( "LEFT", frame )
		
		f5:SetPoint( "TOPRIGHT", f4, "BOTTOMRIGHT", 0, 3 )
		f5:SetPoint( "LEFT", frame )
		
	end

	if ArkInventory.LocationOptionGet( loc_id, { "anchor", loc_id, "locked" } ) then
		frame:RegisterForDrag()
	else
		frame:RegisterForDrag( "LeftButton" )
	end

	if rescale then
		ArkInventory.Frame_Main_Anchor_Save( frame )
	end
	
	if ElvUI then
		local eb = _G[f2:GetName().."Filter"]
		if eb then
			ElvUI[1]:GetModule("Skins"):HandleEditBox(eb)
		end
	end
	
end

function ArkInventory.Frame_Main_Paint( frame )
	
	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local loc_id = frame.ARK_Data.loc_id
	
	for _, z in pairs( { frame:GetChildren() } ) do
		
		-- background colour
		local obj = getfenv()[z:GetName() .. "Background"]
		if obj then
			local colour = ArkInventory.LocationOptionGet( loc_id, { "window", "colour", "background" } )
			obj:SetTexture( colour.r, colour.g, colour.b, colour.a )
		end
		
		-- border
		if ArkInventory.LocationOptionGet( loc_id, { "window", "border", "show" } ) then
		
			local borderDefault = "Tooltip"
			local borderCustom = "Custom"
			local style = ArkInventory.LocationOptionGet( loc_id, { "window", "border", "style" } ) or borderDefault
			local file, size, scale
			if style == borderCustom then
				file = ArkInventory.LocationOptionGet( loc_id, { "window", "border", "file" } ) or ArkInventory.Const.Texture.Border[borderDefault].file
				size = ArkInventory.LocationOptionGet( loc_id, { "window", "border", "size" } ) or ArkInventory.Const.Texture.Border[borderDefault].size
				scale = ArkInventory.LocationOptionGet( loc_id, { "window", "border", "scale" } ) or 1
			else
				file = ArkInventory.Const.Texture.Border[style].file
				size = ArkInventory.Const.Texture.Border[style].size
				scale = 1
			end
			z:SetBackdrop( { ["edgeFile"] = file, ["edgeSize"] = size * scale } )
		
			local colour = ArkInventory.LocationOptionGet( loc_id, { "window", "colour", "border" } )
			z:SetBackdropBorderColor( colour.r, colour.g, colour.b, 1 )
			
		else
		
			z:SetBackdrop( { ["edgeFile"] = "" } )
			
		end
		
	end
	
end

function ArkInventory.Frame_Main_Paint_All()

	for loc_id, loc_data in ipairs( ArkInventory.Global.Location ) do
		frame = ArkInventory.Frame_Main_Get( loc_id )
		ArkInventory.Frame_Main_Paint( frame )
	end
	
end

function ArkInventory.Frame_Main_Update( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end
	
	local loc_id = frame.ARK_Data.loc_id

	ArkInventory.Frame_Status_Update( frame )
	
	-- set the size of the window
	local h = 0
	h = h + getfenv()[frame:GetName() .. ArkInventory.Const.Frame.Title.Name]:GetHeight()
	h = h + getfenv()[frame:GetName() .. ArkInventory.Const.Frame.Container.Name]:GetHeight()
	h = h + getfenv()[frame:GetName() .. ArkInventory.Const.Frame.Changer.Name]:GetHeight()
	h = h + getfenv()[frame:GetName() .. ArkInventory.Const.Frame.Status.Name]:GetHeight()
	frame:SetHeight( h )
	
	frame:SetWidth( ArkInventory.Global.Location[loc_id].Layout.container.width )
	
	ArkInventory.Frame_Main_Scale( frame )
	
end

function ArkInventory.Frame_Main_Draw( frame )

	if not frame:IsVisible() then
		return
	end
	
	--ArkInventory.Output( { "Frame_Main_Draw( ", frame:GetName(), " ) @ ", frame:GetFrameLevel() } )
	
	local loc_id = frame.ARK_Data.loc_id
	
	if not ArkInventory.Global.Location[loc_id].canView then
		-- not a controllable window (for scanning only)
		-- shouldnt ever get here, but just in case
		frame:Hide()
		return
	end
	
	-- is the window online or offline?
	ArkInventory.Frame_Main_Offline( frame )
	
	-- changer frame
	local obj = getfenv()[frame:GetName() .. ArkInventory.Const.Frame.Changer.Name]
	
	-- shrink and hide the changer frame if it can't be used
	if not ArkInventory.Global.Location[loc_id].hasChanger or ArkInventory.LocationOptionGet( loc_id, { "framehide", "changer" } ) then
		obj:SetHeight( 3 )
		obj:Hide()
	else
		obj:SetHeight( ArkInventory.Const.Frame.Changer.Height )
		obj:Show()
	end

	-- vault tab changed
	if loc_id == ArkInventory.Const.Location.Vault then
		if ArkInventory.Global.Location[loc_id].current_tab ~= GetCurrentGuildBankTab() then
			ArkInventory.Global.Location[loc_id].current_tab = GetCurrentGuildBankTab()
			ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
		end
	end
	
	-- if changer frame is open then make sure they're updated
	if obj:IsVisible() then
		ArkInventory.Frame_Changer_Update( loc_id )
	end

	
	-- edit mode
	if ArkInventory.Global.Mode.Edit then
		ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
	end

	
	-- bag data has changed
	if ArkInventory.Global.Location[loc_id].changed then

		ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	
		ArkInventory.ItemCategoryReload( loc_id )
	
		-- instant sort
		if ArkInventory.LocationOptionGet( loc_id, { "sort", "instant" } ) then
			ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
		end

		ArkInventory.Global.Location[loc_id].changed = false

	end

	
	-- rebuild category and sort values
	if ArkInventory.Global.Location[loc_id].resort then
	
		ArkInventory.ItemSortKeyClear( loc_id )

		ArkInventory.Global.Location[loc_id].resort = false
	
		ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
		
	end
	
	
	-- guild bank item and money logs
	if loc_id == ArkInventory.Const.Location.Vault then
	
		if GuildBankFrame.mode == "log" or GuildBankFrame.mode == "moneylog" then
			
			obj = getfenv()[frame:GetName() .. ArkInventory.Const.Frame.Container.Name]
			obj:Hide()

			obj = getfenv()[frame:GetName() .. ArkInventory.Const.Frame.Log.Name]
			obj:Show()
			
			ArkInventory.Global.Location[loc_id].drawState = ArkInventory.Const.Window.Draw.Recalculate
			
		else
		
			obj = getfenv()[frame:GetName() .. ArkInventory.Const.Frame.Log.Name]
			obj:Hide()
			
			obj = getfenv()[frame:GetName() .. ArkInventory.Const.Frame.Container.Name]
			obj:Show()

		end
	
	end
	
	
	-- do we still need to draw the window?
	if ArkInventory.Global.Location[loc_id].drawState == ArkInventory.Const.Window.Draw.None then
		return
	end
	
	if ArkInventory.Global.Location[loc_id].drawState <= ArkInventory.Const.Window.Draw.Init then

		ArkInventory.Frame_Main_Paint( frame )
		
		-- hide the header window if it's not needed
		local obj = getfenv()[frame:GetName() .. ArkInventory.Const.Frame.Title.Name]
		if ArkInventory.LocationOptionGet( loc_id, { "framehide", "header" } ) then
			obj:Hide()
			obj:SetHeight( 3 )
		else
			obj:SetHeight( ArkInventory.Const.Frame.Title.Height )
			obj:Show()
		end
		
	end

	if ArkInventory.Global.Location[loc_id].drawState <= ArkInventory.Const.Window.Draw.Refresh then
			
		-- hide the search window if it's not needed
		local obj = getfenv()[frame:GetName() .. ArkInventory.Const.Frame.Search.Name]
		if (ArkInventory.LocationOptionGet( loc_id, { "framehide", "search" } )) or (not ArkInventory.Global.Location[loc_id].canSearch) then
			ArkInventory.Global.Location[loc_id].filter = ""
			obj:Hide()
			obj:SetHeight( 3 )
		else
			obj:SetHeight( ArkInventory.Const.Frame.Search.Height )
			obj:Show()
		end
	
		-- set the window title
		local obj = getfenv()[frame:GetName() .. ArkInventory.Const.Frame.Title.Name .. "Who"]
		
		local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
		local t = ArkInventory.DisplayName1( cp.info )
	
		if ArkInventory.Global.Location[loc_id].isOffline then
			obj:SetTextColor( 1, 0, 0 )
			t = string.format( "%s [%s]", t, ArkInventory.Localise["STATUS_OFFLINE"] )
		else
			obj:SetTextColor( 0, 1, 0 )
		end
	
		obj:SetText( t )

	end
	
	obj = getfenv()[frame:GetName() .. ArkInventory.Const.Frame.Container.Name]
	ArkInventory.Frame_Container_Draw( obj )
	
	if ArkInventory.Global.Location[loc_id].drawState <= ArkInventory.Const.Window.Draw.Refresh then
		ArkInventory.Frame_Main_Update( frame )
	end

	if ArkInventory.Global.Location[loc_id].drawState <= ArkInventory.Const.Window.Draw.Init then
		ArkInventory.SetFontFrame( frame )
	end

	ArkInventory.Global.Location[loc_id].drawState = ArkInventory.Const.Window.Draw.None
	

	-- bug fix for framelevel issue
	if ArkInventory.db.global.option.bugfix.enable and frame:GetFrameLevel() > 126 then
		
		local level_old = frame:GetFrameLevel()
		local level_new = 2
		
		ArkInventory.ResetFrameLevel( frame, level_new )
		
		if ArkInventory.db.global.option.bugfix.alert == 1 then
			-- short
			--ArkInventory.Output( { RED_FONT_COLOR_CODE, ArkInventory.Localise["MISC_ALERT"], FONT_COLOR_CODE_CLOSE, " ", ArkInventory.Localise["MISC_ALERT_FRAMELEVEL_1"] } )
		elseif ArkInventory.db.global.option.bugfix.alert == 2 then
			-- long
			--ArkInventory.Output( { RED_FONT_COLOR_CODE, ArkInventory.Localise["MISC_ALERT"], FONT_COLOR_CODE_CLOSE, " ", ArkInventory.Localise["MISC_ALERT_FRAMELEVEL_1"], "  ", string.format( ArkInventory.Localise["MISC_ALERT_FRAMELEVEL_2"], ArkInventory.Global.Location[loc_id].Name, level_old, level_new ) } )
		else
			-- disabled
		end
		
	end	
	
end
	
function ArkInventory.ResetFrameLevel( frame, level )

	if type( frame ) == "string" then
		frame = getfenv()[frame]
	end
	
	if frame == nil then
		return
	end
	
	if frame:GetFrameLevel() ~= level then
		--ArkInventory.Output( { "ResetFrameLevel( ", frame:GetName(), " ) ", frame:GetFrameLevel(), " -> ", level } )
		frame:SetFrameLevel( level )
	end
	
	for _, z in pairs( { frame:GetChildren() } ) do
		ArkInventory.ResetFrameLevel( z, level + 1 )
	end

end	
	
function ArkInventory.Frame_Main_Toggle( loc_id )

	local frame = ArkInventory.Frame_Main_Get( loc_id )

	if frame then
		if frame:IsVisible() then
			ArkInventory.Frame_Main_Hide( loc_id )
		else
			ArkInventory.Frame_Main_Show( loc_id )
		end
	end
	
end

function ArkInventory.Frame_Main_Show( loc_id, player_id )

	assert( loc_id, "invalid location: nil" )
	
	local frame = ArkInventory.Frame_Main_Get( loc_id )

	if not player_id and loc_id == ArkInventory.Const.Location.Vault then
		player_id = ArkInventory.Global.Me.info.guild_id
	end

	if not player_id then
		player_id = ArkInventory.Global.Me.info.player_id
	end
	
	if player_id ~= ArkInventory.Global.Location[loc_id].player_id then
		-- showing a different player than whats already being displayed so init
		ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Init )
	else
		-- same player, leave as is, display code will sort it out, unless user wants it to sort
		if ArkInventory.LocationOptionGet( loc_id, { "sort", "open" } ) then
			ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Resort )
		end
		
	end

	ArkInventory.LocationSetValue( loc_id, "player_id", player_id )
	
	frame:Show()
	ArkInventory.Frame_Main_Draw( frame )

end

function ArkInventory.Frame_Main_OnShow( frame )

	local loc_id = frame.ARK_Data.loc_id

	if loc_id == ArkInventory.Const.Location.Key then
		PlaySound( "KeyRingOpen" )
	elseif loc_id == ArkInventory.Const.Location.Bank then
		PlaySound( "igMainMenuOpen" )
	elseif loc_id == ArkInventory.Const.Location.Bag then
		PlaySound( "igBackPackOpen" )
	elseif loc_id == ArkInventory.Const.Location.Vault then
		PlaySound( "GuildVaultOpen" )
	elseif loc_id == ArkInventory.Const.Location.Mail then
		PlaySound( "igSpellBookOpen" )
	elseif loc_id == ArkInventory.Const.Location.Wearing then
		PlaySound( "igCharacterInfoOpen" )
	end
	
end
function ArkInventory.Frame_Main_Search( frame )
	if not frame then
		frame = this:GetParent():GetParent():GetName()
	end
	
	local loc_id = _G[frame].ARK_Data.loc_id
	local search = frame .. "Search"
	local filter = getfenv()[search .. "Filter"]:GetText()
	
	ArkInventory.Global.Location[loc_id].filter = strtrim( filter )
	ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )

end

function ArkInventory.Frame_Main_Hide( w )

	for loc_id in ipairs( ArkInventory.Global.Location ) do
		if not w or w == loc_id then
			local frame = ArkInventory.Frame_Main_Get( loc_id )
			frame:Hide()
		end
	end
	
end

function ArkInventory.Frame_Main_OnHide( frame )

	ArkInventory.Lib.DewDrop:Close()

	local loc_id = frame.ARK_Data.loc_id

	if loc_id == ArkInventory.Const.Location.Key then
	
		PlaySound( "KeyRingClose" )
		
	elseif loc_id == ArkInventory.Const.Location.Bank then
	
		PlaySound( "igMainMenuClose" )
		
		if ArkInventory.Global.Mode.Bank and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bank ) then
			-- close blizzards bank frame if we're hiding blizzard frames, we're at the bank, and the bank window was closed
			CloseBankFrame()
		end
		
	elseif loc_id == ArkInventory.Const.Location.Bag then
	
		PlaySound( "igBackPackClose" )
		
	elseif loc_id == ArkInventory.Const.Location.Vault then
	
		PlaySound( "GuildVaultClose" )
		
		if ArkInventory.Global.Mode.Vault and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Vault ) then
		
			-- close blizzards vault frame if we're hiding blizzard frames, we're at the vault, and the vault window was closed
			
			GuildBankPopupFrame:Hide()
			StaticPopup_Hide( "GUILDBANK_WITHDRAW" )
			StaticPopup_Hide( "GUILDBANK_DEPOSIT" )
			StaticPopup_Hide( "CONFIRM_BUY_GUILDBANK_TAB" )
			
			CloseGuildBankFrame()
			
		end
		
	elseif loc_id == ArkInventory.Const.Location.Mail then
	
		PlaySound( "igSpellBookClose" )
		
	elseif loc_id == ArkInventory.Const.Location.Wearing then
	
		PlaySound( "igCharacterInfoClose" )
		
	end

	if ArkInventory.Global.Mode.Edit then
		-- if the edit mode is active then disable edit mode and taint so it's rebuilt when next opened
		ArkInventory.Global.Mode.Edit = false
		ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
	end
	
end

function ArkInventory.Frame_Main_OnLoad( frame )

	assert( frame, "frame is nil" )

	local framename = frame:GetName()
	local loc_id = strmatch( framename, "^.-(%d+)" )
	assert( loc_id ~= nil, string.format( "xml element '%s' is not an %s frame", framename, ArkInventory.Const.Program.Name ) )
	
	frame.ARK_Data = {
		["loc_id"] = tonumber( loc_id ),
	}

	loc_id = tonumber( loc_id )
	
	local tex
	
	-- setup main icon
	local obj = getfenv()[frame:GetName() .. ArkInventory.Const.Frame.Title.Name .. "Location0"]
	if obj then
	
		tex = obj:GetNormalTexture()
		tex:SetTexture( ArkInventory.Global.Location[loc_id].Texture )
		tex:SetTexCoord( 0.075, 0.925, 0.075, 0.925 )
		
		tex = obj:GetHighlightTexture()
		tex:SetTexture( ArkInventory.Global.Location[loc_id].Texture )
		tex:SetTexCoord( 0.075, 0.925, 0.075, 0.925 )
		
		tex = obj:GetPushedTexture()
		tex:SetTexture( ArkInventory.Global.Location[loc_id].Texture )
		tex:SetTexCoord( 0.075, 0.925, 0.075, 0.925 )
		
	end
	
	-- setup action buttons
	for k, v in pairs( ArkInventory.Const.Actions ) do
	
		local obj = getfenv()[frame:GetName() .. ArkInventory.Const.Frame.Title.Name .. "ActionButton" .. k]
		
		if obj then
		
			tex = obj:GetNormalTexture()
			tex:SetTexture( v.Texture )
			tex:SetTexCoord( 0.075, 0.925, 0.075, 0.925 )
			
			tex = obj:GetPushedTexture()
			tex:SetTexture( v.Texture )
			tex:SetTexCoord( 0.075, 0.925, 0.075, 0.925 )

			tex = obj:GetHighlightTexture()
			tex:SetTexture( v.Texture )
			tex:SetTexCoord( 0.075, 0.925, 0.075, 0.925 )

			for s, f in pairs( v.Scripts ) do
				obj:SetScript( s, f )
			end
			
		end
	end
	
	tinsert( UISpecialFrames, framename )
	
end

function ArkInventory.Frame_Main_Anchor_Save( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end
	
	local loc_id = frame.ARK_Data.loc_id
	
	ArkInventory.LocationOptionSet( loc_id, { "anchor", loc_id, "t" }, frame:GetTop() )
	ArkInventory.LocationOptionSet( loc_id, { "anchor", loc_id, "b" }, frame:GetBottom() )
	ArkInventory.LocationOptionSet( loc_id, { "anchor", loc_id, "l" }, frame:GetLeft() )
	ArkInventory.LocationOptionSet( loc_id, { "anchor", loc_id, "r" }, frame:GetRight() )
	
end

function ArkInventory.Frame_Container_Calculate( frame )

	--ArkInventory.Output( { "Frame_Container_Calculate( ", frame:GetName(), " )" } )

	local loc_id = frame.ARK_Data.loc_id
	
	ArkInventory.Table.Clean( ArkInventory.Global.Location[loc_id].Layout, nil, true )

	-- break the inventory up into it's respective bars
	ArkInventory.Frame_Container_CalculateBars( frame, ArkInventory.Global.Location[loc_id].Layout )
	
	-- calculate what the container should look like with those bars
	ArkInventory.Frame_Container_CalculateContainer( frame, ArkInventory.Global.Location[loc_id].Layout )

end

function ArkInventory.Frame_Container_CalculateBars( frame, Layout )

	-- loads the inventory into their respective bars
	
	--cp.location[loc_id].Layout

	local loc_id = frame.ARK_Data.loc_id
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )

	--ArkInventory.Output( { GREEN_FONT_COLOR_CODE, "Frame_Container_CalculateBars( ", frame:GetName(), " ) for [", cp.name, "] start" } )

	Layout.bar = { }
	Layout.bar_count = 1

	-- the basics, just stick the items into their appropriate bars
	for bag_id, bag in pairs( cp.location[loc_id].bag ) do
	
		for slot_id, i in pairs( bag.slot ) do
		
			local ignore = false
			if loc_id == ArkInventory.Const.Location.Vault and not ArkInventory.db.global.player.data[cp.info.player_id].display[loc_id].bag[bag_id] then
				ignore = true
			end
			
			if not ignore then
			
				local cat_id = i.cat or ArkInventory.ItemCategoryGet( i )
				local bar_id = ArkInventory.Category_Location_Get( loc_id, cat_id )
				
				--ArkInventory.Output( { "loc=[", loc_id, "], bag=[", bag_id, "], slot=[", slot_id, "], cat=[", cat_id, "], bar_id=[", bar_id, "]" } )
		
				local hidden = nil
				
				if bar_id < 0 or not ArkInventory.db.global.player.data[cp.info.player_id].display[loc_id].bag[bag_id] then
					-- hidden categories (reside on negative bar numbers) do not get shown
					-- isoalted bags do not get shown
					hidden = true
				end
				
				if ArkInventory.Global.Mode.Edit or ArkInventory.LocationOptionGet( loc_id, { "slot", "ignorehidden" } ) then
					-- show everything if in edit mode or the user wants us to ignore the hidden flag
					hidden = nil
				end
				
				if not hidden then
				
					bar_id = abs( bar_id )
					
					-- create the bar
					if not Layout.bar[bar_id] then
						Layout.bar[bar_id] = { ["id"] = bar_id, ["item"] = { }, ["count"] = 0, ["width"] = 0, ["height"] = 0, ["ghost"] = false, ["frame"] = 0 }
					end
					
					-- add the item to the bar
					tinsert( Layout.bar[bar_id].item, { ["bag"] = bag_id, ["slot"] = slot_id } )
					
					-- increment the bars item count
					Layout.bar[bar_id].count = Layout.bar[bar_id].count + 1
					
					-- keep track of the last bar used
					if bar_id > Layout.bar_count then
						Layout.bar_count = bar_id
					end
					
					--ArkInventory.Output( { "bag[", bag_id, "], slot[", slot_id, "], cat[", cat_id, "], bar[", bar_id, "], id=[", Layout.bar[bar_id].id, "]" } )
					
				end
				
			end
			
		end
		
	end

	
	-- get highest used bar
	local cats = ArkInventory.LocationOptionGet( loc_id, { "category" } )
	for _, bar_id in pairs( cats ) do
		if bar_id > Layout.bar_count then
			Layout.bar_count = bar_id
		end
	end
	
	-- round up to a full number of bars per row
	Layout.bar_count = ceil( Layout.bar_count / ArkInventory.LocationOptionGet( loc_id, { "bar", "per" } ) ) * ArkInventory.LocationOptionGet( loc_id, { "bar", "per" } )

	-- update the maximum number of bar frames used so far
	if Layout.bar_count > ArkInventory.Global.Location[loc_id].maxBar then
		ArkInventory.Global.Location[loc_id].maxBar = Layout.bar_count
	end

	-- if we're in edit mode then create all missing bars and add a ghost item to every bar
	-- ghost items allow for the bar menu icon
	if ArkInventory.Global.Mode.Edit or ArkInventory.LocationOptionGet( loc_id, { "bar", "showempty" } ) then
	
		--ArkInventory.Output( { "edit mode - adding ghost bars" } )
		for bar_id = 1, Layout.bar_count do
				
			if not Layout.bar[bar_id] then
			
				-- create a ghost bar
				Layout.bar[bar_id] = { ["id"] = bar_id, ["item"] = { }, ["count"] = 1, ["width"] = 0, ["height"] = 0, ["ghost"] = true, ["frame"] = 0 }
				
			else
	
				-- add a ghost item to the bar by incrementing the bars item count
				Layout.bar[bar_id].count = Layout.bar[bar_id].count + 1
				
			end
			
		end
		
	end

	
	--ArkInventory.Output( { GREEN_FONT_COLOR_CODE, "Frame_Container_CalculateBars( ", frame:GetName(), " ) end" } )
	
end

function ArkInventory.Frame_Container_CalculateContainer( frame, Layout )

	-- calculate what the bars look like in the conatiner

	--ArkInventory.Output( { GREEN_FONT_COLOR_CODE, "Frame_Container_Calculate( ", frame:GetName(), " ) start" } )

	local loc_id = frame.ARK_Data.loc_id

	Layout.container = { ["row"] = { } }
	
	local bpr = ArkInventory.LocationOptionGet( loc_id, { "bar", "per" } )
	local rownum = 0
	local bf = 1 -- bar frame, allocated to each bar as it's calculated (uses less frames this way)
	
	--ArkInventory.Output( { "container ", loc_id, " has ", Layout.bar_count, " bars" } )
	--ArkInventory.Output( { "container ", loc_id, " set for ", bpr, " bars per row" } )
	
	
	if ArkInventory.Global.Mode.Edit == false and ArkInventory.LocationOptionGet( loc_id, { "bar", "compact" } ) then
	
		--ArkInventory.Output( { "compact bars enabled" } )
	
		local bc = 0  -- number of bars currently in this row
		local vr = { }  -- virtual row - holds a list of bars for this row

		for j = 1, Layout.bar_count do
		
			--ArkInventory.Output( { "bar [", j, "]" } )
		
			if Layout.bar[j] then
				if Layout.bar[j].count > 0 then
					--ArkInventory.Output( { "assignment: bar [", j, "] to frame [", bf, "]" } )
					Layout.bar[j]["frame"] = bf
					bf = bf + 1
					bc = bc + 1
					--tinsert( vr, Layout.bar[j] )
					tinsert( vr, j )
				else
					--ArkInventory.Output( { "bar [", j, "] has no items" } )
				end
			else
				--ArkInventory.Output( { "bar [", j, "] has no items (does not exist)" } )
			end
		
			if bc > 0 and ( bc == bpr or j == Layout.bar_count ) then
		
				rownum = rownum + 1
				if not Layout.container.row[rownum] then
					Layout.container.row[rownum] = { }
				end
				
				--ArkInventory.Output( { "row [", rownum, "] allocated [", bc, "] bars" } )
			
				Layout.container.row[rownum].bar = vr
				
				--ArkInventory.Output( { "row [", rownum, "] created" } )
				
				bc = 0
				vr = { }

			end
		
		end
	
	else
	
		for j = 1, Layout.bar_count, bpr do
		
			local bc = 0  -- number of bars currently in this row
			local vr = { }  -- virtual row - holds a list of bars for this row

			for b = 1, bpr do
				if Layout.bar[j+b-1] then
					if Layout.bar[j+b-1].count > 0 then
						--ArkInventory.Output( { "assignment: bar [", j+b-1, "] to frame [", bf, "]" } )
						Layout.bar[j+b-1]["frame"] = bf
						bf = bf + 1
						bc = bc + 1
						--tinsert( vr, Layout.bar[j+b-1] )
						tinsert( vr, j+b-1 )
					else
						--ArkInventory.Output( { "bar [", j+b-1, "] has no items" } )
					end
				else
					--ArkInventory.Output( { "bar [", j+b-1, "] has no items (does not exist)" } )
				end
			end
		
			if bc > 0 then
		
				rownum = rownum + 1
				if not Layout.container.row[rownum] then
					Layout.container.row[rownum] = { }
				end
			
				--ArkInventory.Output( { "row [", rownum, "] allocated [", bc, "] bars" } )
				
				Layout.container.row[rownum].bar = vr
				
			end

		end
		
	end

	
	-- fit the bars into the row

	local rmw = ArkInventory.LocationOptionGet( loc_id, { "window", "width" } )  -- row max width
	local rcw = 0 -- row current width
	local rch = 1 -- row current height
	local rmh = 0 -- row max height
		
	local bar = Layout.bar
	
	--ArkInventory.Output( { "bars per row=[", bpr, "], max columns=[", rmw, "], columns per bar=[", floor( rmw / bpr ), "]" } )
	
	for rownum, row in ipairs( Layout.container.row ) do
		
		for k, bar_id in ipairs( row.bar ) do

			bar[bar_id].width = 1
			if bar[bar_id].width < 1 then
				bar[bar_id].width = 1
			end
			
			bar[bar_id].height = ceil( bar[bar_id].count / bar[bar_id].width )
			
			if bar[bar_id].height > rmh then
				rmh = bar[bar_id].height
			end
			
			--ArkInventory.Output( { "row=[", rownum, "], index=[", k, "], bar=[", bar_id, "], width=[", bar[bar_id].width, "], height=[", bar[bar_id].height, "]" } )
			
		end
		
		
		
		if rmh > 1 then

			repeat
			
				rmh = 1
				local rmb = 0
				
				-- find bar with highest height
				for _, bar_id in ipairs( row.bar ) do
					if bar[bar_id].height > rmh then
						rmh = bar[bar_id].height
						rmb = bar_id
					end
				end

				if rmh > 1 then

					-- increase that bars width by one
					bar[rmb].width = bar[rmb].width + 1
				
					-- and recalcualte it's new height
					bar[rmb].height = ceil( bar[rmb].count / bar[rmb].width )
				
					-- and see if that all fits
					rcw = 0
					rmh = 0
					for _, bar_id in ipairs( row.bar ) do
					
						rcw = rcw + bar[bar_id].width
					
						if bar[bar_id].height > rmh then
							rmh = bar[bar_id].height
						end
					
					end
					
				end
				
				-- exit if the width fits or the max height is 1
			until rcw >= rmw or rmh == 1
			
		end
		
		--ArkInventory.Output( { "maximum height for row [", rownum, "] was [", rmh, "]" } )
		
		for k, bar_id in ipairs( row.bar ) do
		
			--ArkInventory.Output( { "setting max height for row [", rownum, "] bar [", bar_id, "] to [", rmh, "]" } )
		
			-- set height of all bars in the row to the maximum height used (looks better)
			bar[bar_id].height = rmh
			
			if bar[bar_id].ghost or ArkInventory.Global.Mode.Edit or ArkInventory.LocationOptionGet( loc_id, { "bar", "showempty" } ) then
				-- remove the ghost item from the count (it was only needed to calculate properly)
				bar[bar_id].count = bar[bar_id].count - 1
			end
		end
		
	end
	

	--ArkInventory.Output( { GREEN_FONT_COLOR_CODE, "Frame_Container_Calculate( ", frame:GetName(), " ) end" } )

end

function ArkInventory.Frame_Container_Draw( frame )

	local loc_id = frame.ARK_Data.loc_id
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	
	--ArkInventory.Output( { "draw frame=", frame:GetName(), ", loc=", loc_id, ", state=", ArkInventory.Global.Location[loc_id].drawState } )
	
	if ArkInventory.Global.Location[loc_id].drawState <= ArkInventory.Const.Window.Draw.Recalculate then

		-- calculate what the container should look like
		ArkInventory.Frame_Container_Calculate( frame )

		local name

		-- create (if required) the bar frames, and hide any that are no longer required
		local placeframename = frame:GetName() .. "Bar"
		local placeframe = getfenv()[placeframename]
		assert( placeframe, "xml element '" .. placeframename .. "' could not be found" )
		
		local baselevel = placeframe:GetFrameLevel()
		
		for j = 1, ArkInventory.Global.Location[loc_id].maxBar do
			local barframename = placeframename .. j
			local barframe = getfenv()[barframename]
			if not barframe then
				--ArkInventory.Output( { "creating bar [", barframename, "]" } )
				barframe = CreateFrame( "Frame", barframename, placeframe, "ARKINV_TemplateFrameBar" )
			end
			
			ArkInventory.Frame_Bar_Paint( barframe )
			barframe:Hide()
		end
		
		-- create (if required) the bags and their item buttons, and hide any that are not currently needed
		local placeframename = frame:GetName() .. "Bag"
		local placeframe = getfenv()[placeframename]
		assert( placeframe, "xml element '" .. placeframename .. "' could not be found" )
		
		--~~~~ need to fix this for when the cache is reset
		for bag_id in pairs( ArkInventory.Global.Location[loc_id].Bags ) do
		
			local bagframename = placeframename .. bag_id
			local bagframe = getfenv()[bagframename]
			if not bagframe then
				--ArkInventory.Output( { "creating bag frame [", bagframename, "]" } )
				bagframe = CreateFrame( "Frame", bagframename, placeframe, "ARKINV_TemplateFrameBag" )
			end

			-- remember the maximum number of slots used for each bag
			local b = cp.location[loc_id].bag[bag_id]
			
			if not ArkInventory.Global.Location[loc_id].maxSlot[bag_id] then
				ArkInventory.Global.Location[loc_id].maxSlot[bag_id] = 0
			end
			
			if b.count > ArkInventory.Global.Location[loc_id].maxSlot[bag_id] then
				ArkInventory.Global.Location[loc_id].maxSlot[bag_id] = b.count
			end

			-- create the item frames for the bag
			for j = 1, ArkInventory.Global.Location[loc_id].maxSlot[bag_id] do

				local itemframename = ArkInventory.ContainerItemNameGet( loc_id, bag_id, j )
				local itemframe = getfenv()[itemframename]
				if not itemframe then
					--ArkInventory.Output( { "creating item frame [", itemframename, "]" } )				
					if loc_id == ArkInventory.Const.Location.Vault then
						itemframe = CreateFrame( "Button", itemframename, bagframe, "ARKINV_TemplateButtonVaultItem" )
					else
						itemframe = CreateFrame( "Button", itemframename, bagframe, "ARKINV_TemplateButtonItem" )
					end
				end	
				
				if j == 1 then
					ArkInventory.Global.BAG_SLOT_SIZE = itemframe:GetWidth()
				end
			
				ArkInventory.Frame_Item_Update_Clickable( itemframe )
				itemframe:Hide()
				
			end
			
		end
		
	end

	-- build the bar frames
	
	local name = frame:GetName()
		
	local pad_slot = ArkInventory.LocationOptionGet( loc_id, { "slot", "pad" } )
	local pad_bar_int = ArkInventory.LocationOptionGet( loc_id, { "bar", "pad", "internal" } )
	local pad_bar_ext = ArkInventory.LocationOptionGet( loc_id, { "bar", "pad", "external" } )
	local pad_window = ArkInventory.LocationOptionGet( loc_id, { "window", "pad" } )
	local anchor = ArkInventory.LocationOptionGet( loc_id, { "bar", "anchor" } )

	--ArkInventory.Output( { "Layout=[", ArkInventory.Global.Location[loc_id].Layout, "]" } )
	
	for rownum, row in ipairs( ArkInventory.Global.Location[loc_id].Layout.container.row ) do

		row["width"] = pad_window * 2 + pad_bar_ext
		
		for bar_index, bar_id in ipairs( row.bar ) do

			local bar = ArkInventory.Global.Location[loc_id].Layout.bar[bar_id]
			
			local barframename = name .. "Bar" .. bar.frame
			local obj = getfenv()[barframename]
			assert( obj, "xml element '" .. barframename .. "' could not be found" )

			-- assign the bar number used to the bar frame
			obj.ARK_Data.bar_id = bar_id
			
			if ArkInventory.Global.Location[loc_id].drawState <= ArkInventory.Const.Window.Draw.Recalculate then

				local obj_width = bar.width * ArkInventory.Global.BAG_SLOT_SIZE + ( bar.width - 1 ) * pad_slot + pad_bar_int * 2
				obj:SetWidth( obj_width )
				row.width = row.width + obj_width
				
				row.width = row.width + pad_bar_ext

				row["height"] = bar.height * ArkInventory.Global.BAG_SLOT_SIZE + ( bar.height - 1 ) * pad_slot + pad_bar_int * 2				
				obj:SetHeight( row.height )
				
				obj:ClearAllPoints()
				
				--ArkInventory.Output( "row=" .. rownum .. ", bar=" .. bar_index .. ", obj=" .. obj:GetName() .. ", frame=" .. bar.frame )
				-- anchor first bar to frame
				if bar.frame == 1 then
				
					if anchor == ArkInventory.Const.Anchor.BottomLeft then
						obj:SetPoint( "BOTTOMLEFT", frame, "BOTTOMLEFT", pad_window + pad_bar_ext, pad_window + pad_bar_ext )
					elseif anchor == ArkInventory.Const.Anchor.TopLeft then
						obj:SetPoint( "TOPLEFT", frame, "TOPLEFT", pad_window + pad_bar_ext, 0 - pad_window - pad_bar_ext )
					elseif anchor == ArkInventory.Const.Anchor.TopRight then
						obj:SetPoint( "TOPRIGHT", frame, "TOPRIGHT", 0 - pad_window - pad_bar_ext, 0 - pad_window - pad_bar_ext )
					else -- if anchor == ArkInventory.Const.Anchor.BottomRight then
						obj:SetPoint( "BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0 - pad_window - pad_bar_ext, pad_window + pad_bar_ext )
					end
					
				else
				
					if bar_index == 1 then
						-- next row, place under previous row
						--ArkInventory.Output( "anchor=" .. name .. "Bar" .. ArkInventory.Global.Location[loc_id].Layout.container.row[rownum-1].bar[1].frame )
						
						local prev = ArkInventory.Global.Location[loc_id].Layout.container.row[rownum-1].bar[1]
						local parent = name .. "Bar" .. ArkInventory.Global.Location[loc_id].Layout.bar[prev].frame
						
						if anchor == ArkInventory.Const.Anchor.BottomLeft then
							obj:SetPoint( "BOTTOMLEFT", parent, "TOPLEFT", 0, pad_bar_ext )
						elseif anchor == ArkInventory.Const.Anchor.TopLeft then
							obj:SetPoint( "TOPLEFT", parent, "BOTTOMLEFT", 0, 0 - pad_bar_ext )
						elseif anchor == ArkInventory.Const.Anchor.TopRight then
							obj:SetPoint( "TOPRIGHT", parent, "BOTTOMRIGHT", 0, 0 - pad_bar_ext )
						else -- if anchor == ArkInventory.Const.Anchor.BottomRight then
							obj:SetPoint( "BOTTOMRIGHT", parent, "TOPRIGHT", 0, pad_bar_ext )
						end

					else
					
						-- next slot, place bar next to last one
						
						local parent = name .. "Bar" .. ( bar.frame - 1 )
						
						if anchor == ArkInventory.Const.Anchor.BottomLeft then
							obj:SetPoint( "BOTTOMLEFT", parent, "BOTTOMRIGHT", pad_bar_ext, 0 )
						elseif anchor == ArkInventory.Const.Anchor.TopLeft then
							obj:SetPoint( "TOPLEFT", parent, "TOPRIGHT", pad_bar_ext, 0 )
						elseif anchor == ArkInventory.Const.Anchor.TopRight then
							obj:SetPoint( "TOPRIGHT", parent, "TOPLEFT", 0 - pad_bar_ext, 0 )
						else -- if anchor == ArkInventory.Const.Anchor.BottomRight then
							obj:SetPoint( "BOTTOMRIGHT", parent, "BOTTOMLEFT", 0 - pad_bar_ext, 0 )
						end
						
					end
				
				end
				
				obj:Show()

			end
			
			if ArkInventory.Global.Location[loc_id].drawState <= ArkInventory.Const.Window.Draw.Refresh then
				ArkInventory.Frame_Bar_Label( obj )
				ArkInventory.Frame_Bar_DrawItems( obj )
			end
			
		end

	end

	if ArkInventory.Global.Location[loc_id].drawState <= ArkInventory.Const.Window.Draw.Recalculate then

		-- set container height and width
		
		local c = ArkInventory.Global.Location[loc_id].Layout.container
		
		c.width = ArkInventory.Const.Window.Min.Width
		
		c.height = pad_window * 2 + pad_bar_ext

		for row_index, row in ipairs( c.row ) do
		
			if row.width > c.width then
				c.width = row.width
			end
			
			c.height = c.height + row.height + pad_bar_ext
		
		end
		
		if c.height < ArkInventory.Const.Window.Min.Height then
			c.height = ArkInventory.Const.Window.Min.Height
		end
		
		frame:SetWidth( c.width )
		frame:SetHeight( c.height )

	end

end

function ArkInventory.Frame_Container_OnLoad( frame )

	assert( frame, "frame is nil" )

	local framename = frame:GetName()
	local loc_id = strmatch( framename, "^.-(%d+)Container" )

	assert( loc_id, string.format( "xml element '%s' is not an %s frame", framename, ArkInventory.Const.Program.Name ) )
	
	frame.ARK_Data = {
		["loc_id"] = tonumber( loc_id ),
	}
	
end


function ArkInventory.Frame_Bar_Paint_All()

	--ArkInventory.Output( { "Frame_Bar_Paint_All()" } )

	for loc_id, loc_data in ipairs( ArkInventory.Global.Location ) do

		c = getfenv()[ArkInventory.Const.Frame.Main.Name .. loc_id .. ArkInventory.Const.Frame.Container.Name]
		
		if c and c:IsVisible() then
		
			for bar_id = 1, loc_data.maxBar do

				obj = getfenv()[c:GetName() .. "Bar" .. bar_id]
				
				if obj then
					ArkInventory.Frame_Bar_Paint( obj )
				end
				
			end
			
		end
		
	end

end

function ArkInventory.Frame_Bar_Paint( frame )
	
	if not frame then
		return
	end
	
	--ArkInventory.Output( { "Painting ", frame:GetName() } )
	
	local loc_id = frame.ARK_Data.loc_id
	
	-- border
	if ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "show" } ) then

		local borderDefault = "Tooltip"
		local borderCustom = "Custom"
		local style = ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "style" } ) or borderDefault
		local file, size, scale
		if style == borderCustom then
			file = ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "file" } ) or ArkInventory.Const.Texture.Border[borderDefault].file
			size = ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "size" } ) or ArkInventory.Const.Texture.Border[borderDefault].size
			scale = ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "scale" } ) or 1
		else
			file = ArkInventory.Const.Texture.Border[style].file
			size = ArkInventory.Const.Texture.Border[style].size
			scale = 1
		end

		frame:SetBackdrop( { ["edgeFile"] = file, ["edgeSize"] = size * scale } )
		
		-- border colour
		local colour = ArkInventory.LocationOptionGet( loc_id, { "bar", "colour", "border" } )
		frame:SetBackdropBorderColor( colour.r, colour.g, colour.b, 1 )
		
	else
	
		frame:SetBackdrop( { ["edgeFile"] = "" } )
		--frame:SetBackdropBorderColor( 0, 0, 0, 0 )
		
	end
	
	
	-- background colour
	if ArkInventory.Global.Mode.Edit then
	
		frame:SetBackdropBorderColor( 1, 0, 0, 1 )
		getfenv()[frame:GetName() .. "Background"]:SetTexture( 1, 0, 0, 0.1 )
		
		local obj = getfenv()[frame:GetName() .. "Edit"]
		
		local pad_bar = ArkInventory.LocationOptionGet( loc_id, { "bar", "pad", "internal" } )
		local anchor = ArkInventory.LocationOptionGet( loc_id, { "slot", "anchor" } )

		obj:ClearAllPoints()
		
		-- anchor to the opposite corner that items are
		if anchor == ArkInventory.Const.Anchor.BottomLeft then
			obj:SetPoint( "TOPRIGHT", 0 - pad_bar, 0 - pad_bar ) -- OK
		elseif anchor == ArkInventory.Const.Anchor.TopLeft then
			obj:SetPoint( "BOTTOMRIGHT", 0 - pad_bar, pad_bar )
		elseif anchor == ArkInventory.Const.Anchor.TopRight then
			obj:SetPoint( "BOTTOMLEFT", pad_bar, pad_bar )
		else -- anchor == ArkInventory.Const.Anchor.BottomRight then
			obj:SetPoint( "TOPLEFT", pad_bar, 0 - pad_bar ) -- OK
		end

		obj:SetWidth( ArkInventory.Global.BAG_SLOT_SIZE )
		obj:SetHeight( ArkInventory.Global.BAG_SLOT_SIZE )
		obj:Show()
	
	else
	
		local colour = ArkInventory.LocationOptionGet( loc_id, { "bar", "colour", "background" } )
		getfenv()[frame:GetName() .. "Background"]:SetTexture( colour.r, colour.g, colour.b, colour.a )
		getfenv()[frame:GetName() .. "Edit"]:Hide()
	
	end

	-- label
	ArkInventory.Frame_Bar_Label( frame )
	
end

function ArkInventory.Frame_Bar_DrawItems( frame )

	--ArkInventory.Output( { "Frame_Bar_DrawItems( ", frame:GetName(), " )" } )

	local loc_id = frame.ARK_Data.loc_id
	
	if ArkInventory.Global.Location[loc_id].drawState > ArkInventory.Const.Window.Draw.Refresh then
		return
	end
	
	local bar_id = frame.ARK_Data.bar_id
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	
	local bar = ArkInventory.Global.Location[loc_id].Layout.bar[bar_id]
	assert( bar, "bar id has not been set on frame" )
	
	if bar.count == 0 or bar.ghost then
		return
	end
	
	-- sort the items in the bar
	for j = 1, bar.count do
		local bag_id = bar.item[j].bag
		local slot_id = bar.item[j].slot
		
		local i = cp.location[loc_id].bag[bag_id].slot[slot_id]
		
		if bar.item[j].sortkey == nil then
			bar.item[j].sortkey = ArkInventory.ItemSortKeyGenerate( i ) or "!"
		end
		
	end
	
	if ArkInventory.LocationOptionGet( loc_id, { "sort", "ascending" } ) then
		sort( bar.item, function( a, b ) return a.sortkey > b.sortkey end )
	else
		sort( bar.item, function( a, b ) return a.sortkey < b.sortkey end )
	end
	

	local pad_slot = ArkInventory.LocationOptionGet( loc_id, { "slot", "pad" } )
	local pad_bar = ArkInventory.LocationOptionGet( loc_id, { "bar", "pad", "internal" } )
	local col = bar.width

	-- cycle through the items in the bar
	for j = 1, bar.count do

		local i = cp.location[loc_id].bag[bar.item[j].bag].slot[bar.item[j].slot]
		local framename = ArkInventory.ContainerItemNameGet( loc_id, bar.item[j].bag, bar.item[j].slot )
		local obj = getfenv()[framename]
		assert( obj, "xml element '" .. framename .. "' does not exist" )

		if ArkInventory.Global.Location[loc_id].drawState <= ArkInventory.Const.Window.Draw.Recalculate then
		
			-- anchor first item to bar frame - WARNING - item anchor point can only be bottom right, nothing else, so be relative

			local anchor = ArkInventory.LocationOptionGet( loc_id, { "slot", "anchor" } )
			local item_size = obj:GetWidth()
			
			if j == 1 then
				
				if anchor == ArkInventory.Const.Anchor.BottomLeft then
					obj:SetPoint( "BOTTOMRIGHT", frame, "BOTTOMLEFT", pad_bar + item_size, pad_bar ) -- OK
				elseif anchor == ArkInventory.Const.Anchor.TopLeft then
					obj:SetPoint( "BOTTOMRIGHT", frame, "TOPLEFT", pad_bar + item_size, 0 - pad_bar - item_size ) -- OK
				elseif anchor == ArkInventory.Const.Anchor.TopRight then
					obj:SetPoint( "BOTTOMRIGHT", frame, "TOPRIGHT", 0 - pad_bar, 0 - pad_bar - item_size ) -- OK
				else -- anchor == ArkInventory.Const.Anchor.BottomRight then
					obj:SetPoint( "BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0 - pad_bar, pad_bar ) -- OK
				end
				
			else
			
				if mod( ( j - 1 ), col ) == 0 then
				
					-- next row, anchor to first item in previous row
					local anchorframe = ArkInventory.ContainerItemNameGet( loc_id, bar.item[j-col].bag, bar.item[j-col].slot )
					
					if anchor == ArkInventory.Const.Anchor.BottomLeft then
						obj:SetPoint( "BOTTOMRIGHT", anchorframe, 0, pad_slot + item_size ) -- OK
					elseif anchor == ArkInventory.Const.Anchor.TopLeft then
						obj:SetPoint( "BOTTOMRIGHT", anchorframe, 0, 0 - pad_slot - item_size ) -- OK
					elseif anchor == ArkInventory.Const.Anchor.TopRight then
						obj:SetPoint( "BOTTOMRIGHT", anchorframe, 0, 0 - pad_slot - item_size ) -- OK
					else -- if anchor == ArkInventory.Const.Anchor.BottomRight then
						obj:SetPoint( "BOTTOMRIGHT", anchorframe, 0, pad_slot + item_size ) -- OK
					end
						
				else
				
					-- anchor to last item
					
					local anchorframe = ArkInventory.ContainerItemNameGet( loc_id, bar.item[j-1].bag, bar.item[j-1].slot )
					
					if anchor == ArkInventory.Const.Anchor.BottomLeft then
						obj:SetPoint( "BOTTOMRIGHT", anchorframe, pad_slot + item_size, 0 )
					elseif anchor == ArkInventory.Const.Anchor.TopLeft then
						obj:SetPoint( "BOTTOMRIGHT", anchorframe, pad_slot + item_size, 0 )
					elseif anchor == ArkInventory.Const.Anchor.TopRight then
						obj:SetPoint( "BOTTOMRIGHT", anchorframe, 0 - pad_slot - item_size, 0 )
					else -- if anchor == ArkInventory.Const.Anchor.BottomRight then
						obj:SetPoint( "BOTTOMRIGHT", anchorframe, 0 - pad_slot - item_size, 0 )
					end
					
				end
				
			end
			
		end
	
		obj:Show()

		if ArkInventory.Global.Location[loc_id].drawState <= ArkInventory.Const.Window.Draw.Refresh then
			ArkInventory.Frame_Item_Update_QualityBorder( obj )
			ArkInventory.Frame_Item_Update_Fade( obj )
			ArkInventory.Frame_Item_Update_Count( obj )
			ArkInventory.Frame_Item_Update_Texture( obj )
			ArkInventory.Frame_Item_Update_Lock( obj )
			ArkInventory.Frame_Item_Update_Cooldown( obj )
		end

	end

end

function ArkInventory.Frame_Bar_Label( frame )

	local loc_id = frame.ARK_Data.loc_id
	local bar_id = frame.ARK_Data.bar_id
	
	local nameplate = getfenv()[frame:GetName() .. "Label"]
	
	if nameplate ~= nil then
		
		local txt = ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "label", bar_id } )
		
		if txt and txt ~= "" and ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "show" } ) then
		
			nameplate:SetText( txt )
		
			local colour = ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "colour" } )
			nameplate:SetTextColor( colour.r, colour.g, colour.b )
			
			nameplate:Show()
			
		else
		
			nameplate:Hide()
			
		end
		
	end

end

function ArkInventory.Frame_Bar_Label_Insert( loc_id, bar_id )

	local tbl = { }
	for k, v in pairs( ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "label" } ) ) do
		if k >= bar_id then
			tbl[k + 1] = v
		else
			tbl[k] = v
		end
	end
	ArkInventory.LocationOptionSet( loc_id, { "bar", "name", "label" }, tbl )

end

function ArkInventory.Frame_Bar_Label_Remove( loc_id, bar_id )

	local tbl = { }
	for k, v in pairs( ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "label" } ) ) do
		if k > bar_id then
			tbl[k - 1] = v
		elseif k == bar_id then
			-- do nothing
		else
			tbl[k] = v
		end
	end
	ArkInventory.LocationOptionSet( loc_id, { "bar", "name", "label" }, tbl )

end

function ArkInventory.Frame_Bar_Label_Up( loc_id, bar_id )

	local txt1 = ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "label", bar_id } )
	local txt2 = ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "label", bar_id + 1 } )

	ArkInventory.LocationOptionSet( loc_id, { "bar", "name", "label", bar_id }, txt2 )
	ArkInventory.LocationOptionSet( loc_id, { "bar", "name", "label", bar_id + 1 }, txt1 )

end

function ArkInventory.Frame_Bar_Label_Down( loc_id, bar_id )

	local txt1 = ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "label", bar_id } )
	local txt2 = ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "label", bar_id - 1 } )

	ArkInventory.LocationOptionSet( loc_id, { "bar", "name", "label", bar_id }, txt2 )
	ArkInventory.LocationOptionSet( loc_id, { "bar", "name", "label", bar_id - 1 }, txt1 )

end

function ArkInventory.Frame_Bar_Label_Clear( loc_id, bar_id )

	ArkInventory.LocationOptionSet( loc_id, { "bar", "name", "label", bar_id }, "" )

end

function ArkInventory.Frame_Bar_OnLoad( frame )

	assert( frame, "frame is nil" )

	local framename = frame:GetName()
	local loc_id, bar_id = strmatch( framename, "^.-(%d+)ContainerBar(%d+)" )

	assert( loc_id, string.format( "xml element '%s' is not an %s frame", framename, ArkInventory.Const.Program.Name ) )
	assert( bar_id, string.format( "xml element '%s' is not an %s frame", framename, ArkInventory.Const.Program.Name ) )
	
	frame.ARK_Data = {
		["loc_id"] = tonumber( loc_id ),
		["bar_id"] = tonumber( bar_id ),
	}
	
	frame:SetID( bar_id )
	
	ArkInventory.SetFontFrame( frame )

end


function ArkInventory.Frame_Bag_OnLoad( frame )

	assert( frame, "frame is nil" )

	local framename = frame:GetName()
	local loc_id, bag_id = strmatch( framename, "^.-(%d+)ContainerBag(%d+)" )
	
	assert( loc_id, string.format( "xml element '%s' is not an %s frame", framename, ArkInventory.Const.Program.Name ) )
	assert( bag_id, string.format( "xml element '%s' is not an %s frame", framename, ArkInventory.Const.Program.Name ) )
	
	loc_id = tonumber( loc_id )
	bag_id = tonumber( bag_id )
	--local inv_id = ArkInventory.InventoryIDGet( loc_id, bag_id )
	
	frame.ARK_Data = {
		["loc_id"] = loc_id,
		["bag_id"] = bag_id,
		--["inv_id"] = inv_id,
	}
	
	local bliz_id = ArkInventory.BagID_Blizzard( loc_id, bag_id )
	frame:SetID( bliz_id )
	
	ArkInventory.SetFontFrame( frame )
	
end

function ArkInventory.Frame_Bag_Create( loc_id, bag_id )



end

function ArkInventory.Frame_Item_Create( loc_id, bag_id, slot_id )

	local framename = ArkInventory.ContainerItemNameGet( loc_id, bag_id, slot_id )
	local frame = getfenv()[framename]
	if not frame then
		--ArkInventory.Output( { "creating item frame [", itemframename, "]" } )
		if loc_id == ArkInventory.Const.Location.Vault then
			frame = CreateFrame( "Button", framename, parent, "ARKINV_TemplateButtonVaultItem" )
		else
			frame = CreateFrame( "Button", framename, parent, "ARKINV_TemplateButtonItem" )
		end
	end	
		
	ArkInventory.Global.BAG_SLOT_SIZE = frame:GetWidth()
	
	ArkInventory.Frame_Item_Update_Clickable( frame )
	frame:Hide()
	
	return frame
	
end

function ArkInventory.Frame_Item_GetDB( frame )

	--ArkInventory.Output( { "frame=[", frame:GetName(), "]" } )
	local loc_id = frame.ARK_Data.loc_id
	local bag_id = frame.ARK_Data.bag_id
	local slot_id = frame.ARK_Data.slot_id
	
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )

	--ArkInventory.Output( { "name=[", cp.info.name, "], loc=[", loc_id, "], bag=[", bag_id, "], slot=[", slot_id, "]" } )
	return cp.location[loc_id].bag[bag_id].slot[slot_id]
	
end
	
function ArkInventory.Frame_Item_Update_Texture( frame )
	
	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local loc_id = frame.ARK_Data.loc_id
	local i = ArkInventory.Frame_Item_GetDB( frame )

	if i and i.h then

		-- frame has an item
		frame.hasItem = 1
		
		-- item is readable?
		if loc_id ~= ArkInventory.Const.Location.Vault then
			if ArkInventory.Global.Location[loc_id].isOffline == false then
				frame.readable = select( 5, GetContainerItemInfo( i.bag_id, i.slot_id ) )
			end
		else
			frame.readable = nil
		end

		-- item texture
		local t = ArkInventory.ItemGetTexture( i.h )
		ArkInventory.SetItemButtonTexture( frame, t, 1.0, 0.1, 0.1 )
	
	else
		
		frame.hasItem = nil
		
		frame.readable = nil
	
		ArkInventory.Frame_Item_Update_Empty( frame )
		
	end

	-- new item indicator
	ArkInventory.Frame_Item_Update_NewIndicator( frame )
	
end

function ArkInventory.SetItemButtonTexture( frame, texture, r, g, b )
	
	if not frame then
		return
	end
	
	local obj = getfenv()[frame:GetName() .. "IconTexture"]
	
	if not obj then
		return
	end
	
	if texture then
		obj:Show()
	else
		obj:Hide()
	end
	
	obj:SetTexture( texture )
	obj:SetTexCoord( 0.075, 0.925, 0.075, 0.925 )
	
	if r and g and b then
		obj:SetVertexColor( r, g, b )
	end
	
end

function ArkInventory.SetItemButtonDesaturate( frame, desaturate, r, g, b )

	if not frame then
		return
	end
	
	local obj = getfenv()[frame:GetName() .. "IconTexture"]
	
	if not obj then
		return
	end
	
	local shaderSupported = obj:SetDesaturated( desaturate )
	
	if desaturate then
	
		if shaderSupported then
			return
		end
		
		if not r then
			r = 0.5
			g = 0.5
			b = 0.5
		end
		
	else

		if not r then
			r = 1.0
			g = 1.0
			b = 1.0
		end
		
	end
	
	obj:SetVertexColor( r, g, b )
	
end

function ArkInventory.Frame_Item_Update_Count( frame )

	local i = ArkInventory.Frame_Item_GetDB( frame )
	
	if i then
		SetItemButtonCount( frame, i.count )
	end
	
end

--[[
function ArkInventory.Frame_Item_Update_Fade( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local loc_id = frame.ARK_Data.loc_id
	local action = false

	if ArkInventory.Global.Location[loc_id].isOffline and ArkInventory.LocationOptionGet( loc_id, { "slot", "offline", "fade" } ) then
	
		action = true
		
	else
	
		if loc_id == ArkInventory.Const.Location.Vault then
		
			local bag_id = frame.ARK_Data.bag_id
			local _, _, _, canDeposit, numWithdrawals = GetGuildBankTabInfo( bag_id )
			if not canDeposit and numWithdrawals == 0 then
				action = true
			end
		
		end
	
	end

	if action then
		frame:SetAlpha( ArkInventory.Const.Fade )
	else
		frame:SetAlpha( 1 )
	end
	
end
]]

function ArkInventory.Frame_Item_Update_Fade( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local loc_id = frame.ARK_Data.loc_id
	local action = false
	local fade = 1

	if ArkInventory.Global.Location[loc_id].isOffline and ArkInventory.LocationOptionGet( loc_id, { "slot", "offline", "fade" } ) then
		
		fade = 0.6
		
	else
	
		if loc_id == ArkInventory.Const.Location.Vault then
		
			local bag_id = frame.ARK_Data.bag_id
			local canDeposit, numWithdrawals = select( 4, GetGuildBankTabInfo( bag_id ) )
			if not canDeposit and numWithdrawals == 0 then
				fade = 0.6
			end
		
		end
	
	end

	local f = string.lower( strtrim( ArkInventory.Global.Location[loc_id].filter or "" ) )
	if f ~= "" then
		local i = ArkInventory.Frame_Item_GetDB( frame ) or { }
		local n = string.lower( select( 3, ArkInventory.ObjectInfo( i.h ) ) or "" )
		if not string.find( n, strtrim( f ) ) then
			-- drop fade to 0.2 for all non matching items
			fade = 0.2
		end
	end
	
	frame:SetAlpha( fade )
	
end

function ArkInventory.Frame_Item_Update_QualityBorder( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end
	
	local framename = frame:GetName()
	local obj_name = "ArkQualityBorder"
	local obj = getfenv()[framename .. obj_name]
	assert( obj, string.format( "xml element '%s' is missing the sub element %s", framename, obj_name ) )
	
	ArkInventory.Frame_Item_Update_QualityBorderBackdrop( frame )
	
	local loc_id = frame.ARK_Data.loc_id
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	local bag_id = frame.ARK_Data.bag_id
	local i = ArkInventory.Frame_Item_GetDB( frame )
	
	if i and i.h then
	
		if ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "rarity" } ) then
			local r, g, b = GetItemQualityColor( i.q or 0 )	
			obj:SetBackdropBorderColor( r, g, b, 1 )
		else
			local r, g, b = GetItemQualityColor( 0 )
			obj:SetBackdropBorderColor( r, g, b, 1 )
		end
		
	else
	
		if ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "border" } ) then
			-- slot colour
			local bt = cp.location[loc_id].bag[bag_id].type
			local colour = ArkInventory.LocationOptionGet( loc_id, { "slot", "data", bt, "colour" } )
			obj:SetBackdropBorderColor( colour.r, colour.g, colour.b, 1 )
		else
			-- trash colour
			local r, g, b = GetItemQualityColor( 0 )
			obj:SetBackdropBorderColor( r, g, b, 1 )
		end
	
	end
	
end

function ArkInventory.Frame_Item_Update_QualityBorderBackdrop( frame )

	local framename = frame:GetName()
	local obj_name = "ArkQualityBorder"
	local obj = getfenv()[framename .. obj_name]
	assert( obj, string.format( "xml element '%s' is missing the sub element %s", framename, obj_name ) )
	
	local loc_id = frame.ARK_Data.loc_id

	if ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "show" } ) then

		local borderDefault = "Tooltip"
		local borderCustom = "Custom"
		local style = ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "style" } ) or borderDefault
		local file, size, offset, scale
		if style == borderCustom then
			file = ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "file" } ) or ArkInventory.Const.Texture.Border[borderDefault].file
			size = ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "size" } ) or ArkInventory.Const.Texture.Border[borderDefault].size
			offset = ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "offset" } ) or ArkInventory.Const.Texture.Border[borderDefault].offset
			scale = ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "scale" } ) or 1
		else
			file = ArkInventory.Const.Texture.Border[style].file
			size = ArkInventory.Const.Texture.Border[style].size
			offset = ArkInventory.Const.Texture.Border[style].offset
			scale = 1
		end
		
		obj:SetBackdrop( { ["edgeFile"] = file, ["edgeSize"] = size * scale } )
		
		offset = offset * scale
		
		obj:ClearAllPoints()
		obj:SetPoint( "TOPLEFT", framename .. "IconTexture", 0 - offset, offset )
		obj:SetPoint( "BOTTOMRIGHT", framename .. "IconTexture", offset, 0 - offset )
		
		obj:Show()
		
	else
	
		obj:Hide()
		
	end
	
end

function ArkInventory.Frame_Item_Update_NewIndicator( frame )
	
	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local framename = frame:GetName()
	local loc_id = frame.ARK_Data.loc_id
	local i = ArkInventory.Frame_Item_GetDB( frame )
	
	local obj_name = "ArkNewText"
	local obj = getfenv()[framename .. obj_name]
	assert( obj, string.format( "xml element '%s' is missing the sub element %s", framename, obj_name ) )
	
	if i and i.h and ArkInventory.LocationOptionGet( loc_id, { "slot", "new", "show" } ) then
		colour = ArkInventory.LocationOptionGet( loc_id, { "slot", "new", "colour" } )
		obj:SetTextColor( colour.r, colour.g, colour.b )
		if i.new == ArkInventory.Const.Slot.New.None then
			obj:Hide()
		elseif i.new == ArkInventory.Const.Slot.New.New then
			obj:SetText( ArkInventory.Localise["NEW_ITEM_NEW"] )
			obj:Show()
		elseif i.new == ArkInventory.Const.Slot.New.Increased then
			obj:SetText( ArkInventory.Localise["NEW_ITEM_INCREASE"] )
			obj:Show()
		elseif i.new == ArkInventory.Const.Slot.New.Decreased then
			obj:SetText( ArkInventory.Localise["NEW_ITEM_DECREASE"] )
			obj:Show()
		end
	else
		obj:Hide()
	end
	
end

function ArkInventory.Frame_Item_Update_Empty( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end
	
	local loc_id = frame.ARK_Data.loc_id
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	local bag_id = frame.ARK_Data.bag_id
	local i = ArkInventory.Frame_Item_GetDB( frame )
	
	if i and not i.h then
	
		local bt = cp.location[loc_id].bag[bag_id].type
	
		-- slot background
		if ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "icon" } ) then
		
			-- icon
			local texture = ArkInventory.Const.Slot.Data[bt].texture or ArkInventory.Const.Texture.Empty.Item
			
			-- wearing empty slot icons
			if loc_id == ArkInventory.Const.Location.Wearing then
				local a, b = GetInventorySlotInfo( ArkInventory.Const.InventorySlotName[i.slot_id] )
				--ArkInventory.Output( { "id=[", i.slot_id, "], name=[", ArkInventory.Const.InventorySlotName[i.slot_id], "], texture=[", b, "]" } )
				texture = b
			end
			
			ArkInventory.SetItemButtonTexture( frame, texture, 1.0, 1.0, 1.0 )
			
		else

			-- solid colour
			local colour = ArkInventory.LocationOptionGet( loc_id, { "slot", "data", bt, "colour" } )
			--ArkInventory.SetItemButtonTexture( frame, [[Interface\Buttons\WHITE8X8]], colour.r * 0.25, colour.g * 0.25, colour.b * 0.25 )
			ArkInventory.SetItemButtonTexture( frame, [[Interface\Buttons\WHITE8X8]], colour.r, colour.g, colour.b )
			
		end
		
	end
	
end
	
function ArkInventory.Frame_Item_Empty_Paint_All()

	for loc_id, loc_data in ipairs( ArkInventory.Global.Location ) do
	
		for bag_id in pairs( loc_data.Bags ) do
		
			for slot_id = 1, ArkInventory.Global.Location[loc_id].maxSlot[bag_id] or 0 do
			
				local s = getfenv()[ArkInventory.ContainerItemNameGet( loc_id, bag_id, slot_id )]
				if s then
					ArkInventory.Frame_Item_Update_Empty( s )
					ArkInventory.Frame_Item_Update_QualityBorder( s )
				end
				
			end
			
		end
		
	end
	
end

function ArkInventory.Frame_Item_OnEnter( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	if not ArkInventory.db.global.option.tooltip.show then
		return
	end
	
	local loc_id = frame.ARK_Data.loc_id
	local bag_id = frame.ARK_Data.bag_id
	local bliz_id = ArkInventory.BagID_Blizzard( loc_id, bag_id )
	local i = ArkInventory.Frame_Item_GetDB( frame )
	
	
	--ArkInventory.Output( { "item=[", i.h, "]" } )
	local usedmycode = false
	
	if ArkInventory.Global.Mode.Edit or ArkInventory.Global.Location[loc_id].isOffline or bliz_id == BANK_CONTAINER or bliz_id == KEYRING_CONTAINER or loc_id == ArkInventory.Const.Location.Vault or loc_id == ArkInventory.Const.Location.Wearing or loc_id == ArkInventory.Const.Location.Mail then

		usedmycode = true -- edit mode, offline, bank, keyring, vault
		
		if i.h then
	
			ArkInventory.GameTooltipSetPosition( frame )

			if loc_id == ArkInventory.Const.Location.Mail then

				GameTooltip:SetHyperlink( i.h )
				
				local daysLeft = 0
				if i.dl then
				
					GameTooltip:AddLine( dl, 0, 1, 0 )
				
--[[					if i.dl >= 1 then
						daysLeft = TIME_REMAINING .. " " .. floor(i.dl) .. " " .. GetText("DAYS_ABBR", nil, floor(i.dl))
						GameTooltip:AddLine( daysLeft, 0, 1, 0 )
					else
						daysLeft = TIME_REMAINING .. " " .. SecondsToTime(floor(i.dl * 24 * 60 * 60))
						GameTooltip:AddLine( daysLeft, 1, 0, 0 )
					end
	]]--				
				end
				
			elseif loc_id == ArkInventory.Const.Location.Wearing then
			
				GameTooltip:SetHyperlink( i.h )
				
			elseif ArkInventory.Global.Mode.Edit or ArkInventory.Global.Location[loc_id].isOffline then
				
				GameTooltip:SetHyperlink( i.h )
				
				
	-- online options
				
			elseif bliz_id == BANK_CONTAINER then
				
				GameTooltip:SetInventoryItem( "player", BankButtonIDToInvSlotID( i.slot_id ) )

			elseif bliz_id == KEYRING_CONTAINER then
			
				GameTooltip:SetInventoryItem( "player", KeyRingButtonIDToInvSlotID( i.slot_id ) )
				
			elseif loc_id == ArkInventory.Const.Location.Vault then
			
				local tab_id = i.bag_id
				
				local _, _, isViewable = GetGuildBankTabInfo( tab_id )

				if isViewable then
					GameTooltip:SetGuildBankItem( tab_id, i.slot_id )
				else
					GameTooltip:SetHyperlink( i.h )
				end

			else
			
				assert( false, "uncoded value to build tooltip " )
				
			end
			

			if IsShiftKeyDown() then
				GameTooltip_ShowCompareItem()
			elseif IsControlKeyDown() then
				ShowInspectCursor()
			elseif frame.readable then
				ShowInspectCursor()
			else
				SetCursor( "POINT_CURSOR" )
			end
			
			CursorUpdate()
			
			GameTooltip:Show()
			
		end

	end
	
	if usedmycode == false then
		ContainerFrameItemButton_OnEnter( frame )
	end

end

function ArkInventory.Frame_Item_OnDrag( frame )
	
	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local loc_id = frame.ARK_Data.loc_id
	local usedmycode = false
	
	if ArkInventory.Global.Location[loc_id].isOffline or ArkInventory.Global.Mode.Edit then
	
		usedmycode = true
		-- do not drag for disabled buttons
		
	end

	if not usedmycode then
		if ArkInventory.Const.TOC < 30000 then
			ContainerFrameItemButton_OnClick( "LeftButton" )
		else
			ContainerFrameItemButton_OnClick( frame, "LeftButton" )
		end
	end

end

function ArkInventory.Frame_Item_OnMouseUp( frame, arg1 )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end
	
	local loc_id = frame.ARK_Data.loc_id
	local i = ArkInventory.Frame_Item_GetDB( frame )
		
	if ArkInventory.Global.Location[loc_id].isOffline or ArkInventory.Global.Mode.Edit then
		
		if IsModifierKeyDown() then
			
			if i.h then
				HandleModifiedItemClick( i.h )
			end
			
		else
	
			if ArkInventory.Global.Mode.Edit then
				ArkInventory.MenuItemOpen( frame )
			end
	
		end
			
	end
		
end

function ArkInventory.Frame_Item_Update_Cooldown( frame, arg1 )

	-- triggered when a cooldown is first started, and used to hide/show the cooldown frame when offline
	
	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end
	
	local loc_id = frame.ARK_Data.loc_id
	local i = ArkInventory.Frame_Item_GetDB( frame )
	
	if i and ( arg1 == nil or arg1 == i.bag_id ) then
	
		local framename = frame:GetName()
		local obj_name = "Cooldown"
		local obj = getfenv()[framename .. obj_name]
		assert( obj, string.format( "xml element '%s' is missing the sub element %s", framename, obj_name ) )
	
		if ArkInventory.Global.Location[loc_id].isOffline then
			SetItemButtonTextureVertexColor( frame, 1, 1, 1 )
			obj:Hide()
			return
		end
		
		
		if i.h then
		
			local bliz_id = ArkInventory.BagID_Blizzard( loc_id, i.bag_id )
			ContainerFrame_UpdateCooldown( bliz_id, frame )

			-- tint un-useable items red
			local canUse = true
			
			if ArkInventory.LocationOptionGet( loc_id, { "slot", "unusable", "tint" } ) then
				ArkInventory.Global.Tooltip.Scan:SetHyperlink( i.h )
				canUse = ArkInventory.Global.Tooltip.Scan:CanUse( )
			end
			
			if canUse then
				SetItemButtonTextureVertexColor( frame, 1, 1, 1 )
			else
				SetItemButtonTextureVertexColor( frame, 1, 0.1, 0.1 )
			end
		
		else
		
			SetItemButtonTextureVertexColor( frame, 1, 1, 1 )
			obj:Hide()
		
		end
		
	end
	
end

function ArkInventory.Frame_Item_Update_Lock( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end
	
	local loc_id = frame.ARK_Data.loc_id
	if ArkInventory.Global.Location[loc_id].isOffline then
		return
	end
	
	local i = ArkInventory.Frame_Item_GetDB( frame )
	
	if i and i.h then
		
		local locked = false
		local readable = false
		local quality = nil
		
		if loc_id == ArkInventory.Const.Location.Vault then
			
			locked = select( 3, GetGuildBankItemInfo( i.bag_id, i.slot_id ) )
			
		else
		
			local bliz_id = ArkInventory.BagID_Blizzard( loc_id, i.bag_id )
			locked, quality, readable = select( 3, GetContainerItemInfo( bliz_id, i.slot_id ) )
			
		end


		if locked then
		
			--ArkInventory.Output( { "frame=", frame:GetName(), "], locked=[", locked, "]" } )
			
			ArkInventory.SetItemButtonDesaturate( frame, locked )
			
		else
		
			--ArkInventory.Output( { "frame=", frame:GetName(), "], locked=[", locked, "]" } )
			
			local canUse = true
			
			if ArkInventory.LocationOptionGet( loc_id, { "slot", "unusable", "tint" } ) then
				ArkInventory.Global.Tooltip.Scan:SetHyperlink( i.h )
				canUse = ArkInventory.Global.Tooltip.Scan:CanUse()
			end
			
			canUse = true
			
			if canUse then
				ArkInventory.SetItemButtonDesaturate( frame, locked )
			else
				ArkInventory.SetItemButtonDesaturate( frame, locked, 1.0, 0.1, 0.1 )
			end
			
		end
		
		frame.locked = locked
		frame.readable = readable
	
	else
	
		frame.locked = false
		frame.readable = false
	
	end

end

function ArkInventory.Frame_Item_Update_Clickable( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local loc_id = frame.ARK_Data.loc_id
	
	local action = false

	if ArkInventory.Global.Mode.Edit or ArkInventory.Global.Location[loc_id].isOffline then
	
		action = true
		
	else
	
		if frame.ARK_Data.loc_id == ArkInventory.Const.Location.Vault then
		
			local bag_id = frame.ARK_Data.bag_id
			local _, _, _, canDeposit, numWithdrawals = GetGuildBankTabInfo( bag_id )
			if not canDeposit and numWithdrawals == 0 then
				action = true
			end
		
		end
	
	end

	if action then
		-- disable clicks/drag when in edit mode or offline
		frame:RegisterForClicks()
		frame:RegisterForDrag()
	else
		frame:RegisterForClicks( "LeftButtonUp", "RightButtonUp" )
		frame:RegisterForDrag( "LeftButton" )
	end
	
end
	
function ArkInventory.Frame_Item_OnLoad( frame )

	local framename = frame:GetName()
	--ArkInventory.Output( { "OnLoad( ", framename, " ]" } )
	
	local loc_id, bag_id, slot_id = strmatch( framename, "^.-(%d+)ContainerBag(%d+)Item(%d+)" )
	
	assert( loc_id, string.format( "xml element '%s' is not an %s frame", framename, ArkInventory.Const.Program.Name ) )
	assert( bag_id, string.format( "xml element '%s' is not an %s frame", framename, ArkInventory.Const.Program.Name ) )
	assert( slot_id, string.format( "xml element '%s' is not an %s frame", framename, ArkInventory.Const.Program.Name ) )
	
	loc_id = tonumber( loc_id )
	bag_id = tonumber( bag_id )
	slot_id = tonumber( slot_id )

	frame:SetID( slot_id )
	
	--local bag_id = ArkInventory.BagID_Blizzard( loc_id, bag_id )
	--ArkInventory.Output( { "loc=[", loc_id, "], int=[", bag_id, "], slot=[", slot_id, "], bag=[", bag_id, "]" } )
	
	frame.ARK_Data = {
		["loc_id"] = loc_id,
		["bag_id"] = bag_id,
		["slot_id"] = slot_id,
	}
	
	ContainerFrameItemButton_OnLoad( frame )
	
	local obj = getfenv()[framename .. "Count"]
	if obj ~= nil then
		obj:SetPoint( "BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 2 )
		obj:SetPoint( "LEFT", frame, "LEFT", 0, 0 )
	end
	
	frame.UpdateTooltip = ArkInventory.Frame_Item_OnEnter
	
	frame.locked = false
	
	if loc_id == ArkInventory.Const.Location.Vault then
		
		-- replace the split function
		frame.SplitStack = function( button, split )
			local tab_id = frame.ARK_Data.bag_id
			local slot_id = frame.ARK_Data.slot_id
			SplitGuildBankItem( tab_id, slot_id, split )
		end
		
	end
	
	ArkInventory.SetFontFrame( frame )
	
end

function ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )

	--if ArkInventory.Global.Location[loc_id].drawState <= ArkInventory.Const.Window.Draw.Refresh then

	local framename = ArkInventory.ContainerItemNameGet( loc_id, bag_id, slot_id )	
	local frame = getfenv()[framename]
	
	if frame and not ArkInventory.Global.Location[loc_id].isOffline then
		ArkInventory.Frame_Item_Update_QualityBorder( frame )
		ArkInventory.Frame_Item_Update_Fade( frame )
		ArkInventory.Frame_Item_Update_Count( frame )
		ArkInventory.Frame_Item_Update_Texture( frame )
		ArkInventory.Frame_Item_Update_Lock( frame )
		ArkInventory.Frame_Item_Update_Cooldown( frame )
	end
	
end

function ArkInventory.Frame_Status_Update( frame )

	local loc_id = frame.ARK_Data.loc_id
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	
	-- hide the status window if it's not needed
	local obj = getfenv()[frame:GetName() .. ArkInventory.Const.Frame.Status.Name]
	if ArkInventory.LocationOptionGet( loc_id, { "framehide", "status" } ) then
		obj:Hide()
		obj:SetHeight( 3 )
		return
	else
		obj:SetHeight( ArkInventory.Const.Frame.Status.Height )
		obj:Show()
	end

	
	-- update money
	local moneyFrameName = obj:GetName() .. "Gold"
	local moneyFrame = getfenv()[moneyFrameName]
	assert( moneyFrame, "moneyframe is nil" )

	if ArkInventory.Global.Location[loc_id].isOffline then
		ArkInventory.MoneyFrame_SetType( moneyFrame, "STATIC" )
		MoneyFrame_Update( moneyFrameName, cp.info.money )
		SetMoneyFrameColor( moneyFrameName, 0.75, 0.75, 0.75 )
	else
		SetMoneyFrameColor( moneyFrameName, 1, 1, 1 )
		if loc_id == ArkInventory.Const.Location.Vault then
			ArkInventory.MoneyFrame_SetType( moneyFrame, "GUILDBANK" )
		else
			ArkInventory.MoneyFrame_SetType( moneyFrame, "PLAYER" )
		end
	end
	

	
	-- update the empty slot count
	local empty = { }
	
	local bags = cp.location[loc_id].bag
	
	for k, bag in pairs( bags ) do
	
		if not empty[bag.type] then
			empty[bag.type] = { ["count"] = 0, ["empty"] = 0, ["type"] = bag.type }
		end
		
		if bag.status == ArkInventory.Const.Bag.Status.Active then
			empty[bag.type].count = empty[bag.type].count + bag.count
			empty[bag.type].empty = empty[bag.type].empty + bag.empty
		end
		
	end

	local ee = ArkInventory.Table.Sum( empty, function( a ) return a.empty end )
	local ts = cp.location[loc_id].slot_count
	
	local y = ""
	if ee == 0 then
		y = RED_FONT_COLOR_CODE .. ArkInventory.Localise["STATUS_FULL"]
	else
		y = y .. ee .. "/" .. ts
	end

	if ts == 0 then
		y = RED_FONT_COLOR_CODE .. ArkInventory.Localise["STATUS_NO_DATA"]
	end

	
	if ts ~= 0 and ArkInventory.Table.Elements( empty ) > 1 then
		local z = 0
		local x
		y = y .. "  -  "
		for t, e in ArkInventory.spairs( empty, function(a,b) return empty[a].type < empty[b].type end ) do
			z = z + 1
			--x = e.empty .. "/" .. e.count .. " " .. ArkInventory.BagTypeText( t )
			x = e.empty .. " " .. ArkInventory.LocationOptionGet( loc_id, { "slot", "data", t, "name" } )
			if e.empty == 0 then
				local ec = ArkInventory.LocationOptionGet( loc_id, { "slot", "data", t, "emptycolour" } )
				if ec == nil then
					ec = RED_FONT_COLOR_CODE
				end
				x = ec .. x .. FONT_COLOR_CODE_CLOSE
			end
			
			if z == 1 then
				y = y .. x
			else
				y = y .. ", " .. x
			end
			
		end
	end

	getfenv()[frame:GetName() .. ArkInventory.Const.Frame.Status.Name .. "Text"]:SetText( y )


end


function ArkInventory.Frame_Vault_Item_OnClick( frame, arg1 )
	
	--ArkInventory.Output( { "OnClick( ", frame:GetName(), ", ", arg1, " )" } )
	
	if frame.ARK_Data.loc_id == ArkInventory.Const.Location.Vault then
	
		local loc_id = frame.ARK_Data.loc_id
		local tab_id = frame.ARK_Data.bag_id
		local slot_id = frame.ARK_Data.slot_id
	
		if HandleModifiedItemClick( GetGuildBankItemLink( tab_id, slot_id ) ) then
			return
		end
		
		if IsModifiedClick( "SPLITSTACK" ) then
			if not frame.locked then
				OpenStackSplitFrame( frame.count, frame, "BOTTOMLEFT", "TOPLEFT")
			end
			return
		end
		
		local infoType, info1, info2 = GetCursorInfo()
		if infoType == "money" then
			DepositGuildBankMoney( info1 )
			ClearCursor()
		elseif infoType == "guildbankmoney" then
			DropCursorMoney()
			ClearCursor()
		else
			if arg1 == "RightButton" then
				AutoStoreGuildBankItem( tab_id, slot_id )
			else
				PickupGuildBankItem( tab_id, slot_id )
			end
		end

	end

end

function ArkInventory.Frame_Changer_Update( loc_id )

	if loc_id == ArkInventory.Const.Location.Bag then
	
		for bag_id in ipairs( ArkInventory.Global.Location[loc_id].Bags ) do
		
			local frame = getfenv()[ArkInventory.Const.Frame.Main.Name .. loc_id .. ArkInventory.Const.Frame.Changer.Name .. "WindowBag" .. bag_id]
	
			ArkInventory.Frame_Item_Update_QualityBorderBackdrop( frame )
			
			if bag_id == 1 then
				ArkInventory.Frame_Changer_Primary_Update( frame )
			else
				ArkInventory.Frame_Changer_Secondary_Update( frame )
			end
			
		end
		
	elseif loc_id == ArkInventory.Const.Location.Bank then
	
		ArkInventory.Frame_Changer_Update_Bank()
		
	elseif loc_id == ArkInventory.Const.Location.Vault then
	
		ArkInventory.Frame_Changer_Update_Vault()
		
	end
	
	
	local frame = getfenv()[ArkInventory.Const.Frame.Main.Name .. loc_id]
	ArkInventory.Frame_Status_Update( frame )
	
end

function ArkInventory.Frame_Changer_Primary_OnLoad( frame )

	-- bag & bank

	local framename = frame:GetName()
	local loc_id, bag_id = strmatch( framename, "^" .. ArkInventory.Const.Frame.Main.Name .. "(%d+).-(%d+)$" )
	
	loc_id = tonumber( loc_id )
	bag_id = tonumber( bag_id )
	
	frame.ARK_Data = {
		["loc_id"] = tonumber( loc_id ),
		["bag_id"] = tonumber( bag_id ),
	}

	frame:RegisterForClicks( "LeftButtonUp", "RightButtonUp" )
	
	ArkInventory.SetItemButtonTexture( frame, ArkInventory.Global.Location[loc_id].Texture )
	
	local obj = getfenv()[framename .. "Count"]
	if obj ~= nil then
		obj:SetPoint( "BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 2 )
		obj:SetPoint( "LEFT", frame, "LEFT", 0, 0 )
	end

	local obj = getfenv()[framename .. "Stock"]
	if obj ~= nil then
		obj:SetPoint( "TOPLEFT", frame, "TOPLEFT", 0, -2 )
		obj:SetPoint( "RIGHT", frame, "RIGHT", 0, 0 )
	end




	
end

function ArkInventory.Frame_Changer_Primary_Update( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local loc_id = frame.ARK_Data.loc_id
	local bag_id = frame.ARK_Data.bag_id
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )

	ArkInventory.Frame_Item_Update_Fade( frame )
	
	ArkInventory.Frame_Item_Update_QualityBorderBackdrop( frame )
	
	if ArkInventory.db.global.player.data[cp.info.player_id].display[loc_id].bag[bag_id] == false then
		SetItemButtonTextureVertexColor( frame, 1.0, 0.1, 0.1 )
	else
		SetItemButtonTextureVertexColor( frame, 1.0, 1.0, 1.0 )
	end
	
	local bag = cp.location[loc_id].bag[bag_id]
	
	SetItemButtonCount( frame, bag.count )
	
	if bag.status == ArkInventory.Const.Bag.Status.Active then
		ArkInventory.SetItemButtonStock( frame, bag.empty )
	else
		ArkInventory.SetItemButtonStock( frame, bag.status )
	end

end

function ArkInventory.Frame_Changer_Primary_OnClick( frame, button )

	local loc_id = frame.ARK_Data.loc_id
	
	--ArkInventory.Output( { "primary frame=[", frame:GetName(), "], button=[", button, "]" } )

	
	if loc_id == ArkInventory.Const.Location.Bag then
		
		if button == nil then
			-- drag receive
			if not ArkInventory.Global.Location[loc_id].isOffline then
				PutItemInBackpack()
			end
		elseif button == "RightButton" then
			ArkInventory.MenuBagOpen( frame )
		elseif button == "LeftButton" then
			if not ArkInventory.Global.Location[loc_id].isOffline and CursorHasItem() then
				PutItemInBackpack()
			end
		end

	elseif loc_id == ArkInventory.Const.Location.Bank then
		
		if button == nil then
			if not ArkInventory.Global.Location[loc_id].isOffline then
				ArkInventory.PutItemInBank()
			end
		elseif button == "RightButton" then
			ArkInventory.MenuBagOpen( frame )
		elseif button == "LeftButton" then
			if not ArkInventory.Global.Location[loc_id].isOffline and CursorHasItem() then
				ArkInventory.PutItemInBank()
			end
		end

	end
	
end

function ArkInventory.Frame_Changer_Primary_OnEnter( frame )
	
	local loc_id = frame.ARK_Data.loc_id

	local tooltip_text = nil
	
	if loc_id == ArkInventory.Const.Location.Bag then
		tooltip_text = BACKPACK_TOOLTIP
	elseif loc_id == ArkInventory.Const.Location.Bank then
		tooltip_text = ArkInventory.Localise["LOCATION_BANK"]
	end

	
	if tooltip_text ~= nil then
	
		if ArkInventory.db.global.option.tooltip.show then
			ArkInventory.GameTooltipSetText( frame, tooltip_text, nil, nil, nil, true )
		end
		
		ArkInventory.BagHighlight( frame, true )
		
	end
	
end


function ArkInventory.Frame_Changer_Update_Bank()

	local loc_id = ArkInventory.Const.Location.Bank

	local parent = getfenv()[ArkInventory.Const.Frame.Main.Name .. loc_id .. ArkInventory.Const.Frame.Changer.Name .. "Window"]
	
	if not parent:IsVisible() then
		return
	end
	
	for x = 1, ArkInventory.Global.Location[loc_id].bagCount do
	
		local frame = getfenv()[ArkInventory.Const.Frame.Main.Name .. loc_id .. ArkInventory.Const.Frame.Changer.Name .. "WindowBag" .. x]
		
		if x == 1 then
			ArkInventory.Frame_Changer_Primary_Update( frame )
		else
			ArkInventory.Frame_Changer_Secondary_Update( frame )
		end
		
	end

	local purchaseFrame = getfenv()[parent:GetName() .. "PurchaseInfo"]
	
	if ArkInventory.Global.Location[loc_id].isOffline then
		purchaseFrame:Hide()
		return
	end

	
	-- update blizzards frame as well because the static dialog box uses the data in it
	UpdateBagSlotStatus()

	-- now mimic that frame
	local moneyFrame = purchaseFrame:GetName() .. "DetailMoneyFrame"
	local purchaseButton = getfenv()[purchaseFrame:GetName() .. "PurchaseButton"]
	
	local numSlots, full = GetNumBankSlots()

	-- pass in # of current slots, returns cost of next slot
	local cost = GetBankSlotCost( numSlots )
	
	purchaseFrame.nextSlotCost = cost
	if GetMoney() >= cost then
		SetMoneyFrameColor( moneyFrame, 1.0, 1.0, 1.0 )
		purchaseButton:Enable()
	else
		SetMoneyFrameColor( moneyFrame, 1.0, 0.1, 0.1 )
		purchaseButton:Disable()
	end
	MoneyFrame_Update( moneyFrame, cost )

	if full then
		purchaseFrame:Hide()
	else
		purchaseFrame:Show()
	end
	
end

function ArkInventory.Frame_Changer_Vault_Tab_OnEnter( frame )

	local loc_id = frame.ARK_Data.loc_id
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	local bag_id = frame.ARK_Data.bag_id

	if ArkInventory.db.global.option.tooltip.show then
	
		ArkInventory.GameTooltipSetPosition( frame, true )
		
		local bag = cp.location[loc_id].bag[bag_id]
		
		if bag and bag.name then
			GameTooltip:SetText( bag.name )
		else
			GameTooltip:Hide()
		end
		
		CursorUpdate()
		
	end
	
	--ArkInventory.BagHighlight( frame, true )
	
end

function ArkInventory.Frame_Changer_Vault_Tab_OnClick( frame, button )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local loc_id = frame.ARK_Data.loc_id
	local bag_id = frame.ARK_Data.bag_id
	
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	local tab = cp.location[loc_id].bag[bag_id]
	
	if tab.name == nil then
		return
	end

	if tab.status == ArkInventory.Const.Bag.Status.Active or tab.status == tab.status == ArkInventory.Const.Bag.Status.Empty then

		if button == nil then
		
			-- drag'n'drop (drop)
			
	--		if not ArkInventory.Global.Location[loc_id].isOffline then
	--			ArkInventory.PutItemInGuildBank( tab_id )
	--		end
	
		elseif button == "RightButton" then
			
			ArkInventory.MenuVaultTabOpen( frame )
			
		elseif button == "LeftButton" then
			
			local smf = getfenv()[ArkInventory.Const.Frame.Main.Name .. loc_id .. ArkInventory.Const.Frame.Log.Name .. ArkInventory.Const.Frame.Scrolling.List]
			smf:ScrollToTop()
		
			if GuildBankFrame.mode == "bank" then
			
				if bag_id ~= GetCurrentGuildBankTab() then
					
					SetCurrentGuildBankTab( bag_id )
					
					if ArkInventory.Global.Location[loc_id].isOffline then
						ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
					else
						ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
						QueryGuildBankTab( GetCurrentGuildBankTab() )
					end
					
				end
				
			elseif GuildBankFrame.mode == "log" then
			
				SetCurrentGuildBankTab( bag_id )
				QueryGuildBankLog( bag_id )
				ArkInventory.Frame_Vault_Log_Update()
				
			elseif GuildBankFrame.mode == "moneylog" then
			
				SetCurrentGuildBankTab( bag_id )
				QueryGuildBankLog( MAX_GUILDBANK_TABS + 1 )
				ArkInventory.Frame_Vault_Log_Update()
				
			end
			
		end
		
	end
	
	ArkInventory.Frame_Changer_Update( loc_id )
	
end

function ArkInventory.Frame_Changer_Update_Vault()

	local loc_id = ArkInventory.Const.Location.Vault
	local parent = ArkInventory.Const.Frame.Main.Name .. loc_id .. ArkInventory.Const.Frame.Changer.Name .. "Window"
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	
	if not getfenv()[parent]:IsVisible() then
		return
	end
	
	for bag_id in ipairs( ArkInventory.Global.Location[loc_id].Bags ) do

		if bag_id == GetCurrentGuildBankTab() then
			ArkInventory.db.global.player.data[cp.info.player_id].display[loc_id].bag[bag_id] = true
		else
			ArkInventory.db.global.player.data[cp.info.player_id].display[loc_id].bag[bag_id] = false
		end

		local frame = getfenv()[parent .. "Bag" .. bag_id]
		ArkInventory.Frame_Changer_Secondary_Update( frame )
		
	end
	
	
	local moneyDeposit = parent .. "GoldTotal"
	local buttonDeposit = parent .. "DepositButton"
	local moneyWithdraw = parent .. "GoldAvailable"
	local buttonWithdraw = parent .. "WithdrawButton"
	
	if ArkInventory.Global.Location[loc_id].isOffline then
	
		getfenv()[moneyDeposit]:Hide()
		getfenv()[buttonDeposit]:Hide()
		getfenv()[moneyWithdraw]:Hide()
		getfenv()[buttonWithdraw]:Hide()
		
	else

		-- update the guild gold total
		MoneyFrame_Update( moneyDeposit, GetGuildBankMoney() )
		getfenv()[moneyDeposit]:Show()
		getfenv()[buttonDeposit]:Show()
		getfenv()[moneyWithdraw]:Show()
		getfenv()[buttonWithdraw]:Show()
	
		-- update the guild withdrawl amount
		
		if CanWithdrawGuildBankMoney() then
	
			local withdrawLimit = GetGuildBankWithdrawMoney()

			if withdrawLimit < 0 then
				-- no limit, set to full amount
				withdrawLimit = GetGuildBankMoney()
			end
			
			if withdrawLimit > 0 then
				
				withdrawLimit = min( withdrawLimit, GetGuildBankMoney() )
				getfenv()[buttonWithdraw]:Enable()
				
			else
			
				getfenv()[buttonWithdraw]:Disable()
				
			end
			
			MoneyFrame_Update( moneyWithdraw, withdrawLimit )
			getfenv()[moneyWithdraw]:Show()
			
		else
		
			getfenv()[moneyWithdraw]:Hide()
			getfenv()[buttonWithdraw]:Disable()
			
		end
		
	end
	
	
	-- purchase frame
	local purchaseFrame = getfenv()[parent .. "PurchaseInfo"]
	
	if ArkInventory.Global.Location[loc_id].isOffline or not IsGuildLeader() then
	
		purchaseFrame:Hide()
	
	else

		moneyFrame = purchaseFrame:GetName() .. "DetailMoneyFrame"
		purchaseButton = getfenv()[purchaseFrame:GetName() .. "PurchaseButton"]
	
		numSlots = GetNumGuildBankTabs()
		cost = GetGuildBankTabCost()
	
		if not cost then
	
			-- all tabs purchased
			purchaseFrame:Hide()
		
		else
	
			if GetMoney() >= cost then
				SetMoneyFrameColor( moneyFrame, 1.0, 1.0, 1.0 )
				purchaseButton:Enable()
			else
				SetMoneyFrameColor( moneyFrame, 1.0, 0.1, 0.1 )
				purchaseButton:Disable()
			end
			
			MoneyFrame_Update( moneyFrame, cost )
			purchaseFrame:Show()
	
		end
		
	end
	
end


function ArkInventory.Frame_Changer_Secondary_OnLoad( frame )

	local framename = frame:GetName()
	
	local loc_id, bag_id = strmatch( framename, "^" .. ArkInventory.Const.Frame.Main.Name .. "(%d+).-(%d+)$" )
	
	loc_id = tonumber( loc_id )
	bag_id = tonumber( bag_id )
	--local inv_id = ArkInventory.InventoryIDGet( loc_id, bag_id )
	
	frame.ARK_Data = {
		["loc_id"] = loc_id,
		["bag_id"] = bag_id,
		--["inv_id"] = inv_id,
	}
	
	frame.locked = nil
	
	frame:RegisterForClicks( "LeftButtonUp", "RightButtonUp" )
	frame:RegisterForDrag( "LeftButton" )

	ArkInventory.SetItemButtonTexture( frame, ArkInventory.Const.Texture.Empty.Bag )

	local obj = getfenv()[framename .. "Count"]
	if obj ~= nil then
		obj:SetPoint( "BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 2 )
		obj:SetPoint( "LEFT", frame, "LEFT", 0, 0 )
	end

	local obj = getfenv()[framename .. "Stock"]
	if obj ~= nil then
		obj:SetPoint( "TOPLEFT", frame, "TOPLEFT", 0, -2 )
		obj:SetPoint( "RIGHT", frame, "RIGHT", 0, 0 )
	end
	
end

function ArkInventory.Frame_Changer_Secondary_OnClick( frame, button )
	
	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local loc_id = frame.ARK_Data.loc_id
	
	if IsModifiedClick( "CHATLINK" ) then
	
		local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
		local bag_id = frame.ARK_Data.bag_id
		
		local bag = cp.location[loc_id].bag[bag_id]
	
		if not bag or bag.count == 0 then
		
			-- empty slot, do nothing for the chatlink
			
		else
			
			if bag.h then
				ChatEdit_InsertLink( bag.h )
			end
			
		end
			
	else
	
		if button == nil then
			
		elseif button == "RightButton" then
		
			ArkInventory.MenuBagOpen( frame )
			
		elseif button == "LeftButton" then
			
			if ArkInventory.Global.Location[loc_id].isOffline then
				return
			end
			
			local bag_id = frame.ARK_Data.bag_id
			local inv_id = ArkInventory.InventoryIDGet( loc_id, bag_id )
			
			if CursorHasItem() then
			
				if PutItemInBag( inv_id ) then
					return
				end
				
			else
			
				ArkInventory.Frame_Changer_Secondary_OnDragStart( frame )
				
			end
			
		end
		
	end
	
end

function ArkInventory.Frame_Changer_Secondary_OnDragStart( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local loc_id = frame.ARK_Data.loc_id
	
	if ArkInventory.Global.Location[loc_id].isOffline then
		return
	end
	
	if loc_id == ArkInventory.Const.Location.Vault then
		return
	end
	
	local bag_id = frame.ARK_Data.bag_id
	local inv_id = ArkInventory.InventoryIDGet( loc_id, bag_id )
	PickupBagFromSlot( inv_id )
	PlaySound( "BAGMENUBUTTONPRESS" )
	
end

function ArkInventory.Frame_Changer_Secondary_OnReceiveDrag( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local loc_id = frame.ARK_Data.loc_id
	
	if ArkInventory.Global.Location[loc_id].isOffline then
		return
	end
	
	ArkInventory.Frame_Changer_Secondary_OnClick( frame )
	
end

function ArkInventory.Frame_Changer_Secondary_OnEnter( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end
	
	local loc_id = frame.ARK_Data.loc_id
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	local bag_id = frame.ARK_Data.bag_id
	local inv_id = ArkInventory.InventoryIDGet( loc_id, bag_id )

	if ArkInventory.db.global.option.tooltip.show then
	
		ArkInventory.GameTooltipSetPosition( frame, true )
	
		if ArkInventory.Global.Location[loc_id].isOffline then
	
			local b = cp.location[loc_id].bag[bag_id]
	
			if not b or b.count == 0 then
				-- empty slot, do nothing for the tooltip
			else
		
				if b.h then
					GameTooltip:SetHyperlink( b.h )
				else
					GameTooltip:SetText( ArkInventory.Localise["STATUS_NO_DATA"], 1.0, 1.0, 1.0 )
				end
			
			end
		
		else
		
			GameTooltip:SetInventoryItem( "player", inv_id )
		
		end
	
		CursorUpdate()
	
	end
	
	ArkInventory.BagHighlight( frame, true )
	
end

function ArkInventory.Frame_Changer_Secondary_Update( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local loc_id = frame.ARK_Data.loc_id
	local bag_id = frame.ARK_Data.bag_id
	
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	local bag = cp.location[loc_id].bag[bag_id]
	
	--ArkInventory.Output( { "who[", cp, "].loc[", loc_id, "].bag[", bag_id, "]" } )
	
	if bag.count > 0 then
	
		frame.size = bag.count or 0
		ArkInventory.SetItemButtonTexture( frame, bag.texture )
		SetItemButtonCount( frame, frame.size )
		
	else
	
		frame.size = 0
		ArkInventory.SetItemButtonTexture( frame, ArkInventory.Const.Texture.Empty.Bag )
		SetItemButtonCount( frame, frame.size )
		
	end
		
	if bag.status == ArkInventory.Const.Bag.Status.Active then
		ArkInventory.SetItemButtonStock( frame, bag.empty )
	else
		ArkInventory.SetItemButtonStock( frame, bag.status )
	end

	ArkInventory.Frame_Item_Update_Fade( frame )
	
	ArkInventory.Frame_Item_Update_QualityBorderBackdrop( frame )
	
	if ArkInventory.db.global.player.data[cp.info.player_id].display[loc_id].bag[bag_id] == false then
		SetItemButtonTextureVertexColor( frame, 1.0, 0.1, 0.1 )
	else
		if bag.status == ArkInventory.Const.Bag.Status.Purchase then
			SetItemButtonTextureVertexColor( frame, 1.0, 0.1, 0.1 )
		else
			SetItemButtonTextureVertexColor( frame, 1.0, 1.0, 1.0 )
		end
	end

end

function ArkInventory.Frame_Changer_Secondary_Update_Lock( loc_id, bag_id )

	local frame = getfenv()[ArkInventory.Const.Frame.Main.Name .. loc_id .. ArkInventory.Const.Frame.Changer.Name .. "WindowBag" .. bag_id]
	if not frame then
		return
	end

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end
	
	if ArkInventory.Global.Location[loc_id].isOffline then
		return
	end
	
	if ArkInventory.Global.Me.location[loc_id].bag[bag_id].h then
	
		local inv_id = ArkInventory.InventoryIDGet( loc_id, bag_id )
		local locked = IsInventoryItemLocked( inv_id )
		ArkInventory.SetItemButtonDesaturate( frame, locked )
		frame.locked = locked
	
	else
	
		frame.locked = false
	
	end

end

function ArkInventory.Frame_Changer_Generic_OnLeave( frame )
	GameTooltip:Hide()
	ResetCursor()
	ArkInventory.BagHighlight( frame, false )
end



function ArkInventory.BagHighlight( frame, show )
	
	local loc_id = frame.ARK_Data.loc_id
	local bag_id = frame.ARK_Data.bag_id
	
	if loc_id ~=nil and bag_id ~= nil then
	
		local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
		
		local b = cp.location[loc_id].bag[bag_id]
		if not b then
			return
		end
		
		local name = ArkInventory.Const.Frame.Main.Name .. loc_id .. ArkInventory.Const.Frame.Container.Name .. "Bag" .. bag_id
		local frame = getfenv()[name]
		if not frame then
			return
		end

		local colour = ArkInventory.LocationOptionGet( loc_id, { "window", "colour", "baghighlight" } )

		for slot_id in pairs( b.slot ) do
			local obj = getfenv()[name .. "Item" .. slot_id .. "ArkHighlight"]
			if obj then
				if show then
					getfenv()[obj:GetName() .. "Background"]:SetTexture( colour.r, colour.g, colour.b, 0.3 )
					obj:Show()
				else
					obj:Hide()
				end
			end
			
		end
	
	end
	
end


function ArkInventory.MyHook(...)
	if not ArkInventory:IsHooked(...) then
		ArkInventory:RawHook(...)
	end
end

function ArkInventory.MyUnhook(...)
	if ArkInventory:IsHooked(...) then
		ArkInventory:Unhook(...)
	end
end

function ArkInventory.MySecureHook(...)
	if not ArkInventory:IsHooked(...) then
		ArkInventory:SecureHook(...)
	end
end

function ArkInventory.BlizzardAPIHooks( disable )

	-- bag hooks
	if ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) and not disable then
		ArkInventory.MyHook( "OpenBackpack", "HookOpenBackpack", true )
		ArkInventory.MyHook( "ToggleBackpack", "HookToggleBackpack", true )
		ArkInventory.MyHook( "OpenBag", "HookOpenBag", true )
		ArkInventory.MyHook( "ToggleBag", "HookToggleBag", true )
		ArkInventory.MyHook( "OpenAllBags", "HookOpenAllBags", true )
	else
		ArkInventory.MyUnhook( "OpenBackpack" )
		ArkInventory.MyUnhook( "ToggleBackpack" )
		ArkInventory.MyUnhook( "OpenBag" )
		ArkInventory.MyUnhook( "ToggleBag" )
		ArkInventory.MyUnhook( "OpenAllBags" )
		
		ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
	end

	-- keyring hooks
	if ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Key ) and not disable then
		ArkInventory.MyHook( "ToggleKeyRing", "HookToggleKeyRing", true )
	else
		ArkInventory.MyUnhook( "ToggleKeyRing" )
	end
	
	-- bank hooks
	if ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bank ) and not disable then
		BankFrame:UnregisterEvent( "BANKFRAME_OPENED" )
		--BankFrame:UnregisterEvent( "BANKFRAME_CLOSED" )
	else
		BankFrame:RegisterEvent( "BANKFRAME_OPENED" )
		--BankFrame:RegisterEvent( "BANKFRAME_CLOSED" )
	end
	
	-- guild bank hooks
	if ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Vault ) and not disable then
	
		UIParent:UnregisterEvent( "GUILDBANKFRAME_OPENED" )
		
		GuildBankFrame:UnregisterEvent( "GUILDBANKBAGSLOTS_CHANGED" )
		GuildBankFrame:UnregisterEvent( "GUILDBANK_ITEM_LOCK_CHANGED" )
		GuildBankFrame:UnregisterEvent( "GUILDBANK_UPDATE_TABS" )
		GuildBankFrame:UnregisterEvent( "GUILDBANK_UPDATE_MONEY" )
		GuildBankFrame:UnregisterEvent( "GUILD_ROSTER_UPDATE" )
		GuildBankFrame:UnregisterEvent( "GUILDBANKLOG_UPDATE" )
		GuildBankFrame:UnregisterEvent( "GUILDTABARD_UPDATE" )

		local frame = getfenv()[ArkInventory.Const.Frame.Main.Name .. ArkInventory.Const.Location.Vault]
		if frame then
			GuildBankPopupFrame:ClearAllPoints()
			GuildBankPopupFrame:SetPoint( "TOPLEFT", frame, "TOPRIGHT", -4, -30 )
		end
		
	else

		UIParent:RegisterEvent( "GUILDBANKFRAME_OPENED" )
		
		GuildBankFrame:RegisterEvent( "GUILDBANKBAGSLOTS_CHANGED" )
		GuildBankFrame:RegisterEvent( "GUILDBANK_ITEM_LOCK_CHANGED" )
		GuildBankFrame:RegisterEvent( "GUILDBANK_UPDATE_TABS" )
		GuildBankFrame:RegisterEvent( "GUILDBANK_UPDATE_MONEY" )
		GuildBankFrame:RegisterEvent( "GUILD_ROSTER_UPDATE" )
		GuildBankFrame:RegisterEvent( "GUILDBANKLOG_UPDATE" )
		GuildBankFrame:RegisterEvent( "GUILDTABARD_UPDATE" )

		local frame = getfenv()["GuildBankFrame"]
		if frame then
			GuildBankPopupFrame:ClearAllPoints()
			GuildBankPopupFrame:SetPoint( "TOPLEFT", frame, "TOPRIGHT", -4, -30 )
		end
	
	end

	--ArkInventory.MySecureHook( "GuildBankPopupOkayButton_OnClick", "HookGuildBankPopupOkayButton_OnClick" )
	
	-- tooltip
	
	local tooltip_objects = { GameTooltip, ItemRefTooltip, ShoppingTooltip1, ShoppingTooltip2 }
	
	local tooltip_functions = { -- GameTooltip:SetXXXX() functions taken from wowwiki, there may be some missing
		"SetAuctionCompareItem", "SetAuctionItem", "SetAuctionSellItem", "SetBagItem", "SetBuybackItem",
		"SetCraftItem", "SetCraftSpell", "SetGuildBankItem", "SetHyperlink", "SetHyperlinkCompareItem",
		"SetInboxItem", "SetInventoryItem", "SetLootItem", "SetLootRollItem", "SetMerchantCompareItem",
		"SetMerchantItem", "SetQuestItem", "SetQuestLogItem", "SetSendMailItem", "SetTradePlayerItem",
		"SetTradeSkillItem", "SetTradeTargetItem", }

	if ArkInventory.db.global.option.tooltip.show and not disable then
	
		for _, obj in pairs( tooltip_objects ) do
		
			for _, func in pairs( tooltip_functions ) do
				if obj[func] then -- make sure only valid functions are hooked (wowwiki is not always accurate)
					ArkInventory.MySecureHook( obj, func, ArkInventory.TooltipAddCustom )
				end
			end
			
		end
		
	else
	
		for _, obj in pairs( tooltip_objects ) do
		
			for _, func in pairs( tooltip_functions ) do
				if obj[func] then -- make sure only valid functions are unhooked (wowwiki is not always accurate)
					ArkInventory.MyUnhook( obj, func, ArkInventory.TooltipAddCustom )
				end
			end
			
		end
		
	end
	
end

function ArkInventory.HookOpenBackpack( self, forceOpen )

	--ArkInventory.Output( { RED_FONT_COLOR_CODE, "HookOpenBackpack( ", forceOpen, " )" } )
	
	local loc_id = ArkInventory.Const.Location.Bag
	
	if ArkInventory.LocationIsControlled( loc_id ) then
		if forceOpen then
			ArkInventory.Frame_Main_Show( loc_id )
		else
			ArkInventory.Frame_Main_Toggle( loc_id )
		end
	else
		ArkInventory.hooks["OpenBackpack"]( forceOpen )
	end

	
end

function ArkInventory.HookToggleBackpack( self )

	--ArkInventory.Output( { RED_FONT_COLOR_CODE, "HookToggleBackpack()" } )
	
	ArkInventory.HookOpenBackpack( self )
	
end

function ArkInventory.HookToggleKeyRing( self )

	--ArkInventory.Output( { RED_FONT_COLOR_CODE, "ToggleKeyRing()" } )
	
	local loc_id = ArkInventory.Const.Location.Key
	
	if ArkInventory.LocationIsControlled( loc_id ) then
		ArkInventory.Frame_Main_Toggle( loc_id )
	else
		ArkInventory.hooks["KeyringToggle"]()
	end
	
end

function ArkInventory.HookOpenBag( self, bag_id, forceOpen )
	
	--ArkInventory.Output( { RED_FONT_COLOR_CODE, "HookOpenBag( ", bag_id, ", ", forceOpen, " )" } )
	
	if bag_id then
	
		local loc_id = ArkInventory.BagID_Internal( bag_id )
		
		if loc_id == ArkInventory.Const.Location.Bank or loc_id == ArkInventory.Const.Location.Bag then
			if ArkInventory.LocationIsControlled( loc_id ) then
				if forceOpen then
					ArkInventory.Frame_Main_Show( loc_id )
				else
					ArkInventory.Frame_Main_Toggle( loc_id )
				end
			else
				ArkInventory.hooks["OpenBag"]( bag_id, forceOpen )
			end
		end
		
	end
	
end

function ArkInventory.HookToggleBag( self, bag_id )
	
	--ArkInventory.Output( { RED_FONT_COLOR_CODE, "HookToggleBag( ", bag_id, " )" } )
	
	ArkInventory.HookOpenBag( self, bag_id, false )
	
end

function ArkInventory.HookOpenAllBags( self, forceOpen )

	--ArkInventory.Output( { RED_FONT_COLOR_CODE, "HookOpenAllBags( ", forceOpen, " )" } )
	
	local loc_id = ArkInventory.Const.Location.Bag
	
	if ArkInventory.LocationIsControlled( loc_id ) then
		if forceOpen then
			ArkInventory.Frame_Main_Show( loc_id )
		else
			ArkInventory.Frame_Main_Toggle( loc_id )
		end
	else
		ArkInventory.hooks["OpenAllBags"]( forceOpen )
	end
	
end

function ArkInventory.HookDoNothing( self )
	-- ArkInventory.Output( { RED_FONT_COLOR_CODE, "HookDoNothing()" } )
	-- do nothing
end

function ArkInventory.HookGuildBankPopupOkayButton_OnClick( self )

	--ArkInventory.Output( { RED_FONT_COLOR_CODE, "GuildBankPopupOkayButton_OnClick()" } )
	--ArkInventory.hooks["GuildBankPopupOkayButton_OnClick"]()
	
	local loc_id = ArkInventory.Const.Location.Vault
	
	if not ArkInventory.Global.Location[loc_id].isOffline then
		ArkInventory.Frame_Main_Generate( loc_id, nil )
	end
	
end

function ArkInventory.ContainerNameGet( loc_id, bag_id )
	if loc_id ~= nil and bag_id ~= nil then
		local x = ArkInventory.Const.Frame.Main.Name .. loc_id .. ArkInventory.Const.Frame.Container.Name .. "Bag" .. bag_id
		return x
	end
end

function ArkInventory.ContainerItemNameGet( loc_id, bag_id, slot_id )
	--if loc_id ~= nil and type( loc_id ) == "number" and bag_id ~= nil and type( bag_id ) == "number" and slot_id ~= nil and type( slot_id ) == "number" then
	if loc_id ~= nil and bag_id ~= nil and slot_id ~= nil and type( slot_id ) == "number" then
		local x = ArkInventory.ContainerNameGet( loc_id, bag_id ) .. "Item" .. slot_id
		return x
	end
end

function ArkInventory.LocationOptionGet( loc_id, opt )
	local loc_id = ArkInventory.db.profile.option.use[loc_id]
	return ArkInventory.LocationOptionGetReal( loc_id, opt )
end

function ArkInventory.LocationOptionGetReal( loc_id, opt )

	assert( loc_id ~= nil, "location id is nil" )
	assert( type( opt ) == "table", "opt is not a table" )

	local p = ArkInventory.db.profile.option.location[loc_id]
	
	for k = 1, #opt do
	
		if p == nil then
			--ArkInventory.Output( { "loc_id=[", loc_id, "], opt=[", opt, "], k=[", k, "]" } )
			assert( false, "code error: encountered nil on option sub path - please reload ui to reset database" )
		end
		local v = opt[k]
		assert( v ~= nil, "code error: encountered a nil parameter at position " .. k )
--		ArkInventory.Output( { "p[", v, "]=[", p[v], "]" } )
		p = p[v]
	end
	
	return p

end

function ArkInventory.LocationOptionSetReal( loc_id, opt, n )

	assert( loc_id ~= nil, "location id is nil" )
	assert( type( opt ) == "table", "opt is not a table" )

	--s = "option.local." .. loc_id
	local p = { ArkInventory.db.profile.option.location[loc_id] }
	local c = 1
	
	for k = 1, #opt - 1 do
		c = k + 1
		local v = opt[k]
		p[c] = p[k][v]
		--s = s .. "." .. v
	end
	
	local v = opt[c]
	--ArkInventory.Output( { "set ", s, "[", v, "], old=[", p[c][v], "], new=[", n, "]" } )
	p[c][v] = n

end

function ArkInventory.LocationOptionSet( loc_id, opt, n )
	local loc_id = ArkInventory.db.profile.option.use[loc_id]
	return ArkInventory.LocationOptionSetReal( loc_id, opt, n )
end

function ArkInventory.ToggleChanger( loc_id )
	ArkInventory.LocationOptionSet( loc_id, { "framehide", "changer" }, not ArkInventory.LocationOptionGet( loc_id, { "framehide", "changer" } ) )
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
end

function ArkInventory.ToggleEditMode()
	ArkInventory.Global.Mode.Edit = not ArkInventory.Global.Mode.Edit
	ArkInventory.Frame_Bar_Paint_All()
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
end

function ArkInventory.GameTooltipSetPosition( frame, bottom )

	local x, a
	x = frame:GetLeft() + ( frame:GetRight() - frame:GetLeft() ) / 2
	
	if bottom then
		if ( x >= ( GetScreenWidth() / 2 ) ) then
			a = "ANCHOR_BOTTOMLEFT"
		else
			a = "ANCHOR_BOTTOMRIGHT"
		end
	else
		if ( x >= ( GetScreenWidth() / 2 ) ) then
			a = "ANCHOR_LEFT"
		else
			a = "ANCHOR_RIGHT"
		end
	end
	
	GameTooltip:SetOwner( frame, a )
	
end

function ArkInventory.GameTooltipSetText( frame, txt, r, g, b, bottom )
	ArkInventory.GameTooltipSetPosition( frame, bottom )
	GameTooltip:SetText( txt or "missing text", r or 1, g or 1, b or 1 )
	GameTooltip:Show()
end

function ArkInventory.GameTooltipSetHyperlink( frame, h )
	ArkInventory.GameTooltipSetPosition( frame )
	GameTooltip:SetHyperlink( h )
	GameTooltip:Show()
end

function ArkInventory.GameTooltipHide()
	GameTooltip:Hide()
end

function ArkInventory.TooltipSetMoneyCoin( frame, money, txt, r, g, b )

	frame:AddDoubleLine( txt or "missing text", " ", r or 1, g or 1, b or 1 )
	local numLines = frame:NumLines()
	
	local txtFrame = getfenv()[frame:GetName() .. "TextLeft" .. numLines]
	local moneyFrame = getfenv()[frame:GetName() .. "MoneyFrame"]
	
	MoneyFrame_Update( moneyFrame:GetName(), money )
	moneyFrame:Show()
	moneyFrame:SetPoint( "LEFT", frame:GetName() .. "TextLeft" .. numLines, "RIGHT", 10, 0 )

	frame:SetMinimumWidth( txtFrame:GetWidth() + moneyFrame:GetWidth() + 10 )
	
end

function ArkInventory.TooltipSetMoneyText( frame, money, txt, r, g, b )
	if money == 0 then
		frame:AddDoubleLine( txt or "missing text", ITEM_UNSELLABLE, r or 1, g or 1, b or 1, 1, 1, 1 )
	else
		frame:AddDoubleLine( txt or "missing text", string.format( "%s", ArkInventory.MoneyText( money ) ), r or 1, g or 1, b or 1, 1, 1, 1 )
	end
end

function ArkInventory.PTItemSearch( item )

	-- taken from pt3.0 because someone decided that it didnt belong in pt3.1
	
	local item = ArkInventory.ItemStringDecode( item )
	if item <= 0 then
		return nil
	end
	
	local matches = { }
	for k, v in pairs( ArkInventory.Lib.PeriodicTable.sets ) do
		local _, set = ArkInventory.Lib.PeriodicTable:ItemInSet( item, k )
		if set then
			local have
			for _, v in ipairs( matches ) do
				if v == set then
					have = true
				end
			end
			if not have then
				table.insert( matches, set )
			end
		end
	end
	
	if #matches > 0 then
		table.sort( matches )
		return matches
	end
	
end

function ArkInventory.LocationControlToggle( loc_id )
	
	local player_id = ArkInventory.Global.Me.info.player_id
	
	if not ArkInventory.db.global.player.data[player_id].control[loc_id] then
	
		-- enabling ai for location - hide open blizzard frame
		
		if loc_id == ArkInventory.Const.Location.Bag then
			CloseAllBags()
		elseif loc_id == ArkInventory.Const.Location.Keyring then
		
		elseif loc_id == ArkInventory.Const.Location.Bank and ArkInventory.Global.Mode.Bank then
			CloseBankFrame()
		elseif loc_id == ArkInventory.Const.Location.Vault and ArkInventory.Global.Mode.Vault then
			CloseGuildBankFrame()
		end
		
	else

		-- disabling ai for location - hide ai frame
		
		ArkInventory.Frame_Main_Hide( loc_id )
		
	end
	
	ArkInventory.db.global.player.data[player_id].control[loc_id] = not ArkInventory.db.global.player.data[player_id].control[loc_id]
	ArkInventory.BlizzardAPIHooks()

end


function ArkInventory.Frame_Vault_Log_Update()

	local numTransactions = 0
	if GuildBankFrame.mode == "log" then
		numTransactions = GetNumGuildBankTransactions( GetCurrentGuildBankTab() ) or 0
	elseif GuildBankFrame.mode == "moneylog" then
		numTransactions = GetNumGuildBankMoneyTransactions() or 0
	end

	if numTransactions == 0 then
		return
	end
	
	local loc_id = ArkInventory.Const.Location.Vault

	local obj = getfenv()[ArkInventory.Const.Frame.Main.Name .. loc_id .. ArkInventory.Const.Frame.Log.Name .. ArkInventory.Const.Frame.Scrolling.List]
	obj:SetMaxLines( numTransactions )
	
	local tab = GetCurrentGuildBankTab()

	obj:SetInsertMode( "TOP" )
	obj:AddMessage( "-- end of list --" )

	for i = 1, numTransactions do
		
		local msg, type, name, amount, year, month, day, hour, money
		
		if GuildBankFrame.mode == "log" then
			type, name, itemLink, count, tab1, tab2, year, month, day, hour = GetGuildBankTransaction( tab, i )
		elseif GuildBankFrame.mode == "moneylog" then
			type, name, amount, year, month, day, hour = GetGuildBankMoneyTransaction( i )
		end
		
		if not name then
			name = UNKNOWN
		end
		
		name = NORMAL_FONT_COLOR_CODE..name..FONT_COLOR_CODE_CLOSE
		
		if GuildBankFrame.mode == "log" then
			
			if type == "deposit" then
				msg = format( GUILDBANK_DEPOSIT_FORMAT, name, itemLink )
				if count > 1 then
					msg = msg .. format( GUILDBANK_LOG_QUANTITY, count )
				end
			elseif type == "withdraw" then
				msg = format( GUILDBANK_WITHDRAW_FORMAT, name, itemLink )
				if count > 1 then
					msg = msg .. format( GUILDBANK_LOG_QUANTITY, count )
				end
			elseif type == "move" then
				msg = format( GUILDBANK_MOVE_FORMAT, name, itemLink, count, GetGuildBankTabInfo(tab1), GetGuildBankTabInfo(tab2) )
			end
			
		elseif GuildBankFrame.mode == "moneylog" then

			money = GetDenominationsFromCopper( amount )
		
			if type == "deposit" then
				msg = format( GUILDBANK_DEPOSIT_MONEY_FORMAT, name, money )
			elseif type == "withdraw" then
				msg = format( GUILDBANK_WITHDRAW_MONEY_FORMAT, name, money )
			elseif type == "repair" then
				msg = format( GUILDBANK_REPAIR_MONEY_FORMAT, name, money )
			elseif type == "withdrawForTab" then
				msg = format( GUILDBANK_WITHDRAWFORTAB_MONEY_FORMAT, name, money )
			elseif type == "buyTab" then
				msg = format( GUILDBANK_BUYTAB_MONEY_FORMAT, name, money )
			end
			
		end
		
		if msg then
			obj:AddMessage( msg .. GUILD_BANK_LOG_TIME_PREPEND .. format( GUILD_BANK_LOG_TIME, RecentTimeDate( year, month, day, hour ) ) )
		end
		
	end

	ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
	
end

function ArkInventory.ScrollingMessageFrame_Scroll( parent, name, direction )

	if not parent or not name then
		return
	end
	
	local obj = getfenv()[parent:GetName() .. name]
	if not obj then
		return
	end
	
	local i = obj:GetInsertMode()
	
	if i == "TOP" then
	
		if direction == "up" and not obj:AtBottom() then
			obj:ScrollDown()
		elseif direction == "pageup" and not obj:AtBottom() then
			obj:PageDown()
		elseif direction == "down" and not obj:AtTop() then
			obj:ScrollUp()
		elseif direction == "pagedown" and not obj:AtTop() then
			obj:PageUp()
		end
	
	else
	
		if direction == "up" and not obj:AtTop() then
			obj:ScrollUp()
		elseif direction == "pageup" and not obj:AtTop() then
			obj:PageUp()
		elseif direction == "down" and not obj:AtBottom() then
			obj:ScrollDown()
		elseif direction == "pagedown" and not obj:AtBottom() then
			obj:PageDown()
		end
	
	end
	
end

function ArkInventory.ScrollingMessageFrame_ScrollWheel( parent, name, direction )

	if direction == 1 then
		ArkInventory.ScrollingMessageFrame_Scroll( parent, name, "up" )
	else
		ArkInventory.ScrollingMessageFrame_Scroll( parent, name, "down" )
	end

end

function ArkInventory.LocationIsMonitored( loc_id ) -- listen for changes in this location
	local x = ArkInventory.db.global.player.data[ArkInventory.Global.Me.info.player_id].monitor[loc_id]
	return x
end

function ArkInventory.LocationIsControlled( loc_id )
	local x = ArkInventory.db.global.player.data[ArkInventory.Global.Me.info.player_id].control[loc_id]
	return x
end

function ArkInventory.LocationIsSaved( loc_id )
	local x = ArkInventory.db.global.player.data[ArkInventory.Global.Me.info.player_id].save[loc_id]
	return x
end

function ArkInventory.DisplayName1( p )
	local x = string.format( "%s\n%s > %s", p.name, p.faction_local, p.realm ) -- window titles
	return x
end

function ArkInventory.DisplayName2( p )
	local x = string.format( "%s > %s > %s", p.realm, p.faction_local, p.name ) -- switch menu
	return x
end

function ArkInventory.DisplayName3( p )
	local x = p.name -- tooltip item count
	return x
end

function ArkInventory.DisplayName4( p )
	local x = string.format( "%s%s [%s:%s]", ArkInventory.ClassColourCode( p.info.class ), p.info.name, p.info.class_local, p.info.level )
	return x
end

function ArkInventory.MemoryUsed( c )

	if c then
		collectgarbage( "stop" )
	end

	--UpdateAddOnMemoryUsage()

	--local am = GetAddOnMemoryUsage( ArkInventory.Const.Program.Name ) * 1000
	local am = collectgarbage( "count" )
	
	if not c then
		collectgarbage( "restart" )
	end
	
	return am

end

function ArkInventory.StartupChecks()

	for w in pairs( RAID_CLASS_COLORS ) do
	
		local key
		
		key = string.format( "PT_CLASS_%s", w )
		if not ArkInventory.Localise:HasBaseTranslation( key ) then
			ArkInventory.Output( { "locale warning: enUS entry for ", key, " is missing" } )
		end

		key = string.format( "WOW_CLASS_%s", w )
		if not ArkInventory.Localise:HasBaseTranslation( key ) then
			ArkInventory.Output( { "locale warning: enUS entry for ", key, " is missing" } )
		elseif not ArkInventory.Localise:HasTranslation( key ) then
			ArkInventory.Output( { "locale warning: ", GetLocale(), " entry for ", key, " (", ArkInventory.Localise:GetTranslation( key ), ") is missing" } )
		end
	
	end

	
	for w in string.gmatch( ArkInventory.Const.Skills, "[^,]+" ) do
		local key = string.format( "WOW_SKILL_%s", w )
		if not ArkInventory.Localise:HasBaseTranslation( key ) then
			ArkInventory.Output( { "locale warning: enUS entry for ", key, " is missing" } )
		elseif not ArkInventory.Localise:HasTranslation( key ) then
			ArkInventory.Output( { "locale warning: ", GetLocale(), " entry for ", key, " (", ArkInventory.Localise:GetTranslation( key ), ") is missing" } )
		end
	end

end
