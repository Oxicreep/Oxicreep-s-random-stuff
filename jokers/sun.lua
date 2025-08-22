SMODS.Joker{ --Sun Joker
    key = "sun",
    config = {
        extra = {
            odds = 6,
            odds2 = 3,
            ignore = 0,
            Tarot = 0
        }
    },
    loc_txt = {
        ['name'] = 'Sun Joker',
        ['text'] = {
            [1] = '{C:green}#5# in #6#{} chance to create a {C:attention}sun{} at the end of the {C:attention}shop{}.',
            [2] = '{C:inactive}(Must have room){}',
            [3] = '{C:green}#3# in #4#{} chance to break'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 2
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
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
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_oxicreep_random_sun')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_oxicreep_random_sun')
        return {vars = {card.ability.extra.Tarot, card.ability.extra.ignore, new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,

    calculate = function(self, card, context)
        if context.ending_shop  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_4445f33b', 1, card.ability.extra.odds, 'j_oxicreep_random_sun') then
                      SMODS.calculate_effect({func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_oxicreep_random_sun_broken' })
                    if joker_card then
                        
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "R.I.P.", colour = G.C.BLUE})
            end
            return true
        end}, card)
                        SMODS.calculate_effect({func = function()
                card:start_dissolve()
                return true
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                  end
                if SMODS.pseudorandom_probability(card, 'group_1_e80671fa', 1, card.ability.extra.odds2, 'j_oxicreep_random_sun') then
                      SMODS.calculate_effect({func = function()local created_consumable = false
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    created_consumable = true
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card{set = 'Tarot', key = 'c_sun', key_append = 'joker_forge_tarot'}
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                    end
                    return true
                end}, card)
                  end
            end
        end
    end
}