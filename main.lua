function love.load ()
    sideSize = 300

    -- Get center of game screen
    x_middle_point = love.graphics.getWidth() / 2
    y_middle_point = love.graphics.getHeight() / 2

    -- Distance from center
    units = (sideSize / 2)

    -- Calculate edges
    x1 = x_middle_point - units
    y1 = y_middle_point - units

    x2 = x_middle_point + units
    y2 = y1

    x3 = x2
    y3 = y_middle_point + units

    x4 = x1
    y4 = y3
end

function love.update ()

end

function love.draw()
    love.graphics.line(x1, y1, x2, y2, x3, y3, x4, y4, x1, y1)
end
