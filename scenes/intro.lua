local composer = require( "composer" )

local scene = composer.newScene()

local btnPlay, btnOptions, backgroundImage
local centerX, centerY = display.contentCenterX, display.contentCenterY
local backGroup = display.newGroup()
local uiGroup = display.newGroup()
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------



-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    backgroundImage = display.newImageRect( backGroup, "images/BGIntro.jpg", display.actualContentWidth, display.actualContentHeight)
    backgroundImage.x, backgroundImage.y = centerX, centerY
    --  backgroundImage:toBack()
    btnPlay = display.newImageRect(uiGroup, "images/btnPlay.png", 50, 50)
    btnPlay.x, btnPlay.y = -20 , 285

    btnOptions = display.newImageRect(uiGroup, "images/btnOptions.png", 40, 40)
    btnOptions.x, btnOptions.y = -20 , 285

    sceneGroup:insert( backGroup )
    sceneGroup:insert( uiGroup )
end
local function goToMenu()
    composer.gotoScene("scenes.menu")
end
function blink()
  -- transition.blink(btnPlay, {time = 3000})
  -- transition.from( btnPlay, { time = 1200, xScale = 0.899, yScale = 0.899})
end
-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
        btnPlay:addEventListener("tap", goToMenu )
        --btnOptions:addEventListener("tap", goToMenu )
        transition.to( btnPlay, {time = 300, x = centerX, y = 285, onComplete = blink })

        transition.to( btnOptions, {time = 200, delay= 300, alpha = 1, x = 100, y = 285})
    end
end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
        btnPlay:removeEventListener("tap", goToMenu )
        btnPlay:removeSelf()
        btnOptions:removeSelf()
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
