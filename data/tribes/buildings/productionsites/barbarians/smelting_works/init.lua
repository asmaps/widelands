dirname = path.dirname(__file__)

tribes:new_productionsite_type {
   msgctxt = "barbarians_building",
   name = "barbarians_smelting_works",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("barbarians_building", "Smelting Works"),
   helptext_script = dirname .. "helptexts.lua",
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 3,
      blackwood = 1,
      granite = 1,
      grout = 1,
      reed = 2
   },
   return_on_dismantle = {
      log = 1,
      blackwood = 1,
      granite = 1
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 44, 58 },
      },
      working = {
         pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
         hotspot = { 44, 58 },
      },
   },

   aihints = {
      prohibited_till = 700,
      basic_amount = 1,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2
   },

   working_positions = {
      barbarians_smelter = 1
   },

   inputs = {
      { name = "coal", amount = 8 },
      { name = "iron_ore", amount = 8 },
      { name = "gold_ore", amount = 8 }
   },
   outputs = {
      "iron",
      "gold"
   },

   programs = {
      work = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=smelt_iron",
            "call=smelt_gold",
            "call=smelt_iron_2",
            "return=no_stats"
         }
      },
      -- 2 identical programs for iron to prevent unnecessary skipping penalty
      smelt_iron = {
         -- TRANSLATORS: Completed/Skipped/Did not start smelting iron because ...
         descname = _"smelting iron",
         actions = {
            "return=skipped unless economy needs iron",
            "consume=coal iron_ore",
            "sleep=29000",
            "playsound=sound/metal/furnace 192",
            "animate=working 35000",
            "playsound=sound/metal/ironping 80",
            "produce=iron"
         }
      },
      smelt_iron_2 = {
         -- TRANSLATORS: Completed/Skipped/Did not start smelting iron because ...
         descname = _"smelting iron",
         actions = {
            "return=skipped unless economy needs iron",
            "consume=coal iron_ore",
            "sleep=29000",
            "playsound=sound/metal/furnace 192",
            "animate=working 35000",
            "playsound=sound/metal/ironping 80",
            "produce=iron"
         }
      },
      smelt_gold = {
         -- TRANSLATORS: Completed/Skipped/Did not start smelting gold because ...
         descname = _"smelting gold",
         actions = {
            "return=skipped unless economy needs gold",
            "consume=coal gold_ore",
            "sleep=29000",
            "playsound=sound/metal/furnace 192",
            "animate=working 35000",
            "playsound=sound/metal/goldping 80",
            "produce=gold"
         }
      },
   },
}
