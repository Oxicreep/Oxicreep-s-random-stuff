SMODS.Joker{ --Spamton NEO
    key = "spamton_neo",
    config = {
        extra = {
            emult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Spamton NEO',
        ['text'] = {
            [1] = '{X:edition,C:white}^1.5{} if hand contains at least',
            [2] = 'one {C:attention}scoring card{} with {C:dark_edition}Edition{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 2
    },
    cost = 1,
    rarity = "oxicreep_random_unknown",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
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
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
    local count = 0
    for _, playing_card in pairs(context.scoring_hand or {}) do
        if playing_card.edition ~= nil then
            count = count + 1
        end
    end
    return count >= 1
end)() then
                return {
                    e_mult = card.ability.extra.emult,
                    message = "[BIG SHOT]"
                }
            end
        end
    end
}