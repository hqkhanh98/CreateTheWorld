local composer = require( "composer" )
local data = require "libs.data"
local scene = composer.newScene()
--======================================================
-- Đang bị lỗi do 2 sực kiện check
-- của 2 nguyên tố khác nhau chồng chéo nhau
--======================================================
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local board = display.newGroup() -- Create board group
board.tiles = {}
board.items = {}
local array = 20 -- total tiles of bag
local countTile = 0
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

  local sceneGroup = self.view
  print( "22 - Game is init..." )
    -- Background of scene
	background = display.newImageRect( "images/BGgame.jpg", 480, 320 )
	background.x, background.y = 240, 160

	--====================================
	-- Make the background of list bag items
	--====================================

	board.panel = display.newRect(240, 235, 480, 120)
	board.panel:setFillColor(0.255, 0, 0)
	board.panel.alpha = .5

  board.param1 = display.newImageRect( "images/board.png", 35, 35 )
  board.param1.x, board.param1.y = 120, 80
  board.param1.name = "exp1"
  board.param1.check = false
  board.param1.isHaveItem = false

  board.param2 = display.newImageRect( "images/board.png", 35, 35 )
  board.param2.x, board.param2.y = 360, 80
  board.param2.name = "exp2"
  board.param2.check = false
  board.param2.isHaveItem = false

  board.btnFusion = display.newImageRect( "images/fusion.png", 35, 35 )
  board.btnFusion.x, board.btnFusion.y = 240, 80
  board.btnFusion.name = "fusion"
  --====================================
	-- Create button elemental the top of list bag items
	--====================================

	board.btnFire = display.newRect( 25, 165, 50, 20 )
  board.btnFire.name = "fire"
  board.btnFire:setFillColor(.255, 0, 0)
  board.btnFire.text = display.newText( board.btnFire.name, board.btnFire.x, board.btnFire.y, nil, 12 )
  board.btnFire.alpha = 1
  board.btnFire.text.alpha = 1

	board.btnAir = display.newRect( 75, 165, 50, 20 )
  board.btnAir.name = "air"
  board.btnAir:setFillColor(0, 0, 0.255)
  board.btnAir.text = display.newText( board.btnAir.name, board.btnAir.x, board.btnAir.y, nil, 12 )
  board.btnAir.alpha = .5
  board.btnAir.text.alpha = .5

	board.btnEarth = display.newRect( 125	, 165, 50, 20 )
  board.btnEarth.name = "earth"
  board.btnEarth:setFillColor( .57, .2, .004)
	board.btnEarth.text = display.newText( board.btnEarth.name, board.btnEarth.x, board.btnEarth.y, nil, 12 )
  board.btnEarth.alpha = .5
  board.btnEarth.text.alpha = .5

  -- Insert into sceneGroup
	sceneGroup:insert( background )
	sceneGroup:insert( board )
  print( "78 - Game is init successfully !" )
end


-- show()
function scene:show( event )
    print( "84 - Game is show" )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
    print( "90 - Create tile .." )
    createTiles()
    print( "92 - Create tile done !" )
    board.btnFire:addEventListener( "touch", touch )
    board.btnAir:addEventListener( "touch", touch )
    board.btnEarth:addEventListener( "touch", touch )
    board.btnFusion:addEventListener( "touch", touch )
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

    end
end

