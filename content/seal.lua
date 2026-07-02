SMODS.Seal {
    name = "Brown Seal",
    key = "brown",
    badge_colour = HEX("4c2d00"),
    config = {ability = "jud"},
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
    badge_colour = HEX("000000"),
    config = {ability = "jud"},
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
