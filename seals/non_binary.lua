SMODS.Seal {
    key = 'non_binary',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            x_chips = 1.5
        }
    },
    badge_colour = HEX('000000'),
   loc_txt = {
        name = 'Non-binary Seal',
        label = 'Non-binary Seal',
        text = {
        [1] = '{X:blue,C:white}x1.5{} Chips when scored',
        [2] = '{s:0.8,C:inactive}(This mod is{}{s:0.8,C:red} woke{}{s:0.8,C:inactive}){}'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { x_chips = card.ability.seal.extra.x_chips }
        end
    end
}