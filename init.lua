-- dice by TumeniNodes 2/14/2017 (CC0)

minetest.register_node("dice:dice", {
	description = "Dice",
	tiles = {"dice.png"},
	groups = {cracky = 3, stone = 1},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random node
		local stack = ItemStack("dice:dice_" .. math.random(1,6))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("dice:dice " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 1, 6 do
	minetest.register_node("dice:dice_" .. i, {
		description = "Dice",
		tiles = {"dice_" .. i .. ".png"},
		groups = {cracky = 3, stone = 1, not_in_creative_inventory = 1},
		sounds = default.node_sound_stone_defaults()
})
end