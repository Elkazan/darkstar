-----------------------------------
-- Area: Upper Jeuno
-- NPC: Brutus
-- Starts Quest: Chocobo's Wounds, Save My Son, Path of the Beastmaster, Wings of gold, Scattered into Shadow
-- @pos -55 8 95 244
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
package.loaded["scripts/globals/settings"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Upper_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	player:addKeyItem (138);

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

    if(csid == 0x0047 and option == 1) then
        player:addQuest(JEUNO,CHOCOBO_S_WOUNDS);
    	player:setVar("ChocobosWounds_Event",1);
    elseif(csid == 0x0046) then
    	player:addQuest(JEUNO,PATH_OF_THE_BEASTMASTER);
		player:addTitle(ANIMAL_TRAINER);
		player:unlockJob(9); -- Beastmaster
		player:messageSpecial(YOU_CAN_NOW_BECOME_A_BEASTMASTER);
		player:addFame(JEUNO, JEUNO_FAME*30);
		player:completeQuest(JEUNO,PATH_OF_THE_BEASTMASTER);
	elseif((csid == 0x008b or csid == 0x0089) and option == 1) then
		player:addQuest(JEUNO,WINGS_OF_GOLD);
		player:setVar("wingsOfGold_shortCS",0);
	elseif(csid == 0x008a) then
		if(player:getFreeSlotsCount() < 1) then
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16680);
		else
			player:delKeyItem(GUIDING_BELL);
			player:addItem(16680);
			player:messageSpecial(ITEM_OBTAINED,16680); -- Barbaroi Axe
			player:addFame(JEUNO,AF1_FAME);
			player:completeQuest(JEUNO,WINGS_OF_GOLD);
		end
	elseif((csid == 0x008f or csid == 0x008d) and option == 1) then
		player:addQuest(JEUNO,SCATTERED_INTO_SHADOW);
		player:setVar("scatIntoShadow_shortCS",0);
		player:addKeyItem(AQUAFLORA1);
		player:addKeyItem(AQUAFLORA2);
		player:addKeyItem(AQUAFLORA3);
		player:messageSpecial(KEYITEM_OBTAINED,AQUAFLORA1);
	elseif(csid == 0x0090) then
		player:setVar("scatIntoShadowCS",1);
	elseif(csid == 0x0087) then
		if(player:getFreeSlotsCount() < 1) then
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,14097);
		else
			player:setVar("scatIntoShadowCS",0);
			player:addItem(14097);
			player:messageSpecial(ITEM_OBTAINED,14097); -- Beast Gaiters
			player:addFame(JEUNO,JEUNO_FAME*AF2_FAME);
			player:completeQuest(JEUNO,SCATTERED_INTO_SHADOW);
		end
    end

end;