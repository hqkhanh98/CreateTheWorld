-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require "composer"
local store = require "libs.store"
-- Path for the file to read
function checkNewMembers()
  local path = system.pathForFile( "data/inforgame.txt" )

  -- Open the file handle
  local file, errorString = io.open( path, "r" )

  if not file then
      -- Error occurred; output the cause
      print( "File error: " .. errorString )
  else
      -- Output lines
      for line in file:lines() do
          return line
      end
      -- Close the file handle
      io.close( file )
  end

  file = nil
end

print( checkNewMembers() )
if checkNewMembers() == "0" then
  store.saveData()
  print("????")
else

end
local options = { time = 2000, effect = "fade" }
--store.saveData()
composer.gotoScene( "scenes.intro", options )
