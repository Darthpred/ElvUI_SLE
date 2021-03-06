local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local UF = E:GetModule('UnitFrames');
local LSM = LibStub("LibSharedMedia-3.0");

local abs = math.abs
local _, ns = ...
local ElvUF = ns.oUF

--Here and in other units, moving power text to power bar
UF.Update_ArenaFramesSLE = UF.Update_ArenaFrames
function UF:Update_ArenaFrames(frame, db)
	self:Update_ArenaFramesSLE(frame, db)
	
	local power = frame.Power
	--Text
	local x, y = self:GetPositionOffset(db.power.position)
	power.value:ClearAllPoints()
	power.value:Point(db.power.position, frame.Power, db.power.position, x, y)		
	frame:Tag(power.value, db.power.text_format)
	
	frame:UpdateAllElements()
end

UF:Update_AllFrames()