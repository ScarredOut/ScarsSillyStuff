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
            amountpervouch = 3,
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