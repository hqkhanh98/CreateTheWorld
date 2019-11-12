local M = {}
local data = require "libs.data"
function M.new( options )
  local options = options or {}
  local x = options.x or 240
  local y = options.y or 160
  local w = options.w or 30
  local h = options.h or 30
  local id = options.id or 1
  local type = options.type or "fire"
  local check = false
  local path, name
  element = display.newGroup()
  element.list = data.getListActive( type )
  --print()
  if id > 0 then
    if type == "fire" and id <= #element.list then
      name = element.list[id].name
      path = element.list[id].path
      check = true
    elseif type == "air" and id <= #element.list then
      name = element.list[id].name
      path = element.list[id].path
      check = true
    end
  end
  -- if id > 0 then
  --   if type == 1 and id <= #data.fire then
  --     if data.fire[id].active == true then
  --       name = data.fire[id].name
  --       path = data.fire[id].path
  --       check = true
  --     else
  --       xSave, ySave = x, y
  --       save = true
  --     end
  --   elseif type == 2 and id <= #data.air then
  --     if data.air[id].active == true then
  --       name = data.air[id].name
  --       path = data.air[id].path
  --       check = true
  --     else
  --       xSave, ySave = x, y
  --       save = true
  --     end
  --   end
  -- end

  if check == true then


    function createElement( x, y )

      obj = display.newImageRect( path, w, h )
      obj.x, obj.y = x, y
      obj.id = id
      obj.name = name

      return obj
    end

      element.obj = createElement( x, y )
    function element.obj:touch( event )
        if event.phase == "began" then
          -- Set touch focus
          display.getCurrentStage():setFocus( self )
          self.isFocus = true
          self.alpha = .8
          self:scale( 1.11, 1.11 )
        elseif ( self.isFocus ) then

          if ( event.phase == "ended" or event.phase == "cancelled" ) then
              self:scale( 0.9, 0.9 )
              self.alpha = 1
              -- Reset touch focus
              display.getCurrentStage():setFocus( nil )
              self.isFocus = nil

          end
        end
      return true
    end

    element.obj:addEventListener( "touch" )
    function element.obj:clear()
      element.obj:removeEventListener( "touch" )
      element.obj:removeSelf()
      element.obj = nil
    end

    check = false
  end

  return element
end

return M
