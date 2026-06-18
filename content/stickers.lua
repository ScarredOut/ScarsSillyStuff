SMODS.Sticker {
    key = "generous",
    badge_colour = HEX('6b8100'),
    atlas = "SSSStickers",
    pos = {
        x = 0,
        y = 0
    },
    needs_enabled_flag = true,
    sets = {
        Joker = true
    },
    rate = 0.3,
    config = {
        money = 3
    },
    loc_vars = function(self, info_queue, card)
        local condition = "at end of round"
        if next(SMODS.find_card("v_sss_generousvouchert2")) then
            condition = "on hand played"
        end
        return {
            vars = {
                card.ability.sss_generous.money,
                condition
            }
        }
    end,
    calculate = function(self, card, context)
        if context.after and next(SMODS.find_card("v_sss_generousvouchert2")) then
            return {
                dollars = card.ability.sss_generous.money
            }
        end
        if context.end_of_round and context.game_over == false and not next(SMODS.find_card("v_sss_generousvouchert2")) then
            return {
                dollars = card.ability.sss_generous.money
            }
        end
    end
}