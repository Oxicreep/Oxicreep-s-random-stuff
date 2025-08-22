SMODS.Joker{ --White Space
    key = "white_space",
    config = {
        extra = {
            discard_change = 10,
            hand_change = 1
        }
    },
    loc_txt = {
        ['name'] = 'White Space',
        ['text'] = {
            [1] = 'Sets {C:red}discards {}to {C:attention}10 {}but sets {C:blue}hands{} to {C:attention}1{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 3
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
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
    end,

    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.original_discards = G.GAME.round_resets.discards
        G.GAME.round_resets.discards = card.ability.extra.discard_change
        card.ability.extra.original_hands = G.GAME.round_resets.hands
        G.GAME.round_resets.hands = card.ability.extra.hand_change
    end,

    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.original_discards then
            G.GAME.round_resets.discards = card.ability.extra.original_discards
        end
        if card.ability.extra.original_hands then
            G.GAME.round_resets.hands = card.ability.extra.original_hands
        end
    end
}