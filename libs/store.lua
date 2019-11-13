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
        active = true
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
        active = true
    }
}
function M.saveData()
  loadsave.saveTable(elements, "data.json")
end
return M
