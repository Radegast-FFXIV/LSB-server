-----------------------------------
-- Pulling the Strings
-- Mine Shaft #2716 ENM, Shaft Gate Operating Dial
-- !addkeyitem SHAFT_GATE_OPERATING_DIAL
-- !pos -60.9781 -120.0084 -579.8447 13
-----------------------------------
local ID = zones[xi.zone.MINE_SHAFT_2716]
-----------------------------------

local content = Battlefield:new({
    zoneId                = xi.zone.MINE_SHAFT_2716,
    battlefieldId         = xi.battlefield.id.PULLING_THE_STRINGS,
    canLoseExp            = false,
    allowTrusts           = false,
    allowSubjob           = false,
    maxPlayers            = 1,
    levelCap              = 60,
    timeLimit             = utils.minutes(15),
    index                 = 3,
    entryNpc              = '_0d0',
    exitNpcs              = { '_0d1', '_0d2', '_0d3' },
    requiredKeyItems      = { xi.ki.SHAFT_GATE_OPERATING_DIAL, message = ID.text.NO_BATTLEFIELD_ENTRY},
    grantXP               = 2000,
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

function getLootTableFromPlayerJob(playerJob)
    local lootTable = {
        {
            { item = xi.item.SACK_OF_LITTLE_WORM_MULCH,                weight = 1000 }, -- player always gets worm mulch
        },
        unpack(jobLootTable[playerJob], 0, #jobLootTable[playerJob])
    }
    -- print(string.format("Prospective loot table: %s", tostring(lootTable)))
    return lootTable
end

function content:entryRequirement(player, npc, isRegistrant, trade)
    local playerJob = player:getMainJob()

    local playerIsNotWingsOrAdoulinJob = not (
        playerJob == xi.job.DNC or
        playerJob == xi.job.SCH or
        playerJob == xi.job.GEO or
        playerJob == xi.job.RUN
    )

    return playerIsNotWingsOrAdoulinJob
end

function content:battlefieldEntry(player, battlefield)
    content.loot = getLootTableFromPlayerJob(player:getMainJob())
end

content.groups = {
    {
        mobs = { 'Fantoccini' },
        setup = function(battlefield, mobs)
            print(string.format("Number of players: %i",battlefield:getPlayerCount()))
            print(string.format("Player Job: %s", tostring(battlefield:getPlayers())))
        end
    },
    {
        mobs = {'Moblin_Fantocciniman'},
    }
}

content:addEssentialMobs({ 'Fantoccini', 'Moblin_Fantocciniman' })

return content:register()