local square = {}

ONE_PERSON_TEXT = 'One Person'
local squareTable = {}

local sideIncrement = 5
local xTopLeftPosition = 0
local xTopRightPosition = 0
local xBottomRightPosition = 0
local xBottomLeftPosition = 0
local yTopLeftPosition = 0
local yTopRightPosition = 0
local yBottomRightPosition = 0
local yBottomLeftPosition = 0

local dynamicXTopRightPosition = 0
local dynamicXBottomLeftPosition = 0
local dynamicYBottomRightPosition = 0
local dynamicYTopLeftPosition = 0

local currentSize

function square.setInitialValues (initialXPosition, initialYPosition, sideSize)
    xTopLeftPosition = initialXPosition
    yTopLeftPosition = initialYPosition

    xTopRightPosition = xTopLeftPosition + sideSize
    yTopRightPosition = yTopLeftPosition

    xBottomRightPosition = xTopRightPosition
    yBottomRightPosition = yTopLeftPosition + sideSize

    xBottomLeftPosition = xTopLeftPosition
    yBottomLeftPosition = yBottomRightPosition

    -- Initial values for build dynamic square
    dynamicXTopRightPosition = xTopLeftPosition
    dynamicYBottomRightPosition = yTopRightPosition
    dynamicXBottomLeftPosition = xBottomRightPosition
    dynamicYTopLeftPosition = yBottomLeftPosition
    -- side global
    currentSize = sideSize
end

function square.updateSidesSize ()
    -- TODO: Investigate better solution
    if not square.updateTopSideSize () then
        if not square.updateRightSideSize () then
            if not square.updateBottomSideSize () then
                square.updateLeftSideSize ()
            end
        end
    end
end


function square.updateTopSideSize ()
    if dynamicXTopRightPosition < xTopRightPosition then
        dynamicXTopRightPosition = dynamicXTopRightPosition + sideIncrement
        
        squareTable = {
            xTopLeftPosition, yTopLeftPosition,
            dynamicXTopRightPosition, yTopRightPosition,
        }

        return true
    end
end


function square.updateRightSideSize ()
    if dynamicYBottomRightPosition < yBottomRightPosition then
        dynamicYBottomRightPosition = dynamicYBottomRightPosition + sideIncrement
        
        squareTable = {
            xTopLeftPosition, yTopLeftPosition,
            dynamicXTopRightPosition, yTopRightPosition,
            xBottomRightPosition, dynamicYBottomRightPosition,
        }

        return true
    end
end


function square.updateBottomSideSize ()
    if dynamicXBottomLeftPosition > xBottomLeftPosition then
        dynamicXBottomLeftPosition = dynamicXBottomLeftPosition - sideIncrement
        
        squareTable = {
            xTopLeftPosition, yTopLeftPosition,
            dynamicXTopRightPosition, yTopRightPosition,
            xBottomRightPosition, dynamicYBottomRightPosition,
            dynamicXBottomLeftPosition, yBottomLeftPosition,
        }

        return true
    end
end


function square.updateLeftSideSize ()
    if dynamicYTopLeftPosition > yTopLeftPosition then
        dynamicYTopLeftPosition = dynamicYTopLeftPosition - sideIncrement
        
        squareTable = {
            xTopLeftPosition, yTopLeftPosition,
            dynamicXTopRightPosition, yTopRightPosition,
            xBottomRightPosition, dynamicYBottomRightPosition,
            dynamicXBottomLeftPosition, yBottomLeftPosition,
            xTopLeftPosition, dynamicYTopLeftPosition,
        }

        return true
    end
end


function square.drawBehavior (x, y, size)
    squareTable = {
        x, y,
        x + size, y,
        x + size, y + size,
        x, y + size,
        x, y,
    }
    love.graphics.line (squareTable)
end


function square.load(initialXPosition, initialYPosition, sidesSize, functionDrawBehavior)
    square.drawBehavior = functionDrawBehavior or square.drawBehavior
    square.setInitialValues (initialXPosition, initialYPosition, sidesSize)
end


function square.update()
    square.updateSidesSize ()
end


function square.test(args)
    if type(args) ~= 'string' then
        return
    end
end


function square.draw()
    square.drawBehavior(xTopLeftPosition, yTopLeftPosition, currentSize)
    -- TODO: move to own module
    love.graphics.printf (
        ONE_PERSON_TEXT,
        xTopLeftPosition,
        -- Calculate Y center of the square
        ((yBottomRightPosition - yTopLeftPosition) / 2) + yTopLeftPosition,
        xTopRightPosition - xTopLeftPosition,
        'center'
    )
end


return square
