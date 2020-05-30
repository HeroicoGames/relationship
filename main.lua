local figures = require 'src/figures'


function love.load ()
    figures.load (400, 340, 200)
end

function love.update ()
    figures.update()
end

function love.draw ()
    figures.draw()
end
