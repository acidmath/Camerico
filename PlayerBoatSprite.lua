print("PlayerBoatSprite.lua loaded")

require "love.graphics"

local image_w = 644
local image_h = 644

local side = 161

return {

    side = 161,

    image_filename = "assets/player/boat1.png",
    
    image = love.graphics.newImage("assets/player/boat1.png"),

    name = "player_boat",
    
    orientations = {
    	"left",
    	"top",
    	"right",
    	"bottom"
	},

    tiles = {

    	left = {
    		love.graphics.newQuad( 0, side, side, side, image_w, image_h ),
    		love.graphics.newQuad( side, side, side, side, image_w, image_h ),
    		love.graphics.newQuad( side*2, side, side, side, image_w, image_h ),
    		love.graphics.newQuad( side*3, side, side, side, image_w, image_h )
    	},
    	
    	up = {
    		love.graphics.newQuad( 0, side*3, side, side, image_w, image_h ),
    		love.graphics.newQuad( side, side*3, side, side, image_w, image_h ),
    		love.graphics.newQuad( side*2, side*3, side, side, image_w, image_h ),
    		love.graphics.newQuad( side*3, side*3, side, side, image_w, image_h )
    	},
    	
    	right = {
    		love.graphics.newQuad( 0, side*2, side, side, image_w, image_h ),
    		love.graphics.newQuad( side, side*2, side, side, image_w, image_h ),
    		love.graphics.newQuad( side*2, side*2, side, side, image_w, image_h ),
    		love.graphics.newQuad( side*3, side*2, side, side, image_w, image_h )
    	},

    	down = {
    		love.graphics.newQuad( 0, 0, side, side, image_w, image_h ),
    		love.graphics.newQuad( side, 0, side, side, image_w, image_h ),
    		love.graphics.newQuad( side*2, 0, side, side, image_w, image_h ),
    		love.graphics.newQuad( side*3, 0, side, side, image_w, image_h )
    	}

    }

}