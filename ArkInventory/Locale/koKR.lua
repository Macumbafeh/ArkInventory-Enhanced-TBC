local L = AceLibrary( "AceLocale-2.2" ):new( "ArkInventory" )
--L:EnableDynamicLocales( )

-- post updated translations at http://groups.google.com/group/wow-arkinventory (modify this file and include as an attachment)
-- note: when creating a new locale do not leave any english translations in your file, comment them out


-- Translated by: Fenlis (jungseop.park@gmail.com)











L:RegisterTranslations( "koKR", function() return {

--	wow skill headers - must match exactly what is in game
	["WOW_SKILL_HEADER_PRIMARY"] = "전문 기술",
	["WOW_SKILL_HEADER_SECONDARY"] = "보조 기술",
	
	
--	wow skill names - must match exactly what is in game
	["WOW_SKILL_ALCHEMY"] = "연금술",
	["WOW_SKILL_BLACKSMITHING"] = "대장기술",
	["WOW_SKILL_COOKING"] = "요리",
	["WOW_SKILL_ENCHANTING"] = "마법부여",
	["WOW_SKILL_ENGINEERING"] = "기계공학",
	["WOW_SKILL_FIRST_AID"] = "응급치료",
	["WOW_SKILL_FISHING"] = "낚시",
	["WOW_SKILL_HERBALISM"] = "약초 채집",
--	["WOW_SKILL_INSCRIPTION"] = "",
	["WOW_SKILL_JEWELCRAFTING"] = "보석세공",
	["WOW_SKILL_LEATHERWORKING"] = "가죽세공",
	["WOW_SKILL_MINING"] = "채광",
	["WOW_SKILL_RIDING"] = "탈것 타기",
	["WOW_SKILL_SKINNING"] = "무두질",
	["WOW_SKILL_TAILORING"] = "재봉술",
	
	
--	wow class names - must match exactly what is in game
	["WOW_CLASS_DRUID"] = "드루이드",
	["WOW_CLASS_HUNTER"] = "사냥꾼",
	["WOW_CLASS_MAGE"] = "마법사",
	["WOW_CLASS_PALADIN"] = "성기사",
	["WOW_CLASS_PRIEST"] = "사제",
	["WOW_CLASS_ROGUE"] = "도적",
	["WOW_CLASS_SHAMAN"] = "주술사",
	["WOW_CLASS_WARLOCK"] = "흑마법사",
	["WOW_CLASS_WARRIOR"] = "전사",
--	["WOW_CLASS_DEATHKNIGHT"] = "",

	
--	wow item types - must match exactly what is in game
	["WOW_ITEM_TYPE_ARMOR"] = "방어구",
	["WOW_ITEM_TYPE_CONSUMABLE"] = "소비 용품",
--	["WOW_ITEM_TYPE_CONSUMABLE_BANDAGE"] = "",
	["WOW_ITEM_TYPE_CONSUMABLE_ELIXIR"] = "영약",
--	["WOW_ITEM_TYPE_CONSUMABLE_FLASK"] = "",
--	["WOW_ITEM_TYPE_CONSUMABLE_FOOD_AND_DRINK"] = "",
	["WOW_ITEM_TYPE_CONSUMABLE_POTION"] = "물약",
--	["WOW_ITEM_TYPE_CONSUMABLE_SCROLL"] = "",
	["WOW_ITEM_TYPE_CONTAINER"] = "가방",
	["WOW_ITEM_TYPE_CONTAINER_BAG"] = "가방",
	["WOW_ITEM_TYPE_CONTAINER_ENCHANTING"] = "마법부여 가방",
	["WOW_ITEM_TYPE_CONTAINER_ENGINEERING"] = "기계공학 가방",
	["WOW_ITEM_TYPE_CONTAINER_GEM"] = "보석 가방",
	["WOW_ITEM_TYPE_CONTAINER_HERB"] = "약초 가방",
--	["WOW_ITEM_TYPE_CONTAINER_INSCRIPTION"] = "",
--	["WOW_ITEM_TYPE_CONTAINER_LEATHERWORKING"] = "",
	["WOW_ITEM_TYPE_CONTAINER_MINING"] = "채광 가방",
	["WOW_ITEM_TYPE_CONTAINER_SOULSHARD"] = "영혼석 가방",
	["WOW_ITEM_TYPE_GEM"] = "보석",
	["WOW_ITEM_TYPE_KEY"] = "열쇠", 
	["WOW_ITEM_TYPE_MISC"] = "기타", 
--	["WOW_ITEM_TYPE_MISC_MOUNT"] = "",
--	["WOW_ITEM_TYPE_MISC_PET"] = "",
--	["WOW_ITEM_TYPE_MISC_REAGENT"] = "",
	["WOW_ITEM_TYPE_PROJECTILE"] = "투사체",
	["WOW_ITEM_TYPE_PROJECTILE_ARROW"] = "화살",
	["WOW_ITEM_TYPE_PROJECTILE_BULLET"] = "탄환",
	["WOW_ITEM_TYPE_QUEST"] = "퀘스트",
	["WOW_ITEM_TYPE_QUIVER"] = "화살통",
	["WOW_ITEM_TYPE_QUIVER_ARROW"] = "화살통",
	["WOW_ITEM_TYPE_QUIVER_BULLET"] = "탄환 주머니",
	["WOW_ITEM_TYPE_RECIPE"] = "제조법",
	["WOW_ITEM_TYPE_TRADE_GOODS"] = "직업 용품",
--	["WOW_ITEM_TYPE_TRADE_GOODS_CLOTH"] = "",
	["WOW_ITEM_TYPE_TRADE_GOODS_DEVICES"] = "장치",
--	["WOW_ITEM_TYPE_TRADE_GOODS_ELEMENTAL"] = "",
--	["WOW_ITEM_TYPE_TRADE_GOODS_ENCHANTMENT_ARMOR"] = "",
--	["WOW_ITEM_TYPE_TRADE_GOODS_ENCHANTMENT_WEAPON"] = "",
	["WOW_ITEM_TYPE_TRADE_GOODS_EXPLOSIVES"] = "폭탄",
--	["WOW_ITEM_TYPE_TRADE_GOODS_HERB"] = "",
--	["WOW_ITEM_TYPE_TRADE_GOODS_LEATHER"] = "",
--	["WOW_ITEM_TYPE_TRADE_GOODS_MEAT"] = "",
--	["WOW_ITEM_TYPE_TRADE_GOODS_METAL_AND_STONE"] = "",
--	["WOW_ITEM_TYPE_TRADE_GOODS_MATERIALS"] = "",
	["WOW_ITEM_TYPE_TRADE_GOODS_PARTS"] = "부품",
	
	
--	wow tooltip text - must match exactly what is in game
	["WOW_ITEM_TOOLTIP_FOOD"] = "음식을 먹으려면 앉아 있어야 합니다.",
	["WOW_ITEM_TOOLTIP_DRINK"] = "음료를 마시려면 앉아 있어야 합니다.",
	["WOW_ITEM_TOOLTIP_POTION_HEAL"] = "%d+~%d+의 생명력이 회복됩니다.",
	["WOW_ITEM_TOOLTIP_POTION_MANA"] = "%d+~%d+의 마나가 회복됩니다.",
--	["WOW_ITEM_TOOLTIP_ELIXIR_BATTLE"] = "",
--	["WOW_ITEM_TOOLTIP_ELIXIR_GUARDIAN"] = "",
	
	
--	location names
--	["LOCATION_ALL"] = "",
	["LOCATION_BAG"] = "가방",
	["LOCATION_BANK"] = "은행",
--	["LOCATION_WEARING"] = "",
	
	
--	status bar/bag text
	["STATUS_OFFLINE"] = "오프라인",
	["STATUS_NO_DATA"] = "자료 없음",
	["STATUS_FULL"] = "가득참",
--	["STATUS_PURCHASE"] = "",
	
	
--	restack
	["RESTACK"] = "압축과 쌓기",
	["RESTACK_TEXT"] = "나뉘어진 더미를 하나로 압축하고 빈 칸 없이 채웁니다.",
	["RESTACK_START"] = "시작",
	["RESTACK_COMPLETE"] = "종료",
--	["RESTACK_FAIL_WAIT"] = "",
--	["RESTACK_FAIL_ACCESS"] = "",

	
--	vault tab tooltips
--	["VAULT_TAB_ACCESS_NONE"] = "",
--	["VAULT_TAB_NAME"] = "",
--	["VAULT_TAB_ACCESS"] = "",
--	["VAULT_TAB_REMAINING_WITHDRAWALS"] = "",
	
	
--	category "header" descriptions  (does not have to match wow)
	["CATEGORY_CLASS"] = "직업",
	["CATEGORY_CONSUMABLE"] = "소모품",
--	["CATEGORY_CUSTOM"] = "",
	["CATEGORY_EMPTY"] = "빈공간",
--	["CATEGORY_OTHER"] = "",
	["CATEGORY_RULE"] = "규칙",
	["CATEGORY_SKILL"] = "전문 기술",
	["CATEGORY_SYSTEM"] = "시스템",
--	["CATEGORY_TRADE_GOODS"] = "",
	
	
--	system category descriptions
	["CATEGORY_CONTAINER"] = "가방",
	["CATEGORY_CORE_MATS"] = "중요 재료",
	["CATEGORY_DEFAULT"] = "기본",
	["CATEGORY_EQUIPMENT"] = "착용장비 (착용 시 귀속)",
	["CATEGORY_EQUIPMENT_SOULBOUND"] = "착용장비(귀속 아이템)",
	["CATEGORY_PROJECTILE"] = "투사체",
	["CATEGORY_PROJECTILE_ARROW"] = "투사체 (화살)",
	["CATEGORY_PROJECTILE_BULLET"] = "투사체 (탄환)",
	["CATEGORY_REPUTATION"] = "평판",
	["CATEGORY_SOULBOUND"] = "귀속 아이템",
	["CATEGORY_SOULSHARD"] = "영혼의 조각",
	["CATEGORY_TRASH"] = "잡동사니",
--	["CATEGORY_UNKNOWN"] = "",
	
	
--	consumable category descriptions
	["CATEGORY_CONSUMABLE_DRINK"] = "음료",
	["CATEGORY_CONSUMABLE_FOOD"] = "음식",
	["CATEGORY_CONSUMABLE_FOOD_PET"] = "음식 (소환수용)",
	["CATEGORY_CONSUMABLE_POTION_MANA"] = "마나 (물약/석)",
	["CATEGORY_CONSUMABLE_POTION_HEAL"] = "치유 (물약/석)",
--	["CATEGORY_CONSUMABLE_ELIXIR_BATTLE"] = "",
--	["CATEGORY_CONSUMABLE_ELIXIR_GUARDIAN"] = "",


--	empty categories
	["CATEGORY_EMPTY_BAG"] = "빈공간 (가방)",
	["CATEGORY_EMPTY_ENCHANTING"] = "빈공간 (마법부여)",
	["CATEGORY_EMPTY_ENGINEERING"] = "빈공간 (기계공학)",
	["CATEGORY_EMPTY_GEM"] = "빈공간 (보석)",
	["CATEGORY_EMPTY_HERB"] = "빈공간 (약초)",
--	["CATEGORY_EMPTY_INSCRIPTION"] = "",
	["CATEGORY_EMPTY_KEY"] = "빈공간 (열쇠고리)",
--	["CATEGORY_EMPTY_LEATHERWORKING"] = "",
	["CATEGORY_EMPTY_MINING"] = "빈공간 (광물)",
	["CATEGORY_EMPTY_PROJECTILE"] = "빈공간 (투사체)",
	["CATEGORY_EMPTY_PROJECTILE_ARROW"] = "빈공간 (투사체 - 화살)",
	["CATEGORY_EMPTY_PROJECTILE_BULLET"] = "빈공간 (투사체 - 탄환)",
	["CATEGORY_EMPTY_SOULSHARD"] = "빈공간 (영혼의 조각)",
	["CATEGORY_EMPTY_UNKNOWN"] = "빈공간 (알 수 없음)",
	
	
--	bag names - used to name the empty slots in the status frame
	["STATUS_NAME_BAG"] = "가방",
	["STATUS_NAME_ENCHANTING"] = "마부",
	["STATUS_NAME_ENGINEERING"] = "기공",
	["STATUS_NAME_GEM"] = "보석",
	["STATUS_NAME_HERB"] = "약초",
--	["STATUS_NAME_INSCRIPTION"] = "",
	["STATUS_NAME_KEY"] = "열쇠",
--	["STATUS_NAME_LEATHERWORKING"] = "",
	["STATUS_NAME_MINING"] = "광물",
	["STATUS_NAME_PROJECTILE"] = "탄약",
	["STATUS_NAME_PROJECTILE_BULLET"] = "탄환",
	["STATUS_NAME_PROJECTILE_ARROW"] = "화살",
	["STATUS_NAME_SOULSHARD"] = "조각",
	["STATUS_NAME_UNKNOWN"] = "분류없음",
	
	
--	main menu
	["MOD_FRAME_MENU"] = "메뉴",

	["MOD_MENU_MAIN_SWITCH_CHARACTER"] = "캐릭터 전환",
	["MOD_MENU_MAIN_SWITCH_CHARACTER_TEXT"] = "다른 캐릭터로 디스플레이를 전환합니다.",
	["MOD_MENU_MAIN_SWITCH_CHARACTER_CHOOSE_NONE"] = "선택할 다른 캐릭터의 데이터가 없습니다.",
	["MOD_MENU_MAIN_SWITCH_CHARACTER_CHOOSE_TEXT"] = "현재 디스플레이를 %1$s|1으로;로; 전환합니다.",
	["MOD_MENU_MAIN_SWITCH_CHARACTER_ERASE"] = "저장된 데이터 삭제",
	["MOD_MENU_MAIN_SWITCH_CHARACTER_ERASE_TEXT"] = "%1$s에 대해 저장된 모든 데이터를 삭제합니다.",
	
--	["MOD_MENU_MAIN_SWITCH_LOCATION"] = "",
--	["MOD_MENU_MAIN_SWITCH_LOCATION_TEXT"] = "",
	
	["MOD_MENU_MAIN_WINDOW"] = "창",
	["MOD_MENU_MAIN_WINDOW_SCALE_TEXT"] = "창을 크게 혹은 작게 하기 위한 크기 비율을 설정합니다.",
	["MOD_MENU_MAIN_WINDOW_PADDING_TEXT"] = "창의 경계와 바 사이의 간격을 설정합니다.",
	["MOD_MENU_MAIN_WINDOW_WIDTH_TEXT"] = "디스플레이할 열의 수를 설정합니다.",
	["MOD_MENU_MAIN_WINDOW_BACKGROUND_COLOR_TEXT"] = "메인 창의 배경 색상을 설정합니다.",
	["MOD_MENU_MAIN_WINDOW_BORDER_SHOW_TEXT"] = "메인 창 주변의 테두리 표시를 전환합니다.",
--	["MOD_MENU_MAIN_WINDOW_BORDER_STYLE_TEXT"] = "",
	["MOD_MENU_MAIN_WINDOW_BORDER_COLOR_TEXT"] = "메인 창의 테두리 색상을 설정합니다.",
	["MOD_MENU_MAIN_WINDOW_BAGHIGHLIGHT_COLOR"] = "가방 강조 색상",
	["MOD_MENU_MAIN_WINDOW_BAGHIGHLIGHT_COLOR_TEXT"] = "가방에 마우스를 올렸을 때 칸을 강조하는데 사용할 색상을 설정합니다.",
--	["MOD_MENU_MAIN_WINDOW_ANCHOR_LOCK_TEXT"] = "",
	
	["MOD_MENU_MAIN_BARS"] = "바",
	["MOD_MENU_MAIN_BARS_PER_ROW"] = "열 단위",
	["MOD_MENU_MAIN_BARS_PER_ROW_TEXT"] = "각 열에 표시할 바의 수를 설정합니다.",
	["MOD_MENU_MAIN_BARS_DIRECTION"] = "방향",
	["MOD_MENU_MAIN_BARS_DIRECTION_HORIZONTAL_TEXT"] = "수평으로 바를 확장합니다.",
	["MOD_MENU_MAIN_BARS_DIRECTION_VERTICAL_TEXT"] = "수직으로 바를 확장합니다.",
	["MOD_MENU_MAIN_BARS_COMPACT"] = "간략형",
	["MOD_MENU_MAIN_BARS_COMPACT_TEXT"] = "순서대로 모든 비어있지 않은 바를 표시합니다.",
	["MOD_MENU_MAIN_BARS_SHOW_EMPTY"] = "빈 바 표시",
	["MOD_MENU_MAIN_BARS_SHOW_EMPTY_TEXT"] = "빈 바의 표시를 전환합니다.",
	["MOD_MENU_MAIN_BARS_BACKGROUND_TEXT"] = "바의 배경 색상을 설정합니다.",
	["MOD_MENU_MAIN_BARS_BORDER_TEXT"] = "각 바 주변의 테두리 표시를 전환합니다.",
--	["MOD_MENU_MAIN_BARS_BORDER_STYLE_TEXT"] = "",
	["MOD_MENU_MAIN_BARS_BORDER_COLOUR_TEXT"] = "바 주변의 테두리 색상을 설정합니다.",
--	["MOD_MENU_MAIN_BARS_NAME"] = "",
--	["MOD_MENU_MAIN_BARS_NAME_TEXT"] = "",
--	["MOD_MENU_MAIN_BARS_NAME_SHOW_TEXT"] = "",
--	["MOD_MENU_MAIN_BARS_NAME_COLOUR_TEXT"] = "",
--	["MOD_MENU_MAIN_BARS_PADDING_INTERNAL_TEXT"] = "",
--	["MOD_MENU_MAIN_BARS_PADDING_EXTERNAL_TEXT"] = "",
	
	["MOD_MENU_MAIN_ITEMS"] = "아이템",
	["MOD_MENU_MAIN_ITEMS_PADDING_TEXT"] = "아이템 칸 사이에 추가할 간격을 설정합니다.",
	["MOD_MENU_MAIN_ITEMS_FADE"] = "아이템 숨김",
	["MOD_MENU_MAIN_ITEMS_FADE_TEXT"] = "오프라인 아이템을 숨길지를 결정합니다.",
--	["MOD_MENU_MAIN_ITEMS_TINT_USABLE"] = "",
--	["MOD_MENU_MAIN_ITEMS_TINT_USABLE_TEXT"] = "",
--	["MOD_MENU_MAIN_ITEMS_BORDER_SHOW_TEXT"] = "",
--	["MOD_MENU_MAIN_ITEMS_BORDER_STYLE_TEXT"] = "",
	["MOD_MENU_MAIN_ITEMS_BORDER_RARITY"] = "등급에 따른 테두리 색상화",
	["MOD_MENU_MAIN_ITEMS_BORDER_RARITY_TEXT"] = "각 아이템의 칸 주변의 테두리를 아이템의 등급에 따른 색상을 사용할 지를 결정합니다. (일반, 희귀, 영웅, 등)",
--	["MOD_MENU_MAIN_ITEMS_BORDER_TEXTURE_OFFSET"] = "",
--	["MOD_MENU_MAIN_ITEMS_BORDER_TEXTURE_OFFSET_TEXT"] = "",
--	["MOD_MENU_MAIN_ITEMS_BORDER_SCALE_TEXT"] = "",
	["MOD_MENU_MAIN_ITEMS_HIDDEN"] = "숨겨진 아이템 표시",
	["MOD_MENU_MAIN_ITEMS_HIDDEN_TEXT"] = "숨겨진 분류 내의 아이템을 표시할 지를 결정합니다.",
	
	["MOD_MENU_MAIN_SORTING"] = "정렬",
	["MOD_MENU_MAIN_SORTING_BAGSLOT"] = "가방 / 칸 순",
	["MOD_MENU_MAIN_SORTING_BAGSLOT_TEXT"] = "인텐토리를 가방과 칸 번호순으로 정렬합니다.",
	["MOD_MENU_MAIN_SORTING_USER"] = "이름순",
	["MOD_MENU_MAIN_SORTING_USER_TEXT"] = "인벤토리를 아이템의 이름순으로 정렬합니다.",
	["MOD_MENU_MAIN_SORTING_INCLUDE_NAME"] = "아이템 이름",
	["MOD_MENU_MAIN_SORTING_INCLUDE_NAME_TEXT"] = "인벤토리 정렬에 아이템 이름의 포함을 전환합니다..",
	["MOD_MENU_MAIN_SORTING_INCLUDE_NAME_REVERSE"] = "반전한 이름 포함",
	["MOD_MENU_MAIN_SORTING_INCLUDE_NAME_REVERSE_TEXT"] = "인벤토리 정렬에 반전한 이름의 포함을 전환합니다.\n\n예 최상급 마나 물약은 물약 마나 최고급이 됩니다.",
	["MOD_MENU_MAIN_SORTING_INCLUDE_QUALITY"] = "아이템 등급",
	["MOD_MENU_MAIN_SORTING_INCLUDE_QUALITY_TEXT"] = "인벤토리 정렬에 아이템 등급의 포함을 전환합니다.",
	["MOD_MENU_MAIN_SORTING_INCLUDE_LOCATION"] = "아이템 착용 부위",
	["MOD_MENU_MAIN_SORTING_INCLUDE_LOCATION_TEXT"] = "인벤토리 정렬에 아이템 착용 부위의 포함을 전환합니다.\n\n노트: 단 착용가능한 아이템만 적용됩니다.",
	["MOD_MENU_MAIN_SORTING_INCLUDE_ITEMTYPE"] = "아이템 종류와 세부 종류",
	["MOD_MENU_MAIN_SORTING_INCLUDE_ITEMTYPE_TEXT"] = "인벤토리 정렬에 아이템의 종류와 세부 종류의 포함을 전환합니다.",
	["MOD_MENU_MAIN_SORTING_INCLUDE_CATEGORY"] = "아이템 분류",
	["MOD_MENU_MAIN_SORTING_INCLUDE_CATEGORY_TEXT"] = "인벤토리 정렬에 아이템 분류의 포함을 전환합니다.",
	["MOD_MENU_MAIN_SORTING_INCLUDE_ITEMUSELEVEL"] = "아이템 (사용) 레벨",
	["MOD_MENU_MAIN_SORTING_INCLUDE_ITEMUSELEVEL_TEXT"] = "인벤토리 정렬에 아이템의 (사용) 레벨의 포함을 전환합니다.",
--	["MOD_MENU_MAIN_SORTING_INCLUDE_ITEMSTATLEVEL"] = "",
--	["MOD_MENU_MAIN_SORTING_INCLUDE_ITEMSTATLEVEL_TEXT"] = "",
--	["MOD_MENU_MAIN_SORTING_INCLUDE_VENDORPRICE"] = "",
--	["MOD_MENU_MAIN_SORTING_INCLUDE_VENDORPRICE_TEXT"] = "",
--	["MOD_MENU_MAIN_SORTING_OPEN"] = "",
--	["MOD_MENU_MAIN_SORTING_OPEN_TEXT"] = "",
	["MOD_MENU_MAIN_SORTING_INSTANT"] = "즉시",
	["MOD_MENU_MAIN_SORTING_INSTANT_TEXT"] = "즉시 정렬 모드를 전환합니다.\n\nenabled: sorting is done when something changes\n\ndisabled: sorting is done only when the window is opened, or you refresh.\n\nnote: if the bag changer window is open then your choice is ignored and instant sort is always enabled",
--	["MOD_MENU_MAIN_SORTING_ASCENDING"] = "",
--	["MOD_MENU_MAIN_SORTING_ASCENDING_TEXT"] = "",
	["MOD_MENU_MAIN_SORTING_ORDER"] = "정렬 순서",
	["MOD_MENU_MAIN_SORTING_MOVE_UP"] = "위로 이동",
--	["MOD_MENU_MAIN_SORTING_MOVE_UP_TEXT"] = "",
	["MOD_MENU_MAIN_SORTING_MOVE_DOWN"] = "아래로 이동",
--	["MOD_MENU_MAIN_SORTING_MOVE_DOWN_TEXT"] = "",
--	["MOD_MENU_MAIN_SORTING_NOT_INCLUDED"] = "",
	
	["MOD_MENU_MAIN_EMPTY"] = "빈 칸",
	["MOD_MENU_MAIN_EMPTY_ICON"] = "아이콘 사용",
	["MOD_MENU_MAIN_EMPTY_ICON_TEXT"] = "빈 칸 배경에 고정 색상 혹은 아이콘 사용을 전환합니다.",
	["MOD_MENU_MAIN_EMPTY_BORDER"] = "테두리 색상화",
	["MOD_MENU_MAIN_EMPTY_BORDER_TEXT"] = "가방 종류에 따른 빈 칸 테두리 색상 사용을 전환합니다.",
	["MOD_MENU_MAIN_EMPTY_COLOUR"] = "칸 색상",
	["MOD_MENU_MAIN_EMPTY_COLOUR_TEXT"] = "빈 칸의 색상을 변경합니다.",
--	["MOD_MENU_MAIN_EMPTY_COLOUR_TEXT2"] = "",
--	["MOD_MENU_MAIN_EMPTY_CLUMP"] = "",
--	["MOD_MENU_MAIN_EMPTY_CLUMP_TEXT"] = "",
--	["MOD_MENU_MAIN_EMPTY_SHOW"] = "",
--	["MOD_MENU_MAIN_EMPTY_SHOW_TEXT"] = "",
--	["MOD_MENU_MAIN_EMPTY_SHOW_COLOUR_TEXT"] = "",
	
	["MOD_MENU_MAIN_HIDDEN"] = "숨겨진 프레임",
	["MOD_MENU_MAIN_HIDDEN_TITLE"] = "제목 숨김",
	["MOD_MENU_MAIN_HIDDEN_TITLE_TEXT"] = "%1$s의 제목 프레임 (상단 프레임) 숨김을 전환합니다.",
	["MOD_MENU_MAIN_HIDDEN_CHANGER"] = "가방 변경 숨김",
	["MOD_MENU_MAIN_HIDDEN_CHANGER_TEXT"] = "%1$s의 가방 변경 프레임 (가방칸) 숨김을 전환합니다.",
	["MOD_MENU_MAIN_HIDDEN_STATUS"] = "상태 숨김",
	["MOD_MENU_MAIN_HIDDEN_STATUS_TEXT"] = "%1$s의 상태 프레임 (빈 칸 개수와 금액) 숨김을 전환합니다.",
	
	["MOD_MENU_MAIN_NEWITEM"] = "새 아이템",
	["MOD_MENU_MAIN_NEWITEM_SHOW"] = "지시자 표시",
	["MOD_MENU_MAIN_NEWITEM_SHOW_TEXT"] = "새 아이템 글자의 표시를 전환합니다.",
	["MOD_MENU_MAIN_NEWITEM_COLOUR_TEXT"] = "새 아이템 글자의 색상을 설정합니다.",
	["MOD_MENU_MAIN_NEWITEM_RESET"] = "클리어",
	["MOD_MENU_MAIN_NEWITEM_RESET_TEXT"] = "해당 캐릭터의 모든 아이템에 대한 새 아이템 상태를 클리어합니다.",
	
--	["MOD_MENU_MAIN_ACTIONS"] = "",
	
	["MOD_MENU_MAIN_AUTO_MERCHANT"] = "상인/상점",
	["MOD_MENU_MAIN_AUTO_TRADE"] = "거래",
	["MOD_MENU_MAIN_AUTO_AUCTION"] = "경매장",
	["MOD_MENU_MAIN_AUTO_COMBAT"] = "전투",
	
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
	
	["MOD_MENU_MAIN_REFRESH"] = "새로 고침",
	["MOD_MENU_MAIN_REFRESH_TEXT"] = "창을 갱신합니다.",
	
	["MOD_MENU_MAIN_RELOAD"] = "재시작",
	["MOD_MENU_MAIN_RELOAD_TEXT"] = "창을 재시작 합니다.  장비 세트에 아이템 변경시 사용하세요.",
	
	["MOD_MENU_MAIN_EDITMODE"] = "편집 모드 전환",
	["MOD_MENU_MAIN_EDITMODE_TEXT"] = "아이템 레이아웃을 설정 할 수 있도록 편집 모드를 전환합니다.",
	
	["MOD_MENU_MAIN_BAGCHANGE"] = "가방 표시 전환",
	["MOD_MENU_MAIN_BAGCHANGE_TEXT"] = "가방을 추가하거나 교체할 수 있도록 가방칸의 표시를 전환합니다.",
	
	["MOD_MENU_MAIN_RULES"] = "규칙",
	
	["MOD_MENU_RULE_SHOWDISABLED"] = "비활성화된 규칙 표시",
	["MOD_MENU_RULE_SHOWDISABLED_TEXT"] = "비활성화된 규칙의 표시를 전환합니다.",

--	["MOD_MENU_MAIN_SEARCH"] = "",
	
--	["MOD_MENU_MAIN_CUSTOM_CATEGORIES"] = "",
	
	
--	item menu
	["MOD_MENU_ITEM_INFORMATION_TITLE"] = "아이템 설정",
	["MOD_MENU_ITEM_ITEM"] = "아이템",
	["MOD_MENU_ITEM_CURRENT_ASSIGNMENT"] = "현재 지정",
	["MOD_MENU_ITEM_DEFAULT_ASSIGNMENT"] = "기본 지정",
--	["MOD_MENU_ITEM_DEFAULT_RESET"] = "",
--	["MOD_MENU_ITEM_DEFAULT_RESET_TEXT"] = "",
--	["MOD_MENU_ITEM_ASSIGN_CHOICES"] = "",
--	["MOD_MENU_ITEM_ASSIGN_THIS"] = "",
--	["MOD_MENU_ITEM_ASSIGN_THIS_TEXT"] = "",
	["MOD_MENU_ITEM_MOVE"] = "%1$s|1을;를; 바로 이동",
	["MOD_MENU_ITEM_RULE_NEW"] = "새 규칙 생성",
	["MOD_MENU_ITEM_RULE_ADD"] = "규칙에 추가",
	["MOD_MENU_ITEM_DEBUG"] = "디버그 정보",
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
	["MOD_MENU_ITEM_DEBUG_PT"] = "PT 세트",
	["MOD_MENU_ITEM_DEBUG_PT_TEXT"] = "해당 아이템이 속한 PT 세트 목록",
	["MOD_MENU_ITEM_DEBUG_PT_NONE"] = "해당 아이템은 PT 세트에 없습니다.",
	["MOD_MENU_ITEM_DEBUG_PT_TITLE"] = "해당 아이템의 PT 세트 위치",
	
	
--	bar menu
	["MOD_MENU_BAR_INFORMATION_TITLE"] = "%1$s번 바 설정",
	["MOD_MENU_BAR_CATEGORY"] = "분류",
	["MOD_MENU_BAR_CATEGORY_TEXT"] = "해당 바에 %1$s 분류를 지정합니다.",
	["MOD_MENU_BAR_CATEGORY_CURRENT"] = "현재 지정",
	["MOD_MENU_BAR_CATEGORY_ASSIGN"] = "지정 가능한 분류",
	["MOD_MENU_BAR_CATEGORY_REMOVE"] = "제거",
	["MOD_MENU_BAR_CATEGORY_REMOVE_TEXT"] = "%2$s번 바에서 %1$s 분류를 제거하고 기본 바로 되돌리려면 클릭하세요.", -- 1 is the category name, 2 is the bar number
	["MOD_MENU_BAR_CATEGORY_HIDDEN"] = "숨김",
	["MOD_MENU_BAR_CATEGORY_HIDDEN_TEXT"] = "해당 분류의 숨겨진 상태를 전환하려면 클릭하세요.\n\n숨겨진 분류의 아이템은 정상 모드에서 표시되지 않습니다.",
--	["MOD_MENU_BAR_OPTIONS"] = "",
	["MOD_MENU_BAR_CLEAR"] = "해당 바 클리어",
	["MOD_MENU_BAR_CLEAR_TEXT"] = "해당 바의 기본 분류를 제외하고 현재 지정된 모든 분류를 제거합니다.",
	["MOD_MENU_BAR_INSERT"] = "빈 바 삽입",
	["MOD_MENU_BAR_INSERT_TEXT"] = "모든 분류을 위로 이동시키고 빈 바를 삽입합니다.",
	["MOD_MENU_BAR_REMOVE"] = "해당 바 제거",
	["MOD_MENU_BAR_REMOVE_TEXT"] = "해당 바를 제거합니다, 현재 모든 지정된 분류를 이전의 기본 바로 되돌리고 다른 것들은 아래 바로 이동합니다.",
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
	
	
	-- rules frame
	["MOD_FRAME_RULE_RULE"] = "규칙",
	["MOD_FRAME_RULE_ENABLED"] = "사용함",
	["MOD_FRAME_RULE_HIDDEN"] = "숨겨짐",
	["MOD_FRAME_RULE_ORDER"] = "순서",
	["MOD_FRAME_RULE_DESCRIPTION"] = "세부설명",
	["MOD_FRAME_RULE_FORMULA"] = "형식",
	["MOD_FRAME_RULE_SEARCH"] = "탐색",
	["MOD_FRAME_RULE_VIEW"] = "보기",
	["MOD_FRAME_RULE_ADD"] = "추가",
	["MOD_FRAME_RULE_EDIT"] = "편집",
	["MOD_FRAME_RULE_REMOVE"] = "제거",
	["MOD_FRAME_RULE_OK"] = "확인",
	["MOD_FRAME_RULE_CANCEL"] = "취소",
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
	["GENERIC_BOTTOMLEFT"] = "좌측 하단",
	["GENERIC_BOTTOMRIGHT"] = "우측 하단",
	["GENERIC_TOPLEFT"] = "좌측 상단",
	["GENERIC_TOPRIGHT"] = "우측 상단",
	["GENERIC_HORIZONTAL"] = "수평",
	["GENERIC_VERTICAL"] = "수직",
	["GENERIC_CLOSE_MENU"] = "메뉴 닫기",
--	["GENERIC_ANCHOR"] = "Anchor Point",
--	["GENERIC_ANCHOR_TEXT1"] = "set the anchor point for the %1$s window", -- window name  (bags, bank, vault)
--	["GENERIC_ANCHOR_TEXT2"] = "set the anchor point for the %1$s", -- object name (bars, items)
--	["GENERIC_BORDER"] = "Border",
--	["GENERIC_BORDER_TEXT"] = "border options",
--	["GENERIC_SHOW"] = "Show",
--	["GENERIC_FILE"] = "File",
--	["GENERIC_HEIGHT"] = "Height",
--	["GENERIC_SCALE"] = "Scale",
--	["GENERIC_TEXTURE"] = "Texture",
--	["GENERIC_BORDER_TEXTURE_TEXT"] = "border texture options",
--	["GENERIC_BORDER_TEXTURE_FILE_TEXT"] = "the texture to use for the border",
--	["GENERIC_BORDER_TEXTURE_HEIGHT_TEXT"] = "the height (in pixels) of the texture",
--	["GENERIC_FONT"] = "Font",
	["GENERIC_COLOUR"] = "테두리 색상",
	["GENERIC_BACKGROUND_COLOUR"] = "배경 색상",
--	["GENERIC_LOCK"] = "Lock",
--	["GENERIC_STYLE"] = "Style",
--	["GENERIC_ENABLED"] = "Enabled",
--	["GENERIC_DISABLED"] = "Disabled",
--	["GENERIC_ALERT"] = "Alert",
	["GENERIC_PADDING"] = "간격",
--	["GENERIC_INTERNAL"] = "Internal",
--	["GENERIC_EXTERNAL"] = "External",
	["GENERIC_WIDTH"] = "너비",
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

	["OPT_AUTO"] = "자동 열기/닫기",
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
	["OPT_CONTROL_SAVE"] = "오프라인",
--	["OPT_CONTROL_SAVE_TEXT"] = "",
	["OPT_CONTROL_CONTROL"] = "블리자드 프레임 숨김",
--	["OPT_CONTROL_CONTROL_TEXT"] = "",
	
--	["OPT_LOCATION"] = "",
	
	["OPT_ASSIGN_SETTINGS"] = "전체 설정 사용",
--	["OPT_ASSIGN_SETTINGS_TEXT"] = "",
--	["OPT_ASSIGN_SETTINGS_LOCATION_TEXT"] = "",
	
--	["OPT_LOCATION_SETTINGS"] = "",
	
	
} end )
