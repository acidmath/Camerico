local levelSprite

local playerBoatSprite
local playerPosition_X = 300
local playerPosition_Y = 300

local mapCenterX = 300
local mapCenterY = 300

local worldScale = 1

local playerOrientation = "up"
local frameTick = 0
local frame = 1

-- mouse stuff
local movingPlayer = false
local movingMap = false

function love.load()
	levelSprite = dofile("LevelSprite.lua")
    playerBoatSprite = dofile("PlayerBoatSprite.lua")
end

function love.update()
    frameTick = frameTick + 1
    if frameTick%50==0 then
        frameTick = 50
	    frame = frame + 1
        if frame%5==0 then
            frame = 1
        end
    end

    movePlayer()

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
        love.timer.getTime(),
        0,
        0,
        0,
        worldScale,
        worldScale,
        0,
        0
    )
end

function drawLevel()
    love.graphics.draw(
        levelSprite["image"], 
        levelSprite["tiles"]["dirt"]["top_left"][1], 
        mapCenterX, 
        mapCenterY,
        0, 
        worldScale, 
        worldScale, 
        0, 
        0
    )

    love.graphics.draw(
        levelSprite["image"], 
        levelSprite["tiles"]["dirt"]["top_right"][1], 
        mapCenterX + levelSprite["side"]*worldScale, 
        mapCenterY,
        0, 
        worldScale, 
        worldScale, 
        0, 
        0
    )
    
    love.graphics.draw(
        levelSprite["image"], 
        levelSprite["tiles"]["dirt"]["bottom_right"][1], 
        mapCenterX + levelSprite["side"]*worldScale, 
        mapCenterY + levelSprite["side"]*worldScale,
        0, 
        worldScale, 
        worldScale, 
        0, 
        0
    )

    love.graphics.draw(
        levelSprite["image"], 
        levelSprite["tiles"]["dirt"]["bottom_left"][1], 
        mapCenterX, 
        mapCenterY + levelSprite["side"]*worldScale,
        0, 
        worldScale, 
        worldScale, 
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
        -- if no object under mouse, move world
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
        worldScale = worldScale + 0.05
    else
        worldScale = worldScale - 0.05
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