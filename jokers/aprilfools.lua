SMODS.Joker{ --April Fools Joker
    key = "aprilfools",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'April Fools Joker',
        ['text'] = {
            [1] = 'H-Hello',
            [2] = '{C:dark_edition}+1 joker slot{}',
            [3] = '{s:0.6,C:inactive}(pls don\'t kill them){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    cost = 50,
    rarity = "oxicreep_random_unknown",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'buf' and args.source ~= 'rif' and args.source ~= 'rta' and args.source ~= 'sou' and args.source ~= 'uta' and args.source ~= 'wra' 
          or args.source == 'sho' or args.source == 'jud'
          )
          and true
      end
    ,

    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end
}