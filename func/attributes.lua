--[[
Attributes that i think will be helpful

Criteria for addition:
selfdestruct: Items that destroy themselves (ex: Pocket Aces)
crossmod: Items added by this mod that are only present when another mod is active (ex: Coding Work)
trash: Items that have no meaningful effect on gameplay (ex: Late Joker)
minusscore: Items that subtract score (ex: Key and Chain)
seal_spectral: Spectral cards that apply seals to cards (ex: Talisman)
edition_tag: Tags that give cards in the shop an edition (ex: Negative Tag)

]]

SMODS.Attribute {
    key = "selfdestruct",
    keys = {
        "j_gros_michel",
        "j_cavendish"
    }
}
SMODS.Attribute {
    key = "crossmod"
}
SMODS.Attribute {
    key = "trash"
}
SMODS.Attribute {
    key = "minusscore"
}
SMODS.Attribute {
    key = "seal_spectral",
    keys = {
       "c_talisman",
       "c_deja_vu",
       "c_trance",
       "c_medium"
    }
}
SMODS.Attribute {
    key = "edition_tag",
    keys = {
       "tag_negative", -- Vanilla
       "tag_holo",
       "tag_foil",
       "tag_polychrome",
       "tag_cry_glitched", -- Cryptid
       "tag_cry_oversat",
       "tag_cry_mosaic",
       "tag_cry_gold",
       "tag_cry_glass",
       "tag_cry_blur",
       "tag_cry_astral",
       "tag_cry_m",
       "tag_crv_sunwashed", -- Revo's Vault
       "tag_crv_pastel",
       "tag_crv_bloom",
       "tag_crv_magnetised",
       "tag_crv_antichrome",
       "tag_crv_radiated",
       "tag_fam_aureate", -- Familiar
       "tag_fam_speckle",
       "tag_fam_statics",
       "tag_zero_gala", -- 0 ERROR
       "tag_zero_occult",
    }
}



-- and one more thing to remind myself: once star counting and stars in the sky have art im adding them to the space joker pool