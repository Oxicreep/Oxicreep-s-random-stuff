SMODS.Joker{ --K-ON!
    key = "k_on",
    config = {
        extra = {
            Xmult = 5
        }
    },
    loc_txt = {
        ['name'] = 'K-ON!',
        ['text'] = {
            [1] = 'The {C:dark_edition}best {}anime ever made',
            [2] = '{C:inactive}({X:red,C:white}x5{}{C:inactive} Mult){}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 4,
        y = 1
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rif' and args.source ~= 'rta' and args.source ~= 'uta' and args.source ~= 'wra' 
          or args.source == 'sou'
          )
          and true
      end
    ,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.Xmult,
                    message = "K-ON! FOREVER!"
                }
        end
    end
}