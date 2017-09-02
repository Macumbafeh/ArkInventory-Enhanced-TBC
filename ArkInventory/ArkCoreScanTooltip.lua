
local AceOO = AceLibrary( "AceOO-2.0" )

ArkCoreScanTooltip_Class = AceOO.Class()

function ArkCoreScanTooltip_Class.prototype:init( frameName )
	
	ArkCoreScanTooltip_Class.super.prototype.init( self )
	
	self.tooltip = getfenv()[frameName]
	
	assert( self.tooltip, "XML Frame [" .. frameName .. "] not found when initialising class instance" )
	
end

function ArkCoreScanTooltip_Class.prototype:tostring()
	if self.tooltip then
		return self.tooltip:GetName()
	else
		return "nil"
	end
end

function ArkCoreScanTooltip_Class.prototype:NumLines()
	return self.tooltip:NumLines() or 0
end

function ArkCoreScanTooltip_Class.prototype:SetHyperlink( hyperlink )

	self.tooltip:ClearLines()
	
	if hyperlink ~= nil then
		self.tooltip:SetHyperlink( hyperlink )
	end
	
end

function ArkCoreScanTooltip_Class.prototype:SetBagItem( bag_id, slot_id )
	self.tooltip:ClearLines()
	self.tooltip:SetBagItem( bag_id, slot_id )
end

function ArkCoreScanTooltip_Class.prototype:SetInventoryItem( slot )
	self.tooltip:ClearLines()
	self.tooltip:SetInventoryItem( "player", slot )
end

function ArkCoreScanTooltip_Class.prototype:SetGuildBankItem( tab, slot )
	self.tooltip:ClearLines()
	self.tooltip:SetGuildBankItem( tab, slot )
end

function ArkCoreScanTooltip_Class.prototype:SetItem( bag_id, slot_id )
	-- does not work for offline mode, only direct online scanning of the current player
	if bag_id == BANK_CONTAINER then
		self:SetInventoryItem( BankButtonIDToInvSlotID( slot_id ) )
	elseif bag_id == KEYRING_CONTAINER then
		self:SetInventoryItem( KeyRingButtonIDToInvSlotID( slot_id ) )
	else
		self:SetBagItem( bag_id, slot_id )
	end
end

function ArkCoreScanTooltip_Class.prototype:GetMoneyFrame()
	return getfenv()[self.tooltip:GetName() .. "MoneyFrame1"]
end

function ArkCoreScanTooltip_Class.prototype:GetItem()
	local itemName, ItemLink = self.tooltip:GetItem()
	return itemName, ItemLink
end

function ArkCoreScanTooltip_Class.prototype:Find( TextToFind, IgnoreLeft, IgnoreRight, CaseSensitive )

	if not TextToFind or strtrim( TextToFind ) == "" then
		return false
	end
	
	local IgnoreLeft = IgnoreLeft or false
	local IgnoreRight = IgnoreRight or false
	local CaseSensitive = CaseSensitive or false
	
	local obj, txt
	
	for i = 2, self:NumLines() do
	
		if not IgnoreLeft then
			obj = getfenv()[self.tooltip:GetName() .. "TextLeft" .. i]
			if obj and obj:IsShown() then
				txt = obj:GetText()
				if txt then
				
					--ArkInventory.Output( { "L[", i, "] = [", txt, "]" } )
					
					if not CaseSensitive then
						txt = string.lower( txt )
						TextToFind = string.lower( TextToFind )
					end
					if string.find( txt, TextToFind ) then
						return string.find( txt, TextToFind )
					end
				end
			end
		end
		
		if not IgnoreRight then
			obj = getfenv()[self.tooltip:GetName() .. "TextRight" .. i]
			if obj and obj:IsShown() then
				txt = obj:GetText()
				if txt then
				
					--ArkInventory.Output( { "R[", i, "] = [", txt, "]" } )
					
					if not CaseSensitive then
						txt = string.lower( txt )
						TextToFind = string.lower( TextToFind )
					end
					if string.find( txt, TextToFind ) then
						return string.find( txt, TextToFind )
					end
				end
			end
		end

	end

	return nil
	
end

function ArkCoreScanTooltip_Class.prototype:Contains( TextToFind, IgnoreLeft, IgnoreRight, CaseSensitive )

	if self:Find( TextToFind, IgnoreLeft, IgnoreRight, CaseSensitive ) then
		return true
	else
		return false
	end

end

function ArkCoreScanTooltip_Class.prototype:CanUse()

	local l = { "TextLeft", "TextRight" }
	
	for i = 2, self:NumLines() do
		for _, v in pairs( l ) do
			local obj = getfenv()[self.tooltip:GetName() .. v .. i]
			if obj and obj:IsShown() then
				--local txt = obj:GetText()
				local r, g, b = obj:GetTextColor()
				local c = string.format( "%02x%02x%02x", r * 255, g * 255, b * 255 )
				if c == "fe1f1f" then
					--ArkInventory.Output( { "line[", i, "]=[", txt, "]" } )
					return false
				end
			end
		end
	end

	return true
	
end
