SMODS.Consumable {
    key = 'neo_disk',
    set = 'item',
    pos = { x = 1, y = 0 },
    loc_txt = {
        name = 'NEO Disk',
        text = {
        [1] = 'Release the power of {C:dark_edition}NEO{}',
        [2] = '{s:0.7,C:inactive}(Works only on compatible jokers){}'
    }
    },
    cost = 5,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
    end,
    can_use = function(self, card)
        return true
    end
}