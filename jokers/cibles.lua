SMODS.Joker{ --Cibles GD
    key = "cibles",
    config = {
        extra = {
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Cibles GD',
        ['text'] = {
            [1] = '{C:attention}First{} played card of hand gain a {C:dark_edition}trans{} seal',
            [2] = '{s:0.8,C:inactive}(This mod is{}{s:0.8,C:red} woke{}{s:0.8,C:inactive}){}',
            [3] = '{s:0.8,C:inactive}({}{s:0.8,C:dark_edition}Meme{} {s:0.8,C:inactive}compatible){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
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
        if context.individual and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[1] then
                context.other_card:set_seal("oxicreep_random_transseal", true)
                return {
                    message = "Card Modified!"
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
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_oxicreep_random_cibblescd' })
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