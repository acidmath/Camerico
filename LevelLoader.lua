print("LevelLoader.lua loaded")

LevelLoader = {}
LevelLoader.__index = LevelLoader

function LevelLoader.new()
	local levelLoader = {}
	setmetatable(levelLoader, LevelLoader)
	return LevelLoader
end

-- reads in a level name, opens file, converts to  multidimensional table
function LevelLoader:load(levelName)
	local levelColumns = -1
	local levelRows = 0
	local levelTable = {}
	local debugLevel = ""
	for line in io.lines("data/level/"..levelName..".bin") do
		if string.find(line, '-') == nil then
			levelRows = levelRows + 1
			if levelColumns < 0 then
				levelColumns = string.len(line)
				if levelColumns%2 == 1 then
					io.close()
					return "Error: level data not formatted correctly - row contains an odd amount of characters"
				end
			end
			if levelColumns == string.len(line) then
				table.insert(levelTable, ConvertHexToLevelRow(line))
			else 
				io.close()
				return "Error: level data not formatted correctly - mismatched column count in level data"
			end
		end
	end
	io.close()
	return levelTable, levelRows, levelColumns*0.5
end

function ConvertHexToLevelRow(hexLevelRow)
	local convertedRow = {}
	for i=1, string.len(hexLevelRow), 2 do
		local tileTypeAndOrientation = {}
		local tileType = ConvertHexToTileType(string.sub(hexLevelRow, i, i))
		local tileOrientation = ConvertHexToOrientation(string.sub(hexLevelRow, i+1, i+1))
		if tileType == -1 or tileOrientation == -1 then
			return "Error: level data not formatted correctly - undefined character"
		end
		tileTypeAndOrientation[1] = tileType		
		tileTypeAndOrientation[2] = tileOrientation
		table.insert(convertedRow, tileTypeAndOrientation)
	end
	return convertedRow
end

function ConvertHexToTileType(hexTileType)
	if hexTileType == '0' then
		return "grass"
	elseif hexTileType == '1' then
		return "dirt"
	elseif hexTileType == '2' then
		return "water"
	end
	return -1
end

function ConvertHexToOrientation(hexOrientation)
	if hexOrientation == '0' then
		return "top_left"
	elseif hexOrientation == '1' then
		return "top"
	elseif hexOrientation == '2' then
		return "top_right"
	elseif hexOrientation == '3' then
		return "right"
	elseif hexOrientation == '4' then
		return "bottom_right"
	elseif hexOrientation == '5' then
		return "bottom"
	elseif hexOrientation == '6' then
		return "bottom_left"
	elseif hexOrientation == '7' then
		return "left"
	elseif hexOrientation == '8' then
		return "center"
	elseif hexOrientation == '9' then
		return "outer_top_left"
	elseif hexOrientation == 'A' then
		return "outer_top_right"
	elseif hexOrientation == 'B' then
		return "outer_bottom_left"
	elseif hexOrientation == 'C' then
		return "outer_bottom_right"
	end
	return -1
end