function touch( event )
    if event.phase == "began" then
      -- Set touch focus
      display.getCurrentStage():setFocus( event.target )
      print( " 107 - Touch is button "..event.target.name )
      event.target.isFocus = true
      if event.target.name == "fire" then
        board.btnAir.alpha = .5
        board.btnAir.text.alpha = .5
        board.btnFire.alpha = 1
        board.btnFire.text.alpha = 1
        board.btnEarth.alpha = .5
        board.btnEarth.text.alpha = .5
        board.panel:setFillColor(.255, 0, 0)

      elseif event.target.name == "air" then
        board.btnAir.alpha = 1
        board.btnAir.text.alpha = 1
        board.btnFire.alpha = .5
        board.btnFire.text.alpha = .5
        board.btnEarth.alpha = .5
        board.btnEarth.text.alpha = .5
        board.panel:setFillColor(0, 0, 0.255)

      elseif event.target.name == "earth" then
        board.btnAir.alpha = .5
        board.btnAir.text.alpha = .5
        board.btnFire.alpha = .5
        board.btnFire.text.alpha = .5
        board.btnEarth.alpha = 1
        board.btnEarth.text.alpha = 1
        board.panel:setFillColor( .57, .2, .004)
      end

      if event.target.name == "fusion" then
        if board.param1.isHaveItem == true and board.param2.isHaveItem == true then
          print( "FUSION ELEMENT | "..board.param1.exp.name.." AND "..board.param2.exp.name.." | => ?????" )
        end
      else
        print( " 142 - Draw Element "..event.target.name )
        drawElementsByName( event.target.name )
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
--=================================
-- function clear all items of bag
--=================================
function clearElements()

  if board.items == nil then
    print("ERORR: 163 - items table was nil !")
  else
    local items = board.items
    for i = 1, #items do
      items[i]:removeEventListener( "touch", onTouchElement )
      items[i]:removeSelf()
      items[i] = nil
    end
  end
end
--===============================================
-- function draw all items of bag with name group
--===============================================
function drawElementsByName( name )
  local size = data.getSizeOfGroupActive( name )
  local x , y

  if board.items == nil then
    board.items = {}
  end

  local items = board.items

  if board.tiles == nil then
    print("ERORR: 187 - tiles table was nil !")
  else
    print( "189 - Clear "..name )
    clearElements() -- Clear all items of bag before
    print( "191 - Getting data.. " )
    local dataItems = data.getItemsActiveByGroup( name )
    print( "193 - Getting done " )
    -- Create items
    for i = 1, size do
      x, y = board.tiles[i].x, board.tiles[i].y
      print( "197 - Creating items.. " )
      items[i] = display.newImageRect( dataItems[i].path, 25, 25 )
      items[i].x, items[i].y = x, y
      items[i].name = dataItems[i].name
      items[i].check = false
      items[i]:addEventListener( "touch", onTouchElement )
    end
    print( "204 - Create items done " )
  end
end

function clearParam( param )
  print( "209 - Clear param "..param.name )
  param.exp:removeSelf()
  param.exp = nil
  param.check = false
  param.isHaveItem = false
end

function createParam( param, name )
  local data = data.getItemActiveByName( name )
    print( "218 - Create param "..param.name )
    param.exp = display.newImageRect( data.path, 25, 25 )
    param.exp.x, param.exp.y = param.x, param.y
    param.exp.name = data.name
    param.isHaveItem = true
end

function onTouchElement( event )
  if event.phase == "began" then
    -- Set touch focus
    display.getCurrentStage():setFocus( event.target )
    event.target.isFocus = true
    if event.target.check == false then
      event.target.check = true
    else
      event.target.check = false
    end
    if event.target.check == true  then

      if board.param1.check == true then
        if board.param2.isHaveItem == false then
          createParam( board.param2, event.target.name )
          event.target.param = "exp2"
          board.param2.check = true
        end
      else
        if board.param1.isHaveItem == false then
          createParam( board.param1, event.target.name )
          event.target.param = "exp1"
          board.param1.check = true
        end
      end
    else
      print(event.target.check)
      if event.target.param == "exp1" then
        clearParam(board.param1)
      else
        clearParam(board.param2)
      end
    end
    print(event.target.name)
  elseif ( event.target.isFocus ) then

    if ( event.phase == "ended" or event.phase == "cancelled" ) then

        -- Reset touch focus
        display.getCurrentStage():setFocus( nil )
        event.target.isFocus = nil

    end
  end
return true
end
--=======================================================
-- Function fill the tile all board
--=======================================================
function createTiles()
  local x , y = 40, 210
  if board.tiles == nil then
			board.tiles = {}
	end
  local tiles = board.tiles
    for i = 1, array , 1 do
    tiles[i] = display.newImageRect( "images/tile.png", 35 , 35 )
    tiles[i].x = x
    tiles[i].y = y

    countTile = countTile + 1
    if( countTile > 9 ) then
      y = y + 45
      countTile = 0
      x = - 5
    end
    x = x + 45
    end
  drawElementsByName( "fire" )
end

-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

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
