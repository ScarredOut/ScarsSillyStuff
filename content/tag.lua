SMODS.Tag {
    key = "slotmachine",
    atlas = "SSSTags",
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            numerator = 1,
            denominator = 2,
            money = 50
        }
    },
    loc_vars = function(self, info_queue, tag)
	    local num, denom = SMODS.get_probability_vars(tag, tag.config.extra.numerator, tag.config.extra.denominator)
        return {
            vars = {
                num,
                denom,
                tag.config.extra.money
            }
        }
    end,
    apply = function(self, tag, context)
        if context.type == "immediate" then -- ease_dollars exists mate
            if SMODS.pseudorandom_probability(tag, "slotmachine", tag.config.extra.numerator, tag.config.extra.denominator) then
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