SMODS.Joker{ --SWEETHEART
    key = "sweetheart",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'SWEETHEART',
        ['text'] = {
            [1] = 'When a hand is played {C:attention}destroy{} all',
            [2] = 'cards {C:attention}held in hand{} except {C:attention}{C:edition}{C:rare}Queen Of Heart{}{}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 3
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
          or args.source ~= 'rif' and args.source ~= 'sou' and args.source ~= 'uta' 
          or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rta' or args.source == 'wra'
          )
          and true
      end
    ,

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            context.other_card.should_destroy = false
            if (not (context.other_card:get_id() == 12) and not (context.other_card:is_suit("Hearts"))) then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            end
        end
    end
}