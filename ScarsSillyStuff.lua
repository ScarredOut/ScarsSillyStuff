if not SMODS.find_mod("Cryptid") then -- mod check list (this mod's priority is so high because i plan on adding a lot of crossmod stuff)
    print("[SillyStuff] Cryptid not installed.")
    CryptidInstalled = false
else
    CryptidInstalled = true
end
if not SMODS.find_mod("Familiar") then
    print("[SillyStuff] Familiar not installed.")
    FamiliarInstalled = false
else
    FamiliarInstalled = true
end
if not SMODS.find_mod("Paya's Terrible Additions") then
    print("[SillyStuff] Paya's Terrible Additions not installed.")
    PTAInstalled = false
else
    PTAInstalled = true
end
if not SMODS.find_mod("Talisman") then
    print("[SillyStuff] Talisman not installed.")
    TalismanInstalled = false
else
    TalismanInstalled = true
end
if not SMODS.find_mod("Yahimod") then
    print("[SillyStuff] Yahimod not installed.")
    YahimodInstalled = false
else
    YahimodInstalled = true
end
function DestroySelfJoker(self) -- shamelessly stole from vanilla. please tell me if theres a better way to do this
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
function BlindSizeAdjustment(self, card, context, ability) -- code shamefully stolen from SDM_0's Stuff
    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
        G.GAME.blind.chips = math.floor(G.GAME.blind.chips * ability)
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        local chips_UI = G.hand_text_area.blind_chips
        G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
        G.HUD_blind:recalculate()
        chips_UI:juice_up()
        if not silent then play_sound('chips2') end
    return true end }))
end
function GetAmountOfRedeemedVouchers()
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
function GetRandomNumberPsuedo(seed, min, max) -- this function is completely useless lmao
    local randdecimal = pseudorandom(seed)
    local randnum = randdecimal * (max/min)
end
function XScore(card) -- i owe astronomica money for this (sensing a theme here)
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
function PlusScore(card, score)
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
function GiveMoney(money) -- might not work as intended rn but i cba it works for scratchoff
    G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + money
    G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
    return {
        dollars = money
    }
end
function GetPlayedHandLevel()
    local text = G.FUNCS.get_poker_hand_info(G.play.cards)
    local level = to_number(G.GAME.hands[text].level)
    return level
end
SMODS.Atlas {
    key = "brownsealatlas",
    path = "brownseal.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = "filledsealatlas",
    path = "filledseal.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = "whitedeckatlas",
    path = "whitedeck.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = "familartarotvouchert1atlas",
    path = "familartarotvouchert1.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = "vouchercashbackatlas",
    path = "cashback.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = "latejokeratlas",
    path = "latejoker.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = "manwhosoldtheworldatlas",
    path = "manwhosoldtheworld.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = "slotmachinetagatlas",
    path = "slotmachinetag.png",
    px = 34,
    py = 34
}
SMODS.Atlas {
    key = "cryptid_setatlas",
    path = "set.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = "cryptid_getatlas",
    path = "get.png",
    px = 71,
    py = 95
}
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
    atlas = "brownsealatlas",
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
    atlas = "filledsealatlas",
    pos = {x=0,y=0},
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
SMODS.Back { -- bazaar deck if it was approximately equivalent in strength
    name = "White Deck",
    key = "whitedeck",
    loc_txt = {
        name = "White Deck",
        text = {
            "Start run with",
            "{C:dark_edition,T:v_glow_up}#1#{},",
            "{C:dark_edition,T:v_blank}#2#{},",
            "{C:money,T:v_seed_money}#3#{},",
            "+1 {C:attention}hand size{}"
        }
    },
    unlocked = true,
    discovered = true,
	config = {vouchers = {"v_glow_up","v_blank","v_seed_money"}},
    loc_vars = function(self, info_queue, center)
        return {vars = {localize{type = 'name_text', key = 'v_glow_up', set = 'Voucher'}, localize{type = 'name_text', key = 'v_blank', set = 'Voucher'}, localize{type = 'name_text', key = 'v_seed_money', set = 'Voucher'}}}
    end,
    pos = {x=0,y=0},
    atlas = "whitedeckatlas",
    apply = function(self, back)
        G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + 1
    end
}
--SMODS.Voucher {
--    name = "Black Voucher",
--    key = "blackvoucher",
--
--}

