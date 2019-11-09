local M = {}

function M.new( options )
  local options = options or {}
  local x = options.x or 240
  local y = options.y or 160
  local w = options.w or 30
  local h = options.h or 30
  local id = options.id or 1
  local path = options.path or "images/"
  local name = options.name or "fire"
  local group = options.group or "Fire"
  element = display.newGroup()
  local obj = element.obj
  obj = display.newImageRect( path..name..".png", w, h )

  obj.x, obj.y = x, y
  obj.id = id

  obj.name = name
  function obj:touch( event )
      if event.phase == "began" then
        -- Set touch focus
        display.getCurrentStage():setFocus( self )
        self.isFocus = true
        self.touchOffsetX = event.x - self.x
        self.touchOffsetY = event.y - self.y
      elseif ( self.isFocus ) then
        if ( event.phase == "moved" ) then
            self.x = event.x - self.touchOffsetX
            self.y = event.y - self.touchOffsetY
        elseif ( event.phase == "ended" or event.phase == "cancelled" ) then

            -- Reset touch focus
            display.getCurrentStage():setFocus( nil )
            self.isFocus = nil

        end
      end
    return true
  end

  function obj:clear()
    obj:removeEventListener( "touch" )
    obj:removeSelf()
  end

  obj:addEventListener( "touch" )
  return element
end

return M
