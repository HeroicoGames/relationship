local figures = require 'src/figures'


function love.load ()
    figures.load ()
end

function love.update ()
    figures.update()
end

function love.draw ()
    figures.draw()
end