--SMODS.Joker({
    --     key = "KEY",
    
    --     loc_vars = function(self, info_queue, card)
    --                 return {
    --                     vars = {
    --                     }
    --                 }
    --     end,
    --     cost = 1,
    --     rarity = 1,
    --     blueprint_compat = false,
    --     eternal_compat = true,
    --     unlocked = true,
    --     discovered = true,
    --     atlas = 'jokers',
    --     pos = {
    --         x = 4,
    --         y = 0
    --     },
    -- 	config = {
    --         extra = {
    --         }
    --     },
    
    --     calculate = function(self, card, context)
    --         return true
    --     end
    -- })
--SMODS.Joker {
--    key = "executioner"
--}
SMODS.Joker {
    key = "vouchercashbackjoker",
    loc_txt = {
        name = "Cash Back",
        text = {
            "Gives {C:money}$#1#{} at the end of round",
            "for each {C:attention}voucher{} redeemed in the run.",
            "{C:inactive}(Currently {}{C:money}$#2#{}{C:inactive}){}"
        }
    },
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
    atlas = "vouchercashbackatlas",
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
            local getamount = GetAmountOfRedeemedVouchers() or 0
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
SMODS.Joker {
    key = "pocketaces",
    loc_txt = {
        name = "Pocket Aces",
        text = {
            "Gives {C:mult}+#1# Mult{} and is {C:attention}destroyed{}",
            "if played hand is a {C:attention}Pair{} and only",
            "contains {C:attention}Aces{}"
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
            }
        }
    end,
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    demicoloncompat = true,
    discovered = true,
    atlas = "vouchercashbackatlas",
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            mult = 50
        }
    },
    calculate = function(self, card, context)
        local count = 0
        if context.joker_main then -- remove(self, card, context, true)
            for k, v in ipairs(context.full_hand) do
                if v:get_id() == 14 then count = count + 1 end
            end
            if next(context.poker_hands['Pair']) and count == 2 then
                count = 0 
                DestroySelfJoker(card)
                return {
                    mult_mod = card.ability.extra.mult,
                    message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
                }
            end
        end
        if context.forcetrigger then -- remove(self, card, context, true)
            DestroySelfJoker(card)
                return {
                    mult_mod = card.ability.extra.mult,
                    message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
                }
        end
    end
}
SMODS.Joker {
    key = "starsinthesky",
    loc_txt = {
        name = "Stars In The Sky",
        text = { -- {C:attention}{}
            "When a {C:blue}Planet{} card is {C:attention}used{},",
            "generates a {C:attention}The Star{} {C:purple}tarot{} card"
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.c_star
        return {}
    end,
    cost = 4,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    demicoloncompat = true,
    discovered = true,
    atlas = "vouchercashbackatlas",
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            moneygiven = 5
        }
    },
    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.config.center.set == 'Planet' then -- remove(self, card, context, true)
            G.E_MANAGER:add_event(Event({
                func = (function()
                    G.E_MANAGER:add_event(Event({
                        func = function() 
                            local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, "c_star", 'car')
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 0
                            return true
                        end}))   
                        card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})                       
                    return true
                end)}))
        end
        if context.forcetrigger then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    G.E_MANAGER:add_event(Event({
                        func = function() 
                            local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, "c_star", 'car')
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 0
                            return true
                        end}))   
                        card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})                       
                    return true
                end)}))
        end
    end
}
SMODS.Joker {
    key = "themanwhosoldtheworld",
    loc_txt = {
        name = "Venom Snake",
        text = { -- {C:attention}{}
            "Gains {X:mult,C:white} X#2#{} Mult{}",
            "when a {C:attention}The World{} {C:purple}tarot{} card is {C:attention}sold{}",
            "{C:inactive}(Currently {}{X:mult,C:white} X#1#{} {C:inactive}Mult{}{C:inactive}){}"
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.c_world
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xmultgain
            }
        }
    end,
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    demicoloncompat = true,
    discovered = true,
    atlas = "manwhosoldtheworldatlas",
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            xmult = 1,
            xmultgain = 0.75
        }
    },
    calculate = function(self, card, context)
        if context.selling_card and context.card.config.center.key == "c_world" then -- remove(self, card, context, true)
            -- add XMult
            local xmultvar = card.ability.extra.xmult + card.ability.extra.xmultgain
            card.ability.extra.xmult = xmultvar
            return {
                message = localize('k_upgrade_ex')
            }
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
        if context.forcetrigger then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}
