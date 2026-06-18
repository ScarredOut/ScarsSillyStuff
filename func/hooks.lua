local gcp = get_current_pool
function get_current_pool(_type, _rarity, _legendary, _append)
	if _type == "Tag" and G.GAME.modifiers.sss_tagenthusiast then 
        P_SSS_TAGS = {} -- i just stole this from cryptid and hacked it together to work for me lowkey
		for k, v in pairs(G.P_CENTER_POOLS["Tag"]) do
			P_SSS_TAGS[#P_SSS_TAGS + 1] = v.key
		end
		if #P_SSS_TAGS <= 0 then
			P_SSS_TAGS[#P_SSS_TAGS + 1] = "tag_foil" -- if for some ungodly reason we can't find any tags at all use foil (if there's no foil tag god help us)
		end
		return P_SSS_TAGS, "sss_tagenthusiast" .. G.GAME.round_resets.ante -- why does it append the ante? I don't know but i'm going to keep it in case it's loadbearing
    end
	return gcp(_type, _rarity, _legendary, _append)
end

-- mod contained functions (technically not hooks but uhhh close enough ok)

function SMODS.current_mod.calculate(self, context)
	-- Well I don't need it yet....
end

function SMODS.current_mod.calc_dollar_bonus(self)
	-- I was going to use this for making generous pay out during the cashout but im lazy + generous is supposed to be inverted rental and rental doesn't do that either
end