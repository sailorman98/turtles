local straight, up, right = ...
local x = 0
local y = 0
local z = 0

local rightTurns = 0
local leftTurns = 0

local fuelUsed = 0

function moveForward()
    front = turtle.inspect()

    while not turtle.forward() and front.name ~= "minecraft:bedrock" do
        print("Something blocking ahead!")
        turtle.dig()
    end

    if front.name == "minecraft:bedrock" then
       moveHome()
    end

    direction = math.abs(tonumber(rightTurns) - tonumber(leftTurns)) % 4 -- 0 is straight, 1 with left > right = left, 3 with right > left = left, 1 with right > left = right, 3 with left > right = right, 2 = back
    
    if direction == 0 then
        x = x + 1
        print(x)
    elseif direction == 2 then
        x = x - 1
        print(x)
    elseif (direction == 1 and leftTurns > rightTurns) or (direction == 3 and rightTurns > leftTurns) then
        z = z - 1
        print(z)
    else
        z = z + 1
        print(z)
    end
end

function moveDown()
    bottom = turtle.inspectDown()
    while not turtle.down() and bottom.name ~= "minecraft:bedrock" do
        print("Something blocking below!")
        turtle.digDown()
    end
    if bottom.name == "minecraft:bedrock" then
       moveHome()
    end

    y = y + 1
    print(y)
end

function moveUp()
    while not turtle.up() do
        print("Something blocking above!")
        turtle.digUp()
    end

    y = y - 1
    print(y)
end

function move()
    straight = tonumber(straight)
    up = tonumber(up)
    right = tonumber(right)

    for i = 1, straight, 1 do
        moveForward()
    end

    turtle.turnRight()
    for i = 1, right, 1 do
        moveForward()
    end

    if up > 0 then
        for i = 1, up, 1 do
            moveUp()
        end
    else
        for i = 1, 0 - up, 1 do
            moveDown()
        end
    end
    moveHome()
end

function turnLeft()
    turtle.turnLeft()
    leftTurns = leftTurns + 1
end

function turnRight()
    turtle.turnRight()
    rightTurns = rightTurns + 1
end

function moveHome()
    fuelUsed = abs(x) + abs(y) + abs(z)
    turnTowardsHome()
    for i in 1, y, 1 do
        moveUp()
    end

    for i in 1, x, 1 do
        moveForward()
    end

    if z < 0 then
        turnLeft()
    elseif z > 0 then
        turnRight()
    end

    for i in 1, math.abs(z), 1 do
        moveForward()
    end
    turnAwayFromHome()
    dropItems()
end

function turnTowardsHome()
    while math.abs(tonumber(rightTurns) - tonumber(leftTurns)) % 4 ~= 2 do
        turnRight()
    end
end
    
function turnAwayFromHome()
    while math.abs(tonumber(rightTurns) - tonumber(leftTurns)) % 4 ~= 0 do
        turnRight()
    end
end

function refuel()
    for slot = 1,16,1
    do
        turtle.select(slot)
        turtle.refuel()
    end
end

function dropItems()
    print("Dropping items")
    for slot = 1,16,1
    do
        turtle.select(slot)
        turtle.dropDown()
    end
end

move()