SMODS.Joker {
    key = "latejoker",
    loc_txt = {
        name = "Late Joker",
        text = { -- {C:attention}{}
            "{X:purple,C:white} X#1#{} Score{}",
            "at {C:attention}end of round{}"
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xscore,
                card.ability.extra.ismulted
            }
        }
    end,
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    demicoloncompat = true,
    discovered = true,
    atlas = "latejokeratlas",
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            xscore = 5,
            ismulted = true
        }
    },
    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.extra.ismulted = false
        end
        if context.end_of_round and card.ability.extra.ismulted == false then -- chess battle advanced (i have no clue if this will work)
            XScore(card) -- update: it worked but went through multiple times for some reason. hoping ismulted will fix it
            card.ability.extra.ismulted = true
        end
        if context.forcetrigger then
            XScore(card)
        end 
    end
}
SMODS.Joker {
    key = "starcounting",
    loc_txt = {
        name = "Star Counting",
        text = { -- {C:attention}{}
            "Gives {C:purple}Score{} equal to",
            "the {C:attention}level of played hand{} {X:purple,C:white} ^#1#{}"
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.expamount,
                card.ability.extra.ismulted
            }
        }
    end,
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    demicoloncompat = true,
    discovered = true,
    atlas = "latejokeratlas",
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            expamount = 6,
            ismulted = true
        }
    },
    calculate = function(self, card, context)
        if context.before then
            card.ability.extra.ismulted = false
        end
        if context.after and card.ability.extra.ismulted == false then -- chess battle advanced (i have no clue if this will work)
            local level = GetPlayedHandLevel()
            local score = level ^ card.ability.extra.expamount
            PlusScore(card, score) -- update: it worked but went through multiple times for some reason. hoping ismulted will fix it
            card.ability.extra.ismulted = true
        end
        if context.forcetrigger then
            local level = GetPlayedHandLevel()
            local score = level ^ card.ability.extra.expamount
            PlusScore(card, score)
        end 
    end
}
SMODS.Voucher {
    name = "Black Voucher",
    key = "blackvouchert1",
    loc_txt = {
        name = "Black Voucher",
        text = {
            "+#1#{C:dark_edition} Joker slots{}",
            "{C:blue}#2#{} hands"
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.jokerslots,
                card.ability.extra.hands
            }
        }
    end,
    atlas = 'familartarotvouchert1atlas',
    pos = {
        x = 0,
        y = 0
    },
    config = { 
        extra = { 
            jokerslots = 1,
            hands = -1
        }
    },
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then 
                    G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.jokerslots
                end
                G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
                ease_hands_played(card.ability.extra.hands)
                return true
            end
        }))
    end
}
SMODS.Voucher {
    name = "Blacker Voucher",
    key = "blackvouchert2",
    loc_txt = {
        name = "Blacker Voucher",
        text = {
            "+#1#{C:dark_edition} Joker slots{}",
            "{C:red}#2#{} discards"
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.jokerslots,
                card.ability.extra.discards
            }
        }
    end,
    atlas = 'familartarotvouchert1atlas',
    pos = {
        x = 0,
        y = 0
    },
    config = { 
        extra = { 
            jokerslots = 1,
            discards = -1
        }
    },
    requires = {
        "v_SSS_blackvouchert1"
    },
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then 
                    G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.jokerslots
                end
                G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discards
                ease_discard(card.ability.extra.discards)
                return true
            end
        }))
    end
}
SMODS.Tag {
    key = "slotmachinetag",
    atlas = "slotmachinetagatlas",
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
    loc_txt = {
        name = "Slot Machine Tag",
        text = {
            "{C:green}#1# in #2# chance{} to",
            "give {C:money}$#3#{}"
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
if FamiliarInstalled then
    SMODS.Voucher {
       name = "Familiar Vendor",
       key = "familiartarotvouchert1",
       loc_txt = {
          name = "Familiar Vendor",
         text = {
             "{C:dark_edition}Fortune{} cards may now",
             "appear in the shop"
         }
     },
     loc_vars = function(self, info_queue, card)
         return {
             vars = {
                  card.ability.extra.multiplier
             }
         }
     end,
     atlas = 'familartarotvouchert1atlas',
     pos = {
         x = 0,
            y = 0
     },
        config = { extra = { multiplier = 2 }},
        redeem = function(self, card)
            G.GAME.familiar_tarots_rate = 1
        end
    }
    SMODS.Voucher {
        name = "Familiar Shipment",
        key = "familiartarotvouchert2",
        loc_txt = {
            name = "Familiar Shipment",
            text = {
                "{C:dark_edition}Fortune{} cards appear in the shop",
                "{C:attention}2X{} more often"
            }
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.multiplier
                }
            }
        end,
        atlas = 'familartarotvouchert1atlas',
        pos = {
            x = 0,
            y = 0
        },
        requires = {
            "v_SSS_familiartarotvouchert1"
        },
        config = { extra = { multiplier = 2 }},
        redeem = function(self, card)
            G.GAME.familiar_tarots_rate = G.GAME.familiar_tarots_rate * card.ability.extra.multiplier
        end
    }
    SMODS.Back { -- tarot cards yeahhh
    name = "Tarot Enthusiast Deck",
    key = "tarotenthusiastdeck",
    loc_txt = {
        name = "Tarot Enthusiast Deck",
        text = {
            "Start run with",
            "{C:dark_edition,T:v_SSS_familiartarotvouchert2}#1#{},",
            "{C:dark_edition,T:v_tarot_tycoon}#2#{}"
        }
    },
    unlocked = true,
    discovered = true,
	config = {vouchers = {"v_SSS_familiartarotvouchert1", "v_SSS_familiartarotvouchert2","v_tarot_tycoon"}},
    loc_vars = function(self, info_queue, center)
        return {vars = {localize{type = 'name_text', key = 'v_SSS_familiartarotvouchert2', set = 'Voucher'}, localize{type = 'name_text', key = 'v_tarot_tycoon', set = 'Voucher'}}}
    end,
    pos = {x=0,y=0},
    atlas = "whitedeckatlas", -- for now, give it its own later
    }   
end
if CryptidInstalled then
    print("[SillyStuff] Cryptid installed, adding cross mod...")
    SMODS.Joker {
        key = "cryptid_codingwork",
        loc_txt = {
            name = "Coding Work",
            text = { -- {C:attention}{}
                "When a {C:green}Code{} card is {C:attention}used{},",
                "gives {C:money}$#1#{}"
            }
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.moneygiven
                }
            }
        end,
        cost = 4,
        rarity = 1,
        blueprint_compat = true,
        eternal_compat = true,
        discovered = true,
        atlas = "vouchercashbackatlas",
        pos = {
            x = 0,
            y = 0
        },
        config = {
            extra = {
                moneygiven = 5
            }
        },
        calculate = function(self, card, context)
            if context.using_consumeable and context.consumeable.config.center.set == 'Code' then -- remove(self, card, context, true)
                return {dollars = card.ability.extra.moneygiven}
            end
        end
    }
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
        atlas = "cryptid_setatlas",
        pos = {
            x = 0,
            y = 0
        },
        can_use = function(self, card)
            if G.STATE == G.STATES.SHOP then
                return true
            else
                return false
            end
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
        atlas = "cryptid_getatlas",
        pos = {
            x = 0,
            y = 0
        },
        can_use = function(self, card)
            if G.STATE == G.STATES.SHOP then
                return true
            else
                return false
            end
        end,
        use = function(self, card, area)
            print("hello.")
            ease_dollars(G.GAME.current_round.reroll_cost)
            return {dollars = G.GAME.current_round.reroll_cost}
        end
    }
    --SMODS.Achievement 
   -- { -- for a Banana stickered Gros Michel
    --    key = "bananabanana",
    --    loc_text = {
    --        name = 'Banana Banana', 
    --        description = {
    --            "Get a Banana stickered",
    --            "Gros Michel"
    --        }
    --    },
    --    unlock_condition = function(self, args)
    --        local jokerschecking = {}
    --        for k, v in pairs(G.jokers.cards) do
    --            jokerschecking[#jokerschecking + 1] = v
    --        end
    --        for i,v in pairs(jokerschecking) do
    --            if card.ability[sticker_key]
    --        end
    --    end
    --}
end
if PTAInstalled then -- paya's crossmod chicanery
    SMODS.Joker {
        key = "droppeddollars",
        blueprint_compat = true,
        perishable_compat = true,
        loc_txt = {
            name = "Yen on a Rope",
            text = {
                "When {C:attention}shop is rerolled{},",
                "gain {C:attention}#1#{} {C:BLUE}pyroxene{}"
            }
        },
        rarity = 1,
        cost = 1,
        pos = { x = 0, y = 0 },
        config = {
            extra = {
                pyroxenes = 1
            }
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.pyroxenes
                }
            }
        end,
        calculate = function(self, card, context)
            if context.reroll_shop then
                if TalismanInstalled then
                    ease_pyrox(to_number(card.ability.extra.pyroxenes))
                else
                    ease_pyrox(card.ability.extra.pyroxenes)
                end
                return {
						message = 'Pyroxene Get!',
						colour = G.C.BLUE
                }
            end
        end
    }
