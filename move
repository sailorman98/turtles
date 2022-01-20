local straight, up, right = ...

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
end

move()






