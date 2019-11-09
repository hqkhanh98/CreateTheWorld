local M = {}

function M.new( options )
  local options = options or {}
  local x = options.x or 240
  local y = options.y or 160
  local w = options.w or 20
  local y = options.y or 20
  local path = options.path or "images/elements/"
  local name = options.name or "fire"

  local element = display.newImage( path..name..".png", x, y, w, h )
end
