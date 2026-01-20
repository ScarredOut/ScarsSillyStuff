to_big = to_big or function(x) return x end
SMODS.Joker {
    key = "cashback",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.amountpervouch,
                card.ability.extra.total
            }
        }
    end,
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    discovered = true,
    atlas = "SSSPlaceholders",
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            amountpervouch = 2,
            total = 0
        }
    },
    calculate = function(self, card, context)
        if context.buying_card then
            local getamount = SSS.GetAmountOfRedeemedVouchers() or 0
            if getamount then 
                local totalamount = card.ability.extra.amountpervouch * getamount
                card.ability.extra.total = totalamount
            else
                card.ability.extra.total = 0
            end
        end
    end,
    calc_dollar_bonus = function(self, card)
		local bonus = card.ability.extra.total
		if bonus > 0 then return bonus end
	end
}
SMODS.Joker {
    key = "energywarning",
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.c_hermit
        return {
            vars = {
                card.ability.extra.dollars
            }
        }
    end,
    cost = 6,
    rarity = 2,
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
            dollars = 10
        }
    },
    calculate = function(self, card, context)
        if context.setting_blind and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            if G.GAME.dollars <= to_big(card.ability.extra.dollars) then
                -- cool. make a hermit RN!!!
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        SMODS.add_card {
                            set = 'Tarot',
                            key = "c_hermit"
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                return {
                    message = "+1 Hermit!",
                    color = G.C.PURPLE
                }
            end
        end
    end
}

SMODS.Joker {
    key = "keyandchain",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.score
            }
        }
    end,
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    demicoloncompat = true,
    discovered = true,
    atlas = "SSSPlaceholders",
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            xmult = 4,
            score = 750
        }
    },
    calculate = function(self, card, context)
         if context.joker_main or context.forcetrigger then
            return {
                xmult = card.ability.extra.xmult
            }
        end
        if context.after or context.forcetrigger then
            SSS.MinusScore(card, card.ability.extra.score)
        end
    end
}
