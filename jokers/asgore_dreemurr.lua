SMODS.Joker{ --Asgore Dreemurr
    key = "asgore_dreemurr",
    config = {
        extra = {
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Asgore Dreemurr',
        ['text'] = {
            [1] = '{C:attention}Spares{} you if you die to a {C:attention}boss blind{}',
            [2] = '{s:0.6,C:inactive}({}{s:0.6,C:dark_edition}Meme{}{s:0.6,C:inactive} compatible){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
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
        if context.end_of_round and context.game_over and context.main_eval  then
            if G.GAME.blind.boss then
                return {
                    saved = true,
                    message = "Spared",
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
        if context.using_consumeable  then
            if context.consumeable and (context.consumeable.ability.set == 'item' or context.consumeable.ability.set == 'item') and context.consumeable.config.center.key == 'c_oxicreep_random_meme_disk' then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_oxicreep_random_bergentruck' })
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