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
    maxPlayers            = 1,
    levelCap              = 60,
    timeLimit             = utils.minutes(15),
    index                 = 1,
    entryNpc              = '_0d0',
    exitNpcs              = { '_0d1', '_0d2', '_0d3' },
    requiredKeyItems      = { xi.ki.SHAFT_GATE_OPERATING_DIAL},
    grantXP               = 2000,
})

local jobLootTable = {
    [xi.job.BRD] = {
        {
            {item = xi.item.NONE,                                      weight = 300},
            {item = xi.item.GETSUL_RING,                               weight = 400}
        }
    },
    [xi.job.BST] = {
        {
            {item = xi.item.NONE,                                      weight = 300},
            {item = xi.item.PACIFIST_RING,                               weight = 400}
        }
    },
    [xi.job.BLM] = {
        {
            {item = xi.item.NONE,                                      weight = 300},
            {item = xi.item.SPIRIT_LANTERN,                               weight = 400}
        }
    },
    [xi.job.BLU] = {
        {
            {item = xi.item.NONE,                                      weight = 300},
            {item = xi.item.DEATH_CHAKRAM,                               weight = 400}
        }
    },
    [xi.job.COR] = {
        {
            {item = xi.item.NONE,                                      weight = 300},
            {item = xi.item.CORSAIR_BULLET_POUCH,                               weight = 400}
        }
    },
    [xi.job.DRK] = {
        {
            {item = xi.item.NONE,                                      weight = 300},
            {item = xi.item.TACTICAL_RING,                               weight = 400}
        }
    },
    [xi.job.DRG] = {
        {
            {item = xi.item.NONE,                                      weight = 300},
            {item = xi.item.BAG_OF_WYVERN_FEED,                               weight = 400}
        }
    },
    [xi.job.MNK] = {
        {
            {item = xi.item.NONE,                                      weight = 300},
            {item = xi.item.COUNTER_EARRING,                               weight = 400}
        }
    },
    [xi.job.NIN] = {
        {
            {item = xi.item.NONE,                                      weight = 300},
            {item = xi.item.NARUKO_EARRING,                            weight = 400}
        }
    },
    [xi.job.PLD] = {
        {
            {item = xi.item.NONE,                                      weight = 300},
            {item = xi.item.VIAL_OF_REFRESH_MUSK,                      weight = 400}
        }
    },
    [xi.job.PUP] = {
        {
            {item = xi.item.NONE,                                      weight = 300},
            {item = xi.item.ATTUNER,                                   weight = 400}
        },
        {
            {item = xi.item.NONE,                                      weight = 300},
            {item = xi.item.TACTICAL_PROCESSOR,                                   weight = 400}
        },
        {
            {item = xi.item.NONE,                                      weight = 300},
            {item = xi.item.DRUM_MAGAZINE,                                   weight = 400}
        },
        {
            {item = xi.item.NONE,                                      weight = 300},
            {item = xi.item.EQUALIZER,                                   weight = 400}
        },
        {
            {item = xi.item.NONE,                                      weight = 300},
            {item = xi.item.TARGET_MARKER,                                   weight = 400}
        },
        {
            {item = xi.item.NONE,                                      weight = 300},
            {item = xi.item.MANA_CHANNELER,                                   weight = 400}
        },
        {
            {item = xi.item.NONE,                                      weight = 300},
            {item = xi.item.ERASER,                                   weight = 400}
        },
        {
            {item = xi.item.NONE,                                      weight = 300},
            {item = xi.item.SMOKE_SCREEN,                                   weight = 400}
        }
    },
    [xi.job.RNG] = {
        {
            {item = xi.item.NONE,                                      weight = 300},
            {item = xi.item.DEADEYE_EARRING,                                   weight = 400}
        }
    },
    [xi.job.RDM] = {
        {
            {item = xi.item.NONE,                                      weight = 300},
            {item = xi.item.SANATION_RING,                                   weight = 400}
        }
    },
    [xi.job.SAM] = {
        {
            {item = xi.item.NONE,                                      weight = 300},
            {item = xi.item.GAMUSHARA_EARRING,                                   weight = 400}
        }
    },
    [xi.job.SMN] = {
        {
            {item = xi.item.NONE,                                      weight = 300},
            {item = xi.item.ASTRAL_POT,                                   weight = 400}
        }
    },
    [xi.job.THF] = {
        {
            {item = xi.item.NONE,                                      weight = 300},
            {item = xi.item.ASSASSINS_RING,                                   weight = 400}
        }
    },
    [xi.job.WAR] = {
        {
            {item = xi.item.NONE,                                      weight = 300},
            {item = xi.item.JANIZARY_EARRING,                                   weight = 400}
        }
    },
    [xi.job.WHM] = {
        {
            {item = xi.item.NONE,                                      weight = 300},
            {item = xi.item.HEALING_FEATHER,                           weight = 400}
        }
    }
}

content:addEssentialMobs({ 'Moblin_Fantocciniman', 'Fantoccini' })


function getLootTableFromPlayerJob(player)
    local playerJob = player:getMainJob()
    return {
        {
            { item = xi.item.SACK_OF_LITTLE_WORM_MULCH,                   weight = 140 }, -- player always gets worm mulch
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


return content:register()