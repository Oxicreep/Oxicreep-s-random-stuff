SMODS.Joker{ --Frieren
    key = "frieren_sleeping",
    config = {
        extra = {
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Frieren',
        ['text'] = {
            [1] = '{C:inactive}(She\'s sleeping !?){}',
            [2] = '{s:0.8,C:inactive}(And broke){}',
            [3] = '{s:0.5,C:inactive}(Maybe the sound of money could wake her up){}',
            [4] = '{s:0.3,C:inactive}(You need to sell her dumbass){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 1
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

    calculate = function(self, card, context)
        if context.selling_self  then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_oxicreep_random_frieren_wake_up' })
                    if joker_card then
                        
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end
                }
        end
    end
}