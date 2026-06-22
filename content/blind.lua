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
            if not G.GAME.GB_BLINDS_SKIPPED_THIS_ANTE then
                G.GAME.win_ante = G.GAME.win_ante + 1
            elseif G.GAME.GB_BLINDS_SKIPPED_THIS_ANTE <= 0 then
                G.GAME.win_ante = G.GAME.win_ante + 1
            end
        end
    end
}