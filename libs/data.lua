local M = {}
local json = require( "json" )
local loadsave = require( "libs.loadsave" )
local defaultLocation = system.DocumentsDirectory

M.elements = loadsave.loadTable("data.json")

function M.getTable()
  return M.elements
end

function M.saveData()
  if M.elements == nil then
    M.elements = {}
  end
  table = loadsave.saveTable( M.elements, "data.json" )

end


function M.getItemByName( name )
	for i = 1, #t do
		if M.elements[i].name == name then
			return M.elements[i]
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

function M.changeItemActiveByName( name )
	for i = 1, #M.elements do
		if M.elements[i].name == name and M.elements[i].active == false then
			M.elements[i].active = true
      return true
    else
      return false
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
