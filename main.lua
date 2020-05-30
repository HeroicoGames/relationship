local square = require 'src/figures/square'


function love.load ()
    square.load (400, 340, 200)
end

function love.update ()
    square.update()
end

function love.draw ()
    square.draw()
end
