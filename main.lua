local square = require 'src/figures/square'
local animation = require 'src/figures/animation'
local background = require 'src/background'

function love.load ()
    background.load ()
    square.load (400, 340, 200, animation.drawSquare)
end

function love.update ()
    square.update()
end

function love.draw ()
    background.draw ()
    square.draw()
end
