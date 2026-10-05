SMODS.Challenge {
    key = "make_it_work",
    rules = {
        custom = {
            { id = 'sss_no_rerolling' },
            { id = 'sss_minus_shop_slot', value = 1 },
        --    { id = 'sss_minus_booster_slot_shop', value = 1 }, this change is shit to play with so i removed it
        }
    },
    restrictions = {
        banned_cards = {
            { id = 'v_reroll_surplus' },
            { id = 'v_reroll_glut' },
            { id = 'j_chaos' },
        }
    }
}
SMODS.Challenge {
    key = "shiny_hunting",
    rules = {
        custom = {
            { id = 'sss_edition_required_end' },
            { id = 'sss_non_edition_tags_banned_cosmetic' }
        }
    },
    restrictions = {
        -- Did you know banned_tags can take a function? I didn't
        banned_tags = function ()
            local banned_tags_list = {}
		    for k, v in pairs(G.P_CENTER_POOLS["Tag"]) do -- get all the tags. All of em
                if v.attributes then -- does this even HAVE an attributes table
                    -- looks inside
                    if not v.attributes["edition_tag"] then -- THIS... IS NOT A GOOD TAG. KILL.
                        local idtable = {}
                        idtable["id"] = v.key
                        banned_tags_list[#banned_tags_list + 1] = idtable
                    end
                else -- so you don't have one? lame, death penalty
                    local idtable = {}
                    idtable["id"] = v.key
                    banned_tags_list[#banned_tags_list + 1] = idtable
                end
		    end
            return banned_tags_list
        end
    }
}