local animation = {}

local dynamicXTopRightPosition = 0
local dynamicYBottomRightPosition = 0
local dynamicXBottomLeftPosition = 0
local dynamicYTopLeftPosition = 0

local speedIncrement = 5

function animation.setInitValues(xTopLeftPosition, yTopRightPosition, xBottomRightPosition, yBottomLeftPosition)
    -- Initial values for build animation
    dynamicXTopRightPosition = xTopLeftPosition
    dynamicYBottomRightPosition = yTopRightPosition
    dynamicXBottomLeftPosition = xBottomRightPosition
    dynamicYTopLeftPosition = yBottomLeftPosition
end

function animation.drawSquare(x, y , size)
    love.graphics.line ({
        x, y,
        x + size, y,
        x + size, y + size
    })
end

function animation.load(x1, y1, x2, y2)
    animation.setInitValues(x1, y1, x2, y2)
end


function animation.update()
end


function animation.draw()
end


return animation
