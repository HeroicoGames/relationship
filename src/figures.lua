ONE_PERSON_TEXT = 'One Person'

function drawAnimateSquare ()
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