local animation = {}

local sideIncrement = 5


function animation.updateSidesSize (square)
    -- TODO: Investigate better solution
    if not animation.updateTopSideSize (square) then
        if not animation.updateRightSideSize (square) then
            if not animation.updateBottomSideSize (square) then
                animation.updateLeftSideSize (square)
            end
        end
    end
end


function animation.updateTopSideSize (square)
    if square.dynamicXTopRightPosition < square.xTopRightPosition then
        square.dynamicXTopRightPosition = square.dynamicXTopRightPosition + sideIncrement

        square.squareTable = {
            square.xTopLeftPosition, square.yTopLeftPosition,
            square.dynamicXTopRightPosition, square.yTopRightPosition,
        }

        return true
    end
end


function animation.updateRightSideSize (square)
    if square.dynamicYBottomRightPosition < square.yBottomRightPosition then
        square.dynamicYBottomRightPosition = square.dynamicYBottomRightPosition + sideIncrement

        square.squareTable = {
            square.xTopLeftPosition, square.yTopLeftPosition,
            square.dynamicXTopRightPosition, square.yTopRightPosition,
            square.xBottomRightPosition, square.dynamicYBottomRightPosition,
        }

        return true
    end
end


function animation.updateBottomSideSize (square)
    if square.dynamicXBottomLeftPosition > square.xBottomLeftPosition then
        square.dynamicXBottomLeftPosition = square.dynamicXBottomLeftPosition - sideIncrement

        square.squareTable = {
            square.xTopLeftPosition, square.yTopLeftPosition,
            square.dynamicXTopRightPosition, square.yTopRightPosition,
            square.xBottomRightPosition, square.dynamicYBottomRightPosition,
            square.dynamicXBottomLeftPosition, square.yBottomLeftPosition,
        }

        return true
    end
end


function animation.updateLeftSideSize (square)
    if square.dynamicYTopLeftPosition > square.yTopLeftPosition then
        square.dynamicYTopLeftPosition = square.dynamicYTopLeftPosition - sideIncrement

        square.squareTable = {
            square.xTopLeftPosition, square.yTopLeftPosition,
            square.dynamicXTopRightPosition, square.yTopRightPosition,
            square.xBottomRightPosition, square.dynamicYBottomRightPosition,
            square.dynamicXBottomLeftPosition, square.yBottomLeftPosition,
            square.xTopLeftPosition, square.dynamicYTopLeftPosition,
        }

        return true
    end
end


function animation.update (square)
    animation.updateSidesSize (square)
end


function animation.draw (square)
    love.graphics.line (square.squareTable)
end


return animation

