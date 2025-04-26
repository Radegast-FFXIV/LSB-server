-----------------------------------
-- Area: Mine_Shaft_2716
-----------------------------------
zones = zones or {}

zones[xi.zone.MINE_SHAFT_2716] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED       = 6385, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                 = 6391, -- Obtained: <item>.
        GIL_OBTAINED                  = 6392, -- Obtained <number> gil.
        KEYITEM_OBTAINED              = 6394, -- Obtained key item: <keyitem>.
        CARRIED_OVER_POINTS           = 7002, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY       = 7003, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!
        LOGIN_NUMBER                  = 7004, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        MEMBERS_LEVELS_ARE_RESTRICTED = 7024, -- Your party is unable to participate because certain members' levels are restricted.
        TIME_IN_THE_BATTLEFIELD_IS_UP = 7073, -- Your time in the battlefield is up! Now exiting...
        PARTY_MEMBERS_ARE_ENGAGED     = 7088, -- The battlefield where your party members are engaged in combat is locked. Access is denied.
        NO_BATTLEFIELD_ENTRY          = 7092, -- The old wooden door is locked tight.
        MEMBERS_OF_YOUR_PARTY         = 7379, -- Currently, # members of your party (including yourself) have clearance to enter the battlefield.
        MEMBERS_OF_YOUR_ALLIANCE      = 7380, -- Currently, # members of your alliance (including yourself) have clearance to enter the battlefield.
        TIME_LIMIT_FOR_THIS_BATTLE_IS = 7382, -- The time limit for this battle is <number> minutes.
        PARTY_MEMBERS_HAVE_FALLEN     = 7418, -- All party members have fallen in battle. Now leaving the battlefield.
        THE_PARTY_WILL_BE_REMOVED     = 7425, -- If all party members' HP are still zero after # minute[/s], the party will be removed from the battlefield.
        CONQUEST_BASE                 = 7442, -- Tallying conquest results...
        ENTERING_THE_BATTLEFIELD_FOR  = 7605, -- Entering the battlefield for [A Century of Hardship/Return to the Depths/Bionic Bug/Pulling the Strings/Automaton Assault/The Mobline Comedy/To Movalpolos!]!
        -- Moblin Fantocciniman Combat Dialogue
        TIME_FOR_GOODEBYONGO          = 7855, -- Ho-ho, ho-ho! Time for goodebyongo!
        HERE_TO_STAY                  = 7856, -- Hey-hey, hey-hey! Are you here to stay?
        ROLY_POLY                     = 7857, -- Roly-poly, roly-poly♪
        DICE_LIKE_YOU                 = 7858, -- Hoo-hoo, hoo-hoo. Maybe dice like you!
        DICE_LIKE_ME                  = 7859, -- Hee-hee, hee-hee! Today, dice like me!
        GO_GO                         = 7860, -- Go-go, go-go!
        HA_HA                         = 7861, -- Ha-ha, ha-ha!
        NOT_YOUR_LUCKY_DAY            = 7862, -- Yay-yay, yay-yay! Not your lucky day!
        NOT_HOW                       = 7864, -- No-no, no-no! Not how it's 'sposed to go!
        YOU_PLAY_TOO_ROUGH            = 7865, -- Huff-huff, huff-huff... You play too rough...
        YOU_MAKE_ME_MAD               = 7866, -- Ow-ow, ow-ow! You make me mad now!
        GOODEBYONGO                   = 7867, -- Ho-ho, ho-ho! Goodebyongo!
        BEGINS_TO_PANIC               = 7868, -- The Moblin Fantocciniman begins to panic.
    },
    mob =
    {
        MOVAMUQ = GetFirstID('Movamuq'),
        MOBLIN_FANTOCCINIMAN = GetFirstID('Moblin_Fantocciniman'),
        FANTOCCINI = GetFirstID('Fantoccini')
    },
    npc =
    {
        ENTRANCE_OFFSET = GetFirstID('_0d0')
    },
    jobTable =
    {
        [xi.job.WAR] =
        {
            modelID = 1209,
            skillList = 4033,
            ability = 1428, -- Warcry
            twoHour = 688, -- Mighty Strikes
            spellListID = 0,
            petID = 0,
        },
        [xi.job.MNK] =
        {
            modelID = 1210,
            skillList = 4034,
            ability = 1429, -- Counterstance
            twoHour = 690, -- Hundred Fists
            spellListID = 0,
            petID = 0,
        },
        [xi.job.WHM] =
        {
            modelID = 1214,
            skillList = 4035,
            ability = 0, -- None
            twoHour = 689, -- Benediction
            spellListID = 1,
            petID = 0,
        },
        [xi.job.BLM] =
        {
            modelID = 1215,
            skillList = 4035,
            ability = 0, -- None
            twoHour = 691, -- Manafont
            spellListID = 2,
            petID = 0,
        },
        [xi.job.RDM] =
        {
            modelID = 1216,
            skillList = 4037,
            ability = 0, -- None
            twoHour = 692, -- Chainspell
            spellListID = 3,
            petID = 0,
        },
        [xi.job.THF] =
        {
            modelID = 1218,
            skillList = 4038,
            ability = 0, -- None
            twoHour = 693, -- Perfect Dodge
            spellListID = 0,
            petID = 0,
        },
        [xi.job.PLD] =
        {
            modelID = 1219,
            skillList = 4037,
            ability = 1431, -- Shield Bash
            twoHour = 694, -- Incincible
            spellListID = 4,
            petID = 0,
        },
        [xi.job.DRK] =
        {
            modelID = 1220,
            skillList = 4039,
            ability = 1432, -- Weapon Bash
            twoHour = 695, -- Blood Weapon
            spellListID = 5,
            petID = 0,
        },
        [xi.job.BST] =
        {
            modelID = 1224,
            skillList = 4033,
            petModelID =
            {
                328, -- Lizzard
                340, -- Sheep
                376, -- Funguar
                356, -- Crab
            },
            petSkillList =
            {
                174, -- Lizzard
                226, -- Sheep
                116, -- Funguar
                372, -- Crab
            },
            ability = 1433, -- Sic
            twoHour = 740, -- Familiar
            spellListID = 0,
            petID = 1,
        },
        [xi.job.BRD] =
        {
            modelID = 1227,
            skillList = 4038,
            ability = 0, -- None
            twoHour = 696, -- Soul Voice
            spellListID = 6,
            petID = 0,
        },
        [xi.job.RNG] =
        {
            modelID = 1228,
            skillList = 4040,
            ability = 1434, -- Barrage
            twoHr = 413, -- Eagle Eye Shot
            spellListID = 0,
            petID = 0,
        },
        [xi.job.SAM] =
        {
            modelID = 1229,
            skillList = 4041,
            ability = 1436, -- Meditate
            twoHour = 730, -- Meikyo Shisui
            spellListID = 0,
            petID = 0,
        },
        [xi.job.NIN] =
        {
            modelID = 1232,
            skillList = 4042,
            ability = 0, -- None
            twoHour = 731, -- Mjin Gakure
            spellListID = 7,
            petID = 0,
        },
        [xi.job.DRG] =
        {
            modelID = 1234,
            skillList = 4043,
            ability = 1437, -- Jump
            twoHour = 732, -- Call Wyvern
            spellListID = 0,
            petID = 2,
        },
        [xi.job.SMN] =
        {
            modelID = 1235,
            skillList = 4036,
            petModelID =
            {
                793, -- Ifrit
                794, -- Titan
                795, -- Leviathan
                796, -- Garuda
                797, -- Shiva
                798, -- Ramuh
                791, -- Carbuncle
            },
            petSkillList =
            {
                38, -- Ifrit
                45, -- Titan
                40, -- Leviathan
                37, -- Garuda
                44, -- Shiva
                43, -- Ramuh
                34, -- Carbuncle
            },

            ability = 1438, -- Blood Pact
            twoHour = 734, -- Astral Flow
            spellListID = 0,
            petID = 3,
        },
        [xi.job.BLU] =
        {
            modelID = 1396,
            skillList = 4037,
            ability = 0, -- None
            spellListID = 8, -- TODO: Mimic player's set spells
            petID = 0,
        },
        [xi.job.COR] =
        {
            modelID = 1397,
            skillList = 4044,
            ability = 0, -- TODO: Add rolls here
            spellListID = 0, -- ???
            petID = 0,
        },
        [xi.job.PUP] =
        {
            modelID = 1398,
            skillList = 4034,
            petModelID =
            {
                { 1983, xi.job.PLD }, -- Melee Automaton
                { 1990, xi.job.RNG }, -- Ranged Automaton
                { 1994, xi.job.BLM }, -- Magic Automaton
            },
            petSkillList =
            {
                364, -- Melee Automaton
                365, -- Ranged Automaton
                366, -- Magic Automaton
            },
            petSpellListID =
            {
                0, -- Melee Automaton
                0, -- Ranged Automaton
                2, -- Magic Automaton
            },
            ability = 1995, -- Maneuvers
            spellListID = 0,
            petID = 4,
        },
    }
}

return zones[xi.zone.MINE_SHAFT_2716]
