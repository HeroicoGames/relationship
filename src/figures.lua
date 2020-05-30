ONE_PERSON_TEXT = 'One Person'

local dynamicX2 = 0
local dynamicY3 = 0
local dynamicX4 = 0
local dynamicY1 = 0

local x1 = 0
local y1 = 0
local x2 = 0
local y2 = 0
local x3 = 0
local y3 = 0
local x4 = 0
local y4 = 0

local sideSize = 0
local increaseSize = 0

local xMiddlePoint = 0
local yMiddlePoint = 0

local figures = {}


function figures.initialCoordinates (initial_x, initial_y, sideSize)
    sideSize = sideSize
    increaseSize = 5
    squareTable = {}

    -- Get center of game screen
    -- xMiddlePoint = love.graphics.getWidth() / 2
    -- yMiddlePoint = love.graphics.getHeight() / 2

    -- Calculate edges
    x1 = initial_x
    y1 = initial_y

    x2 = x1 + sideSize
    y2 = y1

    x3 = x2
    y3 = y1 + sideSize

    x4 = x1
    y4 = y3

    -- Dynamic square
    dynamicX2 = x1
    dynamicY3 = y2
    dynamicX4 = x3
    dynamicY1 = y4
end


function figures.drawAnimateSquare ()
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

function figures.load(x1, y1, sideSize)
    figures.initialCoordinates (x1, y1, sideSize)
end

function figures.update()
    figures.drawAnimateSquare()
end

function figures.draw()
    love.graphics.line (squareTable)
    -- Only work with one rectangle center in window, for now
    love.graphics.printf ('ONE PERSON', x1, ((y3 - y1) / 2) + y1, x2 - x1, 'center')
end

return figures
