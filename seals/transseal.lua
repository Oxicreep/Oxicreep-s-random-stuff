SMODS.Seal {
    key = 'transseal',
    pos = { x = 1, y = 0 },
    badge_colour = HEX('87CEEB'),
   loc_txt = {
        name = 'Trans Seal',
        label = 'Trans Seal',
        text = {
        [1] = 'Create a random {C:dark_edition}negative{} {C:planet}planet{} card when scored',
        [2] = '{s:0.8,C:inactive}(This mod is{}{s:0.8,C:red} woke{}{s:0.8,C:inactive}){}'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local created_consumable = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card{set = 'Planet', edition = 'e_negative', key_append = 'enhanced_card_planet'}
                        return true
                    end
                }))
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_consumable and "+1 Consumable!" or nil, colour = G.C.SECONDARY_SET.Planet})
        end
    end
}