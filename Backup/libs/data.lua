local M = {}
local json = require( "json" )
local loadsave = require( "libs.loadsave" )
local defaultLocation = system.DocumentsDirectory
M.elements = -- t
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
function M.getAllInfoElement()
  loadsave.saveTable( M.elements, "Holy2.json" )
  --print(type(M.elements))
  local t = loadsave.loadTable("Holy2.json")
  print("48 - "..type(t))

  loadsave.printTable(t)

  return M.elements
end


function M.getItemByName( t , name )
	for i = 1, #t do
		if t[i].name == name then
			return t[i]
		else return nil
		end
	end
end

function M.getItemActiveByName( name )
	for i = 1, #M.elements do
		if M.elements[i].name == name and M.elements[i].active then
			return M.elements[i]
		end
	end
end

function M.getItemsByGroup( group )
	local result = {}
	for i = 1, #M.elements do
		if M.elements[i].group == group then
			 table.insert( result, M.elements[i] )
		end
	end
	return result
end

function M.getItemsActiveByGroup( group )
	local result = {}
	for i = 1, #M.elements do
		if M.elements[i].group == group and M.elements[i].active then
			 table.insert( result, M.elements[i] )
		end
	end
	return result
end

function M.getSizeOfGroupActive( group )
  local count = 0
  for i = 1, #M.elements do
		if M.elements[i].group == group and M.elements[i].active then
			 count = count + 1
		end
	end
  return count
end

function M.getSize()
	return #M.elements
end

return M
