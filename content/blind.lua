SMODS.Blind {
    key = "ladder",
    atlas = "SSSBlinds",
    pos = {
        x = 0,
        y = 0
    },
    boss_colour = HEX("775b40"),
    boss = {
        min = 3
    },
    calculate = function(self, blind, context)
        if blind.disabled then return end
        if context.press_play then
            if G.GAME.current_round.hands_played ~= 0 then -- if a hand is played....
                ease_ante(1)
                blind.triggered = true
            end
        end
    end
}
SMODS.Blind {
    key = "speed",
    atlas = "SSSBlinds",
    pos = {
        x = 1,
        y = 0
    },
    boss_colour = HEX("843a26"),
    boss = {
        min = 1
    },
    calculate = function(self, blind, context)
        if blind.disabled then return end
        if context.setting_blind then
            if not G.GAME.sss_blinds_skipped_this_ante then
                G.GAME.win_ante = G.GAME.win_ante + 1
            elseif G.GAME.sss_blinds_skipped_this_ante <= 0 then
                G.GAME.win_ante = G.GAME.win_ante + 1
            end
        end
    end
}
SMODS.Blind {
    key = "stifler",
    atlas = "SSSBlinds",
    pos = {
        x = 2,
        y = 0
    },
    boss_colour = HEX("429382"),
    boss = {
        min = 1
    },
    calculate = function(self, blind, context)
        if blind.disabled then return end
        if context.hand_drawn and G.GAME.current_round.hands_left == 1 then -- context.after does not work here
            -- bit of a scuffed way to check for before the final hand but Whatever!
            -- I need to check if the None hand from Cryptid actually triggers this context... Later.
            G.GAME.blind.triggered = true
            -- I'd think Thunk would use 1 sound effect for plasma but ig not. So is it, worry not about it
            play_sound('gong', 0.94, 0.3)
			play_sound('gong', 0.94*1.5, 0.2)
			play_sound('tarot1', 1.5)
            -- do the thing
            G.GAME.chips = 0
            -- you have officially been... #Stifled! heheheha
            -- alright i'll report to unfunny guy death row in like 5 seconds ok
        end
    end
}