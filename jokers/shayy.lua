SMODS.Joker{ --Shayy
    key = "shayy",
    config = {
        extra = {
            ignore = 0,
            yes = 0,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Shayy',
        ['text'] = {
            [1] = 'All cards in the {C:attention}first discard{} of round',
            [2] = 'gain a {C:dark_edition}non-binary {}seal',
            [3] = '{s:0.8,C:inactive}(This mod is{}{s:0.8,C:red} woke{}{s:0.8,C:inactive}){}',
            [4] = '{s:0.8,C:inactive}({}{s:0.8,C:dark_edition}Meme{} {s:0.8,C:inactive}compatible){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 2
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
        if context.discard  then
            if G.GAME.current_round.discards_used <= 0 then
                return {
                    func = function()
                context.other_card:set_seal("oxicreep_random_non_binary", true)
                    end,
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
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_oxicreep_random_shayycantread' })
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
        if context.ending_shop  then
            if ((function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_oxicreep_random_cibles" then
              return true
          end
      end
      return false
  end)() and (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_oxicreep_random_mystic_slime" then
              return true
          end
      end
      return false
  end)()) then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_oxicreep_random_summon' })
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
                local target_joker = nil
                for i, joker in ipairs(G.jokers.cards) do
                    if joker.config.center.key == "j_oxicreep_random_cibles" and not joker.getting_sliced then
                        target_joker = joker
                        break
                    end
                end
                
                if target_joker then
                    if target_joker.ability.eternal then
                        target_joker.ability.eternal = nil
                    end
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
                        colour = G.C.RED,
                        extra = {
                            func = function()
                local target_joker = nil
                for i, joker in ipairs(G.jokers.cards) do
                    if joker.config.center.key == "j_oxicreep_random_mystic_slime" and not joker.getting_sliced then
                        target_joker = joker
                        break
                    end
                end
                
                if target_joker then
                    if target_joker.ability.eternal then
                        target_joker.ability.eternal = nil
                    end
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
                            colour = G.C.RED,
                        extra = {
                            func = function()
                card:start_dissolve()
                return true
            end,
                            message = "Destroyed!",
                            colour = G.C.RED
                        }
                        }
                        }
                }
            end
        end
    end
}