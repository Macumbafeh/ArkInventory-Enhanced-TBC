local L = AceLibrary( "AceLocale-2.2" ):new( "ArkInventory" )
--L:EnableDynamicLocales( )

-- post updated translations at http://groups.google.com/group/wow-arkinventory (modify this file and include as an attachment)
-- note: when creating a new locale do not leave any english translations in your file, comment them out


-- Translated by: <insert your name here>











L:RegisterTranslations( "enUS", function() return {
	
--	wow skill headers - must match exactly what is in game
	["WOW_SKILL_HEADER_PRIMARY"] = "Professions",
	["WOW_SKILL_HEADER_SECONDARY"] = "Secondary Skills",
	
	
--	wow skill names - must match exactly what is in game
	["WOW_SKILL_ALCHEMY"] = "Alchemy",
	["WOW_SKILL_BLACKSMITHING"] = "Blacksmithing",
	["WOW_SKILL_COOKING"] = "Cooking",
	["WOW_SKILL_ENCHANTING"] = "Enchanting",
	["WOW_SKILL_ENGINEERING"] = "Engineering",
	["WOW_SKILL_FIRST_AID"] = "First Aid",
	["WOW_SKILL_FISHING"] = "Fishing",
	["WOW_SKILL_HERBALISM"] = "Herbalism",
	["WOW_SKILL_INSCRIPTION"] = "Inscription",
	["WOW_SKILL_JEWELCRAFTING"] = "Jewelcrafting",
	["WOW_SKILL_LEATHERWORKING"] = "Leatherworking",
	["WOW_SKILL_MINING"] = "Mining",
	["WOW_SKILL_RIDING"] = "Riding",
	["WOW_SKILL_SKINNING"] = "Skinning",
	["WOW_SKILL_TAILORING"] = "Tailoring",
	
	
--	wow class names - must match exactly what is in game
	["WOW_CLASS_DRUID"] = "Druid",
	["WOW_CLASS_HUNTER"] = "Hunter",
	["WOW_CLASS_MAGE"] = "Mage",
	["WOW_CLASS_PALADIN"] = "Paladin",
	["WOW_CLASS_PRIEST"] = "Priest",
	["WOW_CLASS_ROGUE"] = "Rogue",
	["WOW_CLASS_SHAMAN"] = "Shaman",
	["WOW_CLASS_WARLOCK"] = "Warlock",
	["WOW_CLASS_WARRIOR"] = "Warrior",
	["WOW_CLASS_DEATHKNIGHT"] = "Death Knight",
	
	
--	wow item types - must match exactly what is in game
	["WOW_ITEM_TYPE_ARMOR"] = "Armor",
	["WOW_ITEM_TYPE_CONSUMABLE"] = "Consumable",
	["WOW_ITEM_TYPE_CONSUMABLE_BANDAGE"] = "Bandage",
	["WOW_ITEM_TYPE_CONSUMABLE_ELIXIR"] = "Elixir",
	["WOW_ITEM_TYPE_CONSUMABLE_FLASK"] = "Flask",
	["WOW_ITEM_TYPE_CONSUMABLE_FOOD_AND_DRINK"] = "Food & Drink",
	["WOW_ITEM_TYPE_CONSUMABLE_POTION"] = "Potion",
	["WOW_ITEM_TYPE_CONSUMABLE_SCROLL"] = "Scroll",
	["WOW_ITEM_TYPE_CONTAINER"] = "Container",
	["WOW_ITEM_TYPE_CONTAINER_BAG"] = "Bag",
	["WOW_ITEM_TYPE_CONTAINER_ENCHANTING"] = "Enchanting Bag",
	["WOW_ITEM_TYPE_CONTAINER_ENGINEERING"] = "Engineering Bag",
	["WOW_ITEM_TYPE_CONTAINER_GEM"] = "Gem Bag",
	["WOW_ITEM_TYPE_CONTAINER_HERB"] = "Herb Bag",
	["WOW_ITEM_TYPE_CONTAINER_INSCRIPTION"] = "Inscription Bag",
	["WOW_ITEM_TYPE_CONTAINER_LEATHERWORKING"] = "Leatherworking Bag",
	["WOW_ITEM_TYPE_CONTAINER_MINING"] = "Mining Bag",
	["WOW_ITEM_TYPE_CONTAINER_SOULSHARD"] = "Soul Bag",
	["WOW_ITEM_TYPE_GEM"] = "Gem",
	["WOW_ITEM_TYPE_KEY"] = "Key",
	["WOW_ITEM_TYPE_MISC"] = "Miscellaneous",
	["WOW_ITEM_TYPE_MISC_MOUNT"] = "Mount",
	["WOW_ITEM_TYPE_MISC_PET"] = "Pet",
	["WOW_ITEM_TYPE_MISC_REAGENT"] = "Reagent",
	["WOW_ITEM_TYPE_PROJECTILE"] = "Projectile",
	["WOW_ITEM_TYPE_PROJECTILE_ARROW"] = "Arrow",
	["WOW_ITEM_TYPE_PROJECTILE_BULLET"] = "Bullet",
	["WOW_ITEM_TYPE_QUEST"] = "Quest",
	["WOW_ITEM_TYPE_QUIVER"] = "Quiver",
	["WOW_ITEM_TYPE_QUIVER_ARROW"] = "Quiver",
	["WOW_ITEM_TYPE_QUIVER_BULLET"] = "Ammo Pouch",
	["WOW_ITEM_TYPE_RECIPE"] = "Recipe",
	["WOW_ITEM_TYPE_TRADE_GOODS"] = "Trade Goods",
	["WOW_ITEM_TYPE_TRADE_GOODS_CLOTH"] = "Cloth",
	["WOW_ITEM_TYPE_TRADE_GOODS_DEVICES"] = "Devices",
	["WOW_ITEM_TYPE_TRADE_GOODS_ELEMENTAL"] = "Elemental",
	["WOW_ITEM_TYPE_TRADE_GOODS_ENCHANTMENT_ARMOR"] = "Armor Enchantment",
	["WOW_ITEM_TYPE_TRADE_GOODS_ENCHANTMENT_WEAPON"] = "Weapon Enchantment",
	["WOW_ITEM_TYPE_TRADE_GOODS_EXPLOSIVES"] = "Explosives",
	["WOW_ITEM_TYPE_TRADE_GOODS_HERB"] = "Herb",
	["WOW_ITEM_TYPE_TRADE_GOODS_LEATHER"] = "Leather",
	["WOW_ITEM_TYPE_TRADE_GOODS_MEAT"] = "Meat",
	["WOW_ITEM_TYPE_TRADE_GOODS_METAL_AND_STONE"] = "Metal & Stone",
	["WOW_ITEM_TYPE_TRADE_GOODS_MATERIALS"] = "Materials",
	["WOW_ITEM_TYPE_TRADE_GOODS_PARTS"] = "Parts",
	
	
--	wow tooltip text - must match exactly what is in game
	["WOW_ITEM_TOOLTIP_FOOD"] = "Must remain seated while eating",
	["WOW_ITEM_TOOLTIP_DRINK"] = "Must remain seated while drinking",
	["WOW_ITEM_TOOLTIP_POTION_HEAL"] = "Restores %d+ to %d+ health",
	["WOW_ITEM_TOOLTIP_POTION_MANA"] = "Restores %d+ to %d+ mana",
	["WOW_ITEM_TOOLTIP_ELIXIR_BATTLE"] = "Battle Elixir",
	["WOW_ITEM_TOOLTIP_ELIXIR_GUARDIAN"] = "Guardian Elixir",
	
	
--	location names
	["LOCATION_ALL"] = "All",
	["LOCATION_BAG"] = "Bag",
	["LOCATION_BANK"] = "Bank",
	["LOCATION_WEARING"] = "Wearing",
	
	
--	status bar/bag text
	["STATUS_OFFLINE"] = "Offline",
	["STATUS_NO_DATA"] = "???",
	["STATUS_FULL"] = "Full",
	["STATUS_PURCHASE"] = "Buy",
	
	
--	restack
	["RESTACK"] = "Restack",
	["RESTACK_TEXT"] = "consolidate items into as few stacks as possible and then try to fill up any empty slots in special bags where possible",
	["RESTACK_START"] = "Start",
	["RESTACK_COMPLETE"] = "Complete",
	["RESTACK_FAIL_WAIT"] = "A restack operation is already in progress please wait for completion",
	["RESTACK_FAIL_ACCESS"] = "You don't have enough authority to restack tab %2$s in the %1$s", -- 1 = guild bank, 2 = tab number

	
--	vault tab tooltips
	["VAULT_TAB_ACCESS_NONE"] = "No Access",
	["VAULT_TAB_NAME"] = "Tab: |cffffffff%1$s - %2$s|r", -- 1 = tab number, 2 = tab name
	["VAULT_TAB_ACCESS"] = "Access: |cffffffff%1$s|r",
	["VAULT_TAB_REMAINING_WITHDRAWALS"] = "Remaining Daily Withdrawals: |cffffffff%1$s|r",
	
	
--	category "header" descriptions  (does not have to match wow)
	["CATEGORY_CLASS"] = "Class",
	["CATEGORY_CONSUMABLE"] = "Consumable",
	["CATEGORY_CUSTOM"] = "Custom",
	["CATEGORY_EMPTY"] = "Empty",
	["CATEGORY_OTHER"] = "Other",
	["CATEGORY_RULE"] = "Rule",
	["CATEGORY_SKILL"] = "Skill",
	["CATEGORY_SYSTEM"] = "System",
	["CATEGORY_TRADE_GOODS"] = "Trade Goods",
	
	
--	system category descriptions
	["CATEGORY_CONTAINER"] = "Container",
	["CATEGORY_CORE_MATS"] = "Core Mats",
	["CATEGORY_DEFAULT"] = "Default",
	["CATEGORY_EQUIPMENT"] = "Equipment (Not Soulbound)",
	["CATEGORY_EQUIPMENT_SOULBOUND"] = "Equipment (Soulbound)",
	["CATEGORY_PROJECTILE"] = "Projectile",
	["CATEGORY_PROJECTILE_ARROW"] = "Projectile (Arrow)",
	["CATEGORY_PROJECTILE_BULLET"] = "Projectile (Bullet)",
	["CATEGORY_REPUTATION"] = "Reputation",
	["CATEGORY_SOULBOUND"] = "Soulbound",
	["CATEGORY_SOULSHARD"] = "Soul Shard",
	["CATEGORY_TRASH"] = "Trash",
	["CATEGORY_UNKNOWN"] = "Unknown",
	
	
--	consumable category descriptions
	["CATEGORY_CONSUMABLE_DRINK"] = "Drink",
	["CATEGORY_CONSUMABLE_FOOD"] = "Food",
	["CATEGORY_CONSUMABLE_FOOD_PET"] = "Food (Pet)",
	["CATEGORY_CONSUMABLE_POTION_HEAL"] = "Health (Potion/Stone)",
	["CATEGORY_CONSUMABLE_POTION_MANA"] = "Mana (Potion/Gem)",
	["CATEGORY_CONSUMABLE_ELIXIR_BATTLE"] = "Elixir (Battle)",
	["CATEGORY_CONSUMABLE_ELIXIR_GUARDIAN"] = "Elixir (Guardian)",
	
	
--	empty categories
	["CATEGORY_EMPTY_BAG"] = "Bag",
	["CATEGORY_EMPTY_ENCHANTING"] = "Enchanting",
	["CATEGORY_EMPTY_ENGINEERING"] = "Engineering",
	["CATEGORY_EMPTY_GEM"] = "Gem",
	["CATEGORY_EMPTY_HERB"] = "Herb",
	["CATEGORY_EMPTY_INSCRIPTION"] = "Inscription",
	["CATEGORY_EMPTY_KEY"] = "Key",
	["CATEGORY_EMPTY_LEATHERWORKING"] = "Leatherworking",
	["CATEGORY_EMPTY_MINING"] = "Mining",
	["CATEGORY_EMPTY_PROJECTILE"] = "Projectile",
	["CATEGORY_EMPTY_PROJECTILE_ARROW"] = "Projectile (Arrow)",
	["CATEGORY_EMPTY_PROJECTILE_BULLET"] = "Projectile (Bullet)",
	["CATEGORY_EMPTY_SOULSHARD"] = "Soul Shard",
	["CATEGORY_EMPTY_UNKNOWN"] = "Unknown",
	
	
--	bag names - used to name the empty slots in the status frame
	["STATUS_NAME_BAG"] = "Bag",
	["STATUS_NAME_ENCHANTING"] = "Ench",
	["STATUS_NAME_ENGINEERING"] = "Eng",
	["STATUS_NAME_GEM"] = "Gem",
	["STATUS_NAME_HERB"] = "Herb",
	["STATUS_NAME_INSCRIPTION"] = "Insc",
	["STATUS_NAME_KEY"] = "Key",
	["STATUS_NAME_LEATHERWORKING"] = "Lthr",
	["STATUS_NAME_MINING"] = "Mine",
	["STATUS_NAME_PROJECTILE"] = "Ammo",
	["STATUS_NAME_PROJECTILE_ARROW"] = "Arrow",
	["STATUS_NAME_PROJECTILE_BULLET"] = "Bullet",
	["STATUS_NAME_SOULSHARD"] = "Shard",
	["STATUS_NAME_UNKNOWN"] = "Unknown",
	
	
--	main menu
	["MOD_FRAME_MENU"] = "Menu",
	
	["MOD_MENU_MAIN_SWITCH_CHARACTER"] = "Switch Character",
	["MOD_MENU_MAIN_SWITCH_CHARACTER_TEXT"] = "Switches the display to another character",
	["MOD_MENU_MAIN_SWITCH_CHARACTER_CHOOSE_NONE"] = "no other character data to choose from",
	["MOD_MENU_MAIN_SWITCH_CHARACTER_CHOOSE_TEXT"] = "Switches the current display to %1$s",
	["MOD_MENU_MAIN_SWITCH_CHARACTER_ERASE"] = "Erase %s data",
	["MOD_MENU_MAIN_SWITCH_CHARACTER_ERASE_TEXT"] = "Erase %1$s data for %2$s",
	
	["MOD_MENU_MAIN_SWITCH_LOCATION"] = "Toggle Location",
	["MOD_MENU_MAIN_SWITCH_LOCATION_TEXT"] = "toggles the display of the %1$s window",
	
	["MOD_MENU_MAIN_WINDOW"] = "Window",
	["MOD_MENU_MAIN_WINDOW_SCALE_TEXT"] = "set the scale, making the window larger or smaller",
	["MOD_MENU_MAIN_WINDOW_PADDING_TEXT"] = "set the amount of space to add between the window edge and the bars",
	["MOD_MENU_MAIN_WINDOW_WIDTH_TEXT"] = "set the maximum number of items to display in a single row",
	["MOD_MENU_MAIN_WINDOW_BACKGROUND_COLOR_TEXT"] = "set the background colour of the main window",
	["MOD_MENU_MAIN_WINDOW_BORDER_SHOW_TEXT"] = "display a border around the main window",
	["MOD_MENU_MAIN_WINDOW_BORDER_STYLE_TEXT"] = "set the border style for the main window",
	["MOD_MENU_MAIN_WINDOW_BORDER_COLOR_TEXT"] = "set the border colour for the main window",
	["MOD_MENU_MAIN_WINDOW_BAGHIGHLIGHT_COLOR"] = "Bag Highlight Colour",
	["MOD_MENU_MAIN_WINDOW_BAGHIGHLIGHT_COLOR_TEXT"] = "set the colour used to highlight slots when you mouseover a bag",
	["MOD_MENU_MAIN_WINDOW_HIGHLIGHT_SEARCH_COLOR"] = "Search Highlight Colour",
	["MOD_MENU_MAIN_WINDOW_HIGHLIGHT_SEARCH_COLOR_TEXT"] = "set the colour used to highlight an item when it matches your search text",
	["MOD_MENU_MAIN_WINDOW_ANCHOR_LOCK_TEXT"] = "lock the %1$s window so it can't be moved",
	
	["MOD_MENU_MAIN_BARS"] = "Bars",
	["MOD_MENU_MAIN_BARS_PER_ROW"] = "Per Row",
	["MOD_MENU_MAIN_BARS_PER_ROW_TEXT"] = "set the number of bars to display in each row",
	["MOD_MENU_MAIN_BARS_DIRECTION"] = "Direction",
	["MOD_MENU_MAIN_BARS_DIRECTION_HORIZONTAL_TEXT"] = "extends the bars horizontally",
	["MOD_MENU_MAIN_BARS_DIRECTION_VERTICAL_TEXT"] = "extends the bars vertically",
	["MOD_MENU_MAIN_BARS_COMPACT"] = "Compact",
	["MOD_MENU_MAIN_BARS_COMPACT_TEXT"] = "display all non empty bars in sequential order",
	["MOD_MENU_MAIN_BARS_SHOW_EMPTY"] = "Show empty",
	["MOD_MENU_MAIN_BARS_SHOW_EMPTY_TEXT"] = "display empty bars",
	["MOD_MENU_MAIN_BARS_BACKGROUND_TEXT"] = "set the background colour for bars",
	["MOD_MENU_MAIN_BARS_BORDER_TEXT"] = "display a border around each bar",
	["MOD_MENU_MAIN_BARS_BORDER_STYLE_TEXT"] = "set the border style for bars",
	["MOD_MENU_MAIN_BARS_BORDER_COLOUR_TEXT"] = "set the colour for the border around the bars",
	["MOD_MENU_MAIN_BARS_NAME"] = "Name",
	["MOD_MENU_MAIN_BARS_NAME_TEXT"] = "set the name for this bar",
	["MOD_MENU_MAIN_BARS_NAME_SHOW_TEXT"] = "display bar names",
	["MOD_MENU_MAIN_BARS_NAME_COLOUR_TEXT"] = "set the colour of the bar name",
	["MOD_MENU_MAIN_BARS_PADDING_INTERNAL_TEXT"] = "the amount of space to add between the bars and the items",
	["MOD_MENU_MAIN_BARS_PADDING_EXTERNAL_TEXT"] = "the amount of space to add between bars",
	
	["MOD_MENU_MAIN_ITEMS"] = "Items",
	["MOD_MENU_MAIN_ITEMS_PADDING_TEXT"] = "set the amount of space to add between item slots",
	["MOD_MENU_MAIN_ITEMS_FADE"] = "Fade offline",
	["MOD_MENU_MAIN_ITEMS_FADE_TEXT"] = "fade offline items",
	["MOD_MENU_MAIN_ITEMS_TINT_USABLE"] = "Tint Unusable",
	["MOD_MENU_MAIN_ITEMS_TINT_USABLE_TEXT"] = "tint unusable items red",
	["MOD_MENU_MAIN_ITEMS_BORDER_SHOW_TEXT"] = "show borders around items or not",
	["MOD_MENU_MAIN_ITEMS_BORDER_STYLE_TEXT"] = "set the border style for items",
	["MOD_MENU_MAIN_ITEMS_BORDER_RARITY"] = "Rarity coloured border",
	["MOD_MENU_MAIN_ITEMS_BORDER_RARITY_TEXT"] = "colour the border around each item slot to match it's rarity (Common, Rare, Epic, etc)",
	["MOD_MENU_MAIN_ITEMS_BORDER_TEXTURE_OFFSET"] = "Offset",
	["MOD_MENU_MAIN_ITEMS_BORDER_TEXTURE_OFFSET_TEXT"] = "the number pixels from the outside of the image to the inside edge of the border itself (used to realign the border to the item texture)",
	["MOD_MENU_MAIN_ITEMS_BORDER_SCALE_TEXT"] = "set the scale for the border texture",
	["MOD_MENU_MAIN_ITEMS_HIDDEN"] = "Show hidden",
	["MOD_MENU_MAIN_ITEMS_HIDDEN_TEXT"] = "show hidden categories",
	
	["MOD_MENU_MAIN_SORTING"] = "Sorting",
	["MOD_MENU_MAIN_SORTING_BAGSLOT"] = "Bag / Slot",
	["MOD_MENU_MAIN_SORTING_BAGSLOT_TEXT"] = "sorts your inventory by bag and slot numbers",
	["MOD_MENU_MAIN_SORTING_USER"] = "User Defined",
	["MOD_MENU_MAIN_SORTING_USER_TEXT"] = "sorts your inventory the way you order it",
	["MOD_MENU_MAIN_SORTING_INCLUDE_NAME"] = "item name",
	["MOD_MENU_MAIN_SORTING_INCLUDE_NAME_TEXT"] = "include item name in sorting your inventory",
	["MOD_MENU_MAIN_SORTING_INCLUDE_NAME_REVERSE"] = "Use reversed names",
	["MOD_MENU_MAIN_SORTING_INCLUDE_NAME_REVERSE_TEXT"] = "use reversed names in sorting your inventory.\n\neg Super Mana Potion becomes Potion Mana Super",
	["MOD_MENU_MAIN_SORTING_INCLUDE_QUALITY"] = "item rarity",
	["MOD_MENU_MAIN_SORTING_INCLUDE_QUALITY_TEXT"] = "include item rarity in sorting your inventory",
	["MOD_MENU_MAIN_SORTING_INCLUDE_LOCATION"] = "item equip location",
	["MOD_MENU_MAIN_SORTING_INCLUDE_LOCATION_TEXT"] = "include item equip locations in sorting your inventory.\n\nnote: only affects items that can be equipped",
	["MOD_MENU_MAIN_SORTING_INCLUDE_ITEMTYPE"] = "item type and subtype",
	["MOD_MENU_MAIN_SORTING_INCLUDE_ITEMTYPE_TEXT"] = "include item type and subtype in sorting your inventory.",
	["MOD_MENU_MAIN_SORTING_INCLUDE_CATEGORY"] = "item category",
	["MOD_MENU_MAIN_SORTING_INCLUDE_CATEGORY_TEXT"] = "include item category in sorting your inventory",
	["MOD_MENU_MAIN_SORTING_INCLUDE_ITEMUSELEVEL"] = "item (use) level",
	["MOD_MENU_MAIN_SORTING_INCLUDE_ITEMUSELEVEL_TEXT"] = "include item (use) level in sorting your inventory.",
	["MOD_MENU_MAIN_SORTING_INCLUDE_ITEMSTATLEVEL"] = "item (stat) level",
	["MOD_MENU_MAIN_SORTING_INCLUDE_ITEMSTATLEVEL_TEXT"] = "include item (stat) level in sorting your inventory.",
	["MOD_MENU_MAIN_SORTING_INCLUDE_VENDORPRICE"] = "vendor price",
	["MOD_MENU_MAIN_SORTING_INCLUDE_VENDORPRICE_TEXT"] = "include vendor price (per current stack size) in sorting your inventory.",
	["MOD_MENU_MAIN_SORTING_OPEN"] = "On window open",
	["MOD_MENU_MAIN_SORTING_OPEN_TEXT"] = "toggles whether a resort is done when you open the window.",
	["MOD_MENU_MAIN_SORTING_INSTANT"] = "Instant",
	["MOD_MENU_MAIN_SORTING_INSTANT_TEXT"] = "toggles instant sort mode.\n\nenabled: sorting is done instantly when something changes\n\ndisabled: sorting is done only when the window is opened, or you refresh.",
	["MOD_MENU_MAIN_SORTING_ASCENDING"] = "Ascending order",
	["MOD_MENU_MAIN_SORTING_ASCENDING_TEXT"] = "toggles whether the items are sorted in ascending or descending order",
	["MOD_MENU_MAIN_SORTING_ORDER"] = "Sort Order",
	["MOD_MENU_MAIN_SORTING_MOVE_UP"] = "Move Up",
	["MOD_MENU_MAIN_SORTING_MOVE_UP_TEXT"] = "moves %1$s up in the sort order",
	["MOD_MENU_MAIN_SORTING_MOVE_DOWN"] = "Move Down",
	["MOD_MENU_MAIN_SORTING_MOVE_DOWN_TEXT"] = "moves %1$s down in the sort order",
	["MOD_MENU_MAIN_SORTING_NOT_INCLUDED"] = "* not currently included in sort*",
	
	["MOD_MENU_MAIN_EMPTY"] = "Empty slots",
	["MOD_MENU_MAIN_EMPTY_ICON"] = "Use Icon",
	["MOD_MENU_MAIN_EMPTY_ICON_TEXT"] = "use an icon for empty slot backgrounds",
	["MOD_MENU_MAIN_EMPTY_BORDER"] = "Coloured borders",
	["MOD_MENU_MAIN_EMPTY_BORDER_TEXT"] = "colour empty slot borders according to their bag type",
	["MOD_MENU_MAIN_EMPTY_COLOUR"] = "Slot colours",
	["MOD_MENU_MAIN_EMPTY_COLOUR_TEXT"] = "lets you change the colours for the empty slots",
	["MOD_MENU_MAIN_EMPTY_COLOUR_TEXT2"] = "set the border and background colour for empty %1$s slots",
	["MOD_MENU_MAIN_EMPTY_CLUMP"] = "Clump",
	["MOD_MENU_MAIN_EMPTY_CLUMP_TEXT"] = "clump empty slots in with their non-empty type slots",
	["MOD_MENU_MAIN_EMPTY_SHOW"] = "Empty slot count",
	["MOD_MENU_MAIN_EMPTY_SHOW_TEXT"] = "show empty slot counts on bags",
	["MOD_MENU_MAIN_EMPTY_SHOW_COLOUR_TEXT"] = "set the colour of the empty slot count text",
	
	["MOD_MENU_MAIN_HIDDEN"] = "Hide Frames",
	["MOD_MENU_MAIN_HIDDEN_TITLE"] = "Title",
	["MOD_MENU_MAIN_HIDDEN_TITLE_TEXT"] = "hide the the %1$s title frame (the one at the top)",
	["MOD_MENU_MAIN_HIDDEN_SEARCH"] = "Search",
	["MOD_MENU_MAIN_HIDDEN_SEARCH_TEXT"] = "hide the %1$s search frame",
	["MOD_MENU_MAIN_HIDDEN_CHANGER"] = "Bag Changer",
	["MOD_MENU_MAIN_HIDDEN_CHANGER_TEXT"] = "hide the %1$s bag changer frame",
	["MOD_MENU_MAIN_HIDDEN_STATUS"] = "Status",
	["MOD_MENU_MAIN_HIDDEN_STATUS_TEXT"] = "hide the %1$s status frame (the one with the empty slot count and gold)",
	
	["MOD_MENU_MAIN_NEWITEM"] = "New Items",
	["MOD_MENU_MAIN_NEWITEM_SHOW"] = "Show Indicator",
	["MOD_MENU_MAIN_NEWITEM_SHOW_TEXT"] = "toggles the display of the new item indicator in the %s window",
	["MOD_MENU_MAIN_NEWITEM_COLOUR_TEXT"] = "sets the colour of the new item indicator text",
	["MOD_MENU_MAIN_NEWITEM_RESET"] = "Clear",
	["MOD_MENU_MAIN_NEWITEM_RESET_TEXT"] = "clear the new item status for all items in this location",
	
	["MOD_MENU_MAIN_ACTIONS"] = "Actions",
	
	["MOD_MENU_MAIN_AUTO_MERCHANT"] = "Merchant/Vendor",
	["MOD_MENU_MAIN_AUTO_TRADE"] = "Trade",
	["MOD_MENU_MAIN_AUTO_AUCTION"] = "Auction House",
	["MOD_MENU_MAIN_AUTO_COMBAT"] = "Combat",
	
	["MOD_MENU_MAIN_TOOLTIP"] = "Tooltips",
	["MOD_MENU_MAIN_TOOLTIP_ENABLE_TEXT"] = "show tooltips",
	["MOD_MENU_MAIN_TOOLTIP_EMPTY_ADD"] = "Empty Line",
	["MOD_MENU_MAIN_TOOLTIP_EMPTY_ADD_TEXT"] = "show an empty line between the basic tooltip text and any custom text to be added",
	["MOD_MENU_MAIN_TOOLTIP_ITEMCOUNT_ADD"] = "Item counts",
	["MOD_MENU_MAIN_TOOLTIP_ITEMCOUNT_ADD_TEXT"] = "show item counts in tooltips",
	["MOD_MENU_MAIN_TOOLTIP_ITEMCOUNT_COLOUR_TEXT"] = "set the colour of the item count tooltip text",
	["MOD_MENU_MAIN_TOOLTIP_VENDOR_ADD"] = "Vendor prices",
	["MOD_MENU_MAIN_TOOLTIP_VENDOR_ADD_TEXT"] = "show vendor prices for items in tooltips",
	["MOD_MENU_MAIN_TOOLTIP_VENDOR_COLOUR_TEXT"] = "set the colour of the vendor price tooltip text",
	["MOD_MENU_MAIN_TOOLTIP_SELF_ONLY"] = "Self only",
	["MOD_MENU_MAIN_TOOLTIP_SELF_ONLY_TEXT"] = "show item counts only for the current character",
	
	["MOD_MENU_MAIN_FONT_TEXT"] = "select the font to use",

	["MOD_MENU_MAIN_REFRESH"] = "Refresh",
	["MOD_MENU_MAIN_REFRESH_TEXT"] = "refreshes the window",
	
	["MOD_MENU_MAIN_RELOAD"] = "Reload",
	["MOD_MENU_MAIN_RELOAD_TEXT"] = "reloads the window.  use when you change items in outfit sets",
	
	["MOD_MENU_MAIN_EDITMODE"] = "Edit Mode",
	["MOD_MENU_MAIN_EDITMODE_TEXT"] = "toggles edit mode on and off so you can customise item layout",

	["MOD_MENU_MAIN_BAGCHANGE"] = "Bag Changer",
	["MOD_MENU_MAIN_BAGCHANGE_TEXT"] = "toggles the display of the BagChanger frame so you can add or replace bags",
	
	["MOD_MENU_MAIN_RULES"] = "Rules",
	
	["MOD_MENU_RULE_SHOWDISABLED"] = "Show Disabled Rules",
	["MOD_MENU_RULE_SHOWDISABLED_TEXT"] = "toggles the display of disabled rules",

	["MOD_MENU_MAIN_SEARCH"] = "Search",
	
	["MOD_MENU_MAIN_CUSTOM_CATEGORIES"] = "Custom Categories",
	
	
--	item menu
	["MOD_MENU_ITEM_INFORMATION_TITLE"] = "Item Information",
	["MOD_MENU_ITEM_ITEM"] = "Item",
	["MOD_MENU_ITEM_CURRENT_ASSIGNMENT"] = "Current assignment",
	["MOD_MENU_ITEM_DEFAULT_ASSIGNMENT"] = "Default assignment",
	["MOD_MENU_ITEM_DEFAULT_RESET"] = "Reset to default",
	["MOD_MENU_ITEM_DEFAULT_RESET_TEXT"] = "click to reset the category for this item back to it's default value (does not reset rules)",
	["MOD_MENU_ITEM_ASSIGN_CHOICES"] = "Assignable Categories",
	["MOD_MENU_ITEM_ASSIGN_THIS"] = "Assign Category",
	["MOD_MENU_ITEM_ASSIGN_THIS_TEXT"] = "assign this item to a specific category",
	["MOD_MENU_ITEM_MOVE"] = "Move %1$s to Bar",
	["MOD_MENU_ITEM_RULE_NEW"] = "Create a new rule",
	["MOD_MENU_ITEM_RULE_ADD"] = "Add item to rule",
	["MOD_MENU_ITEM_CUSTOM_NEW"] = "Create a new custom category",
	["MOD_MENU_ITEM_DEBUG"] = "Debug Info",
	["MOD_MENU_ITEM_DEBUG_BAG"] = "Bag",
	["MOD_MENU_ITEM_DEBUG_SLOT"] = "Slot",
	["MOD_MENU_ITEM_DEBUG_BAG_TYPE"] = "Type",
	["MOD_MENU_ITEM_DEBUG_AI_ID_SHORT"] = "Short ID",
	["MOD_MENU_ITEM_DEBUG_AI_ID_CACHE"] = "Cache ID",
	["MOD_MENU_ITEM_DEBUG_AI_ID_CATEGORY"] = "Category ID",
	["MOD_MENU_ITEM_DEBUG_NAME"] = "Name",
	["MOD_MENU_ITEM_DEBUG_QUALITY"] = "Quality",
	["MOD_MENU_ITEM_DEBUG_LVL_ITEM"] = "Item Level (Stat)",
	["MOD_MENU_ITEM_DEBUG_LVL_USE"] = "Item Level (Use)",
	["MOD_MENU_ITEM_DEBUG_TYPE"] = "Type",
	["MOD_MENU_ITEM_DEBUG_SUBTYPE"] = "Sub Type",
	["MOD_MENU_ITEM_DEBUG_LOCATION"] = "Location",
	["MOD_MENU_ITEM_DEBUG_ID"] = "Long ID",
	["MOD_MENU_ITEM_DEBUG_STACK"] = "Stack Size",
	["MOD_MENU_ITEM_DEBUG_TEXTURE"] = "Texture",
	["MOD_MENU_ITEM_DEBUG_FAMILY"] = "Family",
	["MOD_MENU_ITEM_DEBUG_PT"] = "PT Sets",
	["MOD_MENU_ITEM_DEBUG_PT_TEXT"] = "Lists which PT Sets this item is in",
	["MOD_MENU_ITEM_DEBUG_PT_NONE"] = "this item is currently not in any PT set",
	["MOD_MENU_ITEM_DEBUG_PT_TITLE"] = "PT Sets this item is in",
	
	
--	bar menu
	["MOD_MENU_BAR_INFORMATION_TITLE"] = "Bar %1$s Options",
	["MOD_MENU_BAR_CATEGORY"] = "Category",
	["MOD_MENU_BAR_CATEGORY_TEXT"] = "Assign the category %1$s to this bar",
	["MOD_MENU_BAR_CATEGORY_CURRENT"] = "Currently assigned",
	["MOD_MENU_BAR_CATEGORY_ASSIGN"] = "Assignable Categories",
	["MOD_MENU_BAR_CATEGORY_REMOVE"] = "Remove",
	["MOD_MENU_BAR_CATEGORY_REMOVE_TEXT"] = "click to remove %1$s from bar %2$s and return it to the default bar", -- 1 is the category name, 2 is the bar number
	["MOD_MENU_BAR_CATEGORY_HIDDEN"] = "Hide",
	["MOD_MENU_BAR_CATEGORY_HIDDEN_TEXT"] = "click to toggle this categories hidden status.\n\nitems in a hidden category will not display in normal mode",
	["MOD_MENU_BAR_OPTIONS"] = "Bar Options",
	["MOD_MENU_BAR_CLEAR"] = "Clear this bar",
	["MOD_MENU_BAR_CLEAR_TEXT"] = "removes all categories currently assigned to this bar except the default category",
	["MOD_MENU_BAR_INSERT"] = "Insert empty bar",
	["MOD_MENU_BAR_INSERT_TEXT"] = "inserts an empty bar here moving all categories up one bar",
	["MOD_MENU_BAR_REMOVE"] = "Remove this bar",
	["MOD_MENU_BAR_REMOVE_TEXT"] = "moves all categories assigned to this bar back to the default bar and moves all categories above this bar down one bar.\n\nif the default category is on this bar it will be moved to bar 1",
	["MOD_MENU_BAR_MOVE_UP"] = "Move this bar up",
	["MOD_MENU_BAR_MOVE_UP_TEXT"] = "swaps all categories assigned to this bar with the one above",
	["MOD_MENU_BAR_MOVE_DOWN"] = "Move this bar down",
	["MOD_MENU_BAR_MOVE_DOWN_TEXT"] = "swaps all categories assigned to this bar with the one below",
	
	
--	changer bag menu
	["MOD_MENU_BAG_TITLE"] = "Bag Options",
	["MOD_MENU_BAG_SHOW"] = "Display",
	["MOD_MENU_BAG_SHOW_TEXT"] = "display the contents of this bag",
	["MOD_MENU_BAG_ISOLATE"] = "Isolate",
	["MOD_MENU_BAG_ISOLATE_TEXT"] = "only display the contents of this bag",
	["MOD_MENU_BAG_SHOWALL"] = "Display All",
	["MOD_MENU_BAG_SHOWALL_TEXT"] = "display the contents of all bags for this location",
	
	
--	rules frame
	["MOD_FRAME_RULE_RULE"] = "Rule",
	["MOD_FRAME_RULE_ENABLED"] = "Enabled",
	["MOD_FRAME_RULE_HIDDEN"] = "Hidden",
	["MOD_FRAME_RULE_ORDER"] = "Order",
	["MOD_FRAME_RULE_DESCRIPTION"] = "Description",
	["MOD_FRAME_RULE_FORMULA"] = "Formula",
	["MOD_FRAME_RULE_SEARCH"] = "Search",
	["MOD_FRAME_RULE_VIEW"] = "View",
	["MOD_FRAME_RULE_ADD"] = "Add",
	["MOD_FRAME_RULE_EDIT"] = "Edit",
	["MOD_FRAME_RULE_REMOVE"] = "Remove",
	["MOD_FRAME_RULE_OK"] = "OK",
	["MOD_FRAME_RULE_CANCEL"] = "Cancel",
	["MOD_FRAME_RULE_LIST_ENABLED"] = "Use",
	["MOD_FRAME_RULE_LIST_DAMAGED"] = "Dmg",
	["MOD_FRAME_RULE_LIST_ID"] = "Rule",
	["MOD_FRAME_RULE_LIST_ORDER"] = "Order",
	["MOD_FRAME_RULE_LIST_DESCRIPTION"] = "Description",
	
	["RULE_DAMAGED"] = "Rule %s is now flagged as damaged and will no longer be used until repaired",
	["RULE_FAILED_NIL_KEY"] = "FAILED: passed key is nil",
	["RULE_FAILED_NIL_DATA"] = "FAILED: passed data is nil",
	["RULE_FAILED_NIL_DESCRIPTION"] = "FAILED: description is missing",
	["RULE_FAILED_NIL_FORMULA"] = "FAILED: formula is missing",
	
	
--	new item indicators
	["NEW_ITEM_NEW"] = "NEW",
	["NEW_ITEM_INCREASE"] = "+++",
	["NEW_ITEM_DECREASE"] = "- - -",
	
	
--	debug
	["MOD_MENU_MAIN_DEBUG"] = "Debug Mode",
	["MOD_MENU_MAIN_DEBUG_TEXT"] = "toggles whether debugging code is enabled or not",
	
	
--	slash commands
	["SLASH_UI"] = "ui",
	["SLASH_UI_TEXT"] = "ui options",
	["SLASH_UI_RESET"] = "reset",
	["SLASH_UI_RESET_TEXT"] = "centers the interface on the screen",
	["SLASH_UI_RESET_COMPLETE_TEXT"] = "all ui windows reset to center of screen",
	["SLASH_DB"] = "db",
	["SLASH_DB_TEXT"] = "db options",
	["SLASH_DB_RESET"] = "reset",
	["SLASH_DB_RESET_TEXT"] = "resets all options back to the defaults",
	["SLASH_DB_RESET_CONFIRM"] = "confirm",
	["SLASH_DB_RESET_CONFIRM_TEXT"] = "confirms the database reset",
	["SLASH_DB_RESET_COMPLETE_TEXT"] = "Profile has been reset.  All options are now back to defaults.",
	["SLASH_CACHE"] = "cache",
	["SLASH_CACHE_TEXT"] = "cache options",
	["SLASH_CACHE_ERASE"] = "erase",
	["SLASH_CACHE_ERASE_TEXT"] = "erases all cached data",
	["SLASH_CACHE_ERASE_CONFIRM"] = "confirm",
	["SLASH_CACHE_ERASE_CONFIRM_TEXT"] = "confirms the cache erase",
	["SLASH_CACHE_ERASE_COMPLETE_TEXT"] = "Erase All data for All Characters",
	["SLASH_MISC"] = "misc",
	["SLASH_MISC_TEXT"] = "misc options",
	
	
--	misc chat stuff
	["UPGRADE_PROFILE"] = "Upgrading profile data for [%1$s] to v%2$.4f", -- profile name, version
	["UPGRADE_GLOBAL"] = "Upgrading global %1$s data to v%2$.4f",  -- profile type, version
	["MISC_ALERT"] = "Alert!",
	["MISC_ALERT_FRAMELEVEL_1"] = "Bug fix complete.",
	["MISC_ALERT_FRAMELEVEL_2"] = "The FrameLevel for the %1$s window is currently at %2$s and has been reset to %3$s to ensure that it remains functional.  Sorry for the lag spike caused by the fix.",
	
	
--	item count tooltip
	["TOOLTIP_VENDOR"] = "Vendor",
	["TOOLTIP_TOTAL"] = "Total",
	["TOOLTIP_COUNT_ME"] = ">", -- note: theres no space between this and your characters name so add a trailing space if you need one (depending on what you have here)


--	generic text
	["GENERIC_BOTTOMLEFT"] = "Bottom Left",
	["GENERIC_BOTTOMRIGHT"] = "Bottom Right",
	["GENERIC_TOPLEFT"] = "Top Left",
	["GENERIC_TOPRIGHT"] = "Top Right",
	["GENERIC_HORIZONTAL"] = "Horizontal",
	["GENERIC_VERTICAL"] = "Vertical",
	["GENERIC_CLOSE_MENU"] = "Close Menu",
	["GENERIC_ANCHOR"] = "Anchor Point",
	["GENERIC_ANCHOR_TEXT1"] = "set the anchor point for the %1$s window", -- window name  (bags, bank, vault)
	["GENERIC_ANCHOR_TEXT2"] = "set the anchor point for the %1$s", -- object name (bars, items)
	["GENERIC_BORDER"] = "Border",
	["GENERIC_BORDER_TEXT"] = "border options",
	["GENERIC_SHOW"] = "Show",
	["GENERIC_FILE"] = "File",
	["GENERIC_HEIGHT"] = "Height",
	["GENERIC_SCALE"] = "Scale",
	["GENERIC_TEXTURE"] = "Texture",
	["GENERIC_BORDER_TEXTURE_TEXT"] = "border texture options",
	["GENERIC_BORDER_TEXTURE_FILE_TEXT"] = "the texture to use for the border",
	["GENERIC_BORDER_TEXTURE_HEIGHT_TEXT"] = "the height (in pixels) of the texture",
	["GENERIC_FONT"] = "Font",
	["GENERIC_COLOUR"] = "Colour",
	["GENERIC_BACKGROUND_COLOUR"] = "Background Colour",
	["GENERIC_LOCK"] = "Lock",
	["GENERIC_STYLE"] = "Style",
	["GENERIC_ENABLED"] = "Enabled",
	["GENERIC_DISABLED"] = "Disabled",
	["GENERIC_ALERT"] = "Alert",
	["GENERIC_PADDING"] = "Padding",
	["GENERIC_INTERNAL"] = "Internal",
	["GENERIC_EXTERNAL"] = "External",
	["GENERIC_WIDTH"] = "Width",
	["GENERIC_REALM"] = "Realm",
	
	
--	options
	["OPT_CONFIG"] = "Config",
	["OPT_CONFIG_TEXT"] = "Configuration Menu",
	
	["OPT_SYSTEM"] = "System",
	["OPT_SYSTEM_TEXT"] = "System Options",
	["OPT_SYSTEM_BUGFIX"] = "Bug Fixes / Workarounds",
	["OPT_SYSTEM_BUGFIX_TEXT"] = "toggle the code to fix or work around this issue",
	["OPT_SYSTEM_BUGFIX_FRAMELEVEL"] = "FrameLevel",
	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_TEXT"] = "A bug in the blizzard CreateFrame API which can cause a frames background to appear above the foreground, item tooltips won't appear and it's impossible to click on anything in the window.",
	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT"] = "framelevel bug fix alerts",
	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_TEXT"] = "set how framelevel bug fix alerts are displayed",
	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE0"] = "Disabled",
	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE0_TEXT"] = "disables bug fix alerts from being displayed",
	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE1"] = "Short",
	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE1_TEXT"] = "displays the short text for bug fix alerts",
	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE2"] = "Full",
	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE2_TEXT"] = "displays the full text for bug fix alerts",

	["OPT_AUTO"] = "Auto open/close",
	["OPT_AUTO_OPEN"] = "Open the %1$s %2$s when you", -- program, bag
	["OPT_AUTO_OPEN_BANK"] = "open the bank",
	["OPT_AUTO_OPEN_VAULT"] = "open the guild bank",
	["OPT_AUTO_OPEN_MAIL"] = "open a mailbox",
	["OPT_AUTO_OPEN_MERCHANT"] = "open a merchant/vendor",
	["OPT_AUTO_OPEN_TRADE"] = "open a trade",
	["OPT_AUTO_OPEN_AUCTION"] = "open the auction house",
	["OPT_AUTO_CLOSE"] = "Close the %1$s %2$s when you",
	["OPT_AUTO_CLOSE_BANK"] = "close the bank",
	["OPT_AUTO_CLOSE_VAULT"] = "close the guild bank",
	["OPT_AUTO_CLOSE_MAIL"] = "close the mailbox",
	["OPT_AUTO_CLOSE_MERCHANT"] = "close a merchant/vendor",
	["OPT_AUTO_CLOSE_TRADE"] = "close a trade",
	["OPT_AUTO_CLOSE_AUCTION"] = "close auction house",
	["OPT_AUTO_CLOSE_COMBAT"] = "enter combat",

	["OPT_CONTROL"] = "Control",
	["OPT_CONTROL_TEXT"] = "change control settings of %1$s for %2$s", -- location name, chacracter name	
	["OPT_CONTROL_MONITOR"] = "Monitor",
	["OPT_CONTROL_MONITOR_TEXT"] = "monitor changes to %1$s data for this character (%2$s).",
	["OPT_CONTROL_SAVE"] = "Save",
	["OPT_CONTROL_SAVE_TEXT"] = "save %1$s data for this character (%2$s) so that you can view it while on another character (or offline).",
	["OPT_CONTROL_CONTROL"] = "Override",
	["OPT_CONTROL_CONTROL_TEXT"] = "override the original Blizzard %2$s so that %1$s controls it instead.\n\ndisabling this option will return the standard Blizzard %2$s functionality.\n\nyou will still be able to open the %1$s %2$s when this is disabled but you will need to configure and use a keybinding instead.",
	
	["OPT_LOCATION"] = "Location",
	
	["OPT_ASSIGN_SETTINGS"] = "Uses Settings",
	["OPT_ASSIGN_SETTINGS_TEXT"] = "select which settings to use when generating the %1$s window",
	["OPT_ASSIGN_SETTINGS_LOCATION_TEXT"] = "uses the %1$s settings for the %2$s window",
	
	["OPT_LOCATION_SETTINGS"] = "Settings",
	
	
--	WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING
--	WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING
--	WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING
--	WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING
	
--	INTERNAL CODES AND TEXT
	
--	DO NOT TRANSLATE ANYTHING UNDERNEATH THIS LINE
	
--	REMOVE THESE ENTRIES FROM ALL OTHER LOCALE FILES
	
	
--	periodictable3: set names for default skill categories
	["PT_SKILL_ALCHEMY"] = "Tradeskill.Mat.ByProfession.Alchemy,Tradeskill.Tool.Alchemy",
	["PT_SKILL_BLACKSMITHING"] = "Tradeskill.Mat.ByProfession.Blacksmithing,Tradeskill.Tool.Blacksmithing",
	["PT_SKILL_COOKING"] = "Tradeskill.Mat.ByProfession.Cooking",
	["PT_SKILL_ENCHANTING"] = "Tradeskill.Mat.ByProfession.Enchanting,Tradeskill.Tool.Enchanting,Tradeskill.Gather.Disenchant",
	["PT_SKILL_ENGINEERING"] = "Tradeskill.Mat.ByProfession.Engineering,Tradeskill.Tool.Engineering",
	["PT_SKILL_FIRST_AID"] = "Tradeskill.Mat.ByProfession.First Aid",
	["PT_SKILL_FISHING"] = "Tradeskill.Gather.Fishing,Tradeskill.Tool.Fishing", -- 3.1
	["PT_SKILL_HERBALISM"] = "Tradeskill.Mat.ByType.Herb",
	["PT_SKILL_JEWELCRAFTING"] = "Tradeskill.Mat.ByProfession.Jewelcrafting,Tradeskill.Tool.Jewelcrafting",
	["PT_SKILL_LEATHERWORKING"] = "Tradeskill.Mat.ByProfession.Leatherworking",
	["PT_SKILL_MINING"] = "Tradeskill.Gather.Mining,Tradeskill.Tool.Mining,Tradeskill.Mat.ByType.Ore,Tradeskill.Mat.ByType.Bar",
	["PT_SKILL_SKINNING"] = "Tradeskill.Gather.Skinning,Tradeskill.Tool.Skinning",
	["PT_SKILL_TAILORING"] = "Tradeskill.Mat.ByProfession.Tailoring",
	["PT_SKILL_RIDING"] = "Misc.Mount",
	["PT_SKILL_INSCRIPTION"] = "Tradeskill.Mat.ByProfession.Inscription",
	
	
--	periodictable: set names for default class categories
	["PT_CLASS_DRUID"] = "Misc.Reagent.Class.Druid", -- 3.1
	["PT_CLASS_HUNTER"] = "Misc.Reagent.Class.Hunter",
	["PT_CLASS_MAGE"] = "Misc.Reagent.Class.Mage", -- 3.1
	["PT_CLASS_PALADIN"] = "Misc.Reagent.Class.Paladin", -- 3.1
	["PT_CLASS_PRIEST"] = "Misc.Reagent.Class.Priest", -- 3.1
	["PT_CLASS_ROGUE"] = "Misc.Reagent.Class.Rogue", -- 3.1
	["PT_CLASS_SHAMAN"] = "Misc.Reagent.Class.Shaman", -- 3.1
	["PT_CLASS_WARLOCK"] = "Misc.Reagent.Class.Warlock", -- 3.1
	["PT_CLASS_WARRIOR"] = "Misc.Reagent.Class.Warrior",
	["PT_CLASS_DEATHKNIGHT"] = "Misc.Reagent.Class.DeathKnight",
	
	
--	periodictable: other
	["PT_CATEGORY_CONTAINER"] = "Misc.Bag",
	["PT_CATEGORY_SOULSHARD"] = "Misc.Container.ItemsInType.Soul Shard",
	["PT_CATEGORY_MOUNT"] = "Misc.Mount",
	["PT_CATEGORY_REPUTATION"] = "Reputation.Turnin",
	["PT_CATEGORY_QUEST"] = "Misc.QuestMats",
	["PT_CATEGORY_KEY"] = "Misc.Key",
	["PT_CATEGORY_CONSUMABLE_FOOD"] = "Consumable.Food.Edible",
	["PT_CATEGORY_CONSUMABLE_DRINK"] = "Consumable.Water",
	["PT_CATEGORY_POTION_HEAL"] = "Consumable.Potion.Recovery.Healing,Consumable.Warlock.Healthstone",
	["PT_CATEGORY_POTION_MANA"] = "Consumable.Potion.Recovery.Mana",
	["PT_CATEGORY_POTION"] = "Consumable.Potion",
	["PT_CATEGORY_VANITYPET"] = "Misc.Minipet",
	
	
--	periodictable: bag items
	["PT_CONTAINS_SOULSHARD"] = "Misc.Container.ItemsInType.Soul Shard", -- 3.1
	["PT_CONTAINS_HERB"] = "Misc.Container.ItemsInType.Herb", -- 3.1
	["PT_CONTAINS_ENCHANTING"] = "Misc.Container.ItemsInType.Enchanting", -- 3.1
	["PT_CONTAINS_ENGINEERING"] = "Misc.Container.ItemsInType.Engineering", -- 3.1
	["PT_CONTAINS_GEM"] = "Misc.Container.ItemsInType.Gem", -- 3.1
	["PT_CONTAINS_MINING"] = "Misc.Container.ItemsInType.Mining", -- 3.1
	["PT_CONTAINS_LEATHERWORKING"] = "Misc.Container.ItemsInType.Leatherworking",
	["PT_CONTAINS_BULLET"] = "Misc.Reagent.Ammo.Bullet", -- 3.1
	["PT_CONTAINS_ARROW"] = "Misc.Reagent.Ammo.Arrow", -- 3.1
	
	
--	lua string pattern to collect every character in between brackets
	["RULE_PATTERN_COLLECT"] = "%((.-)%)",
	["RULE_PATTERN_SEP"] = "[^,]+",
	
} end )
