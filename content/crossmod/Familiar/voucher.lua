SMODS.Voucher {
    name = "Familiar Vendor",
    key = "familiartarotvouchert1",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.multiplier
            }
        }
    end,
    atlas = 'SSSPlaceholders',
    pos = {
        x = 1,
        y = 0
    },
    config = { extra = { multiplier = 2 } },
    redeem = function(self, card)
        G.GAME.familiar_tarots_rate = 1
    end
}
SMODS.Voucher {
    name = "Familiar Shipment",
    key = "familiartarotvouchert2",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.multiplier
            }
        }
    end,
    atlas = 'SSSPlaceholders',
    pos = {
        x = 1,
        y = 0
    },
    requires = {
        "v_sss_familiartarotvouchert1"
    },
    config = {
        extra = {
            multiplier = 2
        }
    },
    redeem = function(self, card)
        G.GAME.familiar_tarots_rate = G.GAME.familiar_tarots_rate * card.ability.extra.multiplier
    end
}
