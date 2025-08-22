SMODS.Enhancement {
    key = 'infected',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            x_mult = 3,
            dollars = 200
        }
    },
    loc_txt = {
        name = 'Infected card',
        text = {
        [1] = '{X:red,C:white}x3{} Mult and {C:red}-200${} when held in hand'
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
        if context.cardarea == G.hand and context.main_scoring then
            return { x_mult = card.ability.extra.x_mult, dollars = -lenient_bignum(card.ability.extra.dollars) }
        end
    end
}