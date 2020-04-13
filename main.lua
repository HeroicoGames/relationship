function love.load ()
    -- TODO: move all code to src/figures.lua
    sideSize = 300
    increaseSize = 5
    squareTable = {}

    -- Get center of game screen
    xMiddlePoint = love.graphics.getWidth() / 2
    yMiddlePoint = love.graphics.getHeight() / 2

    -- Distance from center
    units = (sideSize / 2)

    -- Calculate edges
    x1 = xMiddlePoint - units
    y1 = yMiddlePoint - units

    x2 = xMiddlePoint + units
    y2 = y1

    x3 = x2
    y3 = yMiddlePoint + units

    x4 = x1
    y4 = y3

    -- Dynamic square
    dynamicX2 = x1
    dynamicY3 = y2
    dynamicX4 = x3
    dynamicY1 = y4
end

function love.update ()
    -- TODO: move all code to src/figures.lua
    if dynamicX2 < x2 then
        dynamicX2 = dynamicX2 + increaseSize
        squareTable = {
            x1, y1,
            dynamicX2, y2,
        }

    elseif dynamicY3 < y3 then
        dynamicY3 = dynamicY3 + increaseSize
        squareTable = {
            x1, y1,
            dynamicX2, y2,
            x3, dynamicY3,
        }

    elseif dynamicX4 > x4 then
        dynamicX4 = dynamicX4 - increaseSize
        squareTable = {
            x1, y1,
            dynamicX2, y2,
            x3, dynamicY3,
            dynamicX4, y4,
        }

    elseif dynamicY1 > y1 then
        dynamicY1 = dynamicY1 - increaseSize
        squareTable = {
            x1, y1,
            dynamicX2, y2,
            x3, dynamicY3,
            dynamicX4, y4,
            x1, dynamicY1,
        }

    end
end

function love.draw ()
    love.graphics.line (squareTable)
    love.graphics.print ('ONE PERSON', xMiddlePoint, yMiddlePoint, 0, 2, 2)
end
