SMODS.Seal {
    name = "Brown Seal",
    key = "Brown",
    badge_colour = HEX("4c2d00"),
    config = {ability = "jud"},
    loc_txt = {
        label = 'Brown Seal',
        name = 'Brown Seal',
        text = {
           "Creates a random {C:attention}Joker{}",
            "when scored.",
            "{C:inactive}(Must have room){}"
        }
    },
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
    key = "FilledSeal",
    badge_colour = HEX("000000"),
    config = {ability = "jud"},
    loc_txt = {
        label = 'Filled Seal',
        name = 'Filled Seal',
        text = {
           "Creates a random {C:attention}Eternal Joker{}",
            "when scored.",
            "{C:inactive}(Doesn't need room){}"
        }
    },
    atlas = "SSSSeals",
    pos = {x=1,y=0},
    -- self - this seal prototype
    -- card - card this seal is applied to
    calculate = function(self, card, context)
        -- repetition_only context is used for red seal retriggers
        if context.main_scoring and not context.repetition_only and context.cardarea == G.play then
            local table =
            {
                set = "Joker",
                stickers = {"eternal"}
            }
            SMODS.add_card(table)
        end
    end,
}
