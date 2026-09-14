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
    vouchers = {
        {id = 'v_hone'},
        {id = 'v_glow_up'}
    },
    restrictions = {}
}