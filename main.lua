-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require "composer"
--local store = require "libs.store"
local options = { time = 2000, effect = "fade" }
--store.saveData()
composer.gotoScene( "scenes.intro", options )
