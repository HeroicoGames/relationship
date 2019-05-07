function love.load ()
    love.window.setTitle ('Relationship')

    increment = 2
    sideSize = 300
    x1 = 100
    y1 = 100
    x2 = x1
    y2 = y1
    x3 = 0
    y3 = y1
    x4 = 0
    y4 = 0

     squareTable = {
        x1, y1,
        x2, y2,
        x3, y3,
        x4, y4,
     }
end

function love.update ()
    drawAnimateSquare ()
end

function love.draw()
    love.graphics.line (squareTable)
    love.graphics.print('ONE PERSON', 100, 100, 0, 2, 2)
end

function drawAnimateSquare ()
    if x2 <= sideSize then
        x2 = x2 + increment
        squareTable = {
            x1, y1,
            x2, y2,
        }
        x3 = x2
    elseif y3 <= sideSize + y1 then
        y3 = y3 + increment
        squareTable = {
            x1, y1,
            x2, y2,
            x3, y3,
         }
         y4 = y3
         x4 = x3
    elseif x4 >= 0 then
        x4 = x4 - increment
        squareTable = {
            x1, y1,
            x2, y2,
            x3, y3,
            x4, y4
         }
         
    end
end
