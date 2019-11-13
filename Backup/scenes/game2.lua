local composer = require( "composer" )
local scene = composer.newScene()
--=================================
local board
local listBox = {}
local listElement = {}
local array = 20
local countBox = 0

local centerX = display.contentCenterX
local centerY = display.contentCentery
local uiGroup = display.newGroup()
--=================================
local elements = require "classes.element"
local data = require "libs.data"
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
--=================================

--=================================
local background
local bag, btnFire, btnAir
local lenEle
local saveClick = {}
local backGroup = display.newGroup()
local boardGroup = display.newGroup()
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    --=================================

    --=================================

	  background = display.newImageRect( backGroup, "images/BGgame.jpg", 480, 320 )
	  background.x, background.y = 240, 160
    bag = display.newRect( boardGroup, 240, 235, 480, 120 )
    bag:setFillColor(0.255, 0, 0)
    bag.alpha = 1
    btnFire = display.newRect( boardGroup, 20, 165, 50, 20 )
    btnFire.name = "btnFire"
    btnFire:setFillColor(.255, 0, 0)
    btnAir = display.newRect( boardGroup, 70, 165, 50, 20 )
    btnAir.name = "btnAir"
    btnAir:setFillColor(0, 0, .255)
    btnAir.alpha = .5

    sceneGroup:insert( backGroup )
    sceneGroup:insert( boardGroup )
end
--=================================

--=================================

-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase
    sceneGroup:insert(uiGroup)
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        --=================================
      local x , y = 40, 210
      for i = 1, array , 1 do
        listBox[i] = display.newImageRect(uiGroup,"images/tile.png", 35 , 35)
        listBox[i].x = x
        listBox[i].y = y
        boardGroup:insert(listBox[i])
        countBox = countBox + 1
        if( countBox > 9 ) then
          y = y + 45
          countBox = 0
          x = - 5
        end
        x = x + 45
      end

      for i = 1, #data.fire do
        local x , y = listBox[i].x, listBox[i].y
         table.insert( listElement, elements.new({ x = x, y = y, type = "fire", id = i }) )
      end
      saveClick[1] = "fire"

        --=================================
        Runtime:addEventListener( "enterFrame", enterFrame )
        btnFire:addEventListener( "touch", touch )
        btnAir:addEventListener( "touch", touch )
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
        --=================================

        --=================================
    end
end

function enterFrame( event )
  -- Cập nhật độ dài chuỗi liên tục

  --print(lenEle)
end

function drawElement( check )
  local element = "fire"
  local len = data.getLen("fire")

  if check == "btnFire" then
    element = "fire"
    len = data.getLen("fire")
    lenEle = #data.getListActive( "fire" )

  elseif check == "btnAir" then
    element = "air"
    len = data.getLen("air")
    lenEle = #data.getListActive("air")

  end
  print("Length element : "..lenEle.." Element : "..element)
  for i = 1, lenEle do
    print(lenEle)
     listElement[i].obj:removeSelf()
     listElement[i] = nil
  end

  for i = 1, lenEle do
    local x , y = listBox[i].x, listBox[i].y
    listElement[i] = elements.new({ x = x, y = y, type = element, id = i})
  end

end
function touch( event )
    if event.phase == "began" then
      -- Set touch focus
      display.getCurrentStage():setFocus( event.target )
      event.target.isFocus = true
      if event.target.name == "btnFire" then
         btnAir.alpha = .5
         btnFire.alpha = 1
         bag:setFillColor(.255, 0, 0)
        -- print("Độ dài list element hiện tại của là : "..#listElement)

         drawElement( "btnFire" )

      elseif event.target.name == "btnAir" then
        btnAir.alpha = 1
        btnFire.alpha = .5
        bag:setFillColor(0, 0, 0.255)

      --    print("Độ dài list element hiện tại của là : "..#listElement)
        drawElement( "btnAir" )
      end
    elseif ( event.target.isFocus ) then

      if ( event.phase == "ended" or event.phase == "cancelled" ) then

          -- Reset touch focus
          display.getCurrentStage():setFocus( nil )
          event.target.isFocus = nil

      end
    end
  return true
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
