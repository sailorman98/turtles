local x_2, y_2, z_2 = ...
local direction = 0

function moveForward()
    while not turtle.forward() do
        print("Something blocking ahead!")
        turtle.dig()
    end
end

function moveDown()
    while not turtle.down() do
        print("Something blocking below!")
        turtle.digDown()
    end
end

function moveUp()
    while not turtle.up() do
        print("Something blocking above!")
        turtle.digUp()
    end
end

function turn(dir)
    -- negative means left, positive means right
    if dir < 0 then
        for i = 0, dir, -1 do
            turtle.turnLeft()
        end
    end

    if dir > 0 then
        for i = 0, dir, 1 do
            turtle.turnRight()
        end
    end
end

function turnTowards(dir)
    -- 0 is north, 1 is east, 2 is south, 3 is west
    turns = dir - direction
    if turns == 3 then
        turns = -1
    end
    if turns == -3 then
        turns = 1
    end

    turn(turns)
    direction = dir
end

function moveTo(x_new, y_new, z_new)

    if 0 < x_new then
        turnTowards(1)
        for i = 0, x_new - 1, 1 do
            moveForward()
        end
    elseif 0 > x_new then
        turnTowards(3)
        for i = 0, 0 - x_new - 1, 1 do
            moveForward()
        end
    end
   
    if 0 < y_new then
        for i = 0, y_new - 1, 1 do
            moveUp()
        end
    elseif 0 > y_new then
        for i = 0, 0 - y_new - 1, 1 do
            print(y_new)
            print("moving down")
            moveDown()
        end
    end

    if 0 < z_new then
        turnTowards(2)
        for i = 0, z_new - 1, 1 do
            moveForward()
        end
    elseif 0 > z_new then
        turnTowards(0)
        for i = 0, 0 - z_new - 1, 1 do
            moveForward()
        end
    end
end

print("starting")
moveTo(tonumber(x_2), tonumber(y_2), tonumber(z_2))






