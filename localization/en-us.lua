return {
    descriptions = {
        Back = {
            b_sss_white = {
                name = "White Deck",
                text = {
                    "Start run with",
                    "{C:dark_edition,T:v_glow_up}#1#{},",
                    "{C:dark_edition,T:v_blank}#2#{},",
                    "{C:money,T:v_seed_money}#3#{},",
                    "+1 {C:attention}hand size{}"
                }
            },
            b_sss_tarotenthusiast = {
                name = "Tarot Enthusiast Deck",
                text = {
                    "Start run with",
                    "{C:dark_edition,T:v_SSS_familiartarotvouchert2}#1#{},",
                    "{C:dark_edition,T:v_tarot_tycoon}#2#{}"
                }
            },
            b_sss_tagenthusiast = {
                name = "Tag Enthusiast Deck",
                text = {
                    "All {C:attention}tags{} may appear at {C:attention}any time{}",
                    "Start with an {C:attention}Eternal{} {C:attention, T:j_throwback}Throwback{}"
                }
            }
        },
        Joker = {
            j_sss_pocketaces = {
                name = "Pocket Aces",
                text = {
                    "Gives {C:mult}+#1# Mult{} and is {C:attention}destroyed{}",
                    "if played hand is a {C:attention}Pair{} and only",
                    "contains {C:attention}Aces{}"
                }
            },
            j_sss_latejoker = {
                name = "Late Joker",
                text = {
                    "{X:purple,C:white} X#1#{} Score{}",
                    "at {C:attention}end of round{}"
                }
            },
            j_sss_cryp_codingwork = {
                name = "Coding Work",
                text = {
                    "When a {C:green}Code{} card is {C:attention}used{},",
                    "gives {C:money}$#1#{}"
                }
            },
            j_sss_paya_yenonrope = {
                name = "Yen on a Rope",
                text = {
                    "When {C:attention}shop is rerolled{},",
                    "gain {C:attention}#1#{} {C:BLUE}pyroxene{}"
                }
            },
            j_sss_cashback = {
                name = "Cash Back",
                text = {
                    "Gives {C:money}$#1#{} at the end of round",
                    "for each {C:attention}voucher{} redeemed in the run",
                    "{C:inactive}(Currently {}{C:money}$#2#{}{C:inactive}){}"
                }
            },
            j_sss_starsinthesky = {
                name = "Stars In The Sky",
                text = {
                    "When a {C:planet}Planet{} card is {C:attention}used{},",
                    "generates a {C:attention}The Star{} {C:purple}tarot{} card"
                }
            },
            j_sss_venomsnake = {
                name = "Venom Snake",
                text = {
                    "Gains {X:mult,C:white} X#2#{} Mult{}",
                    "when a {C:attention}The World{} {C:purple}tarot{} card is {C:attention}sold{}",
                    "{C:inactive}(Currently {}{X:mult,C:white} X#1#{} {C:inactive}Mult{}{C:inactive}){}"
                }
            },
            j_sss_starcounting = {
                name = "Star Counting",
                text = {
                    "Gives {C:purple}Score{} equal to",
                    "the {C:attention}level of played hand{} {X:purple,C:white} ^#1#{}"
                }
            },
            j_sss_scratchoff = {
                name = "Scratch Off",
                text = {
                    "{C:attention}Lucky{} cards held in hand are {C:attention}destroyed{}",
                    "and give {C:money}$#1#-#2#{} dollars"
                }
            },
            j_sss_energywarning = {
                name = "Energy Warning",
                text = {
                    "When {C:attention}Blind{} selected, if you have {C:money}$#1#{} or less,",
                    "create a {C:attention}The Hermit{}",
                    "{C:inactive}(Must have room){}",
                    "{C:inactive,s:0.8}You can learn more about energy too.{}"
                }
            },
            j_sss_purplejoker = {
                name = "Purple Joker",
                text = {
                    "Gives {C:purple}+#1# Score{} for each",
                    "remaining card in {C:attention}deck{}",
                    "{C:inactive}(Currently {C:purple}+#2#{C:inactive} Score)",
                }
            },
            j_sss_keyandchain = {
                name = "Key and Chain",
                text = {
                    "{X:mult,C:white} X#1#{} Mult{}",
                    "{C:purple}-#2#{} Score"
                }
            }
        },
        Tag = {
            tag_sss_slotmachine = {
                name = "Slot Machine Tag",
                text = {
                    "{C:green}#1# in #2# chance{} to",
                    "give {C:money}$#3#{}"
                }
            }
        },
        Voucher = {
            v_sss_familiartarotvouchert1 = {
                name = "Familiar Vendor",
                text = {
                    "{C:dark_edition}Fortune{} cards may now",
                    "appear in the shop"
                }
            },
            v_sss_familiartarotvouchert2 = {
                name = "Familiar Shipment",
                text = {
                    "{C:dark_edition}Fortune{} cards appear in the shop",
                    "{C:attention}2X{} more often"
                }
            },
            v_sss_blackvouchert1 = {
                name = "Black Voucher",
                text = {
                    "+#1#{C:dark_edition} Joker slots{}",
                    "{C:blue}#2#{} hands"
                }
            },
            v_sss_blackvouchert2 = {
                name = "Blacker Voucher",
                text = {
                    "+#1#{C:dark_edition} Joker slots{}",
                    "{C:red}#2#{} discards"
                }
            }
        },
    }
}
