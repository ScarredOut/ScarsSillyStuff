SMODS.Joker {
    key = "cryp_codingwork",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.moneygiven
            }
        }
    end,
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    discovered = true,
    atlas = "SSSPlaceholders",
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            moneygiven = 5
        }
    },
    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.config.center.set == 'Code' then -- remove(self, card, context, true)
            return {dollars = card.ability.extra.moneygiven}
        end
    end
}