SMODS.Back { -- tarot cards yeahhh
    name = "Tarot Enthusiast Deck",
    key = "tarotenthusiast",
    unlocked = true,
    discovered = true,
	config = {vouchers = {"v_sss_familiartarotvouchert1", "v_sss_familiartarotvouchert2","v_tarot_tycoon"}},
    loc_vars = function(self, info_queue, center)
        return {vars = {localize{type = 'name_text', key = 'v_sss_familiartarotvouchert2', set = 'Voucher'}, localize{type = 'name_text', key = 'v_tarot_tycoon', set = 'Voucher'}}}
    end,
    atlas = "SSSDecks",
    pos = {
        x = 0,
        y = 0
    },
}