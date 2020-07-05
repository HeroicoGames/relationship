local square = require 'src/figures/square'
local background = require 'src/background'

local deltaTotal = 0
local sceneName = ''


function love.load ()
    background.load ()
    square.load (400, 340, 200)

    -- Initialize one person
    -- Initialize two person
    -- Initialize relationship
    -- Initialize relationship broken
    -- Initialize one person support to another

    -- Generate random initial values for each scene
end

function love.update (deltaTime)
    deltaTotal = deltaTotal + deltaTime

    square.update()

    --[=====[
        START
            if range betwen 0 or 5 seconds
                sceneName <= one_person
            else if range between 5 or 10 seconds
                sceneName <= two_people
                .
                .
                .
        END

        START
            if sceneName is one_person
                updateOnePerson
            else if sceneName is two_people
                updateTwoPeople
                .
                .
                .
        END
    --]=====]

end

function love.draw ()
    background.draw ()

    if deltaTotal < 5 then
        square.draw()
    end

    --[=====[
        START
            if sceneName is one_person
                drawOnePerson
            else if sceneName is two_people
                drawTwoPeople
                .
                .
                .
        END
    --]=====]
end

