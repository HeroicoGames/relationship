require 'src/figures'


function love.load ()
    determineInitialCoordinates ()
end

function love.update ()
    drawAnimateSquare()
end

function love.draw ()
    love.graphics.line (squareTable)
    -- TODO: center text
    love.graphics.print ('ONE PERSON', xMiddlePoint, yMiddlePoint, 0, 2, 2)
end
