--- The Dungeon-style map Prototype.
-- This class is extended by ROT.Map.Digger and ROT.Map.Uniform
-- @module ROT.Map.Dungeon
local ROT = require((...):gsub('[^./\\]*$', '') .. 'rot')
local Dungeon = ROT.Map:extend("Dungeon")
--- Constructor.
-- Called with ROT.Map.Cellular:new()
-- @tparam int width Width in cells of the map
-- @tparam int height Height in cells of the map
function Dungeon:init(width, height)
	Dungeon.super.init(self, width, height)
	self._rooms    ={}
	self._corridors={}
end

--- Get rooms
-- Get a table of rooms on the map
-- @treturn table A table containing objects of the type ROT.Map.Room
function Dungeon:getRooms() return self._rooms end

--- Get doors
-- Get a table of doors on the map
-- @treturn table A table {{x=int, y=int},...} for doors.
function Dungeon:getDoors()
    local result={}
    for _,v in pairs(self._rooms) do
        for l in pairs(v._doors) do
            local s=l:split(',')
            table.insert(result, {x=tonumber(s[1]), y=tonumber(s[2])})
        end
    end
    return result
end

--- Get corridors
-- Get a table of corridors on the map
-- @treturn table A table containing objects of the type ROT.Map.Corridor
function Dungeon:getCorridors() return self._corridors end

return Dungeon
