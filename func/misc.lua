function SSS.DestroySelfJoker(self) -- shamelessly stole from vanilla. please tell me if theres a better way to do this
    G.E_MANAGER:add_event(Event({ -- start of function ville
        func = function()
            play_sound('tarot1')
            self.T.r = -0.2
            self:juice_up(0.3, 0.4)
            self.states.drag.is = true
            self.children.center.pinch.x = true
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                func = function()
                        G.jokers:remove_card(self)
                        self:remove()
                        self = nil
                    return true; end})) 
            return true
        end
    })) 
end
function SSS.GetAmountOfRedeemedVouchers()
    if G.GAME and G.GAME.used_vouchers then
        local vouchercount = 0
        for i,v in pairs(G.GAME.used_vouchers) do
            vouchercount = vouchercount + 1
        end
        if vouchercount > 0 then
            return vouchercount
        end
    else
        return 0
    end
end
function SSS.XScore(card) -- i owe astronomica money for this (sensing a theme here)
    local xscore = card.ability.extra.xscore
    G.E_MANAGER:add_event(Event({
        func = function() 
            G.GAME.chips = (to_big(G.GAME.chips))*(to_big(xscore))
            G.HUD:get_UIE_by_ID('chip_UI_count'):juice_up(0.3, 0.3)
            play_sound('xchips')
            return true
        end,
    }))
    return {
        message = "X" .. tostring(xscore) .. " Score",
        colour = G.C.PURPLE
    }
end
function SSS.PlusScore(card, score)
    local plusscore = score
    G.E_MANAGER:add_event(Event({
        func = function() 
            G.GAME.chips = (to_big(G.GAME.chips))+(to_big(plusscore))
            G.HUD:get_UIE_by_ID('chip_UI_count'):juice_up(0.3, 0.3)
            play_sound('xchips')
            return true
        end,
    }))
    return {
        message = "+" .. tostring(plusscore) .. " Score",
        colour = G.C.PURPLE
    }
end
function SSS.GetPlayedHandLevel()
    local text = G.FUNCS.get_poker_hand_info(G.play.cards)
    local level = to_number(G.GAME.hands[text].level)
    return level
end
function SSS.IsInShop()
    if G.STATE == G.STATES.SHOP then
        return true
    else
        return false
    end
end