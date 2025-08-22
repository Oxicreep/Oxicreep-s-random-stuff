SMODS.Joker{ --Cibbles CD
    key = "cibblescd",
    config = {
        extra = {
            repetitions = 15
        }
    },
    loc_txt = {
        ['name'] = 'Cibbles CD',
        ['text'] = {
            [1] = '{C:attention}Retrigger{} every {C:attention}7{} of {C:spades}Spade{} {C:attention}15{} times',
            [2] = '{s:0.8,C:inactive}Hey Undyne what\'s 5 + 2 ?{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    cost = 5,
    rarity = "oxicreep_random_unknown",
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rif' and args.source ~= 'rta' and args.source ~= 'sou' and args.source ~= 'uta' and args.source ~= 'wra' 
           
          )
          and true
      end
    ,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if (context.other_card:get_id() == 7 and context.other_card:is_suit("Spades")) then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}