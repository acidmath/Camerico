print("TreeSprite.lua loaded")

require "love.graphics"

local image_w = 2560
local image_h = 1664

local width = 128
local height = 256

return {

    width = 128,
    
    height = 256,

    image_filename = "assets/level/RPGpack_sheet_2X.png",
    
    image = love.graphics.newImage("assets/level/RPGpack_sheet_2X.png"),

    name = "tree_0",
    
    stages = {
    	"young",
    	"old"
	},

    tiles = {

    	young = {
    		love.graphics.newQuad(width, width*10, width, height, image_w, image_h )
    	},
    	
    	old = {
    		love.graphics.newQuad(0, width*10, width, height, image_w, image_h )
    	}

    }

}