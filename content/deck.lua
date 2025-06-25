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