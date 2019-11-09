local composer = require( "composer" )
local scene = composer.newScene()
--=================================
local board
local listBox = {}
local array = 10
local countBox = 0
local centerX = display.contentCenterX
local centerY = display.contentCentery
local uiGroup = display.newGroup()
--=================================
local elements = require "classes.element"
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
--=================================

--=================================
local background
local backGroup = display.newGroup()
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    --=================================

    --=================================
    elements = elements.new().obj
	  background = display.newImageRect( backGroup, "images/BGgame.jpg", 480, 320 )
	  background.x, background.y = 240, 160
    sceneGroup:insert( backGroup )
end
--=================================

--=================================

-- show()
function scene:show( event )
    print(display.contentHeight)
    local sceneGroup = self.view
    local phase = event.phase
    sceneGroup:insert(uiGroup)
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        --=================================
        local x , y = 50, 170
      for i = 1, array , 1 do
        listBox[i] = display.newImageRect(uiGroup,"images/board.png", 25 , 25)
        listBox[i].x = x
        listBox[i].y = y
        countBox = countBox + 1
        if( countBox > 9 ) then
          y = y + 35
          countBox = 0
          x = 0
        end
        x = x + 35
      end


        --=================================
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
        --=================================

        --=================================
    end
end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
        --=================================

        --=================================
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
        --=================================

        --=================================
    end
end
--=================================

--=================================

-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
    --=================================

    --=================================
end
--=================================

--=================================

-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
