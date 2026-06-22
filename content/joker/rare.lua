SMODS.Joker {
    key = "starsinthesky",
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.c_star
        return {}
    end,
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    demicoloncompat = true,
    discovered = true,
    atlas = "SSSPlaceholders",
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            moneygiven = 5
        }
    },
    attributes = {
        "planet",
        "tarot",
        "generation"
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
    key = "venomsnake",
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
    atlas = "SSSJokers",
    pos = {
        x = 1,
        y = 0
    },
    config = {
        extra = {
            xmult = 1,
            xmultgain = 1
        }
    },
    attributes = {
        "xmult",
        "scaling",
        "tarot"
    },
    calculate = function(self, card, context)
        if context.selling_card and context.card.config.center.key == "c_world" then -- remove(self, card, context, true)
           SMODS.scale_card(card, {
	            ref_table = card.ability.extra, -- the table that has the value you are changing in
                ref_value = "xmult", -- the key to the value in the ref_table
	            scalar_value = "xmultgain", -- the key to the value to scale by, in the ref_table by default
            })
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
    key = "starcounting",
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
    atlas = "SSSPlaceholders",
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            expamount = 5,
            ismulted = true
        }
    },
    attributes = {
        "score",
        "hand_type"
    },
    calculate = function(self, card, context)
        if context.before then
            card.ability.extra.ismulted = false
        end
        if context.final_scoring_step and card.ability.extra.ismulted == false then -- chess battle advanced (i have no clue if this will work)
            local level = SSS.GetPlayedHandLevel()
            local addscore = level ^ card.ability.extra.expamount
            card.ability.extra.ismulted = true
            return {
                score = addscore
            }
        end
        if context.forcetrigger then
            local level = SSS.GetPlayedHandLevel()
            local addscore = level ^ card.ability.extra.expamount
            return {
                score = addscore
            }
        end 
    end
}
