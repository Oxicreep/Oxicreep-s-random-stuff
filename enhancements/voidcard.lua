SMODS.Enhancement {
    key = 'voidcard',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            dollars = 3,
            x_mult = 1.5
        }
    },
    loc_txt = {
        name = 'Void Card',
        text = {
        [1] = '{C:money}-$3{} {X:red,C:white}x1.5{} Mult{}'
    }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { dollars = -lenient_bignum(card.ability.extra.dollars), x_mult = card.ability.extra.x_mult }
        end
    end
}