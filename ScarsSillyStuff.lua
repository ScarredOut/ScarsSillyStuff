SSS = SMODS.current_mod
if not SMODS.find_mod("Cryptid") then -- mod check list (this mod's priority is so high because i plan on adding a lot of crossmod stuff)
    print("[SillyStuff] Cryptid not installed.")
    SSS.CryptidInstalled = false
else
    SSS.CryptidInstalled = true
end
if not SMODS.find_mod("Familiar") then
    print("[SillyStuff] Familiar not installed.")
    SSS.FamiliarInstalled = false
else
    SSS.FamiliarInstalled = true
end
if not SMODS.find_mod("Paya's Terrible Additions") then
    print("[SillyStuff] Paya's Terrible Additions not installed.")
    SSS.PTAInstalled = false
else
    SSS.PTAInstalled = true
end
if not SMODS.find_mod("Talisman") then
    print("[SillyStuff] Talisman not installed.")
    SSS.TalismanInstalled = false
else
    SSS.TalismanInstalled = true
end
if not SMODS.find_mod("Yahimod") then
    print("[SillyStuff] Yahimod not installed.")
    SSS.YahimodInstalled = false
else
    SSS.YahimodInstalled = true
end
local files = {
    "func/misc",
    "content/atlas",
    "content/tag",
    "content/voucher",
    "content/seal",
    "content/deck",
    "content/joker/common",
    "content/joker/uncommon",
    "content/joker/rare",
}
local FamiliarFiles = {
    "content/crossmod/Familiar/deck",
    "content/crossmod/Familiar/voucher",
}
local CryptidFiles = {
    "content/crossmod/Cryptid/code",
    "content/crossmod/Cryptid/joker/common",
}
local PTAFiles = {
    "content/crossmod/PTA/joker/common",
}
for i, v in pairs(files) do
	assert(SMODS.load_file(v..".lua"))()
end

if SSS.FamiliarInstalled then
    for i, v in pairs(FamiliarFiles) do
	    assert(SMODS.load_file(v..".lua"))()
    end
end
if SSS.CryptidInstalled then
    print("[SillyStuff] Cryptid installed, adding cross mod...")
    for i, v in pairs(CryptidFiles) do
	    assert(SMODS.load_file(v..".lua"))()
    end
end
if SSS.PTAInstalled then -- paya's crossmod chicanery
    for i, v in pairs(PTAFiles) do
	    assert(SMODS.load_file(v..".lua"))()
    end
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