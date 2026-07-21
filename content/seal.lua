SMODS.Seal {
    name = "Brown Seal",
    key = "brown",
    badge_colour = HEX("4c2d00"),
    config = {},
    atlas = "SSSSeals",
    pos = {x=0,y=0},
    -- self - this seal prototype
    -- card - card this seal is applied to
    calculate = function(self, card, context)
        -- repetition_only context is used for red seal retriggers
        if context.main_scoring and not context.repetition_only and context.cardarea == G.play and (#G.jokers.cards < G.jokers.config.card_limit or self.area == G.jokers) then
            local table =
            {
                set = "Joker"
            }
            SMODS.add_card(table)
        end
    end,
}
SMODS.Seal {
    name = "Filled Seal",
    key = "filled",
    badge_colour = HEX("4b161c"),
    config = {},
    atlas = "SSSSeals",
    pos = {x=1,y=0},
    -- self - this seal prototype
    -- card - card this seal is applied to
    calculate = function(self, card, context)
        -- repetition_only context is used for red seal retriggers
        if context.main_scoring and not context.repetition_only and context.cardarea == G.play then
            local table = {
                set = "Joker",
                force_stickers = {"eternal"},
            }
            SMODS.add_card(table)
        end
    end,
}
SMODS.Seal {
    name = "Magenta Seal",
    key = "magenta",
    badge_colour = HEX("ec27fa"),
    config = {
        extra = {
            chipadd = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.extra.chipadd
            }
        }
    end,
    atlas = "SSSSeals",
    pos = {x=2,y=0},
    -- self - this seal prototype
    -- card - card this seal is applied to
    calculate = function(self, card, context)
        -- repetition_only context is used for red seal retriggers
        if context.discard and context.other_card == card then
            for k, v in ipairs(G.hand.cards) do
                if (v ~= card) then  -- /// the second condition which is intended to prevent cards that are being discarded from counting didn't work and i do NOT feel like making it work.
                    v.ability.perma_bonus = (v.ability.perma_bonus or 0) + card.ability.seal.extra.chipadd
                    SSS.AttentionTextUpgradeMS(v)
                end
            end
        end
    end,
}

