SMODS.Consumable {
    key = "apartment",
    set = "Spectral",
    atlas = "SSSSpectrals",
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            max_highlighted = 1
        }
    },
    can_use = function(self, card)
        local highlighted = G.jokers.highlighted or {}
        if #highlighted < 1 or #highlighted > card.ability.extra.max_highlighted then
            return false
        end
        local joker = highlighted[1]
        if joker.ability and (not joker.ability.rental) then
            return false
        end
        return true
    end,
    use = function(self, card, area, copier)
        local joker = G.jokers.highlighted[1]
        if joker.ability and joker.ability.rental then
            joker:remove_sticker("rental")
            joker:add_sticker("eternal", true)
        end
    end
}