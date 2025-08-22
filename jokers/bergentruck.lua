SMODS.Joker{ --BERGENTRUCK
    key = "bergentruck",
    config = {
        extra = {
            var1 = 0,
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = 'BERGENTRUCK',
        ['text'] = {
            [1] = 'Driving in my {C:dark_edition}car{}',
            [2] = 'Right after a {C:dark_edition}beer{}',
            [3] = 'Hey that {C:dark_edition}bump{} is shaped like a {C:red}deer{}',
            [4] = '{C:dark_edition}DUI{}? How about you {C:red}die{}',
            [5] = 'I\'ll go a hundred miles{}',
            [6] = 'An hour',
            [7] = 'Little do you know',
            [8] = 'I filled up on {C:dark_edition}gas{}',
            [9] = 'Imma get your {C:dark_edition}fontain{} making {C:red}ass{}',
            [10] = 'Pulverise this {C:red}fuck{}',
            [11] = 'With my {C:dark_edition}bergentruck{}',
            [12] = 'It seems you\'re out of {C:green}luck{}',
            [13] = '',
            [14] = '{s:5,C:red}TRUCK{}',
            [15] = '{s:0.5,C:inactive}(This Joker may run over other Jokers){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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

    calculate = function(self, card, context)
        if context.ending_shop  then
            if (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_oxicreep_random_roaringfraud" then
              return true
          end
      end
      return false
  end)() then
                return {
                    func = function()
                local target_joker = nil
                for i, joker in ipairs(G.jokers.cards) do
                    if joker.config.center.key == "j_oxicreep_random_roaringfraud" and not joker.ability.eternal and not joker.getting_sliced then
                        target_joker = joker
                        break
                    end
                end
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
                    return true
                end,
                    extra = {
                        func = function()
            local created_joker = false
    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
        created_joker = true
        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_mr_bones' })
                    if joker_card then
                        
                        
                    end
                    G.GAME.joker_buffer = 0
                    return true
                end
            }))
            end
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "TRUCK", colour = G.C.BLUE})
            end
            return true
        end,
                        colour = G.C.BLUE
                        }
                }
            end
        end
    end
}