--- STEAMODDED HEADER

--- MOD_NAME: Order
--- MOD_ID: order
--- MOD_AUTHOR: [PinkMaggit]
--- MOD_DESCRIPTION: Makes it possible to sort by rank or suit in ascending or descending order by pressing the respective sort button. You can also set the default sorting method/order.
--- BADGE_COLOR: 9e74ce
--- BADGE_TEXT_COLOR: ffffff
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
				create_option_cycle({
					label = localize('order_default_method'),
					current_option = Order.config.default_method,
					default = 1, 
					options = localize('order_default_method_options'),
					ref_table = Order.config,
					ref_value = 'default_method',
					info = localize('order_default_method_desc'),
					colour = Order.badge_colour,
					w = 3.7*0.65/(5/6), h=0.8*0.65/(5/6),
					text_scale=0.5*0.65/(5/6),
					scale=5/6,
					cycle_shoulders = true,
					opt_callback = 'updateSortMethod'
				}),
				create_option_cycle({
					label = localize('order_default_order'),
					current_option = Order.config.default_order,
					default = 2,
					options = localize('order_default_order_options'),
					ref_table = Order.config,
					ref_value = 'default_order',
					info = localize('order_default_order_desc'),
					colour = Order.badge_colour,
					w = 3.7*0.65/(5/6), h=0.8*0.65/(5/6),
					text_scale=0.5*0.65/(5/6),
					scale=5/6,
					cycle_shoulders = true,
					opt_callback = 'updateSortOrder'
				}),
				create_toggle({
					label = localize('order_autosort'),
					ref_table = Order.config,
					ref_value = 'autosort',
					default = true,
					-- info = localize('order_autosort_info'),
					active_colour = Order.badge_colour,
				}),
			}},
	}}
end

local orders = { 'asc', 'desc' }
curr_order = orders[Order.config.default_order]
opp_order = orders[3 - Order.config.default_order]  -- If 1, gives 2; if 2, gives 1
asc_bool = (curr_order == 'asc')

default_sort = (Order.config.default_method == 2 and "suit " or "") .. curr_order

function nullifySort()  -- try to prevent double-click to sort
	sort_ascending = nil 
	sort_ascending_suit = nil
end

function updateAutosortDefault()
	if Order.config.autosort then return true
	else return false end
end


G.FUNCS.updateSortOrder = function() -- callback function to update chosen order dynamically
	Order.config.default_order = (Order.config.default_order == 1) and 2 or 1
	local orders = { 'asc', 'desc' }
	curr_order = orders[Order.config.default_order]
	opp_order = orders[3 - Order.config.default_order]  -- If 1, gives 2; if 2, gives 1
	asc_bool = (curr_order == 'asc')

	default_sort = (Order.config.default_method == 2 and "suit " or "") .. curr_order
	if G.hand then
		nullifySort()
		G.hand:sort(default_sort) 
	end
end

G.FUNCS.updateSortMethod = function() -- callback function to update chosen method dynamically
	Order.config.default_method = (Order.config.default_method == 1) and 2 or 1
	default_sort = (Order.config.default_method == 2 and "suit " or "") .. curr_order
	if G.hand then 
		nullifySort()
		G.hand:sort(default_sort) 
	end
end

-- function Card:get_nominal_edit(mod)
	-- local mult = 1
    -- if mod == 'suit' then mult = 1000 end
    -- if self.ability.effect == 'Stone Card' then mult = -1000 end
    -- return self.base.nominal + self.base.suit_nominal*mult + (self.base.suit_nominal_original or 0)*0.0001*mult + self.base.face_nominal + 0.000001*self.unique_val
-- en]~]\/