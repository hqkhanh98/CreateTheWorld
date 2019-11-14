local json = require( "json" )
local loadsave = require( "libs.loadsave" )
local M = {}
elements = -- t
{
    {
        name = "fire",
        group = "fire",
        path = "images/fire.png",
        active = true
    },
    {
        name = "lava",
        group = "fire",
        path = "images/lava.png",
        active = false
    },
    {
        name = "coal",
        group = "fire",
        path = "images/coal.png",
        active = false
    },
    {
        name = "storm",
        group = "air",
        path = "images/storm.png",
        active = false
    },
    {
        name = "air",
        group = "air",
        path = "images/air.png",
        active = true
    },
    {
        name = "rock",
        group = "earth",
        path = "images/rock.png",
        active = false
    },
    {
        name = "earth",
        group = "earth",
        path = "images/earth.png",
        active = true
    },
    {
        name = "water",
        group = "water",
        path = "images/water.png",
        active = true
    },
    {
        group = "water",
        path = "images/swamp.png",
        name = "swamp",
        active = false
    }
}
function M.saveData()
  loadsave.saveTable(elements, "data.json")
end
return M
