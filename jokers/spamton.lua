SMODS.Joker{ --Spamton G. Spamton
    key = "spamton",
    config = {
        extra = {
            odds = 3,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Spamton G. Spamton',
        ['text'] = {
            [1] = 'I\'VE ALWAYS BEEN A MAN OF THE {C:clubs}[PIPIS]{}.',
            [2] = 'A REAL {C:clubs}[PIPIS]{} PERSON!',
            [3] = '{s:0.7,C:inactive}(Compatible with {s:0.7,C:dark_edition}NEO{}{s:0.7,C:inactive}){}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 2
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
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
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_04fb14f0', 1, card.ability.extra.odds, 'j_oxicreep_random_spamton') then
                      local created_joker = true
                  G.E_MANAGER:add_event(Event({
                      func = function()
                          local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_oxicreep_random_pipis' })
                          if joker_card then
                              
                              
                          end
                          
                          return true
                      end
                  }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "[PIPIS]", colour = G.C.BLUE})
                  end
            end
        end
        if context.using_consumeable  then
            if context.consumeable and (context.consumeable.ability.set == 'item' or context.consumeable.ability.set == 'item') and context.consumeable.config.center.key == 'c_oxicreep_random_neo_disk' then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_oxicreep_random_spamton_neo' })
                    if joker_card then
                        
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end,
                    extra = {
                        func = function()
                card:start_dissolve()
                return true
            end,
                            message = "Destroyed!",
                        colour = G.C.RED
                        }
                }
            end
        end
    end
}