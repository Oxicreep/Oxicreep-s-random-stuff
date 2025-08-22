SMODS.Joker{ --Aubrey (HEADSPACE)
    key = "aubrey_headspace",
    config = {
        extra = {
            Mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Aubrey (HEADSPACE)',
        ['text'] = {
            [1] = 'This Joker gain {C:red}+5{} Mult if you',
            [2] = 'have {C:attention}Omori{}',
            [3] = '{C:inactive}(Currently{} {C:hearts}+#1#{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Mult}}
    end,

    calculate = function(self, card, context)
        if context.ending_shop  then
            if ((function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_oxicreep_random_omori" then
              return true
          end
      end
      return false
  end)() or (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_oxicreep_random_omori1" then
              return true
          end
      end
      return false
  end)() or (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_oxicreep_random_omori2" then
              return true
          end
      end
      return false
  end)() or (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_oxicreep_random_omori3" then
              return true
          end
      end
      return false
  end)() or (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_oxicreep_random_omori4" then
              return true
          end
      end
      return false
  end)() or (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_oxicreep_random_omori5" then
              return true
          end
      end
      return false
  end)()) then
                return {
                    func = function()
                    card.ability.extra.Mult = (card.ability.extra.Mult) + 5
                    return true
                end,
                    extra = {
                        message = "+5",
                        colour = G.C.RED
                        }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    mult = card.ability.extra.Mult
                }
        end
    end
}