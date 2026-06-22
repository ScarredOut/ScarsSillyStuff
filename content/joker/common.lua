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
    attributes = {
        "mult",
        "rank",
        "ace",
        "hand_type",
        "selfdestruct"
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
    attributes = {
        "xscore",
        "trash"
    },
    calculate = function(self, card, context)
        if (context.end_of_round and context.main_eval and context.game_over == false) or context.forcetrigger then
            return {
                xscore = card.ability.extra.xscore
            }
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
    cost = 5,
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
    attributes = {
        "score" -- blue joker isn't full_deck for some reason? i'll just take the precedent
    },
    calculate = function(self, card, context)
        if context.final_scoring_step or context.forcetrigger then
            return {
                score = card.ability.extra.score * #G.deck.cards
            }
        end
    end
}
SMODS.Joker {
    key = "scratchoff",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.min,
                card.ability.extra.max
            }
        }
    end,
    cost = 7,
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
            max = 15,
            min = 5
        }
    },
    attributes = {
        "economy",
        "destroy_card",
        "enhancements"
    },
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.hand then
            if SMODS.has_enhancement(context.destroy_card, "m_lucky") then
                local tempmoney = pseudorandom('scratchoff', card.ability.extra.min, card.ability.extra.max)
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + tempmoney
                G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
                return {
                    dollars = tempmoney,
                    message_card = context.destroy_card,
                    colour = G.C.MONEY,
                    remove = true
                }
            end
        end
    end
}
SMODS.Joker {
    key = "thriftyjoker",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
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
            mult = 10
        }
    },
    attributes = {
        "mult",
        "discard"
    },
    calculate = function(self, card, context)
        if context.joker_main then
            if G.GAME.current_round.discards_used then -- Can't hurt to check.
                if G.GAME.current_round.discards_used == 0 then
                    return {
                        mult = card.ability.extra.mult
                    }
                end
            end
        end
    end
}
SMODS.Joker {
    key = "earlyjoker",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,
    cost = 3,
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
            mult = 4
        }
    },
    attributes = {
        "mult"
    },
    calculate = function(self, card, context)
        if context.initial_scoring_step then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}