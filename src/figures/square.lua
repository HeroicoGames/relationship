local square = {}

local sideIncrement = 5


function square.create (initialXPosition, initialYPosition, sideSize)
    local xTopRightPosition = initialXPosition + sideSize
    local yBottomRightPosition = initialYPosition + sideSize

    return {
        xTopLeftPosition = initialXPosition,
        yTopLeftPosition = initialYPosition,
        xTopRightPosition = xTopRightPosition,
        yTopRightPosition = initialYPosition,
        xBottomRightPosition = xTopRightPosition,
        yBottomRightPosition = yBottomRightPosition,
        xBottomLeftPosition = initialXPosition,
        yBottomLeftPosition = yBottomRightPosition,
        -- Initial values for build dynamic square
        dynamicXTopRightPosition = initialXPosition,
        dynamicYBottomRightPosition = initialYPosition,
        dynamicXBottomLeftPosition = xTopRightPosition,
        dynamicYTopLeftPosition = yBottomRightPosition,
        squareTable = nil
    }
end


return square
