﻿local L = AceLibrary( "AceLocale-2.2" ):new( "ArkInventory" )

--L:EnableDynamicLocales( )

-- post updated translations at http://groups.google.com/group/wow-arkinventory (modify this file and include as an attachment)
-- note: when creating a new locale do not leave any english translations in your file, comment them out


-- Translated by: <insert your name here>










L:RegisterTranslations( "esES", function() return {

--	wow skill headers - must match exactly what is in game
	["WOW_SKILL_HEADER_PRIMARY"] = "Profesiones",
	["WOW_SKILL_HEADER_SECONDARY"] = "Habilidades secundarias",


--	wow skill names - must match exactly what is in game
	["WOW_SKILL_ALCHEMY"] = "Alquimia",
	["WOW_SKILL_BLACKSMITHING"] = "Herrer\195\173a",
	["WOW_SKILL_COOKING"] = "Cocina",
	["WOW_SKILL_ENCHANTING"] = "Encantamiento",
	["WOW_SKILL_ENGINEERING"] = "Ingenier\195\173a",
	["WOW_SKILL_FIRST_AID"] = "Primeros auxilios",
	["WOW_SKILL_FISHING"] = "Pesca",
	["WOW_SKILL_HERBALISM"] = "Bot\195\161nica",
--	["WOW_SKILL_INSCRIPTION"] = "",
	["WOW_SKILL_JEWELCRAFTING"] = "Joyer\195\173a",
	["WOW_SKILL_LEATHERWORKING"] = "Peletería",
	["WOW_SKILL_MINING"] = "Miner\195\173a",
	["WOW_SKILL_RIDING"] = "Equitaci\195\179n",
	["WOW_SKILL_SKINNING"] = "Desollar", -- was Desuello
	["WOW_SKILL_TAILORING"] = "Sastrer\195\173a",
	
	
	-- wow class names - must match exactly what is in game
	["WOW_CLASS_DRUID"] = "Druida",
	["WOW_CLASS_HUNTER"] = "Cazador",
	["WOW_CLASS_MAGE"] = "Mago",
	["WOW_CLASS_PALADIN"] = "Palad\195\173n",
	["WOW_CLASS_PRIEST"] = "Sacerdote",
	["WOW_CLASS_ROGUE"] = "P\195\173caro",
	["WOW_CLASS_SHAMAN"] = "Cham\195\161n",
	["WOW_CLASS_WARLOCK"] = "Brujo",
	["WOW_CLASS_WARRIOR"] = "Guerrero",
--	["WOW_CLASS_DEATHKNIGHT"] = "",

	
--	wow item types - must match exactly what is in game
	["WOW_ITEM_TYPE_ARMOR"] = "Armadura",
	["WOW_ITEM_TYPE_CONSUMABLE"] = "Consumible",
--	["WOW_ITEM_TYPE_CONSUMABLE_BANDAGE"] = "",
--	["WOW_ITEM_TYPE_CONSUMABLE_ELIXIR"] = "",
--	["WOW_ITEM_TYPE_CONSUMABLE_FLASK"] = "",
--	["WOW_ITEM_TYPE_CONSUMABLE_FOOD_AND_DRINK"] = "",
	["WOW_ITEM_TYPE_CONSUMABLE_POTION"] = "Poci\195\179n",
--	["WOW_ITEM_TYPE_CONSUMABLE_SCROLL"] = "",
	["WOW_ITEM_TYPE_CONTAINER"] = "Contenedor",
	["WOW_ITEM_TYPE_CONTAINER_BAG"] = "Bolsa",
	["WOW_ITEM_TYPE_CONTAINER_ENCHANTING"] = "Bolsa de encantamientos",
	["WOW_ITEM_TYPE_CONTAINER_ENGINEERING"] = "Bolsa de ingenier\195\173a",
	["WOW_ITEM_TYPE_CONTAINER_GEM"] = "Bolsa de gemas",
	["WOW_ITEM_TYPE_CONTAINER_HERB"] = "Bolsa de hierbas",
--	["WOW_ITEM_TYPE_CONTAINER_INSCRIPTION"] = "",
--	["WOW_ITEM_TYPE_CONTAINER_LEATHERWORKING"] = "",
	["WOW_ITEM_TYPE_CONTAINER_MINING"] = "Bolsa de miner\195\173a",
	["WOW_ITEM_TYPE_CONTAINER_SOULSHARD"] = "Bolsa de almas",
	["WOW_ITEM_TYPE_GEM"] = "Gems",
	["WOW_ITEM_TYPE_KEY"] = "Llave",
	["WOW_ITEM_TYPE_MISC"] = "Miscel\195\161neas",
--	["WOW_ITEM_TYPE_MISC_MOUNT"] = "",
--	["WOW_ITEM_TYPE_MISC_PET"] = "",
--	["WOW_ITEM_TYPE_MISC_REAGENT"] = "",
	["WOW_ITEM_TYPE_PROJECTILE"] = "Proyectil",
	["WOW_ITEM_TYPE_PROJECTILE_ARROW"] = "Flecha",
	["WOW_ITEM_TYPE_PROJECTILE_BULLET"] = "Bala",
	["WOW_ITEM_TYPE_QUEST"] = "Misi\195\179n",
	["WOW_ITEM_TYPE_QUIVER"] = "Carcaj",
	["WOW_ITEM_TYPE_QUIVER_ARROW"] = "Carcaj",
	["WOW_ITEM_TYPE_QUIVER_BULLET"] = "Bolsa de munici\195\179n",
	["WOW_ITEM_TYPE_RECIPE"] = "Receta",
	["WOW_ITEM_TYPE_TRADE_GOODS"] = "Objeto comerciable",
--	["WOW_ITEM_TYPE_TRADE_GOODS_CLOTH"] = "",
--	["WOW_ITEM_TYPE_TRADE_GOODS_DEVICES"] = "",
--	["WOW_ITEM_TYPE_TRADE_GOODS_ELEMENTAL"] = "",
--	["WOW_ITEM_TYPE_TRADE_GOODS_ENCHANTMENT_ARMOR"] = "",
--	["WOW_ITEM_TYPE_TRADE_GOODS_ENCHANTMENT_WEAPON"] = "",
--	["WOW_ITEM_TYPE_TRADE_GOODS_EXPLOSIVES"] = "",
--	["WOW_ITEM_TYPE_TRADE_GOODS_HERB"] = "",
--	["WOW_ITEM_TYPE_TRADE_GOODS_LEATHER"] = "",
--	["WOW_ITEM_TYPE_TRADE_GOODS_MEAT"] = "",
--	["WOW_ITEM_TYPE_TRADE_GOODS_METAL_AND_STONE"] = "",
--	["WOW_ITEM_TYPE_TRADE_GOODS_MATERIALS"] = "",
--	["WOW_ITEM_TYPE_TRADE_GOODS_PARTS"] = "",
	
	
--	wow tooltip text - must match exactly what is in game
	["WOW_ITEM_TOOLTIP_FOOD"] = "Debes permanecer sentado mientras comes",
	["WOW_ITEM_TOOLTIP_DRINK"] = "Debes permanecer sentado mientras bebes",
	["WOW_ITEM_TOOLTIP_POTION_HEAL"] = "Restaura %d+ a %d+ p. de salud",
	["WOW_ITEM_TOOLTIP_POTION_MANA"] = "Restaura %d+ a %d+ p. de man\195\161",
--	["WOW_ITEM_TOOLTIP_ELIXIR_BATTLE"] = "",
--	["WOW_ITEM_TOOLTIP_ELIXIR_GUARDIAN"] = "",
	
	
--	location names
--	["LOCATION_ALL"] = "",
	["LOCATION_BAG"] = "Bolsas",
	["LOCATION_BANK"] = "Banco",
--	["LOCATION_WEARING"] = "",
	
	
--	status bar/bag text
	["STATUS_OFFLINE"] = "Desconectado",
	["STATUS_NO_DATA"] = "SIN DATOS",
	["STATUS_FULL"] = "LLENO",
--	["STATUS_PURCHASE"] = "",
	
	
--	restack
--	["RESTACK"] = "",
--	["RESTACK_TEXT"] = "",
--	["RESTACK_START"] = "",
--	["RESTACK_COMPLETE"] = "",
--	["RESTACK_FAIL_WAIT"] = "",
--	["RESTACK_FAIL_ACCESS"] = "",

	
--	vault tab tooltips
--	["VAULT_TAB_ACCESS_NONE"] = "",
--	["VAULT_TAB_NAME"] = "",
--	["VAULT_TAB_ACCESS"] = "",
--	["VAULT_TAB_REMAINING_WITHDRAWALS"] = "",
	
	
--	category "header" descriptions  (does not have to match wow)
	["CATEGORY_CLASS"] = "CLASE",
	["CATEGORY_CONSUMABLE"] = "CONSUMIBLE",
--	["CATEGORY_CUSTOM"] = "",
	["CATEGORY_EMPTY"] = "VAC\195\141O",
--	["CATEGORY_OTHER"] = "",
--	["CATEGORY_RULE"] = "",
	["CATEGORY_SKILL"] = "PROFESI\195\147N",
	["CATEGORY_SYSTEM"] = "SISTEMA",
--	["CATEGORY_TRADE_GOODS"] = "",
	
	
--	system category descriptions
	["CATEGORY_CONTAINER"] = "CONTENEDOR",
	["CATEGORY_CORE_MATS"] = "MATERIAS PRIMAS",
	["CATEGORY_DEFAULT"] = "POR DEFECTO",
	["CATEGORY_EQUIPMENT"] = "EQUIPO (NO LIGADO)",
	["CATEGORY_EQUIPMENT_SOULBOUND"] = "EQUIPO",
	["CATEGORY_PROJECTILE"] = "PROYECTIL",
	["CATEGORY_PROJECTILE_ARROW"] = "PROYECTIL (FLECHA)",
	["CATEGORY_PROJECTILE_BULLET"] = "PROYECTIL (BALA)",
	["CATEGORY_REPUTATION"] = "REPUTATION",
	["CATEGORY_SOULBOUND"] = "LIGADO",
	["CATEGORY_SOULSHARD"] = "FRAGMENTO DE ALMA",
	["CATEGORY_TRASH"] = "BASURA",
--	["CATEGORY_UNKNOWN"] = "",
	
	
--	consumable category descriptions
	["CATEGORY_CONSUMABLE_DRINK"] = "BEBIDA",
	["CATEGORY_CONSUMABLE_FOOD"] = "COMIDA",
	["CATEGORY_CONSUMABLE_FOOD_PET"] = "COMIDA (SOLO MASCOTA)",
	["CATEGORY_CONSUMABLE_POTION_MANA"] = "MAN\195\129 (POCI\195\147N/GEMA)",
	["CATEGORY_CONSUMABLE_POTION_HEAL"] = "SALUD (POCI\195\147N/PIEDRA)",
--	["CATEGORY_CONSUMABLE_ELIXIR_BATTLE"] = "",
--	["CATEGORY_CONSUMABLE_ELIXIR_GUARDIAN"] = "",
	
	
--	empty categories
	["CATEGORY_EMPTY_BAG"] = "VAC\195\141O (BOLSA)",
	["CATEGORY_EMPTY_ENCHANTING"] = "VAC\195\141O (ENCANTAMIENTO)",
	["CATEGORY_EMPTY_ENGINEERING"] = "VAC\195\141O (INGENIER\195\141A)",
	["CATEGORY_EMPTY_GEM"] = "VAC\195\141O (GEMA)",
	["CATEGORY_EMPTY_HERB"] = "VAC\195\141O (HIERBA)",
--	["CATEGORY_EMPTY_INSCRIPTION"] = "",
	["CATEGORY_EMPTY_KEY"] = "VAC\195\141O (LLAVERO)",
--	["CATEGORY_EMPTY_LEATHERWORKING"] = "",
	["CATEGORY_EMPTY_MINING"] = "VAC\195\141O (MINER\195\141A)",
	["CATEGORY_EMPTY_PROJECTILE"] = "VAC\195\141O (PROYECTIL)",
	["CATEGORY_EMPTY_PROJECTILE_ARROW"] = "VAC\195\141O (PROYECTIL - FLECHA)",
	["CATEGORY_EMPTY_PROJECTILE_BULLET"] = "VAC\195\141O (PROYECTIL - BALA)",
	["CATEGORY_EMPTY_SOULSHARD"] = "VAC\195\141O (FRAGMENTO DE ALMA)",
	["CATEGORY_EMPTY_UNKNOWN"] = "VAC\195\141O (DESCONOCIDO)",

	
--	bag names - used to name the empty slots in the status frame
	["STATUS_NAME_BAG"] = "Bolsa",
	["STATUS_NAME_ENCHANTING"] = "Encant",
	["STATUS_NAME_ENGINEERING"] = "Ing",
	["STATUS_NAME_GEM"] = "Gem",
	["STATUS_NAME_HERB"] = "Hierba",
--	["STATUS_NAME_INSCRIPTION"] = "",
	["STATUS_NAME_KEY"] = "Llave",
	["STATUS_NAME_MINING"] = "Mine",
--	["STATUS_NAME_LEATHERWORKING"] = "",
	["STATUS_NAME_PROJECTILE"] = "Munic",
	["STATUS_NAME_PROJECTILE_ARROW"] = "Flecha",
	["STATUS_NAME_PROJECTILE_BULLET"] = "Bala",
	["STATUS_NAME_SOULSHARD"] = "Alma",
	["STATUS_NAME_UNKNOWN"] = "Desconocido",
	
	
--	main menu
--	["MOD_FRAME_MENU"] = "",
	
--	["MOD_MENU_MAIN_SWITCH_CHARACTER"] = "",
--	["MOD_MENU_MAIN_SWITCH_CHARACTER_TEXT"] = "",
--	["MOD_MENU_MAIN_SWITCH_CHARACTER_CHOOSE_NONE"] = "",
--	["MOD_MENU_MAIN_SWITCH_CHARACTER_CHOOSE_TEXT"] = "",
--	["MOD_MENU_MAIN_SWITCH_CHARACTER_ERASE"] = "",
--	["MOD_MENU_MAIN_SWITCH_CHARACTER_ERASE_TEXT"] = "",
	
--	["MOD_MENU_MAIN_SWITCH_LOCATION"] = "",
--	["MOD_MENU_MAIN_SWITCH_LOCATION_TEXT"] = "",
	
--	["MOD_MENU_MAIN_WINDOW"] = "",
--	["MOD_MENU_MAIN_WINDOW_SCALE_TEXT"] = "",
--	["MOD_MENU_MAIN_WINDOW_PADDING_TEXT"] = "",
--	["MOD_MENU_MAIN_WINDOW_WIDTH_TEXT"] = "",
--	["MOD_MENU_MAIN_WINDOW_BACKGROUND_COLOR_TEXT"] = "",
--	["MOD_MENU_MAIN_WINDOW_BORDER_SHOW_TEXT"] = "",
--	["MOD_MENU_MAIN_WINDOW_BORDER_STYLE_TEXT"] = "",
--	["MOD_MENU_MAIN_WINDOW_BORDER_COLOR_TEXT"] = "",
--	["MOD_MENU_MAIN_WINDOW_BAGHIGHLIGHT_COLOR"] = "",
--	["MOD_MENU_MAIN_WINDOW_BAGHIGHLIGHT_COLOR_TEXT"] = "",
--	["MOD_MENU_MAIN_WINDOW_ANCHOR_LOCK_TEXT"] = "",
	
--	["MOD_MENU_MAIN_BARS"] = "",
--	["MOD_MENU_MAIN_BARS_PER_ROW"] = "",
--	["MOD_MENU_MAIN_BARS_PER_ROW_TEXT"] = "",
--	["MOD_MENU_MAIN_BARS_DIRECTION"] = "",
--	["MOD_MENU_MAIN_BARS_DIRECTION_HORIZONTAL_TEXT"] = "",
--	["MOD_MENU_MAIN_BARS_DIRECTION_VERTICAL_TEXT"] = "",
--	["MOD_MENU_MAIN_BARS_COMPACT"] = "",
--	["MOD_MENU_MAIN_BARS_COMPACT_TEXT"] = "",
--	["MOD_MENU_MAIN_BARS_SHOW_EMPTY"] = "",
--	["MOD_MENU_MAIN_BARS_SHOW_EMPTY_TEXT"] = "",
--	["MOD_MENU_MAIN_BARS_BACKGROUND_TEXT"] = "",
--	["MOD_MENU_MAIN_BARS_BORDER_TEXT"] = "",
--	["MOD_MENU_MAIN_BARS_BORDER_STYLE_TEXT"] = "",
--	["MOD_MENU_MAIN_BARS_BORDER_COLOUR_TEXT"] = "",
--	["MOD_MENU_MAIN_BARS_NAME"] = "",
--	["MOD_MENU_MAIN_BARS_NAME_TEXT"] = "",
--	["MOD_MENU_MAIN_BARS_NAME_SHOW_TEXT"] = "",
--	["MOD_MENU_MAIN_BARS_NAME_COLOUR_TEXT"] = "",
--	["MOD_MENU_MAIN_BARS_PADDING_INTERNAL_TEXT"] = "",
--	["MOD_MENU_MAIN_BARS_PADDING_EXTERNAL_TEXT"] = "",
	
--	["MOD_MENU_MAIN_ITEMS"] = "",
--	["MOD_MENU_MAIN_ITEMS_PADDING_TEXT"] = "",
--	["MOD_MENU_MAIN_ITEMS_FADE"] = "",
--	["MOD_MENU_MAIN_ITEMS_FADE_TEXT"] = "",
--	["MOD_MENU_MAIN_ITEMS_TINT_USABLE"] = "",
--	["MOD_MENU_MAIN_ITEMS_TINT_USABLE_TEXT"] = "",
--	["MOD_MENU_MAIN_ITEMS_BORDER_SHOW_TEXT"] = "",
--	["MOD_MENU_MAIN_ITEMS_BORDER_STYLE_TEXT"] = "",
--	["MOD_MENU_MAIN_ITEMS_BORDER_RARITY"] = "",
--	["MOD_MENU_MAIN_ITEMS_BORDER_RARITY_TEXT"] = "",
--	["MOD_MENU_MAIN_ITEMS_BORDER_TEXTURE_OFFSET"] = "",
--	["MOD_MENU_MAIN_ITEMS_BORDER_TEXTURE_OFFSET_TEXT"] = "",
--	["MOD_MENU_MAIN_ITEMS_BORDER_SCALE_TEXT"] = "",
--	["MOD_MENU_MAIN_ITEMS_HIDDEN"] = "",
--	["MOD_MENU_MAIN_ITEMS_HIDDEN_TEXT"] = "",
	
--	["MOD_MENU_MAIN_SORTING"] = "",
--	["MOD_MENU_MAIN_SORTING_BAGSLOT"] = "",
--	["MOD_MENU_MAIN_SORTING_BAGSLOT_TEXT"] = "",
--	["MOD_MENU_MAIN_SORTING_USER"] = "",
--	["MOD_MENU_MAIN_SORTING_USER_TEXT"] = "",
--	["MOD_MENU_MAIN_SORTING_INCLUDE_NAME"] = "",
--	["MOD_MENU_MAIN_SORTING_INCLUDE_NAME_TEXT"] = "",
--	["MOD_MENU_MAIN_SORTING_INCLUDE_NAME_REVERSE"] = "",
--	["MOD_MENU_MAIN_SORTING_INCLUDE_NAME_REVERSE_TEXT"] = "",
--	["MOD_MENU_MAIN_SORTING_INCLUDE_QUALITY"] = "",
--	["MOD_MENU_MAIN_SORTING_INCLUDE_QUALITY_TEXT"] = "",
--	["MOD_MENU_MAIN_SORTING_INCLUDE_LOCATION"] = "",
--	["MOD_MENU_MAIN_SORTING_INCLUDE_LOCATION_TEXT"] = "",
--	["MOD_MENU_MAIN_SORTING_INCLUDE_ITEMTYPE"] = "",
--	["MOD_MENU_MAIN_SORTING_INCLUDE_ITEMTYPE_TEXT"] = "",
--	["MOD_MENU_MAIN_SORTING_INCLUDE_CATEGORY"] = "",
--	["MOD_MENU_MAIN_SORTING_INCLUDE_CATEGORY_TEXT"] = "",
--	["MOD_MENU_MAIN_SORTING_INCLUDE_ITEMUSELEVEL"] = "",
--	["MOD_MENU_MAIN_SORTING_INCLUDE_ITEMUSELEVEL_TEXT"] = "",
--	["MOD_MENU_MAIN_SORTING_INCLUDE_ITEMSTATLEVEL"] = "",
--	["MOD_MENU_MAIN_SORTING_INCLUDE_ITEMSTATLEVEL_TEXT"] = "",
--	["MOD_MENU_MAIN_SORTING_INCLUDE_VENDORPRICE"] = "",
--	["MOD_MENU_MAIN_SORTING_INCLUDE_VENDORPRICE_TEXT"] = "",
--	["MOD_MENU_MAIN_SORTING_OPEN"] = "",
--	["MOD_MENU_MAIN_SORTING_OPEN_TEXT"] = "",
--	["MOD_MENU_MAIN_SORTING_INSTANT"] = "",
--	["MOD_MENU_MAIN_SORTING_INSTANT_TEXT"] = "",
--	["MOD_MENU_MAIN_SORTING_ASCENDING"] = "",
--	["MOD_MENU_MAIN_SORTING_ASCENDING_TEXT"] = "",
--	["MOD_MENU_MAIN_SORTING_ORDER"] = "",
--	["MOD_MENU_MAIN_SORTING_MOVE_UP"] = "",
--	["MOD_MENU_MAIN_SORTING_MOVE_UP_TEXT"] = "",
--	["MOD_MENU_MAIN_SORTING_MOVE_DOWN"] = "",
--	["MOD_MENU_MAIN_SORTING_MOVE_DOWN_TEXT"] = "",
--	["MOD_MENU_MAIN_SORTING_NOT_INCLUDED"] = "",
	
--	["MOD_MENU_MAIN_EMPTY"] = "",
--	["MOD_MENU_MAIN_EMPTY_ICON"] = "",
--	["MOD_MENU_MAIN_EMPTY_ICON_TEXT"] = "",
--	["MOD_MENU_MAIN_EMPTY_BORDER"] = "",
--	["MOD_MENU_MAIN_EMPTY_BORDER_TEXT"] = "",
--	["MOD_MENU_MAIN_EMPTY_COLOUR"] = "",
--	["MOD_MENU_MAIN_EMPTY_COLOUR_TEXT"] = "",
--	["MOD_MENU_MAIN_EMPTY_COLOUR_TEXT2"] = "",
--	["MOD_MENU_MAIN_EMPTY_CLUMP"] = "",
--	["MOD_MENU_MAIN_EMPTY_CLUMP_TEXT"] = "",
--	["MOD_MENU_MAIN_EMPTY_SHOW"] = "",
--	["MOD_MENU_MAIN_EMPTY_SHOW_TEXT"] = "",
--	["MOD_MENU_MAIN_EMPTY_SHOW_COLOUR_TEXT"] = "",
	
--	["MOD_MENU_MAIN_HIDDEN"] = "",
--	["MOD_MENU_MAIN_HIDDEN_TITLE"] = "",
--	["MOD_MENU_MAIN_HIDDEN_TITLE_TEXT"] = "",
--	["MOD_MENU_MAIN_HIDDEN_CHANGER"] = "",
--	["MOD_MENU_MAIN_HIDDEN_CHANGER_TEXT"] = "",
--	["MOD_MENU_MAIN_HIDDEN_STATUS"] = "",
--	["MOD_MENU_MAIN_HIDDEN_STATUS_TEXT"] = "",
	
--	["MOD_MENU_MAIN_NEWITEM"] = "",
--	["MOD_MENU_MAIN_NEWITEM_SHOW"] = "",
--	["MOD_MENU_MAIN_NEWITEM_SHOW_TEXT"] = "",
--	["MOD_MENU_MAIN_NEWITEM_COLOUR_TEXT"] = "",
--	["MOD_MENU_MAIN_NEWITEM_RESET"] = "",
--	["MOD_MENU_MAIN_NEWITEM_RESET_TEXT"] = "",
	
--	["MOD_MENU_MAIN_ACTIONS"] = "",
	
--	["MOD_MENU_MAIN_AUTO_MERCHANT"] = "",
--	["MOD_MENU_MAIN_AUTO_TRADE"] = "",
--	["MOD_MENU_MAIN_AUTO_AUCTION"] = "",
--	["MOD_MENU_MAIN_AUTO_COMBAT"] = "",
	
--	["MOD_MENU_MAIN_TOOLTIP"] = "",
--	["MOD_MENU_MAIN_TOOLTIP_ENABLE_TEXT"] = "",
--	["MOD_MENU_MAIN_TOOLTIP_EMPTY_ADD"] = "",
--	["MOD_MENU_MAIN_TOOLTIP_EMPTY_ADD_TEXT"] = "",
--	["MOD_MENU_MAIN_TOOLTIP_ITEMCOUNT_ADD"] = "",
--	["MOD_MENU_MAIN_TOOLTIP_ITEMCOUNT_ADD_TEXT"] = "",
--	["MOD_MENU_MAIN_TOOLTIP_ITEMCOUNT_COLOUR_TEXT"] = "",
--	["MOD_MENU_MAIN_TOOLTIP_VENDOR_ADD"] = "",
--	["MOD_MENU_MAIN_TOOLTIP_VENDOR_ADD_TEXT"] = "",
--	["MOD_MENU_MAIN_TOOLTIP_VENDOR_COLOUR_TEXT"] = "",
--	["MOD_MENU_MAIN_TOOLTIP_SELF_ONLY"] = "",
--	["MOD_MENU_MAIN_TOOLTIP_SELF_ONLY_TEXT"] = "",
	
--	["MOD_MENU_MAIN_FONT_TEXT"] = "",

--	["MOD_MENU_MAIN_REFRESH"] = "",
--	["MOD_MENU_MAIN_REFRESH_TEXT"] = "",
	
--	["MOD_MENU_MAIN_RELOAD"] = "",
--	["MOD_MENU_MAIN_RELOAD_TEXT"] = "",
	
	["MOD_MENU_MAIN_EDITMODE"] = "Activar Modo de Edici\195\179n",
--	["MOD_MENU_MAIN_EDITMODE_TEXT"] = "",

--	["MOD_MENU_MAIN_BAGCHANGE"] = "",
--	["MOD_MENU_MAIN_BAGCHANGE_TEXT"] = "",
	
--	["MOD_MENU_MAIN_RULES"] = "",
	
--	["MOD_MENU_RULE_SHOWDISABLED"] = "",
--	["MOD_MENU_RULE_SHOWDISABLED_TEXT"] = "",

--	["MOD_MENU_MAIN_SEARCH"] = "",
	
--	["MOD_MENU_MAIN_CUSTOM_CATEGORIES"] = "",
	
	
--	item menu
	["MOD_MENU_ITEM_INFORMATION_TITLE"] = "OPCIONES DE OBJETO",
--	["MOD_MENU_ITEM_ITEM"] = "",
--	["MOD_MENU_ITEM_CURRENT_ASSIGNMENT"] = "",
--	["MOD_MENU_ITEM_DEFAULT_ASSIGNMENT"] = "",
--	["MOD_MENU_ITEM_DEFAULT_RESET"] = "",
--	["MOD_MENU_ITEM_DEFAULT_RESET_TEXT"] = "",
--	["MOD_MENU_ITEM_ASSIGN_CHOICES"] = "",
--	["MOD_MENU_ITEM_ASSIGN_THIS"] = "",
--	["MOD_MENU_ITEM_ASSIGN_THIS_TEXT"] = "",
--	["MOD_MENU_ITEM_MOVE"] = "",
--	["MOD_MENU_ITEM_RULE_NEW"] = "",
--	["MOD_MENU_ITEM_RULE_ADD"] = "",
--	["MOD_MENU_ITEM_CUSTOM_NEW"] = "",
--	["MOD_MENU_ITEM_DEBUG"] = "",
--	["MOD_MENU_ITEM_DEBUG_BAG"] = "",
--	["MOD_MENU_ITEM_DEBUG_SLOT"] = "",
--	["MOD_MENU_ITEM_DEBUG_BAG_TYPE"] = "",
--	["MOD_MENU_ITEM_DEBUG_AI_ID_SHORT"] = "",
--	["MOD_MENU_ITEM_DEBUG_AI_ID_CACHE"] = "",
--	["MOD_MENU_ITEM_DEBUG_AI_ID_CATEGORY"] = "",
--	["MOD_MENU_ITEM_DEBUG_NAME"] = "",
--	["MOD_MENU_ITEM_DEBUG_QUALITY"] = "",
--	["MOD_MENU_ITEM_DEBUG_LVL_ITEM"] = "",
--	["MOD_MENU_ITEM_DEBUG_LVL_USE"] = "",
--	["MOD_MENU_ITEM_DEBUG_TYPE"] = "",
--	["MOD_MENU_ITEM_DEBUG_SUBTYPE"] = "",
--	["MOD_MENU_ITEM_DEBUG_LOCATION"] = "",
--	["MOD_MENU_ITEM_DEBUG_ID"] = "",
--	["MOD_MENU_ITEM_DEBUG_STACK"] = "",
--	["MOD_MENU_ITEM_DEBUG_TEXTURE"] = "",
--	["MOD_MENU_ITEM_DEBUG_FAMILY"] = "",
--	["MOD_MENU_ITEM_DEBUG_PT"] = "",
--	["MOD_MENU_ITEM_DEBUG_PT_TEXT"] = "",
--	["MOD_MENU_ITEM_DEBUG_PT_NONE"] = "",
--	["MOD_MENU_ITEM_DEBUG_PT_TITLE"] = "",
	
	
--	bar menu
--	["MOD_MENU_BAR_INFORMATION_TITLE"] = "",
--	["MOD_MENU_BAR_CATEGORY"] = "",
--	["MOD_MENU_BAR_CATEGORY_TEXT"] = "",
--	["MOD_MENU_BAR_CATEGORY_CURRENT"] = "",
--	["MOD_MENU_BAR_CATEGORY_ASSIGN"] = "",
--	["MOD_MENU_BAR_CATEGORY_REMOVE"] = "",
--	["MOD_MENU_BAR_CATEGORY_REMOVE_TEXT"] = "",
--	["MOD_MENU_BAR_CATEGORY_HIDDEN"] = "",
--	["MOD_MENU_BAR_CATEGORY_HIDDEN_TEXT"] = "",
--	["MOD_MENU_BAR_OPTIONS"] = "",
--	["MOD_MENU_BAR_CLEAR"] = "",
--	["MOD_MENU_BAR_CLEAR_TEXT"] = "",
--	["MOD_MENU_BAR_INSERT"] = "",
--	["MOD_MENU_BAR_INSERT_TEXT"] = "",
--	["MOD_MENU_BAR_REMOVE"] = "",
--	["MOD_MENU_BAR_REMOVE_TEXT"] = "",
--	["MOD_MENU_BAR_MOVE_UP"] = "",
--	["MOD_MENU_BAR_MOVE_UP_TEXT"] = "",
--	["MOD_MENU_BAR_MOVE_DOWN"] = "",
--	["MOD_MENU_BAR_MOVE_DOWN_TEXT"] = "",
	
	
--	changer bag menu
--	["MOD_MENU_BAG_TITLE"] = "",
--	["MOD_MENU_BAG_SHOW"] = "",
--	["MOD_MENU_BAG_SHOW_TEXT"] = "",
--	["MOD_MENU_BAG_ISOLATE"] = "",
--	["MOD_MENU_BAG_ISOLATE_TEXT"] = "",
--	["MOD_MENU_BAG_SHOWALL"] = "",
--	["MOD_MENU_BAG_SHOWALL_TEXT"] = "",
	
	
--	rules frame
--	["MOD_FRAME_RULE_RULE"] = "",
--	["MOD_FRAME_RULE_ENABLED"] = "",
--	["MOD_FRAME_RULE_HIDDEN"] = "",
--	["MOD_FRAME_RULE_ORDER"] = "",
--	["MOD_FRAME_RULE_DESCRIPTION"] = "",
--	["MOD_FRAME_RULE_FORMULA"] = "",
--	["MOD_FRAME_RULE_SEARCH"] = "",
--	["MOD_FRAME_RULE_VIEW"] = "",
--	["MOD_FRAME_RULE_ADD"] = "",
--	["MOD_FRAME_RULE_EDIT"] = "",
--	["MOD_FRAME_RULE_REMOVE"] = "",
--	["MOD_FRAME_RULE_OK"] = "",
--	["MOD_FRAME_RULE_CANCEL"] = "",
--	["MOD_FRAME_RULE_LIST_ENABLED"] = "",
--	["MOD_FRAME_RULE_LIST_DAMAGED"] = "",
--	["MOD_FRAME_RULE_LIST_ID"] = "",
--	["MOD_FRAME_RULE_LIST_ORDER"] = "",
--	["MOD_FRAME_RULE_LIST_DESCRIPTION"] = "",
	
--	["RULE_DAMAGED"] = "",
--	["RULE_FAILED_NIL_KEY"] = "",
--	["RULE_FAILED_NIL_DATA"] = "",
--	["RULE_FAILED_NIL_DESCRIPTION"] = "",
--	["RULE_FAILED_NIL_FORMULA"] = "",
	
	
--	new item indicators
--	["NEW_ITEM_NEW"] = "",
--	["NEW_ITEM_INCREASE"] = "",
--	["NEW_ITEM_DECREASE"] = "",
	
	
--	debug
--	["MOD_MENU_MAIN_DEBUG"] = "",
--	["MOD_MENU_MAIN_DEBUG_TEXT"] = "",
	
	
--	slash commands
--	["SLASH_UI"] = "",
--	["SLASH_UI_TEXT"] = "",
--	["SLASH_UI_RESET"] = "",
--	["SLASH_UI_RESET_TEXT"] = "",
--	["SLASH_UI_RESET_COMPLETE_TEXT"] = "",
--	["SLASH_DB"] = "",
--	["SLASH_DB_TEXT"] = "",
--	["SLASH_DB_RESET"] = "",
--	["SLASH_DB_RESET_TEXT"] = "",
--	["SLASH_DB_RESET_CONFIRM"] = "",
--	["SLASH_DB_RESET_CONFIRM_TEXT"] = "",
--	["SLASH_DB_RESET_COMPLETE_TEXT"] = "",
--	["SLASH_CACHE"] = "",
--	["SLASH_CACHE_TEXT"] = "",
--	["SLASH_CACHE_ERASE"] = "",
--	["SLASH_CACHE_ERASE_TEXT"] = "",
--	["SLASH_CACHE_ERASE_CONFIRM"] = "",
--	["SLASH_CACHE_ERASE_CONFIRM_TEXT"] = "",
--	["SLASH_CACHE_ERASE_COMPLETE_TEXT"] = "",
--	["SLASH_MISC"] = "",
--	["SLASH_MISC_TEXT"] = "",
	
	
--	misc chat stuff
--	["UPGRADE_PROFILE"] = "",
--	["UPGRADE_GLOBAL"] = "",
--	["MISC_ALERT"] = "",
--	["MISC_ALERT_FRAMELEVEL_1"] = "",
--	["MISC_ALERT_FRAMELEVEL_2"] = "",
	
	
--	item count tooltip
--	["TOOLTIP_VENDOR"] = "",
--	["TOOLTIP_TOTAL"] = "",
--	["TOOLTIP_COUNT_ME"] = "",


--	generic text
--	["GENERIC_BOTTOMLEFT"] = "",
--	["GENERIC_BOTTOMRIGHT"] = "",
--	["GENERIC_TOPLEFT"] = "",
--	["GENERIC_TOPRIGHT"] = "",
--	["GENERIC_HORIZONTAL"] = "",
--	["GENERIC_VERTICAL"] = "",
--	["GENERIC_CLOSE_MENU"] = "",
--	["GENERIC_ANCHOR"] = "",
--	["GENERIC_ANCHOR_TEXT1"] = "",
--	["GENERIC_ANCHOR_TEXT2"] = "",
--	["GENERIC_BORDER"] = "",
--	["GENERIC_BORDER_TEXT"] = "",
--	["GENERIC_SHOW"] = "",
--	["GENERIC_FILE"] = "",
--	["GENERIC_HEIGHT"] = "",
--	["GENERIC_SCALE"] = "",
--	["GENERIC_TEXTURE"] = "",
--	["GENERIC_BORDER_TEXTURE_TEXT"] = "",
--	["GENERIC_BORDER_TEXTURE_FILE_TEXT"] = "",
--	["GENERIC_BORDER_TEXTURE_HEIGHT_TEXT"] = "",
--	["GENERIC_FONT"] = "",
--	["GENERIC_COLOUR"] = "",
--	["GENERIC_BACKGROUND_COLOUR"] = "",
--	["GENERIC_LOCK"] = "",
--	["GENERIC_STYLE"] = "",
--	["GENERIC_ENABLED"] = "",
--	["GENERIC_DISABLED"] = "",
--	["GENERIC_ALERT"] = "",
--	["GENERIC_PADDING"] = "",
--	["GENERIC_INTERNAL"] = "",
--	["GENERIC_EXTERNAL"] = "",
--	["GENERIC_WIDTH"] = "",
--	["GENERIC_REALM"] = "",
	
	
--	options
--	["OPT_CONFIG"] = "",
--	["OPT_CONFIG_TEXT"] = "",
	
--	["OPT_SYSTEM"] = "",
--	["OPT_SYSTEM_TEXT"] = "",
--	["OPT_SYSTEM_BUGFIX"] = "",
--	["OPT_SYSTEM_BUGFIX_TEXT"] = "",
--	["OPT_SYSTEM_BUGFIX_FRAMELEVEL"] = "",
--	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_TEXT"] = "",
--	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT"] = "",
--	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_TEXT"] = "",
--	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE0"] = "",
--	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE0_TEXT"] = "",
--	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE1"] = "",
--	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE1_TEXT"] = "",
--	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE2"] = "",
--	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE2_TEXT"] = "",

--	["OPT_AUTO"] = "",
--	["OPT_AUTO_OPEN"] = "",
--	["OPT_AUTO_OPEN_BANK"] = "",
--	["OPT_AUTO_OPEN_VAULT"] = "",
--	["OPT_AUTO_OPEN_MAIL"] = "",
--	["OPT_AUTO_OPEN_MERCHANT"] = "",
--	["OPT_AUTO_OPEN_TRADE"] = "",
--	["OPT_AUTO_OPEN_AUCTION"] = "",
--	["OPT_AUTO_CLOSE"] = "",
--	["OPT_AUTO_CLOSE_BANK"] = "",
--	["OPT_AUTO_CLOSE_VAULT"] = "",
--	["OPT_AUTO_CLOSE_MAIL"] = "",
--	["OPT_AUTO_CLOSE_MERCHANT"] = "",
--	["OPT_AUTO_CLOSE_TRADE"] = "",
--	["OPT_AUTO_CLOSE_AUCTION"] = "",
--	["OPT_AUTO_CLOSE_COMBAT"] = "",

--	["OPT_CONTROL"] = "",
--	["OPT_CONTROL_TEXT"] = "",
--	["OPT_CONTROL_MONITOR"] = "",
--	["OPT_CONTROL_MONITOR_TEXT"] = "",
--	["OPT_CONTROL_SAVE"] = "",
--	["OPT_CONTROL_SAVE_TEXT"] = "",
--	["OPT_CONTROL_CONTROL"] = "",
--	["OPT_CONTROL_CONTROL_TEXT"] = "",
	
--	["OPT_LOCATION"] = "",
	
--	["OPT_ASSIGN_SETTINGS"] = "",
--	["OPT_ASSIGN_SETTINGS_TEXT"] = "",
--	["OPT_ASSIGN_SETTINGS_LOCATION_TEXT"] = "",
	
--	["OPT_LOCATION_SETTINGS"] = "",
	
	
} end )