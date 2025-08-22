SMODS.Joker{ --No-Left
    key = "no_left",
    config = {
        extra = {
            xchips = 10
        }
    },
    loc_txt = {
        ['name'] = 'No-Left',
        ['text'] = {
            [1] = '{X:blue,C:white}x10{} Chips if this is the {C:attention}rightmost {}Joker',
            [2] = '{s:0.8,C:inactive}Can you beat ___ without going left ?',
            [3] = '{s:0.6,C:inactive}No{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 1
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
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
          or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end
    ,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
        return G.jokers.cards[#G.jokers.cards] == card
    end)() then
                return {
                    x_chips = card.ability.extra.xchips
                }
            end
        end
    end
}