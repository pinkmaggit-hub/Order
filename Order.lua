--- STEAMODDED HEADER

--- MOD_NAME: Order
--- MOD_ID: order
--- MOD_AUTHOR: [PinkMaggit]
--- MOD_DESCRIPTION: Makes it possible to sort by rank or suit in ascending or descending order by pressing the respective sort button
--- BADGE_COLOR: a58547
--- BADGE_TEXT_COLOR: ffe5b4
--- PREFIX: order
--- VERSION: 1.0
--- LOADER_VERSION_GEQ: 1.0.0

-- defs --
Order = SMODS.current_mod

-- ATLASES --
SMODS.Atlas {
    key = 'modicon',
    path = "order_icon.png",
    px = 34,
    py = 34
}

-- CONFIG --
Order.config_tab = function()
	return {n = G.UIT.ROOT, config = {r = 0.1, minw = 4, align = "tm", padding = 0.2, colour = G.C.BLACK}, nodes = {
			{ n=G.UIT.R, config = {align = 'cm'}, nodes={
				create_option_cycle({label = localize('order_default_order'), current_option = Order.config.default_order, default = 1, options = localize('order_default_order_options'), ref_table = Order.config, ref_value = 'default_order', info = localize('order_default_order_desc'), colour = Order.badge_colour, w = 3.7*0.65/(5/6), h=0.8*0.65/(5/6), text_scale=0.5*0.65/(5/6), scale=5/6, no_pips = true, opt_callback = 'cycle_update'}),
				create_option_cycle({label = localize('order_default_method'), current_option = Order.config.default_method, default = 1, options = localize('order_default_method_options'), ref_table = Order.config, ref_value = 'default_method', info = localize('order_default_method_desc'), colour = Order.badge_colour, w = 3.7*0.65/(5/6), h=0.8*0.65/(5/6), text_scale=0.5*0.65/(5/6), scale=5/6, no_pips = true, opt_callback = 'cycle_update'}),
			},
			},
	}}
end

if Order.config.default_order == 1 then
	default_sort = (Order.config.default_method == 2 and "suit " or "") .. "asc"
	counter_sort = 'desc'
	counter_sort_bool = false
elseif Order.config.default_order == 2 then
	default_sort = (Order.config.default_method == 2 and "suit " or "") .. 'desc'
	counter_sort = 'asc'
	counter_sort_bool = true
end