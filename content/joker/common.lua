SMODS.Joker {
    key = "pocketaces",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
            }
        }
    end,
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    demicoloncompat = true,
    discovered = true,
    atlas = "SSSPlaceholders",
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            mult = 50
        }
    },
    calculate = function(self, card, context)
        local count = 0
        if context.joker_main then -- remove(self, card, context, true)
            for k, v in ipairs(context.full_hand) do
                if v:get_id() == 14 then count = count + 1 end
            end
            if next(context.poker_hands['Pair']) and count == 2 then
                count = 0 
                SSS.DestroySelfJoker(card)
                return {
                    mult_mod = card.ability.extra.mult,
                    message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
                }
            end
        end
        if context.forcetrigger then -- remove(self, card, context, true)
            SSS.DestroySelfJoker(card)
                return {
                    mult_mod = card.ability.extra.mult,
                    message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
                }
        end
    end
}
SMODS.Joker {
    key = "latejoker",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xscore
            }
        }
    end,
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    demicoloncompat = true,
    discovered = true,
    atlas = "SSSJokers",
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            xscore = 5
        }
    },
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and context.game_over == false then
            SSS.XScore(card)
        end
        if context.forcetrigger then
            SSS.XScore(card)
        end 
    end
}
SMODS.Joker {
    key = "purplejoker",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.score,
                card.ability.extra.score * ((G.deck and G.deck.cards) and #G.deck.cards or 52)
            }
        }
    end,
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    demicoloncompat = true,
    discovered = true,
    atlas = "SSSJokers",
    pos = {
        x = 2,
        y = 0
    },
    config = {
        extra = {
            score = 25
        }
    },
    calculate = function(self, card, context)
        if context.after or context.forcetrigger then
            SSS.PlusScore(card, card.ability.extra.score * #G.deck.cards)
        end
    end
}