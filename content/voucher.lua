SMODS.Voucher {
    name = "Black Voucher",
    key = "blackvouchert1",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.jokerslots,
                card.ability.extra.hands
            }
        }
    end,
    atlas = 'SSSPlaceholders',
    pos = {
        x = 1,
        y = 0
    },
    config = { 
        extra = { 
            jokerslots = 1,
            hands = -1
        }
    },
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then 
                    G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.jokerslots
                end
                G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
                ease_hands_played(card.ability.extra.hands)
                return true
            end
        }))
    end
}
SMODS.Voucher {
    name = "Blacker Voucher",
    key = "blackvouchert2",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.jokerslots,
                card.ability.extra.discards
            }
        }
    end,
    atlas = 'SSSPlaceholders',
    pos = {
        x = 1,
        y = 0
    },
    config = { 
        extra = { 
            jokerslots = 1,
            discards = -1
        }
    },
    requires = {
        "v_sss_blackvouchert1"
    },
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then 
                    G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.jokerslots
                end
                G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discards
                ease_discard(card.ability.extra.discards)
                return true
            end
        }))
    end
}