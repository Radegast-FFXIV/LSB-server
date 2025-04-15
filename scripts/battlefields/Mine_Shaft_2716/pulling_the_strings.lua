-----------------------------------
-- Pulling the Strings
-- Mine Shaft #2716 mission battlefield
-----------------------------------
local mineshaftID = zones[xi.zone.MINE_SHAFT_2716]
-----------------------------------

local content = BattlefieldMission:new({
    zoneId                = xi.zone.MINE_SHAFT_2716,
    battlefieldId         = xi.battlefield.id.PULLING_THE_STRINGS,
    canLoseExp            = false,
    isMission             = false,
    allowTrusts           = false,
    allowSubjob           = false,
    maxPlayers            = 1,
    levelCap              = 60,
    timeLimit             = utils.minutes(15),
    index                 = 1,
    entryNpc              = '_0d0',
    exitNpcs              = { '_0d1', '_0d2', '_0d3' },
    requiredKeyItems      = { xi.ki.SHAFT_GATE_OPERATING_DIAL},
    grantXP               = 2000,

    experimental          = true
})

local jobLootTable = {
    [xi.job.BRD] = {
        {
            {item = xi.item.NONE,                                      weight = 500},
            {item = xi.item.GETSUL_RING,                               weight = 500}
        }
    },
    [xi.job.BST] = {
        {
            {item = xi.item.NONE,                                      weight = 500},
            {item = xi.item.PACIFIST_RING,                             weight = 500}
        }
    },
    [xi.job.BLM] = {
        {
            {item = xi.item.NONE,                                      weight = 500},
            {item = xi.item.SPIRIT_LANTERN,                            weight = 500}
        }
    },
    [xi.job.BLU] = {
        {
            {item = xi.item.NONE,                                      weight = 500},
            {item = xi.item.DEATH_CHAKRAM,                             weight = 500}
        }
    },
    [xi.job.COR] = {
        {
            {item = xi.item.NONE,                                      weight = 500},
            {item = xi.item.CORSAIR_BULLET_POUCH,                      weight = 500}
        }
    },
    [xi.job.DRK] = {
        {
            {item = xi.item.NONE,                                      weight = 500},
            {item = xi.item.TACTICAL_RING,                             weight = 500}
        }
    },
    [xi.job.DRG] = {
        {
            {item = xi.item.NONE,                                      weight = 500},
            {item = xi.item.BAG_OF_WYVERN_FEED,                        weight = 500}
        }
    },
    [xi.job.MNK] = {
        {
            {item = xi.item.NONE,                                      weight = 500},
            {item = xi.item.COUNTER_EARRING,                           weight = 500}
        }
    },
    [xi.job.NIN] = {
        {
            {item = xi.item.NONE,                                      weight = 500},
            {item = xi.item.NARUKO_EARRING,                            weight = 500}
        }
    },
    [xi.job.PLD] = {
        {
            {item = xi.item.NONE,                                      weight = 500},
            {item = xi.item.VIAL_OF_REFRESH_MUSK,                      weight = 500}
        }
    },
    [xi.job.PUP] = {
        {
            {item = xi.item.NONE,                                      weight = 200},
            {item = xi.item.ATTUNER,                                   weight = 200},
            {item = xi.item.DRUM_MAGAZINE,                             weight = 200},
            {item = xi.item.EQUALIZER,                                 weight = 200},
            {item = xi.item.MANA_CHANNELER,                            weight = 200}
        },
        {
            {item = xi.item.NONE,                                      weight = 200},
            {item = xi.item.TACTICAL_PROCESSOR,                        weight = 200},
            {item = xi.item.TARGET_MARKER,                             weight = 200},
            {item = xi.item.ERASER,                                    weight = 200},
            {item = xi.item.SMOKE_SCREEN,                              weight = 200}
        }
    },
    [xi.job.RNG] = {
        {
            {item = xi.item.NONE,                                      weight = 500},
            {item = xi.item.DEADEYE_EARRING,                           weight = 500}
        }
    },
    [xi.job.RDM] = {
        {
            {item = xi.item.NONE,                                      weight = 500},
            {item = xi.item.SANATION_RING,                             weight = 500}
        }
    },
    [xi.job.SAM] = {
        {
            {item = xi.item.NONE,                                      weight = 500},
            {item = xi.item.GAMUSHARA_EARRING,                         weight = 500}
        }
    },
    [xi.job.SMN] = {
        {
            {item = xi.item.NONE,                                      weight = 500},
            {item = xi.item.ASTRAL_POT,                                weight = 500}
        }
    },
    [xi.job.THF] = {
        {
            {item = xi.item.NONE,                                      weight = 500},
            {item = xi.item.ASSASSINS_RING,                            weight = 500}
        }
    },
    [xi.job.WAR] = {
        {
            {item = xi.item.NONE,                                      weight = 500},
            {item = xi.item.JANIZARY_EARRING,                          weight = 500}
        }
    },
    [xi.job.WHM] = {
        {
            {item = xi.item.NONE,                                      weight = 500},
            {item = xi.item.HEALING_FEATHER,                           weight = 500}
        }
    }
}

function getLootTableFromPlayerJob(player)
    local playerJob = player:getMainJob()
    return {
        {
            { item = xi.item.SACK_OF_LITTLE_WORM_MULCH,                weight = 1000 }, -- player always gets worm mulch
        },
        table.unpack(jobLootTable[playerJob])
    }
end

function content:entryRequirement(player, npc, isRegistrant, trade)
    local playerHasDial = player:hasKeyItem(xi.ki.SHAFT_GATE_OPERATING_DIAL)
    local playerIsNotWingsOrAdoulinJob = not (
        player:getMainJob() == xi.job.DNC or
        player:getMainJob() == xi.job.SCH or
        player:getMainJob() == xi.job.GEO or
        player:getMainJob() == xi.job.RUN
    )

    local playerIsQualified = playerHasDial and playerIsNotWingsOrAdoulinJob
    if playerIsQualified then
        content.loot = getLootTableFromPlayerJob(player)
    end

    return playerIsQualified
end

content.groups = {
    {
        mobIds  = {
            { mineshaftID.mob.FANTOCCINI },
            { mineshaftID.mob.MOBLIN_FANTOCCINIMAN }
        },
        death = function(battlefield, mob, count)
            -- If the Fantocciniman dies, all mobs get permanently
            -- terrorized.
            if mob.ID == mineshaftID.mob.MOBLIN_FANTOCCINIMAN then
                local battlefieldMobs = battlefield:getMobs(true, true)
                for _, mobObj in ipairs(battlefieldMobs) do
                    mobObj:addStatusEffect(xi.effect.TERROR, 0, 0 , 900)
                end
            end

            -- If the Fantoccini dies, despawn the Moblin
            -- Fantocciniman.
            if mob.ID == mineshaftID.mob.FANTOCCINI then
                local moblin = GetMobByID(mineshaftID.mob.MOBLIN_FANTOCCINIMAN)
                if moblin then
                    moblin:showText(moblin, mineshaftID.text.NOT_HOW)
                    DespawnMob(mob:getLocalVar("petID"))
                    DespawnMob(moblin:getID())
                end
            end
        end,
        allDeath = function(battlefield, mob)
            battlefield:setStatus(xi.battlefield.status.WON)
        end,
    }
}

return content:register()