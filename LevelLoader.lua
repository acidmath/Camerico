print("LevelLoader.lua loaded")

local levelLoader

function LevelLoader:new(levelLoader)
	levelLoader = levelLoader or {}
	setmetatable(levelLoader, self)
	self.__index = self
	return levelLoader
end

function LevelLoader:load(levelName)
	local level
	local levelRow
	local levelRowCount = 1
	
	local rawLevel	

	io.input("data/level/"..levelName)
	rawLevel = io.read("*line")
	while rawLevel !=nil
		local rawLevelPieces = {}
		local rawPieceCount = 0
		rawLevel:gsub(
			",", 
			function(lp) 
				rawPieceCount++ 
				table.insert(rawLevelPieces, lp) 
			end
		)

		local levelPiece = {}
		for i=1, rawPieceCount do
			rawLevelPieces[rawPieceCount]:gsub(
				":",
				function(rlp)
					table.insert(levelPiece, rlp)
				end
			)

			table.insert(levelRow, levelPiece)
		end

		level[levelRowCount]