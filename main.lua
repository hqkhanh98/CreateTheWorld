-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require "composer"
local options = { time = 2000, effect = "fade" }

composer.gotoScene( "scenes.intro", options )
