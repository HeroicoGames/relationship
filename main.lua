local square = require 'src/figures/square'
local background = require 'src/background'

local deltaTotal = 0
local sceneName = 'one_person'


function love.load ()
    background.load ()

    square.setInitialValues (200, 150, 200)
end

function love.update (deltaTime)
    deltaTotal = deltaTotal + deltaTime

    if (deltaTotal < 5 and sceneName ~= 'one_person') then
        sceneName = 'one_person'

    elseif (deltaTotal > 5 and deltaTotal < 10 and sceneName ~= 'two_people') then
        sceneName = 'two_people'
        square.setInitialValues (400, 340, 200)

    elseif (deltaTotal > 10 and deltaTotal < 15 and sceneName ~= 'relationship') then
        sceneName = 'relationship'
        square.setInitialValues (500, 240, 200)

    end

    square.update()

end

function love.draw ()
    background.draw ()

    square.draw ()
end

