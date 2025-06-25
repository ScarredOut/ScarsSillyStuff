SMODS.Joker {
    key = "paya_yenonrope",
    blueprint_compat = true,
    perishable_compat = true,
    rarity = 1,
    cost = 1,
    atlas = "SSSPlaceholders",
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            pyroxenes = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.pyroxenes
            }
        }
    end,
    calculate = function(self, card, context)
        if context.reroll_shop then
            if SSS.TalismanInstalled then
                ease_pyrox(to_number(card.ability.extra.pyroxenes))
            else
                ease_pyrox(card.ability.extra.pyroxenes)
            end
            return {
                message = 'Pyroxene Get!',
                colour = G.C.BLUE
            }
        end
    end
}
