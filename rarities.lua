SMODS.Rarity {
    key = "unknown",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.005,
    badge_colour = HEX('6f1a41'),
    loc_txt = {
        name = "Unknown"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}