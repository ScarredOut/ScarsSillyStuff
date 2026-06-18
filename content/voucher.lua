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
SMODS.Voucher {
    name = "Give and Take",
    key = "generousvouchert1",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,
    atlas = 'SSSVouchers',
    pos = {
        x = 0,
        y = 0
    },
    config = { 
        extra = { 
            xmult = 0.75
        }
    },
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                G.GAME.modifiers.enable_sss_generous = true
                return true
            end
        }))
    end,
    calculate = function(self, card, context)
        if context.joker_main and not next(SMODS.find_card("v_sss_generousvouchert2")) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after', 
                delay = 0.4, 
                func = function()
				    play_sound('multhit2')
			        return true 
                end
            }))
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}
SMODS.Voucher {
    name = "Risk and Reward",
    key = "generousvouchert2",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,
    atlas = 'SSSVouchers',
    pos = {
        x = 1,
        y = 0
    },
    config = { 
        extra = { 
            xmult = 0.5
        }
    },
    calculate = function(self, card, context)
        if context.joker_main then
            G.E_MANAGER:add_event(Event({
                trigger = 'after', 
                delay = 0.4, 
                func = function()
				    play_sound('multhit2')
			        return true 
                end
            }))
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}