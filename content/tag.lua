SMODS.Tag {
    key = "slotmachine",
    atlas = "SSSTags",
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            probability = 2,
            money = 50
        }
    },
    loc_vars = function(self, info_queue, tag)
        return {
            vars = {
                G.GAME.probabilities.normal,
                tag.config.extra.probability,
                tag.config.extra.money
            }
        }
    end,
    apply = function(self, tag, context)
        if context.type == "immediate" then -- ease_dollars exists mate
            if pseudorandom("slotmachinetag") < G.GAME.probabilities.normal / tag.config.extra.probability then
                ease_dollars(tag.config.extra.money, true)
                tag:yep("W", G.C.GOLD, function()
                    return true
                end)
            else
                tag:nope()
            end
            tag.triggered = true
        end
    end
}