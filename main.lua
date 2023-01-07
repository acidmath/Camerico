require ("LevelGenerator")
require ("LevelLoader")

-- window stuff
local windowWidth = 1280
local windowHeight = 720

-- menu stuff
local menuWidth = 240
local menuHeight = 80

-- level stuff
local levelSprite
local levelTable
local levelRowCount
local levelColumnCount

-- player stuff
local playerBoatSprite
local playerPosition_X = 300
local playerPosition_Y = 300
local playerOrientation = "up"

-- world stuff
local mapCenterX = 300
local mapCenterY = 300
local worldScale = 1

-- tree stuff
local treeSprite
local treeTable

-- time stuff
local frameTick = 0
local frame = 1

-- mouse stuff
local movingPlayer = false
local movingMap = false

-- error stuff
local errorMessage = "no problems boss"

function love.load()
    -- set window size
    love.window.setMode(windowWidth, windowHeight, {})
    
    -- load sprites
	loadLevel()
    loadTree()
    playerBoatSprite = dofile("PlayerBoatSprite.lua")
end

function loadLevel()
    levelSprite = dofile("LevelSprite.lua")
    -- setupLevel(levelLoader:load("NewFrance"))
    local levelLoader = LevelLoader.new()    
    local LevelGenerator = LevelGenerator.new()
    setupLevel(levelLoader:load(LevelGenerator:generate("test", 64, 56)))
end

function setupLevel(loadedLevelTable, loadedLevelRowCount, loadedLevelColumnCount)
    if loadedLevelRowCount == nil or loadedLevelColumnCount == nil then
        errorMessage = loadedLevelTable
    else
        levelTable = loadedLevelTable
        levelRowCount = loadedLevelRowCount
        levelColumnCount = loadedLevelColumnCount
        errorMessage = "rows: "..levelRowCount.." columns: "..levelColumnCount
    end
end

function loadTree()
    treeSprite = dofile("TreeSprite.lua")
end

function love.update()
    frameTick = frameTick + 1
    if frameTick%50 == 0 then
        frameTick = 50
	    frame = frame + 1
        if frame%5 == 0 then
            frame = 1
        end
    end

    movePlayer()
    moveMap()
end

function love.draw()
    
    drawLevel()   

    love.graphics.draw(
        playerBoatSprite["image"], 
        playerBoatSprite["tiles"][playerOrientation][frame], 
        playerPosition_X*worldScale+mapCenterX, 
        playerPosition_Y*worldScale+mapCenterY,
        0, 
        worldScale, 
        worldScale, 
        0, 
        0
    )

    love.graphics.print(
        errorMessage,
        0,
        0,
        0,
        worldScale,
        worldScale,
        0,
        0
    )

    drawMenu()
end

function drawLevel()
    for i=1, levelRowCount do
        for j=1, levelColumnCount do
            love.graphics.draw(
                levelSprite["image"],
                levelSprite["tiles"][levelTable[i][j][1]][levelTable[i][j][2]][1],
                mapCenterX + (i-1)*levelSprite["side"]*worldScale,
                mapCenterY + (j-1)*levelSprite["side"]*worldScale,
                0,
                worldScale,
                worldScale,
                0,
                0
            )
        end
    end
end

function drawMenu()

    -- draw menu background
    love.graphics.push()
    love.graphics.setColor(200,15,10)
    love.graphics.rectangle("fill", windowWidth*0.5 - menuWidth*0.5, windowHeight - menuHeight, menuWidth, menuHeight)
    love.graphics.pop()

    -- reset color
    --love.graphics.setColor(255, 255, 255)

    -- draw menu items
    love.graphics.draw(
        treeSprite["image"],
        treeSprite["tiles"]["young"][1],
        windowWidth*0.5 - menuWidth*0.5 + treeSprite["width"]*0.25,
        windowHeight-treeSprite["height"]*0.25,
        0,
        0.25,
        0.25,
        0,
        0        
    )
end

function love.keypressed(key)
	if key == "escape" or key == "q" then
		love.event.quit()
	end
end

function love.mousepressed(x, y, button, istouch)
    if button == 1 then
        if x<playerPosition_X + playerBoatSprite["side"]
            and x>playerPosition_X 
            and y<playerPosition_Y + playerBoatSprite["side"]
            and y>playerPosition_Y
            then
            movingPlayer = true
        else
            movingMap = true
        end
    end
end

function love.mousemoved(x, y, dx, dy, istouch)    
    if movingPlayer then
        playerPosition_X = playerPosition_X + dx
        playerPosition_Y = playerPosition_Y + dy
    elseif movingMap then
        mapCenterX = mapCenterX + dx
        mapCenterY = mapCenterY + dy
    end
end

function love.mousereleased(x, y, button, istouch)
    if button == 1 then
        movingPlayer = false
        movingMap = false
    end
end

function love.wheelmoved(x, y)
    if y > 0 then
        if worldScale < 10 then
            worldScale = worldScale*1.1
        else
            worldScale = 10
        end
    elseif y < 0 then
        if worldScale > 0.1 then
            worldScale = worldScale*0.9
        else
            worldScale = 0.1
        end
    end
end

function moveMap()
    if love.keyboard.isDown("w") then
        mapCenterY = mapCenterY + 5        
    elseif love.keyboard.isDown("s") then
        mapCenterY = mapCenterY - 5   
    end

    if love.keyboard.isDown("a") then
        mapCenterX = mapCenterX + 5        
    elseif love.keyboard.isDown("d") then
        mapCenterX = mapCenterX - 5        
    end
end

function movePlayer()
    if love.keyboard.isDown("up") then
        playerPosition_Y = playerPosition_Y - 5
        playerOrientation = "up"    
    elseif love.keyboard.isDown("down") then
        playerPosition_Y = playerPosition_Y + 5
        playerOrientation = "down"
    end

    if love.keyboard.isDown("left") then
        playerPosition_X = playerPosition_X - 5
        playerOrientation = "left"
    elseif love.keyboard.isDown("right") then
        playerPosition_X = playerPosition_X + 5
        playerOrientation = "right"
    end
end