end
if false then -- jokers here are disabled
    SMODS.Joker {
        key = "craps",
        loc_txt = {
            name = "Craps",
            text = {
                "Gains {C:mult}+3 Mult{} at beginning of round",
                "{C:green}#3# in 6{} chance to lose it all"
            }
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.multgain,
                    card.ability.extra.mult,
                    card.ability.extra.chance
                }
            }
        end,
        cost = 7,
        rarity = 1,
        blueprint_compat = true,
        eternal_compat = true,
        discovered = true,
        atlas = "vouchercashbackatlas",
        pos = {
            x = 0,
            y = 0
        },
        config = {
            extra = {
                mult = 0,
                multgain = 3,
                odds = 6
            }
        },
        calculate = function(self, card, context)
            if context.setting_blind then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multgain
                return {
                    message = 'Upgraded!',
                    colour = G.C.RED
                }
            end
            -- Add the chips in main scoring context
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult
                }
            end
            if context.end_of_round then
                if (pseudorandom('craps') < G.GAME.probabilities.normal / card.ability.extra.odds) then
                    card.ability.extra.mult = 0
                end
            end
        end
    }
    SMODS.Joker {
    key = "scratchoff",
    loc_txt = {
        name = "Scratch Off",
        text = {
            "{C:attention}Lucky{} cards held in hand are {C:attention}destroyed{}",
            "and give {C:money}$#1#-#2#{} dollars"
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.min,
                card.ability.extra.max
            }
        }
    end,
    cost = 7,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    discovered = true,
    atlas = "vouchercashbackatlas",
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            max = 15,
            min = 5
        }
    },
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if context.other_card.ability.name == 'Lucky Card' then
                local tempmoney = pseudorandom('scratchoff', card.ability.extra.min, card.ability.extra.max)
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + tempmoney
                G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
                return {
                    dollars = tempmoney,
                    message_card = context.other_card,
                    colour = G.C.MONEY
                }
            end
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if context.other_card.ability.name == 'Lucky Card' then
                return {
                    remove = true
                }
            end
        end
    end
}
end