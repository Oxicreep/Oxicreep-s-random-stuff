SMODS.Joker{ --Frieren
    key = "frieren_wake_up",
    config = {
        extra = {
            pb_mult_c4744d07 = 2.5,
            perma_mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Frieren',
        ['text'] = {
            [1] = 'Every scored card permanently',
            [2] = 'gains {C:red}+2.5{} Mult when scored and',
            [3] = 'lose all {C:dark_edition}Editions{}, {C:attention}Seals{}, and {C:enhanced}Enhancements{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 0
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rif' and args.source ~= 'sou' and args.source ~= 'uta' 
          or args.source == 'rta' or args.source == 'wra'
          )
          and true
      end
    ,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                context.other_card:set_ability(G.P_CENTERS.c_base)
                context.other_card:set_seal(nil)
                context.other_card:set_edition(nil)
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.pb_mult_c4744d07
                return {
                    message = "Card Modified!",
                    extra = {
                        extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card,
                        colour = G.C.MULT
                        }
                }
        end
    end
}