local L = AceLibrary( "AceLocale-2.2" ):new( "ArkInventory" )
--L:EnableDynamicLocales( )

-- post updated translations at http://groups.google.com/group/wow-arkinventory (modify this file and include as an attachment)
-- note: when creating a new locale do not leave any english translations in your file, comment them out


-- Translated by: <insert your name here>











L:RegisterTranslations( "deDE", function() return {
	
--	wow skill headers - must match exactly what is in game
	["WOW_SKILL_HEADER_PRIMARY"] = "Berufe",
	["WOW_SKILL_HEADER_SECONDARY"] = "Sekund\195\164re F\195\164higkeiten",
	
	
--	wow skill names - must match exactly what is in game
	["WOW_SKILL_ALCHEMY"] = "Alchimie",
	["WOW_SKILL_BLACKSMITHING"] = "Schmiedekunst",
	["WOW_SKILL_COOKING"] = "Kochkunst",
	["WOW_SKILL_ENCHANTING"] = "Verzauberkunst",
	["WOW_SKILL_ENGINEERING"] = "Ingenieurskunst",
	["WOW_SKILL_FIRST_AID"] = "Erste Hilfe",
	["WOW_SKILL_FISHING"] = "Angeln",
	["WOW_SKILL_HERBALISM"] = "Kr\195\164uterkunde",
--	["WOW_SKILL_INSCRIPTION"] = "",
	["WOW_SKILL_JEWELCRAFTING"] = "Juwelenschleifen",
	["WOW_SKILL_LEATHERWORKING"] = "Lederverarbeitung",
	["WOW_SKILL_MINING"] = "Bergbau",
	["WOW_SKILL_RIDING"] = "Reiten",
	["WOW_SKILL_SKINNING"] = "K\195\188rschnerei",
	["WOW_SKILL_TAILORING"] = "Schneiderei",
	
	
--	wow class names - must match exactly what is in game
	["WOW_CLASS_DRUID"] = "Druide",
	["WOW_CLASS_HUNTER"] = "J\195\164ger",
	["WOW_CLASS_MAGE"] = "Magier",
--	["WOW_CLASS_PALADIN"] = "",
	["WOW_CLASS_PRIEST"] = "Priester",
	["WOW_CLASS_ROGUE"] = "Schurke",
	["WOW_CLASS_SHAMAN"] = "Schamane",
	["WOW_CLASS_WARLOCK"] = "Hexenmeister",
	["WOW_CLASS_WARRIOR"] = "Krieger",
--	["WOW_CLASS_DEATHKNIGHT"] = "",
	
	
--	wow item types - must match exactly what is in game
	["WOW_ITEM_TYPE_ARMOR"] = "R\195\188stung",
	["WOW_ITEM_TYPE_CONSUMABLE"] = "Verbrauchbar",
--	["WOW_ITEM_TYPE_CONSUMABLE_BANDAGE"] = "",
	["WOW_ITEM_TYPE_CONSUMABLE_ELIXIR"] = "Elixier",
--	["WOW_ITEM_TYPE_CONSUMABLE_FLASK"] = "",
--	["WOW_ITEM_TYPE_CONSUMABLE_FOOD_AND_DRINK"] = "",
	["WOW_ITEM_TYPE_CONSUMABLE_POTION"] = "Trank",
--	["WOW_ITEM_TYPE_CONSUMABLE_SCROLL"] = "",
	["WOW_ITEM_TYPE_CONTAINER"] = "Beh\195\164lter",
	["WOW_ITEM_TYPE_CONTAINER_BAG"] = "Beh\195\164lter",
	["WOW_ITEM_TYPE_CONTAINER_ENCHANTING"] = "Verzauberertasche",
	["WOW_ITEM_TYPE_CONTAINER_ENGINEERING"] = "Ingenieurstasche",
	["WOW_ITEM_TYPE_CONTAINER_GEM"] = "Edelsteintasche",
	["WOW_ITEM_TYPE_CONTAINER_HERB"] = "Kr\195\164utertasche", 
--	["WOW_ITEM_TYPE_CONTAINER_INSCRIPTION"] = "",
	["WOW_ITEM_TYPE_CONTAINER_LEATHERWORKING"] = "Lederertasche",
	["WOW_ITEM_TYPE_CONTAINER_MINING"] = "Bergbautasche",
	["WOW_ITEM_TYPE_CONTAINER_SOULSHARD"] = "Seelentasche",
	["WOW_ITEM_TYPE_GEM"] = "Edelsteine",
	["WOW_ITEM_TYPE_KEY"] = "Schl\195\188ssel",
	["WOW_ITEM_TYPE_MISC"] = "Verschiedenes", 
--	["WOW_ITEM_TYPE_MISC_MOUNT"] = "",
--	["WOW_ITEM_TYPE_MISC_PET"] = "",
--	["WOW_ITEM_TYPE_MISC_REAGENT"] = "",
	["WOW_ITEM_TYPE_PROJECTILE"] = "Projektil",
	["WOW_ITEM_TYPE_PROJECTILE_ARROW"] = "Pfeil",
	["WOW_ITEM_TYPE_PROJECTILE_BULLET"] = "Kugel",
--	["WOW_ITEM_TYPE_QUEST"] = "",
	["WOW_ITEM_TYPE_QUIVER"] = "K\195\182cher",
	["WOW_ITEM_TYPE_QUIVER_ARROW"] = "K\195\182cher",
	["WOW_ITEM_TYPE_QUIVER_BULLET"] = "Munitionsbeutel",
	["WOW_ITEM_TYPE_RECIPE"] = "Rezept",
	["WOW_ITEM_TYPE_TRADE_GOODS"] = "Handwerkswaren",
--	["WOW_ITEM_TYPE_TRADE_GOODS_CLOTH"] = "",
	["WOW_ITEM_TYPE_TRADE_GOODS_DEVICES"] = "Ger\195\164te",
--	["WOW_ITEM_TYPE_TRADE_GOODS_ELEMENTAL"] = "",
--	["WOW_ITEM_TYPE_TRADE_GOODS_ENCHANTMENT_ARMOR"] = "",
--	["WOW_ITEM_TYPE_TRADE_GOODS_ENCHANTMENT_WEAPON"] = "",
	["WOW_ITEM_TYPE_TRADE_GOODS_EXPLOSIVES"] = "Sprengstoffe",
--	["WOW_ITEM_TYPE_TRADE_GOODS_HERB"] = "",
--	["WOW_ITEM_TYPE_TRADE_GOODS_LEATHER"] = "",
--	["WOW_ITEM_TYPE_TRADE_GOODS_MEAT"] = "",
--	["WOW_ITEM_TYPE_TRADE_GOODS_METAL_AND_STONE"] = "",
--	["WOW_ITEM_TYPE_TRADE_GOODS_MATERIALS"] = "",
	["WOW_ITEM_TYPE_TRADE_GOODS_PARTS"] = "Teile",
	
	
--	wow tooltip text - must match exactly what is in game
	["WOW_ITEM_TOOLTIP_FOOD"] = "Ihr m\195\188sst beim Essen sitzen bleiben",
	["WOW_ITEM_TOOLTIP_DRINK"] = "Ihr m\195\188sst beim Trinken sitzen bleiben",
	["WOW_ITEM_TOOLTIP_POTION_HEAL"] = "Stellt %d+ bis %d+ Gesundheit wieder her",
	["WOW_ITEM_TOOLTIP_POTION_MANA"] = "Stellt %d+ bis %d+ Mana wieder her",
--	["WOW_ITEM_TOOLTIP_ELIXIR_BATTLE"] = "",
--	["WOW_ITEM_TOOLTIP_ELIXIR_GUARDIAN"] = "",
	
	
--	location names
	["LOCATION_ALL"] = "alle",
	["LOCATION_BAG"] = "Taschen",
	["LOCATION_BANK"] = "Bankfach",
	["LOCATION_WEARING"] = "angezogen",
	
	
--	status bar/bag text
	["STATUS_OFFLINE"] = "aus dem Zwischenspeicher",
	["STATUS_NO_DATA"] = "KEINE DATEN",
	["STATUS_FULL"] = "VOLL",
	["STATUS_PURCHASE"] = "kaufen",
	
	
--	restack
	["RESTACK"] = "stapeln und umordnen",
	["RESTACK_TEXT"] = "Stapel werden maximal aufgef\195\188llt und Gegenst\195\164nde in ihre Spezialtaschen umgeordnet",
	["RESTACK_START"] = "gestartet",
	["RESTACK_COMPLETE"] = "beendet",
--	["RESTACK_FAIL_WAIT"] = "",
--	["RESTACK_FAIL_ACCESS"] = "",
	
	
--	vault tab tooltips
--	["VAULT_TAB_ACCESS_NONE"] = "",
--	["VAULT_TAB_NAME"] = "", -- tab number, tab name
--	["VAULT_TAB_ACCESS"] = "",
--	["VAULT_TAB_REMAINING_WITHDRAWALS"] = "",
	
	
--	category "header" descriptions  (does not have to match wow)
	["CATEGORY_CLASS"] = "Klasse",
	["CATEGORY_CONSUMABLE"] = "Verbrauchbares",
--	["CATEGORY_CUSTOM"] = "",
	["CATEGORY_EMPTY"] = "Leer",
	["CATEGORY_OTHER"] = "Sonstiges",
	["CATEGORY_RULE"] = "Regel",
	["CATEGORY_SKILL"] = "Beruf",
--	["CATEGORY_SYSTEM"] = "",
--	["CATEGORY_TRADE_GOODS"] = "",
	
	
--	system category descriptions
	["CATEGORY_CONTAINER"] = "Beh\195\164lter",
	["CATEGORY_CORE_MATS"] = "Kernmaterialien",
	["CATEGORY_DEFAULT"] = "Standard",
	["CATEGORY_EQUIPMENT"] = "Ausr\195\188stung",
	["CATEGORY_EQUIPMENT_SOULBOUND"] = "seelengebundene Ausr\195\188stung",
	["CATEGORY_PROJECTILE"] = "Projektile",
	["CATEGORY_PROJECTILE_BULLET"] = "Kugelprojektile",
	["CATEGORY_PROJECTILE_ARROW"] = "Pfeile",
	["CATEGORY_REPUTATION"] = "Ruf",
	["CATEGORY_SOULBOUND"] = "Seelengebunden",
	["CATEGORY_SOULSHARD"] = "Seelensplitter",
	["CATEGORY_TRASH"] = "M\195\188ll",
	["CATEGORY_UNKNOWN"] = "Unbekannt",
	
	
--	consumable category descriptions
	["CATEGORY_CONSUMABLE_DRINK"] = "Getr\195\164nke",
	["CATEGORY_CONSUMABLE_FOOD"] = "Essen",
	["CATEGORY_CONSUMABLE_FOOD_PET"] = "Essen f\195\188r den Begleiter",
	["CATEGORY_CONSUMABLE_POTION_HEAL"] = "Heiltr\195\164nke",
	["CATEGORY_CONSUMABLE_POTION_MANA"] = "Manatr\195\164nke",
--	["CATEGORY_CONSUMABLE_ELIXIR_BATTLE"] = "",
--	["CATEGORY_CONSUMABLE_ELIXIR_GUARDIAN"] = "",
	
	
--	empty categories
	["CATEGORY_EMPTY_BAG"] = "Leer (Tasche)",
	["CATEGORY_EMPTY_ENCHANTING"] = "Leer (Verzauberung)",
	["CATEGORY_EMPTY_ENGINEERING"] = "Leer (Ingenieur)",
	["CATEGORY_EMPTY_GEM"] = "Leer (Juwelen)",
	["CATEGORY_EMPTY_HERB"] = "Leer (Kr\195\164uter)",
--	["CATEGORY_EMPTY_INSCRIPTION"] = "",
	["CATEGORY_EMPTY_KEY"] = "Leer (Schl\195\188sselbund)",
	["CATEGORY_EMPTY_LEATHERWORKING"] = "Leer (Lederverarbeitung)",
	["CATEGORY_EMPTY_MINING"] = "Leer (Bergbau)",
	["CATEGORY_EMPTY_PROJECTILE"] = "Leer (Projektile)",
	["CATEGORY_EMPTY_PROJECTILE_ARROW"] = "Leer (Pfeile)",
	["CATEGORY_EMPTY_PROJECTILE_BULLET"] = "Leer (Kugelprojektile)",
	["CATEGORY_EMPTY_SOULSHARD"] = "Leer (Seelensplitter)",
	["CATEGORY_EMPTY_UNKNOWN"] = "Leer (Unbekannt)",
	
	
--	bag names - used to name the empty slots in the status frame
	["STATUS_NAME_BAG"] = "Taschen",
	["STATUS_NAME_ENCHANTING"] = "Verzaubern",
	["STATUS_NAME_ENGINEERING"] = "Ingenieur",
	["STATUS_NAME_GEM"] = "Edelsteine",
	["STATUS_NAME_HERB"] = "Kr\195\164uter",
--	["STATUS_NAME_INSCRIPTION"] = "",
	["STATUS_NAME_KEY"] = "Schl\195\188ssel",
	["STATUS_NAME_LEATHERWORKING"] = "Leder",
	["STATUS_NAME_MINING"] = "Bergbau",
	["STATUS_NAME_PROJECTILE"] = "Munition",
	["STATUS_NAME_PROJECTILE_ARROW"] = "Pfeile",
	["STATUS_NAME_PROJECTILE_BULLET"] = "Kugeln",
	["STATUS_NAME_SOULSHARD"] = "Seelensplitter",
	["STATUS_NAME_UNKNOWN"] = "Unbekannt",
	
	
--	main menu
	["MOD_FRAME_MENU"] = "Men\195\188",
	
	["MOD_MENU_MAIN_SWITCH_CHARACTER"] = "Charakter wechseln",
	["MOD_MENU_MAIN_SWITCH_CHARACTER_TEXT"] = "wechselt zu einem anderen Charakter",
	["MOD_MENU_MAIN_SWITCH_CHARACTER_CHOOSE_NONE"] = "keine Daten von anderen Charakteren vorhanden",
	["MOD_MENU_MAIN_SWITCH_CHARACTER_CHOOSE_TEXT"] = "zeigt die Daten von %1$s",
	["MOD_MENU_MAIN_SWITCH_CHARACTER_ERASE"] = "%s Daten l\195\182schen",
	["MOD_MENU_MAIN_SWITCH_CHARACTER_ERASE_TEXT"] = "%1$s Daten von %2$s l\195\182schen",
	
	["MOD_MENU_MAIN_SWITCH_LOCATION"] = "Position wechseln",
	["MOD_MENU_MAIN_SWITCH_LOCATION_TEXT"] = "positioniert das %1$s Fenster an einer anderen Stelle",
	
	["MOD_MENU_MAIN_WINDOW"] = "Fenster",
	["MOD_MENU_MAIN_WINDOW_SCALE_TEXT"] = "mit der Skalierung kann man Fenster gr\195\182\195\159er oder kleiner machen",
	["MOD_MENU_MAIN_WINDOW_PADDING_TEXT"] = "legt den Abstand zwischen dem Fensterrand und den Leisten fest",
	["MOD_MENU_MAIN_WINDOW_WIDTH_TEXT"] = "legt die Anzahl an Spalten fest",
	["MOD_MENU_MAIN_WINDOW_BACKGROUND_COLOR_TEXT"] = "legt die Hintergrundfarbe des Hauptfensters fest",
	["MOD_MENU_MAIN_WINDOW_BORDER_SHOW_TEXT"] = "bestimmt, ob ein Rahmen um das Hauptfenster angezeigt wird",
--	["MOD_MENU_MAIN_WINDOW_BORDER_STYLE_TEXT"] = "",
	["MOD_MENU_MAIN_WINDOW_BORDER_COLOR_TEXT"] = "legt die Rahmenfarbe des Hauptfensters fest",
	["MOD_MENU_MAIN_WINDOW_BAGHIGHLIGHT_COLOR"] = "Farbe zum Hervorheben einer Tasche",
	["MOD_MENU_MAIN_WINDOW_BAGHIGHLIGHT_COLOR_TEXT"] = "die Farbe zum Hervorheben der Taschenpl\195\164tze, wenn man mit der Maus \195\188ber eine Tasche f\195\164hrt",
	["MOD_MENU_MAIN_WINDOW_ANCHOR_LOCK_TEXT"] = "verhindert, dass der %1$s Rahmen verschoben werden kann",
	
	["MOD_MENU_MAIN_BARS"] = "Leisten",
	["MOD_MENU_MAIN_BARS_PER_ROW"] = "pro Zeile",
	["MOD_MENU_MAIN_BARS_PER_ROW_TEXT"] = "legt die Anzahl an Leisten pro Zeile fest",
	["MOD_MENU_MAIN_BARS_DIRECTION"] = "Richtung",
	["MOD_MENU_MAIN_BARS_DIRECTION_HORIZONTAL_TEXT"] = "Leisten horizontal erweitern",
	["MOD_MENU_MAIN_BARS_DIRECTION_VERTICAL_TEXT"] = "Leisten vertikal erweitern",
	["MOD_MENU_MAIN_BARS_COMPACT"] = "kompakt",
	["MOD_MENU_MAIN_BARS_COMPACT_TEXT"] = "zeigt nur benutze Leisten gem\195\164\195\159 ihrer Reihenfolge an",
	["MOD_MENU_MAIN_BARS_SHOW_EMPTY"] = "leere anzeigen",
	["MOD_MENU_MAIN_BARS_SHOW_EMPTY_TEXT"] = "festlegen, ob leere Leisten angezeigt werden sollen",
	["MOD_MENU_MAIN_BARS_BACKGROUND_TEXT"] = "legt die Hintergrundfarbe der Leisten fest",
	["MOD_MENU_MAIN_BARS_BORDER_TEXT"] = "bestimmt, ob ein Rahmen um jede Leiste angezeigt wird",
--	["MOD_MENU_MAIN_BARS_BORDER_STYLE_TEXT"] = "",
	["MOD_MENU_MAIN_BARS_BORDER_COLOUR_TEXT"] = "legt die Rahmenfarbe der Leisten fest",
	["MOD_MENU_MAIN_BARS_NAME"] = "Beschriftung",
	["MOD_MENU_MAIN_BARS_NAME_TEXT"] = "zum Festlegen einer Beschriftung f\195\188r diese Leiste",
	["MOD_MENU_MAIN_BARS_NAME_SHOW_TEXT"] = "bestimmt, ob die Beschriftungen der Leisten angezeigt werden",
	["MOD_MENU_MAIN_BARS_NAME_COLOUR_TEXT"] = "legt die Textfarbe der Leistenbeschriftungen fest",
--	["MOD_MENU_MAIN_BARS_PADDING_INTERNAL_TEXT"] = "",
--	["MOD_MENU_MAIN_BARS_PADDING_EXTERNAL_TEXT"] = "",
	
	["MOD_MENU_MAIN_ITEMS"] = "Gegenst\195\164nde",
	["MOD_MENU_MAIN_ITEMS_PADDING_TEXT"] = "legt den Abstand zwischen den Pl\195\164tzen der Gegenst\195\164nde fest",
	["MOD_MENU_MAIN_ITEMS_FADE"] = "verbleichen, wenn nicht verf\195\188gbar",
	["MOD_MENU_MAIN_ITEMS_FADE_TEXT"] = "bestimmt, ob nicht verf\195\188gbare Gegenst\195\164nde verblichen dargestellt werden sollen",
--	["MOD_MENU_MAIN_ITEMS_TINT_USABLE"] = "",
--	["MOD_MENU_MAIN_ITEMS_TINT_USABLE_TEXT"] = "",
	["MOD_MENU_MAIN_ITEMS_BORDER_SHOW_TEXT"] = "bestimmt, ob ein Rahmen um die Gegenst\195\164nde angezeigt wird",
--	["MOD_MENU_MAIN_ITEMS_BORDER_STYLE_TEXT"] = "",
	["MOD_MENU_MAIN_ITEMS_BORDER_RARITY"] = "Seltenheit bestimmt Rahmenfarbe",
	["MOD_MENU_MAIN_ITEMS_BORDER_RARITY_TEXT"] = "bestimmt, ob der Rahmen um jeden Gegenst\195\164nd mit der Farbe dessen Seltenheit gezeichnet wird (verbreitet, rar, episch, etc)",
	["MOD_MENU_MAIN_ITEMS_BORDER_TEXTURE_OFFSET"] = "Versatz",
	["MOD_MENU_MAIN_ITEMS_BORDER_TEXTURE_OFFSET_TEXT"] = "Anzahl der Pixel vom Bildrand zum Beginn des Rahmens (wird beim Positionieren des Texturrahmens auf dem Rahmen des Gegenstandes verwendet)",
	["MOD_MENU_MAIN_ITEMS_BORDER_SCALE_TEXT"] = "legt die Skalierung der Rahmentextur fest",
	["MOD_MENU_MAIN_ITEMS_HIDDEN"] = "versteckte anzeigen",
	["MOD_MENU_MAIN_ITEMS_HIDDEN_TEXT"] = "bestimmt, ob Gegenst\195\164nde aus versteckten Kategorien angezeigt werden sollen",
	
	["MOD_MENU_MAIN_SORTING"] = "Sortierung",
	["MOD_MENU_MAIN_SORTING_BAGSLOT"] = "Tasche / Platz",
	["MOD_MENU_MAIN_SORTING_BAGSLOT_TEXT"] = "Sortiert das Inventar anhand der Taschen und Platznummern.",
	["MOD_MENU_MAIN_SORTING_USER"] = "Benutzerdefiniert",
	["MOD_MENU_MAIN_SORTING_USER_TEXT"] = "Du bestimmst, wie deine Taschen sortiert werden sollen.",
	["MOD_MENU_MAIN_SORTING_INCLUDE_NAME"] = "Name",
	["MOD_MENU_MAIN_SORTING_INCLUDE_NAME_TEXT"] = "Den Namen des Gegenstandes beim Sortieren des Inventars verwenden.",
	["MOD_MENU_MAIN_SORTING_INCLUDE_NAME_REVERSE"] = "W\195\182rter des Namens umkehren",
	["MOD_MENU_MAIN_SORTING_INCLUDE_NAME_REVERSE_TEXT"] = "Bei der Namenssortierung werden die einzelnen W\195\182rter in umgekehrter Reihenfolge verwendet.\n\neg Erstklassiger Manatrank wird zu Manatrank Erstklassiger",
	["MOD_MENU_MAIN_SORTING_INCLUDE_QUALITY"] = "Seltenheit",
	["MOD_MENU_MAIN_SORTING_INCLUDE_QUALITY_TEXT"] = "Die Gegenst\195\164nde anhand ihrer Seltenheit sortieren.",
	["MOD_MENU_MAIN_SORTING_INCLUDE_LOCATION"] = "Art des Kleidungsst\195\188cks",
	["MOD_MENU_MAIN_SORTING_INCLUDE_LOCATION_TEXT"] = "Die Art des Kleidungsst\195\188cks beim Sortieren des Inventars verwenden.\n\nAnmerkung: Betrifft nur Kleidung, die angezogen werden kann.",
	["MOD_MENU_MAIN_SORTING_INCLUDE_ITEMTYPE"] = "Typ und Subtyp",
	["MOD_MENU_MAIN_SORTING_INCLUDE_ITEMTYPE_TEXT"] = "Typ und Subtyp beim Sortieren des Inventars verwenden.",
	["MOD_MENU_MAIN_SORTING_INCLUDE_CATEGORY"] = "Kategorie",
	["MOD_MENU_MAIN_SORTING_INCLUDE_CATEGORY_TEXT"] = "Die Kategorie eines Gegenstandes beim Sortieren des Inventars verwenden.",
	["MOD_MENU_MAIN_SORTING_INCLUDE_ITEMUSELEVEL"] = "Verwendbarkeitsstufe",
	["MOD_MENU_MAIN_SORTING_INCLUDE_ITEMUSELEVEL_TEXT"] = "Die Stufe, ab der ein Gegenstand verwendet werden kann, bestimmt die Sortierreihenfolge.",
	["MOD_MENU_MAIN_SORTING_INCLUDE_ITEMSTATLEVEL"] = "Gegenstandsstufe",
	["MOD_MENU_MAIN_SORTING_INCLUDE_ITEMSTATLEVEL_TEXT"] = "Die Stufe eines Gegenstandes beim Sortieren des Inventars verwenden.",
	["MOD_MENU_MAIN_SORTING_INCLUDE_VENDORPRICE"] = "Preis beim H\195\164ndler",
	["MOD_MENU_MAIN_SORTING_INCLUDE_VENDORPRICE_TEXT"] = "Der Verkaufspreis (gestapelten Gegenst\195\164nde werden aufsummiert) bestimmt die Sortierreihenfolge.",
	["MOD_MENU_MAIN_SORTING_OPEN"] = "beim \195\150ffnenn des Fensters",
	["MOD_MENU_MAIN_SORTING_OPEN_TEXT"] = "Die Gegenst\195\164nde werden erst beim \195\150ffnenn des Fensters sortiert.",
	["MOD_MENU_MAIN_SORTING_INSTANT"] = "sofort",
	["MOD_MENU_MAIN_SORTING_INSTANT_TEXT"] = "Sofortige Sortierung\n\nan: wenn sich etwas ver\195\164ndert, wird sortiert\n\naus: beim \195\150ffnenn des Fensters oder wenn du auf Aktualisieren klickst, wird sortiert",
	["MOD_MENU_MAIN_SORTING_ASCENDING"] = "aufsteigende Reihenfolge",
	["MOD_MENU_MAIN_SORTING_ASCENDING_TEXT"] = "Gegenst\195\164nde in aufsteigender oder absteigender Reihenfolge sortieren.",
	["MOD_MENU_MAIN_SORTING_ORDER"] = "Sortierreihenfolge",
	["MOD_MENU_MAIN_SORTING_MOVE_UP"] = "nach oben verschieben",
	["MOD_MENU_MAIN_SORTING_MOVE_UP_TEXT"] = "verschiebt %1$s in der Sortierreihenfolge nach oben",
	["MOD_MENU_MAIN_SORTING_MOVE_DOWN"] = "nach unten verschieben",
	["MOD_MENU_MAIN_SORTING_MOVE_DOWN_TEXT"] = "verschiebt %1$s in der Sortierreihenfolge nach unten",
	["MOD_MENU_MAIN_SORTING_NOT_INCLUDED"] = "* wird zurzeit beim Sortieren nicht beachtet *",
	
	["MOD_MENU_MAIN_EMPTY"] = "freie Pl\195\164tze",
	["MOD_MENU_MAIN_EMPTY_ICON"] = "Symbol verwenden",
	["MOD_MENU_MAIN_EMPTY_ICON_TEXT"] = "Freie Pl\195\164tze mit Bild oder nur in einer Farbe anzeigen.",
	["MOD_MENU_MAIN_EMPTY_BORDER"] = "farbiger Rahmen",
	["MOD_MENU_MAIN_EMPTY_BORDER_TEXT"] = "Freie Pl\195\164tze mit der Farbe ihrer Taschenart umrahmen.",
	["MOD_MENU_MAIN_EMPTY_COLOUR"] = "Farben der Pl\195\164tze",
	["MOD_MENU_MAIN_EMPTY_COLOUR_TEXT"] = "Die Farbe, mit der die freien Pl\195\164tze markiert werden.",
--	["MOD_MENU_MAIN_EMPTY_COLOUR_TEXT2"] = "", -- slot name
	["MOD_MENU_MAIN_EMPTY_CLUMP"] = "typisiert",
	["MOD_MENU_MAIN_EMPTY_CLUMP_TEXT"] = "Freie Pl\195\164tze von Spezialtaschen bei ihrer Kategorie anzeigen oder zur allgemeinen Kategorie hinzuf\195\188gen.",
	["MOD_MENU_MAIN_EMPTY_SHOW"] = "Anzahl anzeigen",
	["MOD_MENU_MAIN_EMPTY_SHOW_TEXT"] = "Bestimmt, ob die Anzahl der freien Pl\195\164tze an den Taschen angezeigt werden soll.",
	["MOD_MENU_MAIN_EMPTY_SHOW_COLOUR_TEXT"] = "Textfarbe f\195\188r die Anzahl der freien Pl\195\164tze.",
	
	["MOD_MENU_MAIN_HIDDEN"] = "Elemente verbergen",
	["MOD_MENU_MAIN_HIDDEN_TITLE"] = "Titel",
	["MOD_MENU_MAIN_HIDDEN_TITLE_TEXT"] = "Bestimmt, ob der Titelbereich von %1$s angezeigt werden soll.",
	["MOD_MENU_MAIN_HIDDEN_CHANGER"] = "Taschenpl\195\164tze",
	["MOD_MENU_MAIN_HIDDEN_CHANGER_TEXT"] = "Bestimmt, ob die einzelnen %1$s Pl\195\164tze angezeigt werden sollen.",
	["MOD_MENU_MAIN_HIDDEN_STATUS"] = "Status",
	["MOD_MENU_MAIN_HIDDEN_STATUS_TEXT"] = "Bestimmt, ob die %1$s Statuszeile (freie Pl\195\164tze, Geldstand) angezeigt werden soll.",
	
	["MOD_MENU_MAIN_NEWITEM"] = "neue Gegenst\195\164nde",
	["MOD_MENU_MAIN_NEWITEM_SHOW"] = "markieren",
	["MOD_MENU_MAIN_NEWITEM_SHOW_TEXT"] = "bestimmt, ob neue Gegenst\195\164nde im %s Fenster markiert werden sollen",
	["MOD_MENU_MAIN_NEWITEM_COLOUR_TEXT"] = "legt die Farbe für die Markierung fest",
	["MOD_MENU_MAIN_NEWITEM_RESET"] = "vergessen",
	["MOD_MENU_MAIN_NEWITEM_RESET_TEXT"] = "vergisst die als neu zu markierenden Gegenst\195\164nde",
	
	["MOD_MENU_MAIN_ACTIONS"] = "Aktionen",
	
	["MOD_MENU_MAIN_AUTO_MERCHANT"] = "H\195\164ndler",
	["MOD_MENU_MAIN_AUTO_TRADE"] = "Handeln",
	["MOD_MENU_MAIN_AUTO_AUCTION"] = "Auktionshaus",
	["MOD_MENU_MAIN_AUTO_COMBAT"] = "Kampf",
	
	["MOD_MENU_MAIN_TOOLTIP"] = "Hinweistexte",
	["MOD_MENU_MAIN_TOOLTIP_ENABLE_TEXT"] = "Bestimmt, ob Hinweistexte angezeigt werden.",
--	["MOD_MENU_MAIN_TOOLTIP_EMPTY_ADD"] = "",
--	["MOD_MENU_MAIN_TOOLTIP_EMPTY_ADD_TEXT"] = "",
	["MOD_MENU_MAIN_TOOLTIP_ITEMCOUNT_ADD"] = "Anzahl der Gegenst\195\164nde anzeigen",
	["MOD_MENU_MAIN_TOOLTIP_ITEMCOUNT_ADD_TEXT"] = "Bestimmt, ob die Anzahl der Gegenst\195\164nde angezeigt wird.",
	["MOD_MENU_MAIN_TOOLTIP_ITEMCOUNT_COLOUR_TEXT"] = "legt die Farbe des Textes, der die Anzahl der Gegenst\195\164nde anzeigt, fest",
	["MOD_MENU_MAIN_TOOLTIP_VENDOR_ADD"] = "Kaufpreis des H\195\164ndlers anzeigen",
	["MOD_MENU_MAIN_TOOLTIP_VENDOR_ADD_TEXT"] = "Bestimmt, ob der Kaufpreis des H\195\164ndlers angezeigt wird.",
	["MOD_MENU_MAIN_TOOLTIP_VENDOR_COLOUR_TEXT"] = "Legt fest, in welcher Farbe der Kaufpreis des H\195\164ndlers angezeigt wird.",
--	["MOD_MENU_MAIN_TOOLTIP_SELF_ONLY"] = "",
--	["MOD_MENU_MAIN_TOOLTIP_SELF_ONLY_TEXT"] = "",
	
	["MOD_MENU_MAIN_FONT_TEXT"] = "legt fest, dass die Schriftart %s verwendet werden soll",
	
	["MOD_MENU_MAIN_REFRESH"] = "Aktualisieren",
	["MOD_MENU_MAIN_REFRESH_TEXT"] = "aktualisiert das Fenster",
	
	["MOD_MENU_MAIN_RELOAD"] = "Neu laden",
	["MOD_MENU_MAIN_RELOAD_TEXT"] = "l\195\164dt das Fenster neu (zu verwenden nachdem man Gegenst\195\164nde in den Ausr\195\188stungs-Sets ver\195\164ndert hat)",
	
	["MOD_MENU_MAIN_EDITMODE"] = "Bearbeitungs-Modus",
	["MOD_MENU_MAIN_EDITMODE_TEXT"] = "schaltet den Bearbeitungs-Modus ein oder aus (nur im Bearbeitungs-Modus kann man Leisten, Sortierung etc. ver\195\164ndern)",
	
	["MOD_MENU_MAIN_BAGCHANGE"] = "Taschen anzeigen",
	["MOD_MENU_MAIN_BAGCHANGE_TEXT"] = "bestimmt, ob die Taschenpl\195\164tze angezeigt werden sollen, damit man die Taschen wechseln kann",
	
	["MOD_MENU_MAIN_RULES"] = "Regeln",
	
	["MOD_MENU_RULE_SHOWDISABLED"] = "deaktivierte Regeln anzeigen",
	["MOD_MENU_RULE_SHOWDISABLED_TEXT"] = "bestimmt, ob deaktivierte Regeln angezeigt werden sollen",
	
	["MOD_MENU_MAIN_SEARCH"] = "Suchen",
	
--	["MOD_MENU_MAIN_CUSTOM_CATEGORIES"] = "",
	
	
--	item menu
	["MOD_MENU_ITEM_INFORMATION_TITLE"] = "Informationen zu diesem Gegenstand",
	["MOD_MENU_ITEM_ITEM"] = "Gegenstand",
	["MOD_MENU_ITEM_CURRENT_ASSIGNMENT"] = "aktuelle Zuordnung",
	["MOD_MENU_ITEM_DEFAULT_ASSIGNMENT"] = "Standardzuordnung",
--	["MOD_MENU_ITEM_DEFAULT_RESET"] = "",
--	["MOD_MENU_ITEM_DEFAULT_RESET_TEXT"] = "",
--	["MOD_MENU_ITEM_ASSIGN_CHOICES"] = "",
--	["MOD_MENU_ITEM_ASSIGN_THIS"] = "",
--	["MOD_MENU_ITEM_ASSIGN_THIS_TEXT"] = "",
	["MOD_MENU_ITEM_MOVE"] = "in Leiste %1$s verschieben",
	["MOD_MENU_ITEM_RULE_NEW"] = "eine neue Regel erstellen",
	["MOD_MENU_ITEM_RULE_ADD"] = "zu einer Regel hinzuf\195\188gen",
--	["MOD_MENU_ITEM_CUSTOM_NEW"] = "",
	["MOD_MENU_ITEM_DEBUG"] = "Informationen zur Fehlersuche",
	["MOD_MENU_ITEM_DEBUG_BAG"] = "Tasche",
	["MOD_MENU_ITEM_DEBUG_SLOT"] = "Platz",
	["MOD_MENU_ITEM_DEBUG_BAG_TYPE"] = "Taschenart",
--	["MOD_MENU_ITEM_DEBUG_AI_ID_SHORT"] = "",
--	["MOD_MENU_ITEM_DEBUG_AI_ID_CACHE"] = "",
	["MOD_MENU_ITEM_DEBUG_AI_ID_CATEGORY"] = "AI Kategorie",
	["MOD_MENU_ITEM_DEBUG_NAME"] = "Name",
	["MOD_MENU_ITEM_DEBUG_QUALITY"] = "Qualit\195\164t",
	["MOD_MENU_ITEM_DEBUG_LVL_ITEM"] = "Gegenstandsstufe",
	["MOD_MENU_ITEM_DEBUG_LVL_USE"] = "Verwendbarkeitsstufe",
	["MOD_MENU_ITEM_DEBUG_TYPE"] = "Typ",
	["MOD_MENU_ITEM_DEBUG_SUBTYPE"] = "Subtyp",
	["MOD_MENU_ITEM_DEBUG_LOCATION"] = "Position",
	["MOD_MENU_ITEM_DEBUG_ID"] = "Blizzard-ID",
	["MOD_MENU_ITEM_DEBUG_STACK"] = "Stapelgr\195\182\195\159e",
	["MOD_MENU_ITEM_DEBUG_TEXTURE"] = "Textur",
	["MOD_MENU_ITEM_DEBUG_FAMILY"] = "Familie",
	["MOD_MENU_ITEM_DEBUG_PT"] = "PT-Sets",
	["MOD_MENU_ITEM_DEBUG_PT_TEXT"] = "zeigt die PT-Sets an, in denen dieser Gegenstand ist",
	["MOD_MENU_ITEM_DEBUG_PT_NONE"] = "dieser Gegenstand ist zurzeit in keinem PT-Set",
	["MOD_MENU_ITEM_DEBUG_PT_TITLE"] = "PT-Sets in denen dieser Gegenstand ist",
	
	
--	bar menu
	["MOD_MENU_BAR_INFORMATION_TITLE"] = "Einstellungen der %1$s. Leiste",
	["MOD_MENU_BAR_CATEGORY"] = "Kategorie",
	["MOD_MENU_BAR_CATEGORY_TEXT"] = "Kategorie %1$s dieser Leiste zuordnen",
	["MOD_MENU_BAR_CATEGORY_CURRENT"] = "aktuell zugeordnet",
	["MOD_MENU_BAR_CATEGORY_ASSIGN"] = "verf\195\188gbare Kategorien",
	["MOD_MENU_BAR_CATEGORY_REMOVE"] = "entfernen",
	["MOD_MENU_BAR_CATEGORY_REMOVE_TEXT"] = "entfernt %1$s von der Leiste %2$s, wodurch diese wieder zu einer Standardleiste wird", -- 1 Name der Kategorie, 2 Leistennummer
	["MOD_MENU_BAR_CATEGORY_HIDDEN"] = "verstecken",
	["MOD_MENU_BAR_CATEGORY_HIDDEN_TEXT"] = "Versteckt eine Kategorie.\n\nGegenst\195\164nde, die sich in einer versteckten Kategorie befinden, werden in der normalen Ansicht nicht angezeigt.",
--	["MOD_MENU_BAR_OPTIONS"] = "",
	["MOD_MENU_BAR_CLEAR"] = "Leiste zur\195\188cksetzen",
	["MOD_MENU_BAR_CLEAR_TEXT"] = "Entfernt alle dieser Leiste zugeordneten Kategorien, mit Ausnahme der Standardkategorie.",
	["MOD_MENU_BAR_INSERT"] = "Leiste einf\195\188gen",
	["MOD_MENU_BAR_INSERT_TEXT"] = "F\195\188gt an dieser Stelle eine Leiste ein, welche alle Kategorien um eins nach oben verschiebt.",
	["MOD_MENU_BAR_REMOVE"] = "Leiste entfernen",
	["MOD_MENU_BAR_REMOVE_TEXT"] = "Entfernt diese Leiste (alle Gegenst\195\164nde kommen wieder in die Standardleiste) und die Leiste dar\195\188ber nimmt diesen Platz ein.\n\nFalls dies die Standardleiste ist, wird Leiste 1 zur neuen Standardleiste.",
	["MOD_MENU_BAR_MOVE_UP"] = "Leiste nach oben verschieben",
	["MOD_MENU_BAR_MOVE_UP_TEXT"] = "Tauscht alle Kategorien dieser Leiste mit der dar\195\188ber.",
	["MOD_MENU_BAR_MOVE_DOWN"] = "Leiste nach unten verschieben",
	["MOD_MENU_BAR_MOVE_DOWN_TEXT"] = "Tauscht alle Kategorien dieser Leiste mit der darunter.",
	
	
--	changer bag menu
	["MOD_MENU_BAG_TITLE"] = "Taschen-Einstellungen",
	["MOD_MENU_BAG_SHOW"] = "Anzeigen",
	["MOD_MENU_BAG_SHOW_TEXT"] = "zeigt den Inhalt dieser Tasche an",
	["MOD_MENU_BAG_ISOLATE"] = "Einzelansicht",
	["MOD_MENU_BAG_ISOLATE_TEXT"] = "nur den Inhalt dieser Tasche anzeigen",
	["MOD_MENU_BAG_SHOWALL"] = "alle anzeigen",
	["MOD_MENU_BAG_SHOWALL_TEXT"] = "den Inhalt aller Taschen anzeigen",
	
	
--	rules frame
	["MOD_FRAME_RULE_RULE"] = "Regel",
	["MOD_FRAME_RULE_ENABLED"] = "aktiv",
	["MOD_FRAME_RULE_HIDDEN"] = "versteckt",
	["MOD_FRAME_RULE_ORDER"] = "Reihenfolge",
	["MOD_FRAME_RULE_DESCRIPTION"] = "Beschreibung",
	["MOD_FRAME_RULE_FORMULA"] = "Ausdruck",
	["MOD_FRAME_RULE_SEARCH"] = "Suchen",
	["MOD_FRAME_RULE_VIEW"] = "Anzeige",
	["MOD_FRAME_RULE_ADD"] = "Hinzuf\195\188gen",
	["MOD_FRAME_RULE_EDIT"] = "Bearbeiten",
	["MOD_FRAME_RULE_REMOVE"] = "L\195\182schen",
	["MOD_FRAME_RULE_OK"] = "OK",
	["MOD_FRAME_RULE_CANCEL"] = "Abbrechen",
	["MOD_FRAME_RULE_LIST_ENABLED"] = "Akt",
	["MOD_FRAME_RULE_LIST_DAMAGED"] = "Def",
	["MOD_FRAME_RULE_LIST_ID"] = "Regel",
	["MOD_FRAME_RULE_LIST_ORDER"] = "Reihenfolge",
	["MOD_FRAME_RULE_LIST_DESCRIPTION"] = "Beschreibung",
	
	["RULE_DAMAGED"] = "Regel %s wird als defekt markiert und daher nicht l\195\164nger ausgef\195\188hrt, bis sie wieder korrigiert wurde",
	["RULE_FAILED_NIL_KEY"] = "Fehlgeschlagen: der angegebene Schl\195\188ssel ist nicht gesetzt",
	["RULE_FAILED_NIL_DATA"] = "Fehlgeschlagen: die angegebenen Daten sind nicht gesetzt",
	["RULE_FAILED_NIL_DESCRIPTION"] = "Fehlgeschlagen: fehlende Beschreibung",
	["RULE_FAILED_NIL_FORMULA"] = "Fehlgeschlagen: fehlender Ausdruck",
	
	
--	new item indicators
	["NEW_ITEM_NEW"] = "Neu",
	["NEW_ITEM_INCREASE"] = "+++",
	["NEW_ITEM_DECREASE"] = "- - -",
	
	
--	debug
	["MOD_MENU_MAIN_DEBUG"] = "Modus zur Fehlersuche",
	["MOD_MENU_MAIN_DEBUG_TEXT"] = "legt fest, ob der Programmcode zur Fehlersuche ausgef\195\188hrt wird",
	
	
--	slash commands
	["SLASH_UI"] = "ui",
	["SLASH_UI_TEXT"] = "Optionen zur Benutzeroberfl\195\164che",
	["SLASH_UI_RESET"] = "standard",
	["SLASH_UI_RESET_TEXT"] = "setzt die Benutzeroberfl\195\164che auf die Standardeinstellung zur\195\188ck",
	["SLASH_UI_RESET_COMPLETE_TEXT"] = "alle Fensterpositionen wurden auf die Standardeinstellung zur\195\188ckgesetzt (zentriert)",
	["SLASH_DB"] = "db",
	["SLASH_DB_TEXT"] = "Datenbankoptionen",
	["SLASH_DB_RESET"] = "standard",
	["SLASH_DB_RESET_TEXT"] = "setzt die Profil-Datenbank auf die Standardwerte zur\195\188ck",
	["SLASH_DB_RESET_CONFIRM"] = "akzeptieren",
	["SLASH_DB_RESET_CONFIRM_TEXT"] = "best\195\164tigt das Zur\195\188cksetzen der Profil-Datenbank",
	["SLASH_DB_RESET_COMPLETE_TEXT"] = "Profil-Datenbank wurde zur\195\188ckgesetzt.  Alle Optionen haben nun wieder ihre Standardwerte.",
	["SLASH_CACHE"] = "cache",
	["SLASH_CACHE_TEXT"] = "Zwischenspeicher-Optionen",
	["SLASH_CACHE_ERASE"] = "leeren",
	["SLASH_CACHE_ERASE_TEXT"] = "l\195\182scht alle zwischengespeicherten Daten",
	["SLASH_CACHE_ERASE_CONFIRM"] = "akzeptieren",
	["SLASH_CACHE_ERASE_CONFIRM_TEXT"] = "best\195\164tigt das L\195\182schen aller zwischengespeicherten Daten",
	["SLASH_CACHE_ERASE_COMPLETE_TEXT"] = "l\195\182scht die Daten aller Charaktere",
	["SLASH_MISC"] = "sonstiges",
	["SLASH_MISC_TEXT"] = "verschiedene Optionen",
	
	
--	misc chat stuff
	["UPGRADE_PROFILE"] = "aktualisiere Profil [%1$s] auf %2$.4f",
--	["UPGRADE_GLOBAL"] = "",
	["MISC_ALERT"] = "ACHTUNG!",
	["MISC_ALERT_FRAMELEVEL_1"] = "Fehlerbehebung abgeschlossen",
	["MISC_ALERT_FRAMELEVEL_2"] = "Der Rahmen des Fensters %1$s ist zurzeit bei %2$s und wurde auf %3$s zur\195\188ckgesetzt, um weiter verwendet werden zu k\195\182nnen.  Entschuldige bitte die Verz\195\182gerung, die dadurch verursacht wurde.",
	
	
--	item count tooltip
	["TOOLTIP_VENDOR"] = "H\195\164ndler",
--	["TOOLTIP_TOTAL"] = "",
--	["TOOLTIP_COUNT_ME"] = "",
	
	
--	generic menu text
	["GENERIC_BOTTOMLEFT"] = "unten links",
	["GENERIC_BOTTOMRIGHT"] = "unten rechts",
	["GENERIC_TOPLEFT"] = "oben links",
	["GENERIC_TOPRIGHT"] = "oben rechts",
	["GENERIC_HORIZONTAL"] = "horizontal",
	["GENERIC_VERTICAL"] = "vertikal",
	["GENERIC_CLOSE_MENU"] = "Schlie\195\159en",
	["GENERIC_ANCHOR"] = "Position",
	["GENERIC_ANCHOR_TEXT1"] = "legt die Position fest",
	["GENERIC_ANCHOR_TEXT2"] = "positioniert %1$s %2$s",
	["GENERIC_BORDER"] = "Rahmen",
	["GENERIC_BORDER_TEXT"] = "Rahmen-Einstellungen",
	["GENERIC_SHOW"] = "Anzeigen",
	["GENERIC_FILE"] = "Datei",
	["GENERIC_HEIGHT"] = "H\195\182he",
	["GENERIC_SCALE"] = "Skalierung",
	["GENERIC_TEXTURE"] = "Textur",
	["GENERIC_BORDER_TEXTURE_TEXT"] = "Einstellungen zur Rahmentextur",
	["GENERIC_BORDER_TEXTURE_FILE_TEXT"] = "Textur, die f\195\188r den Rahmen verwendet werden soll (bei einer \195\132nderung wird die Skalierung auf 100% zur\195\188ckgesetzt)",
	["GENERIC_BORDER_TEXTURE_HEIGHT_TEXT"] = "H\195\182he der Textur (in Pixeln)",
	["GENERIC_FONT"] = "Schriftart",
	["GENERIC_COLOUR"] = "Farbe",
	["GENERIC_BACKGROUND_COLOUR"] = "Hintergrundfarbe",
	["GENERIC_LOCK"] = "Position fixieren",
--	["GENERIC_STYLE"] = "",
	["GENERIC_ENABLED"] = "eingeschaltet",
	["GENERIC_DISABLED"] = "ausgeschaltet",
--	["GENERIC_ALERT"] = "",
	["GENERIC_PADDING"] = "Abstand",
--	["GENERIC_INTERNAL"] = "",
--	["GENERIC_EXTERNAL"] = "",
	["GENERIC_WIDTH"] = "Breite",
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
	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT"] = "fehler",
	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_TEXT"] = "legt fest, ob und wie ausf\195\188hrlich, Meldungen bei einer Fehlerbehebung angezeigt werden",
	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE0"] = "aus",
	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE0_TEXT"] = "Meldungen bei einer Fehlerbehebung werden nicht angezeigt",
	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE1"] = "kurz",
	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE1_TEXT"] = "es werden nur kurze Meldungen bei einer Fehlerbehebung angezeigt",
	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE2"] = "lang",
	["OPT_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE2_TEXT"] = "es werden ausf\195\188hrliche Meldungen bei einer Fehlerbehebung angezeigt",

	["OPT_AUTO"] = "automatisches \195\182ffnen/schlie\195\159en",
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
--	["OPT_CONTROL_TEXT"] = "", -- location name, chacracter name
--	["OPT_CONTROL_MONITOR"] = "",
--	["OPT_CONTROL_MONITOR_TEXT"] = "",
	["OPT_CONTROL_SAVE"] = "Zwischenspeicher",
	["OPT_CONTROL_SAVE_TEXT"] = "speichern der %1$s Daten dieses Charakters (%2$s), so dass man sie auch ansehen kann, wenn man mit einem anderen Charakter spielt oder offline ist",
	["OPT_CONTROL_CONTROL"] = "Blizzard Interface austauschen",
	["OPT_CONTROL_CONTROL_TEXT"] = "Tauscht das original Blizzard %2$s Interface mit dem von %1$s.\n\nIn abgeschaltetem Zustand wird das standard Blizzard %2$s Interface verwendet.\n\nMan kann in abgeschaltetem Zustand trotzdem das %2$s Interface von %1$s verwenden, aber man muss dann daf\195\188r erst Tastenkombinationen einrichten.",
	
--	["OPT_LOCATION"] = "",

	["OPT_ASSIGN_SETTINGS"] = "Einstellungen \195\188bernehmen",
--	["OPT_ASSIGN_SETTINGS_TEXT"] = "",
	["OPT_ASSIGN_SETTINGS_LOCATION_TEXT"] = "verwende Einstellungen von %1$s f\195\188r das Fenster %2$s",
	
--	["OPT_LOCATION_SETTINGS"] = "",
	
	
} end )
