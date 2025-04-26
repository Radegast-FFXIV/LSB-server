-----------------------------------
-- Area: Mine Shaft #2716
--  NPC: Shaft Entrance
-- Type: ENM/Fight Entrance
-----------------------------------
local ID = zones[xi.zone.MINE_SHAFT_2716]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if player:hasKeyItem(xi.ki.SHAFT_GATE_OPERATING_DIAL)
    or player:hasKeyItem(xi.ki.SHAFT_2716_OPERATING_LEVER)
    or player:getCurrentMission(xi.mission.log_id.COP) == 8
        xi.bcnm.onTrigger(player, npc)
    end
end

return entity