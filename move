-- local straight, up, right = ...
-- local x = 0
-- local y = 0
-- local z = 0

-- local rightTurns = 0
-- local leftTurns = 0

-- local fuelUsed = 0

-- function moveForward()
--     success, front = turtle.inspect()

--     while not turtle.forward() and front.name ~= "minecraft:bedrock" do
--         print("Something blocking ahead!")
--         turtle.dig()
--     end

--     if front.name == "minecraft:bedrock" then
--        moveHome()
--     end

--     direction = math.abs(tonumber(rightTurns) - tonumber(leftTurns)) % 4 -- 0 is straight, 1 with left > right = left, 3 with right > left = left, 1 with right > left = right, 3 with left > right = right, 2 = back
    
--     if direction == 0 then
--         x = x + 1
--         print("X: "..x)
--     elseif direction == 2 then
--         x = x - 1
--         print("X: "..x)
--     elseif (direction == 1 and leftTurns > rightTurns) or (direction == 3 and rightTurns > leftTurns) then
--         z = z - 1
--         print("Z: "..z)
--     else
--         z = z + 1
--         print("Z: "..z)
--     end
-- end

-- function moveDown()
--     success, bottom = turtle.inspectDown()
--     while not turtle.down() and bottom.name ~= "minecraft:bedrock" do
--         print("Something blocking below!")
--         turtle.digDown()
--     end
--     if bottom.name == "minecraft:bedrock" then
--        moveHome()
--     end
--     y = y + 1
--     print("Y: "..y)
-- end

-- function moveUp()
--     while not turtle.up() do
--         print("Something blocking above!")
--         turtle.digUp()
--     end

--     y = y - 1
--     print("Y: "..y)

-- end

-- function move()
--     straight = tonumber(straight)
--     up = tonumber(up)
--     right = tonumber(right)

--     for i = 1, straight, 1 do
--         moveForward()
--     end

--     turtle.turnRight()
--     for i = 1, right, 1 do
--         moveForward()
--     end

--     if up > 0 then
--         for i = 1, up, 1 do
--             moveUp()
--         end
--     else
--         print("WE SHOULD BE MOVING DOWN")
--         for i = 1, 0 - up, 1 do
--             moveDown()
--         end
--     end
--     moveHome()
-- end

-- function turnLeft()
--     print("Turning left")
--     turtle.turnLeft()
--     leftTurns = leftTurns + 1
--     direction = math.abs(tonumber(rightTurns) - tonumber(leftTurns)) % 4
--     print("Direction: ", direction)
-- end

-- function turnRight()
--     turtle.turnRight()
--     rightTurns = rightTurns + 1
--     print("Turning right")
--     direction = math.abs(tonumber(rightTurns) - tonumber(leftTurns)) % 4
--     print("Direction: ", direction)
-- end

-- function moveHome()
--     print("Moving home")
--     fuelUsed = math.abs(x) + math.abs(y) + math.abs(z)
--     turnTowardsHome()
--     print("X: "..x.." Y: "..y.." Z: "..z)
--     for i = 1, y, 1 do
--         moveDown()
--     end

--     for i = 1, x, 1 do
--         moveForward()
--     end

--     if z < 0 then
--         turnLeft()
--     elseif z > 0 then
--         turnRight()
--     end

--     for i = 1, math.abs(z), 1 do
--         moveForward()
--     end
--     turnAwayFromHome()
--     dropItems()
-- end

-- function turnTowardsHome()
--     while math.abs(tonumber(rightTurns) - tonumber(leftTurns)) % 4 ~= 2 do
--         turnRight()
--     end
-- end
    
function turnAwayFromHome()
    while math.abs(tonumber(rightTurns) - tonumber(leftTurns)) % 4 ~= 0 do
        turnRight()
    end
end

-- function refuel()
--     for slot = 1,16,1
--     do
--         turtle.select(slot)
--         turtle.refuel()
--     end
-- end

-- function dropItems()
--     print("Dropping items")
--     for slot = 1,16,1
--     do
--         turtle.select(slot)
--         turtle.dropDown()
--     end
-- end

-- move()





