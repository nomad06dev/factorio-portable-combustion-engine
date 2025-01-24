local equipment = {
  type = "generator-equipment",
  name = "combustion-engine-equipment",
  sprite =
  {
    filename = "__base__/graphics/equipment/fission-reactor-equipment.png",
    width = 256,
    height = 256,
    priority = "medium",
    scale = 0.5
  },
  shape =
  {
    width = 4,
    height = 4,
    type = "full"
  },
  burner =
  {
    type = "burner",
    fuel_categories = {"chemical"},
    effectivity = 0.25,
    fuel_inventory_size = 1,
    emissions_per_minute = { pollution = 10 },
    smoke =
    {
      {
        name = "smoke",
        north_position = {0.9, 0.0},
        east_position = {-2.0, -2.0},
        deviation = {0.1, 0.1},
        frequency = 9
      }
    }
  },
  energy_source =
  {
    type = "electric",
    usage_priority = "primary-output"
  },
  power = "100kW",
  categories = {"armor"}
}
local item = {
  type = "item",
  name = "combustion-engine-equipment",
  icon = "__base__/graphics/icons/fission-reactor-equipment.png",
  place_as_equipment_result = "combustion-engine-equipment",
  subgroup = "equipment",
  order = "a[energy-source]-b[combustion-engine]",
  stack_size = 20,
}
local recipe = {
  type = "recipe",
  name = "combustion-engine-equipment",
  enabled = false,
  energy_required = 10,
  ingredients =
  {
    {type = "item", name = "engine-unit", amount = 4},
    {type = "item", name = "electric-engine-unit", amount = 4},
    {type = "item", name = "storage-tank", amount = 1},
    {type = "item", name = "pipe", amount = 4},
    {type = "item", name = "iron-plate", amount = 16}
  },
  results = {{type="item", name=item.name, amount=1}}
}
local tech = {
  type = "technology",
  name = "combustion-engine-equipment",
  icons = util.technology_icon_constant_equipment("__base__/graphics/technology/fission-reactor-equipment.png"),
  prerequisites = {"advanced-oil-processing"},
  effects =
  {
    {
      type = "unlock-recipe",
      recipe = "combustion-engine-equipment"
    }
  },
  unit =
  {
    count = 200,
    ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}},
    time = 30
  }
}
data:extend({equipment,item,recipe,tech})
