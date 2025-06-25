SMODS.Consumable {
    key = "cryptid_set",
    set = "Code",
    loc_txt = {
        name = "://SET",
        text = {
            "Sets current shop's",
            "{C:green}reroll{} cost to {C:money}$#1#{}"
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.costtoset
            }
        }
    end,
    config = {
        extra = {
            costtoset = 0
        }
    },
    cost = 3,
    atlas = "SSSCodeCards",
    pos = {
        x = 1,
        y = 0
    },
    can_use = function(self, card)
        return SSS.IsInShop()
    end,
    use = function(self, card, area)
        G.GAME.current_round.reroll_cost = card.ability.extra.costtoset
    end
}
SMODS.Consumable {
    key = "cryptid_get",
    set = "Code",
    loc_txt = {
        name = "://GET",
        text = {
            "Gives current shop's",
            "{C:green}reroll{} cost as {C:money}money{}"
        }
    },
    cost = 3,
    atlas = "SSSCodeCards",
    pos = {
        x = 0,
        y = 0
    },
    can_use = function(self, card)
        return SSS.IsInShop()
    end,
    use = function(self, card, area)
        print("hello.")
        ease_dollars(G.GAME.current_round.reroll_cost)
        return { dollars = G.GAME.current_round.reroll_cost }
    end
}
