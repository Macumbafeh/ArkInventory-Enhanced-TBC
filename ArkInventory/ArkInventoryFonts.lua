
if ArkInventory.Lib.SharedMedia then
	-- all fonts sourced from http://www.fontfreak.com and were specified as freeware, if this is not the case then please let me know and i will remove them from this mod

	--ArkInventory.Lib.SharedMedia:Register( "font", "Myriad Condensed Web", [[Interface\AddOns\ArkInventory\Fonts\ABF.ttf]] )
	--ArkInventory.Lib.SharedMedia:Register( "font", "Action Force Normal", [[Interface\AddOns\ArkInventory\Fonts\Action_Force.ttf]] )
	--ArkInventory.Lib.SharedMedia:Register( "font", "Amerika Sans", [[Interface\AddOns\ArkInventory\Fonts\AMERSN__.ttf]] )
	ArkInventory.Lib.SharedMedia:Register( "font", "Anime Ace", [[Interface\AddOns\ArkInventory\Fonts\animeace.ttf]] )
	--ArkInventory.Lib.SharedMedia:Register( "font", "As Seen on TV", [[Interface\AddOns\ArkInventory\Fonts\ASSEENONTV.ttf]] )
	--ArkInventory.Lib.SharedMedia:Register( "font", "Carbon Block", [[Interface\AddOns\ArkInventory\Fonts\CARBONBL.ttf]] )
	--ArkInventory.Lib.SharedMedia:Register( "font", "Cargo Two SF", [[Interface\AddOns\ArkInventory\Fonts\CARGTS__.TTF]] )
	--ArkInventory.Lib.SharedMedia:Register( "font", "Casper Comics Solid", [[Interface\AddOns\ArkInventory\Fonts\Casps2.ttf]] )
	--ArkInventory.Lib.SharedMedia:Register( "font", "Deftone Stylus", [[Interface\AddOns\ArkInventory\Fonts\DEFTONE.TTF]] )
	--ArkInventory.Lib.SharedMedia:Register( "font", "Degrassi", [[Interface\AddOns\ArkInventory\Fonts\degrassi.ttf]] )
	ArkInventory.Lib.SharedMedia:Register( "font", "Designer Block", [[Interface\AddOns\ArkInventory\Fonts\DESIB___.ttf]] )
	ArkInventory.Lib.SharedMedia:Register( "font", "DestructoBeam BB", [[Interface\AddOns\ArkInventory\Fonts\destructobeambb_reg.ttf]] )
	--ArkInventory.Lib.SharedMedia:Register( "font", "Dev Gothic", [[Interface\AddOns\ArkInventory\Fonts\devgothic.TTF]] )
	ArkInventory.Lib.SharedMedia:Register( "font", "Dreamspeak", [[Interface\AddOns\ArkInventory\Fonts\dfdrsp__.TTF]] )
	--ArkInventory.Lib.SharedMedia:Register( "font", "Digital2", [[Interface\AddOns\ArkInventory\Fonts\Digital2.ttf]] )
	--ArkInventory.Lib.SharedMedia:Register( "font", "Digital dream", [[Interface\AddOns\ArkInventory\Fonts\Digitaldream.ttf]] )
	--ArkInventory.Lib.SharedMedia:Register( "font", "Dragonfly", [[Interface\AddOns\ArkInventory\Fonts\Dragonfly.ttf]] )
	ArkInventory.Lib.SharedMedia:Register( "font", "Drummon", [[Interface\AddOns\ArkInventory\Fonts\Drummon.ttf]] )
	ArkInventory.Lib.SharedMedia:Register( "font", "Dustismo", [[Interface\AddOns\ArkInventory\Fonts\Dustismo.ttf]] )
	ArkInventory.Lib.SharedMedia:Register( "font", "Emblem", [[Interface\AddOns\ArkInventory\Fonts\Emblem.ttf]] )
	ArkInventory.Lib.SharedMedia:Register( "font", "Electrofied", [[Interface\AddOns\ArkInventory\Fonts\electr.ttf]] )
	ArkInventory.Lib.SharedMedia:Register( "font", "SF Diego Sans", [[Interface\AddOns\ArkInventory\Fonts\SF Diego Sans.ttf]] )
	--ArkInventory.Lib.SharedMedia:Register( "font", "SF Electrotome", [[Interface\AddOns\ArkInventory\Fonts\SF Electrotome.ttf]] )
	ArkInventory.Lib.SharedMedia:Register( "font", "SF Laundromatic", [[Interface\AddOns\ArkInventory\Fonts\SF Laundromatic.ttf]] )
	ArkInventory.Lib.SharedMedia:Register( "font", "Zekton", [[Interface\AddOns\ArkInventory\Fonts\zekton__.ttf]] )
	--ArkInventory.Lib.SharedMedia:Register( "font", "Zenith 2000", [[Interface\AddOns\ArkInventory\Fonts\ZENITH2000.TTF]] )
	
	--ArkInventory.Lib.SharedMedia:Register( "font", "", [[Interface\AddOns\ArkInventory\Fonts\]] )
end


function ArkInventory.SetFontFace( obj, fontName )

	if obj == nil or not obj["SetFont"] then
		return
	end
	
	if fontName == nil or fontName == "" then
		fontName = ArkInventory.db.profile.option.font.name or ArkInventory.Const.Font.Face
	end

	local oldPath, oldSize, oldFlags = obj:GetFont()
	fontPath = ArkInventory.Lib.SharedMedia:Fetch( "font", fontName )

	if oldPath == fontPath then
		return
	end
	
	obj:SetFont( fontPath, oldSize, oldFlags )
	
end

function ArkInventory.SetFontFrame( frame, fontName )

	if frame ~= nil and type( frame ) == "string" then
		frame = getfenv()[frame]
	end
	
	if frame == nil then
		return
	end
	
	for _, obj in pairs( { frame:GetRegions() } ) do
		ArkInventory.SetFontFace( obj, fontName )
	end

	for _, obj in pairs( { frame:GetChildren() } ) do
		ArkInventory.SetFontFace( obj, fontName )
	end

	for _, obj in pairs( { frame:GetChildren() } ) do
		ArkInventory.SetFontFrame( obj, fontName )
	end
	
end

function ArkInventory.SetFontAll( fontName )

	if fontName ~= nil and fontName ~= ArkInventory.db.profile.option.font.name then
		ArkInventory.db.profile.option.font.name = fontName
	end

	for z in pairs( ArkInventory.Global.Location ) do
		local frame = getfenv()[ArkInventory.Const.Frame.Main.Name .. z]
		ArkInventory.SetFontFrame( frame, fontName )
	end
	
end
