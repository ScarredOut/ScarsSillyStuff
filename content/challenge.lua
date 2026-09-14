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
            { id = 'v_reroll_glut' }
        }
    }
}
SMODS.Challenge {
    key = "shiny_hunting",
    rules = {
        custom = {
            { id = 'sss_edition_required_end' }
        }
    },
    restrictions = { -- for how I'd like the challenge to play out I should make it go through every tag and pick out the non-edition tags but.. eh. this will do for now
        banned_tags = { -- although I will put in an attribute for it right now
            { id = 'tag_standard' },
            { id = 'tag_uncommon' },
            { id = 'tag_rare' },
            { id = 'tag_investment' },
            { id = 'tag_voucher' },
            { id = 'tag_boss' },
            { id = 'tag_standard' },
            { id = 'tag_charm' },
            { id = 'tag_meteor' },
            { id = 'tag_buffoon' },
            { id = 'tag_handy' },
            { id = 'tag_garbage' },
            { id = 'tag_ethereal' },
            { id = 'tag_coupon' },
            { id = 'tag_double' },
            { id = 'tag_juggle' },
            { id = 'tag_d_six' },
            { id = 'tag_top_up' },
            { id = 'tag_skip' },
            { id = 'tag_orbital' },
            { id = 'tag_economy' },
            { id = 'tag_sss_slotmachine' }
        }
    }
}