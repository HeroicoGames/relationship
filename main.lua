local square = require 'src/figures/square'
local background = require 'src/background'


function love.load ()
    background.load ()
    square.load (400, 340, 200)
end

function love.update ()
    square.update()
end

function love.draw ()
    background.draw ()
    square.draw()
end
