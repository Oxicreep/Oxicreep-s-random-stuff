SMODS.Consumable {
    key = 'stab',
    set = 'item',
    pos = { x = 2, y = 0 },
    loc_txt = {
        name = 'Stab',
        text = {
        [1] = '{X:edition,C:black}Stab{}'
    }
    },
    cost = 5,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        
    end,
    can_use = function(self, card)
        return true
    end
}