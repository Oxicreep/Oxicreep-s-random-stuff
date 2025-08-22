SMODS.Joker{ --Void Joker
    key = "void",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Void Joker',
        ['text'] = {
            [1] = 'Turn all {C:attention}played{} cards into {C:enhanced}void{} cards'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 3
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'rif' and args.source ~= 'rta' and args.source ~= 'sou' and args.source ~= 'wra' 
          or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'uta'
          )
          and true
      end
    ,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                context.other_card:set_ability(G.P_CENTERS.m_oxicreep_random_void)
                return {
                    message = "VOID"
                }
        end
    end
}