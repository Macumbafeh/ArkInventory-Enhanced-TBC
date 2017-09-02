
local AceOO = AceLibrary( "AceOO-2.0" )


ARKCORE_Class_uiFrame = AceOO.Class()

function ARKCORE_Class_uiFrame.prototype:init( frameName, frameType, frameParent, frameInherit )

	ARKCORE_Class_uiFrame.super.prototype.init( self )

	self.tooltip = getfenv()[frameName]
	
	if not self.tooltip then
		if frameType == false then
			error( "XML Frame " .. frameName .. " does not exist" )
		else
			self.tooltip = CreateFrame( frameType, frameName, frameParent, frameInherit )
		end
	end
	
end

function ARKCORE_Class_uiFrame.prototype:tostring()
	if self.tooltip then
		return self.tooltip:GetName()
	else
		return "nil"
	end
end





ARKCORE_Class_ScanTooltip = AceOO.Class( ARKCORE_Class_uiFrame )

function ARKCORE_Class_ScanTooltip.prototype:init( frame )

	ARKCORE_Class_ScanTooltip.super.prototype.init( self, frame, false )

	assert( self.tooltip, "Tooltip frame " .. tostring( frame ) .. " not found" )
	
end

function ARKCORE_Class_ScanTooltip.prototype:tostring()
	if self.tooltip then
		return self.tooltip:GetName()
	else
		return "nil"
	end
end

function ARKCORE_Class_ScanTooltip.prototype:NumLines()
	return self.tooltip:NumLines() or 0
end

function ARKCORE_Class_ScanTooltip.prototype:SetHyperlink( hyperlink )

	self.tooltip:ClearLines()
	
	if hyperlink then
		self.tooltip:SetHyperlink( hyperlink )
	end
	
end

function ARKCORE_Class_ScanTooltip.prototype:SetBagItem( bag_id, slot_id )
	self.tooltip:ClearLines()
	self.tooltip:SetBagItem( bag_id, slot_id )
end

function ARKCORE_Class_ScanTooltip.prototype:SetInventoryItem( slot )
	self.tooltip:ClearLines()
	self.tooltip:SetInventoryItem( "player", slot )
end

function ARKCORE_Class_ScanTooltip.prototype:SetItem( i )
	-- does not work for offline mode, only direct online scanning of the current player
	if i.bag_id == BANK_CONTAINER then
		self:SetInventoryItem( BankButtonIDToInvSlotID( i.slot_id ) )
	elseif i.bag_id == KEYRING_CONTAINER then
		self:SetInventoryItem( KeyRingButtonIDToInvSlotID( i.slot_id ) )
	else
		self:SetBagItem( i.bag_id, i.slot_id )
	end
end

function ARKCORE_Class_ScanTooltip.prototype:GetMoneyFrame()
	local frame = self.tooltip:GetName()
	return getfenv()[frame .. "MoneyFrame1"]
end

function ARKCORE_Class_ScanTooltip.prototype:Find( TextToFind, IgnoreLeft, IgnoreRight, CaseSensitive )

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
				
					--ArkInventory.PrintPlus( { "L[", i, "] = [", txt, "]" } )
					
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
				
					--ArkInventory.PrintPlus( { "R[", i, "] = [", txt, "]" } )
					
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

function ARKCORE_Class_ScanTooltip.prototype:Contains( TextToFind, IgnoreLeft, IgnoreRight, CaseSensitive )

	if self:Find( TextToFind, IgnoreLeft, IgnoreRight, CaseSensitive ) then
		return true
	else
		return false
	end

end
