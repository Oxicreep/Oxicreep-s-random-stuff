SMODS.Joker{ --2B
    key = "2b",
    config = {
        extra = {
            Chips = 0
        }
    },
    loc_txt = {
        ['name'] = '2B',
        ['text'] = {
            [1] = 'This Joker gain {C:blue}10{} Chips every time a',
            [2] = '{C:attention}card{} with a {C:attention}dark suit{} is scored',
            [3] = '{C:inactive}(Currently {C:blue}+#1#{C:inactive}){}{}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Chips}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs") then
                card.ability.extra.Chips = (card.ability.extra.Chips) + 10
                return {
                    message = "Upgrade"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = card.ability.extra.Chips
                }
        end
    end
}