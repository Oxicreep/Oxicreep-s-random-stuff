SMODS.Joker{ --The Roaring Fraud
    key = "roaringfraud",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'The Roaring Fraud',
        ['text'] = {
            [1] = 'If {C:attention}first hand{} of round has only{C:attention} 1{} card,',
            [2] = 'it become a {C:dark_edition}void{} card',
            [3] = '{s:0.4}(It\'s just void joker but worse and more expensive){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 3
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'rta' and args.source ~= 'sou' and args.source ~= 'uta' and args.source ~= 'wra' 
          or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif'
          )
          and true
      end
    ,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (#context.full_hand == 1 and G.GAME.current_round.hands_played == 0) then
                context.other_card:set_ability(G.P_CENTERS.m_oxicreep_random_voidcard)
                return {
                    message = "Card Modified!"
                }
            end
        end
    end
}