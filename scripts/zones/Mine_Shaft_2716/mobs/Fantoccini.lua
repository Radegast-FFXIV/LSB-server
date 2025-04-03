-----------------------------------
-- Area: Mine Shaft 2716
-- Mob: Fantoccini
-- ENM: Pulling the Strings
-----------------------------------
local ID = require("scripts/zones/Mine_Shaft_2716/IDs")
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

local spawnPet = function(mob)
    local pet = GetMobByID(mob:getLocalVar("petID"))
    local job = mob:getLocalVar("job")
    mob:setMobMod(xi.mobMod.NO_MOVE, 1)
    mob:entityAnimationPacket("casm")
    mob:setLocalVar("petSpawned", 1)
    mob:setMagicCastingEnabled(false)
    mob:setAutoAttackEnabled(false)
    mob:setMobAbilityEnabled(false)

    -- Handle for SMN
    if job == xi.job.SMN then
        mob:setLocalVar("petModel", math.random(1,7)) -- Random Avatar
        if pet then
            pet:setModelId(ID.jobTable[job].petModelID[mob:getLocalVar("petModel")]) -- Set Model
        end
    -- Handle for BST
    elseif job == xi.job.BST then
        mob:setLocalVar("petModel", math.random(1,4)) -- Random Beast
        if pet then
            pet:setModelId(ID.jobTable[job].petModelID[mob:getLocalVar("petModel")]) -- Set Model
        end
    -- Handle for PUP
    elseif job == xi.job.PUP then
        mob:setLocalVar("petModel", math.random(1,3)) -- Random Puppet
        if pet then
            pet:setModelId(ID.jobTable[job].petModelID[mob:getLocalVar("petModel")][1]) -- Set Model
            pet:changeJob(ID.jobTable[job].petModelID[mob:getLocalVar("petModel")][2]) -- Change Job
        end
    end

    mob:timer(3000, function(mobArg)
        if mobArg:isAlive() then
            local pos = mobArg:getPos()
            mobArg:setMobMod(xi.mobMod.NO_MOVE, 0)
            mobArg:entityAnimationPacket("shsm")
            mobArg:setMagicCastingEnabled(true)
            mobArg:setAutoAttackEnabled(true)
            mobArg:setMobAbilityEnabled(true)
            mob:setLocalVar("control", 0)
            if pet then
                SpawnMob(pet:getID())
                pet:setPos(pos.x + math.random(-2,2), pos.y, pos.z + math.random(-2,2), pos.rot)
            end
        end
    end)
end

entity.onMobSpawn = function(mob)
    mob:setMobMod(xi.mobMod.NO_AGGRO, 1)
    mob:setMobMod(xi.mobMod.NO_MOVE, 1)
end

entity.onMobFight = function(mob, target)
    -- Pet summoning control
    if mob:getLocalVar("petID") > 0 then
        if not GetMobByID(mob:getLocalVar("petID")):isSpawned() and mob:getLocalVar("petSpawned") == 0 then
            spawnPet(mob)
        elseif not GetMobByID(mob:getLocalVar("petID")):isSpawned() and mob:getLocalVar("control") == 0 then
            mob:setLocalVar("control", 1)
            mob:timer(30000, function(mobArg)
                mob:setLocalVar("petSpawned", 0)
            end)
        end
    end

    -- If Fantoccini used Chainspell or Manafont
    if mob:hasStatusEffect(xi.effect.CHAINSPELL) or mob:hasStatusEffect(xi.effect.MANAFONT) then
        mob:setMobMod(xi.mobMod.SPELL_LIST, ID.jobTable[mob:getMainJob()].spellListID)
    else
        mob:setMobMod(xi.mobMod.SPELL_LIST, 0)
    end
end

entity.onMobDeath = function(mob, player, optParams)
    local moblin = GetMobByID(mob:getID()-2)
    if moblin then
        moblin:showText(moblin, ID.text.NOT_HOW)
        DespawnMob(mob:getLocalVar("petID"))
        DespawnMob(moblin:getID())
    end
end

return entity
