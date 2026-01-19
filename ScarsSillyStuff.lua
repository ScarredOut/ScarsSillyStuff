SSS = SMODS.current_mod
if next(SMODS.find_mod("Cryptid")) then -- mod check list (this mod's priority is so high because i plan on adding a lot of crossmod stuff)
    print("[SillyStuff] Cryptid installed.")
    SSS.CryptidInstalled = true
else
    SSS.CryptidInstalled = false
end
if next(SMODS.find_mod("Familiar")) then
    print("[SillyStuff] Familiar installed.")
    SSS.FamiliarInstalled = true
else
    SSS.FamiliarInstalled = false
end
if next(SMODS.find_mod("Paya's Terrible Additions")) then
    print("[SillyStuff] Paya's Terrible Additions installed.")
    SSS.PTAInstalled = true
else
    SSS.PTAInstalled = false
end
if next(SMODS.find_mod("Talisman")) then
    print("[SillyStuff] Talisman installed.")
    SSS.TalismanInstalled = true
else
    SSS.TalismanInstalled = false
end
if next(SMODS.find_mod("Yahimod")) then
    print("[SillyStuff] Yahimod installed.")
    SSS.YahimodInstalled = true
else
    SSS.YahimodInstalled = false
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
end