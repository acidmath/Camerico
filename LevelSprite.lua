print("LevelSprite.lua loaded")

require "love.graphics"

local image_w = 2560
local image_h = 1664
local side = 128

return {

    side = 128,

    image_filename = "assets/level/RPGpack_sheet_2X.png",
    
    image = love.graphics.newImage("assets/level/RPGpack_sheet_2X.png"),

    name = "level",
    
    orientations = {
    	"top_left",
    	"top",
    	"top_right",
    	"right",
    	"bottom_right",
    	"bottom",
    	"bottom_left",
    	"left",
    	"center"
	},

    ground_types = {
        "grass",
        "dirt",
        "water"
    },

    tiles = {

    	grass = {
    		top_left = 		        { love.graphics.newQuad( 0, 0, side, side, image_w, image_h ) },
    		top = 			        { love.graphics.newQuad( side, 0, side, side, image_w, image_h ) },
    		top_right = 	        { love.graphics.newQuad( side*2, 0, side, side, image_w, image_h ) },
    		right = 		        { love.graphics.newQuad( side*2, side, side, side, image_w, image_h ) },
    		bottom_right = 	        { love.graphics.newQuad( side*2, side*2, side, side, image_w, image_h ) },
    		bottom = 		        { love.graphics.newQuad( side, side*2, side, side, image_w, image_h ) },
    		bottom_left = 	        { love.graphics.newQuad( 0, side*2, side, side, image_w, image_h ) },
    		left = 			        { love.graphics.newQuad( 0, side, side, side, image_w, image_h ) },
    		center = 		        { 
                                        love.graphics.newQuad( side, side, side, side, image_w, image_h ),
                                        love.graphics.newQuad( side*3, side*2, side, side, image_w, image_h ), 
                                        love.graphics.newQuad( side*4, side*2, side, side, image_w, image_h ) 
                                    },
            outer_top_left =        { love.graphics.newQuad( side*3, 0, side, side, image_w, image_h ) },
            outer_top_right =       { love.graphics.newQuad( side*4, 0, side, side, image_w, image_h ) },
            outer_bottom_left =     { love.graphics.newQuad( side*3, side, side, side, image_w, image_h ) },
            outer_bottom_right =    { love.graphics.newQuad( side*4, side, side, side, image_w, image_h ) }
    	},

    	dirt = {
    		top_left = 		        { love.graphics.newQuad( side*5, 0, side, side, image_w, image_h ) },
    		top = 			        { love.graphics.newQuad( side*6, 0, side, side, image_w, image_h ) },
    		top_right = 	        { love.graphics.newQuad( side*7, 0, side, side, image_w, image_h ) },
    		right = 		        { love.graphics.newQuad( side*7, side, side, side, image_w, image_h ) },
    		bottom_right = 	        { love.graphics.newQuad( side*7, side*2, side, side, image_w, image_h ) },
    		bottom = 		        { love.graphics.newQuad( side*5, side*2, side, side, image_w, image_h ) },
    		bottom_left = 	        { love.graphics.newQuad( side*5, side*2, side, side, image_w, image_h ) },
    		left = 			        { love.graphics.newQuad( side*5, side, side, side, image_w, image_h ) },
    		center = 		        { love.graphics.newQuad( side*6, side, side, side, image_w, image_h ) },
            outer_top_left =        { love.graphics.newQuad( side*7, 0, side, side, image_w, image_h ) },
            outer_top_right =       { love.graphics.newQuad( side*8, 0, side, side, image_w, image_h ) },
            outer_bottom_left =     { love.graphics.newQuad( side*7, side, side, side, image_w, image_h ) },
            outer_bottom_right =    { love.graphics.newQuad( side*8, side, side, side, image_w, image_h ) }
    	},

    	water = {
    		top_left = 		        { love.graphics.newQuad( side*10, 0, side, side, image_w, image_h ) },
    		top = 			        { love.graphics.newQuad( side*11, 0, side, side, image_w, image_h ) },
    		top_right = 	        { love.graphics.newQuad( side*12, 0, side, side, image_w, image_h ) },
    		right = 		        { love.graphics.newQuad( side*12, side, side, side, image_w, image_h ) },
    		bottom_right = 	        { love.graphics.newQuad( side*12, side*2, side, side, image_w, image_h ) },
    		bottom = 		        { love.graphics.newQuad( side*11, side*2, side, side, image_w, image_h ) },
    		bottom_left = 	        { love.graphics.newQuad( side*10, side*2, side, side, image_w, image_h ) },
    		left = 			        { love.graphics.newQuad( side*10, side, side, side, image_w, image_h ) },
    		center = 		        { love.graphics.newQuad( side*11, side, side, side, image_w, image_h ) },
            outer_top_left =        { love.graphics.newQuad( side*13, 0, side, side, image_w, image_h ) },
            outer_top_right =       { love.graphics.newQuad( side*14, 0, side, side, image_w, image_h ) },
            outer_bottom_left =     { love.graphics.newQuad( side*13, side, side, side, image_w, image_h ) },
            outer_bottom_right =    { love.graphics.newQuad( side*14, side, side, side, image_w, image_h ) }
    	}

    }

}