local levelFile
local levelFileName

LevelGenerator = {}
LevelGenerator.__index = LevelGenerator

function LevelGenerator.new()
	local levelGenerator = {}
	setmetatable(levelGenerator, LevelGenerator)
	return LevelGenerator
end

function LevelGenerator:generate(seed, sizeRows, sizeCols)
	levelFileName = "France"..seed
	setupFile()

    for row=1, sizeRows do
    	local hexLevelRow = ""
    	for column=1, sizeCols do
    		local randomNumber1 = math.random(2)    		
    		local randomNumber2 = math.random(2)    		
    		hexLevelRow = hexLevelRow.."1C"
    	end
    	writeLevelRow(hexLevelRow)
    end

    levelFile:close()
    return levelFileName
end

function setupFile()
	levelFile = io.open("data/level/"..levelFileName..".bin", "w")
end

function writeLevelRow(hexLevelRow)
	levelFile:write(hexLevelRow, "\n")
end