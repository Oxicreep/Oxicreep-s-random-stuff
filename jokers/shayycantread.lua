SMODS.Joker{ --I cant read im an UNDERTALE fan
    key = "shayycantread",
    config = {
        extra = {
            repetitions = 5
        }
    },
    loc_txt = {
        ['name'] = 'I cant read im an UNDERTALE fan',
        ['text'] = {
            [1] = 'Retrigger {s:0.5,C:inactive} not{} the factors of the number {C:dark_edition}20954472{} {C:attention}5{} times'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 1
    },
    cost = 5,
    rarity = "oxicreep_random_unknown",
    blueprint_compat = true,
    eternal_compat = true,
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
            if (context.other_card:get_id() == 5 or context.other_card:get_id() == 9 or context.other_card:get_id() == 10) then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}