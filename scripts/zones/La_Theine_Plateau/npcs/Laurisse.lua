-----------------------------------
-- Area: La Theine Plateau
-- NPC:  Laurisse
-- Involved in Mission: The Rescue Drill
-- @pos -292 28 143 102
-----------------------------------
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/La_Theine_Plateau/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:getCurrentMission(SANDORIA) == THE_RESCUE_DRILL) then
		local MissionStatus = player:getVar("MissionStatus");
		
		if (MissionStatus == 5) then
			player:startEvent(0x006a);
		elseif (MissionStatus >= 6 and MissionStatus <= 7) then
			player:startEvent(0x006d);
		elseif (MissionStatus == 8) then
			player:showText(npc, RESCUE_DRILL + 21);
		elseif (MissionStatus >= 9) then
			player:showText(npc, RESCUE_DRILL + 26);
		else
			player:showText(npc, RESCUE_DRILL);
		end
	else
		player:showText(npc, RESCUE_DRILL);
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	
	if (csid == 0x006a) then
		player:setVar("MissionStatus",6);
	end
	
end;