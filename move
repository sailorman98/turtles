local x, y, z, x_2, y_2, z_2, direction = ... -- 0 is north, 1 is east, 2 is south, 3 is west

function moveForward()
    while not turtle.forward() do
        print("Something blocking ahead!")
        turtle.dig()
    end
    if direction == 0 do
        z = z - 1
    end
    if direction == 1 do
        x = x + 1
    end
    if direction == 2 do
        z = z + 1
    end
    if direction == 3 do
        x = x - 1
    end
end

function moveDown()
    while not turtle.down() do
        print("Something blocking below!")
        turtle.digDown()
    end
    y = y - 1
end

function moveUp()
    while not turtle.up() do
        print("Something blocking above!")
        turtle.digUp()
    end
    y = y + 1
end

function turn(dir)
    -- negative means left, positive means right
    if dir < 0 do
        for i = 0, dir, -1 do
            turtle.turnLeft()
        end
    end

    if dir  1 do
        for i = 0, dir, 1 do
            turtle.turnRight()
        end
    end
end

function turnTowards(dir)
    -- 0 is north, 1 is east, 2 is south, 3 is west
    turns = dir - direction
    if turns == 3 do
        turns = -1
    end
    if turns == -3 do
        turns = 1
    end
    turn(turns)
    direction = dir
end

function moveTo(x_new, y_new, z_new)
    if x < x_new then
        turnTowards(1)
        for i = 0, x_new - x, 1 do
            moveForward()
        end
    elseif x > x_new do
        turnTowards(3)
        for i = 0, x - x_new, 1 do
            moveForward()
        end
    end
   
    if y < y_new then
        for i = 0, y_new - y, 1 do
            moveUp()
        end
    elseif y > y_new then
        for i = 0, y - y_new, 1 do
            moveDown()
        end
    end

    if z < z_new then
        turnTowards(2)
        for i = 0, z_new - z, 1 do
            moveForward()
        end
    elseif z > z_new do
        turnTowards(0)
        for i = 0, z - z_new, 1 do
            moveForward()
        end
    end
end









