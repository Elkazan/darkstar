-----------------------------------------
-- ID: 4394
-- Item: ginger_cookie
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Magic Regen While Healing 5
-- Plantoid Killer 5
-- Slow Resist 5
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
local result = 0;
	if (target:hasStatusEffect(EFFECT_FOOD) == true) then
		result = 246;
	end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_REGEN,99,3,180000);
	target:addStatusEffect(EFFECT_REFRESH,99,3,180000, 0, 3);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addStatusEffect(EFFECT_REGEN);
	target:addStatusEffect(EFFECT_REFRESH);

end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delStatusEffect(EFFECT_REGEN);
	target:delStatusEffect(EFFECT_REFRESH);

end;
