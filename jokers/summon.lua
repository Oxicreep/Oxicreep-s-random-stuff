SMODS.Joker{ --Summoning Demons
    key = "summon",
    config = {
        extra = {
            xchips = 3,
            echips = 1.5,
            Xmult = 3,
            emult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Summoning Demons',
        ['text'] = {
            [1] = '{X:red,C:white}DEMONS{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 2
    },
    cost = 5,
    rarity = "oxicreep_random_unknown",
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'jud' 
          or args.source == 'buf' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end
    ,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    x_chips = card.ability.extra.xchips,
                    extra = {
                        e_chips = card.ability.extra.echips,
                        colour = G.C.DARK_EDITION,
                        extra = {
                            Xmult = card.ability.extra.Xmult,
                        extra = {
                            e_mult = card.ability.extra.emult,
                            colour = G.C.DARK_EDITION
                        }
                        }
                        }
                }
        end
    end
}