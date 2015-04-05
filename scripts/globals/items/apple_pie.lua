-----------------------------------------
-- ID: 4413
-- Item: Apple Pie
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Magic 25
-- Agility -1
-- Intelligence 3
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
local result = 0;
	if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
		result = 246;
	end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_REFRESH,99,3,180000, 0, 3);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addStatusEffect(EFFECT_REFRESH);

end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delStatusEffect(EFFECT_REFRESH);

end;
