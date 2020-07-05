local square = require 'src/figures/square'
local background = require 'src/background'

local deltaTotal = 0


function love.load ()
    background.load ()
    square.load (400, 340, 200)
end

function love.update (deltaTime)
    deltaTotal = deltaTotal + deltaTime

    if deltaTime < 10 then
        square.update()
    end
end

function love.draw ()
    background.draw ()
    
    if deltaTotal < 5 then
        square.draw()
    end
end

