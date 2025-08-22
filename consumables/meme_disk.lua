SMODS.Consumable {
    key = 'meme_disk',
    set = 'item',
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = 'Meme Disk',
        text = {
        [1] = 'Turn a Joker into it\'s {C:dark_edition}Meme{} version',
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
        
    end,
    can_use = function(self, card)
        return true
    end
}