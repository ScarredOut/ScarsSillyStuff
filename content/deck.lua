SMODS.Back { -- bazaar deck if it was approximately equivalent in strength
    name = "White Deck",
    key = "white",
    unlocked = true,
    discovered = true,
	config = {vouchers = {"v_glow_up","v_blank","v_seed_money"}},
    loc_vars = function(self, info_queue, center)
        return {vars = {localize{type = 'name_text', key = 'v_glow_up', set = 'Voucher'}, localize{type = 'name_text', key = 'v_blank', set = 'Voucher'}, localize{type = 'name_text', key = 'v_seed_money', set = 'Voucher'}}}
    end,
    atlas = "SSSDecks",
    pos = {
        x = 0,
        y = 0
    },
    apply = function(self, back)
        G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + 1
    end
}
SMODS.Back {
    name = "Tag Enthusiast Deck",
    key = "tagenthusiast",
    unlocked = true,
    discovered = true,
	config = {},
    loc_vars = function(self, info_queue, center)
        return {vars = {localize{type = 'name_text', key = 'j_throwback', set = 'Joker'}}}
    end,
    atlas = "SSSDecks",
    pos = {
        x = 0,
        y = 0
    },
    apply = function(self, back)
        G.GAME.modifiers.sss_tagenthusiast = true
        G.E_MANAGER:add_event(Event({
			func = function()
               if G.jokers then -- i would have used SMODS.add_card but I was too stupid to get it to work so this will do
					local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_throwback")
					card:add_to_deck()
					card:start_materialize()
					card:set_eternal(true)
					G.jokers:emplace(card)
					return true
				end
            end,
		}))
    end
}