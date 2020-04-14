require 'src/figures'

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
    drawAnimateSquare()
end

function love.draw ()
    love.graphics.line (squareTable)
    -- TODO: center text
    love.graphics.print ('ONE PERSON', xMiddlePoint, yMiddlePoint, 0, 2, 2)
end
