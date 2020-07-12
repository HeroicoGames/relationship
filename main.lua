local square = require 'src/figures/square'
local animation = require 'src/figures/animation'
local background = require 'src/background'

local deltaTotal = 0
local SCENE_MESSAGE = 'ONE PERSON'
local squareSideSize = 100
local gameEnd = false


function love.load ()
    backgroundMusic = love.audio.newSource ('sounds/relationship.ogg', 'static')
    backgroundMusic:play ()

    background.load ()
    one_person_square = square.create (200, 150, squareSideSize)

    two_people_he = square.create (400, 340, squareSideSize)
    two_people_she = square.create (420 + squareSideSize, 360, squareSideSize)

    relationship_he = square.create (310, 190, squareSideSize)
    relationship_she = square.create (311 + squareSideSize, 190, squareSideSize)
end


function love.update (deltaTime)
    deltaTotal = deltaTotal + deltaTime

    if (deltaTotal < 5 and sceneName ~= 'one_person') then
        sceneName = 'one_person'

    elseif (deltaTotal > 5 and deltaTotal < 10 and sceneName ~= 'first_part_two_people') then
        sceneName = 'first_part_two_people'

        SCENE_MESSAGE = 'TWO PEOPLE'

    elseif (deltaTotal > 10 and deltaTotal < 15 and sceneName ~= 'second_part_two_people') then
        sceneName = 'second_part_two_people'

    elseif (deltaTotal > 15 and deltaTotal < 20 and sceneName ~= 'relationship') then
        sceneName = 'relationship'

        SCENE_MESSAGE = 'RELATIONSHIP'

    elseif (deltaTotal > 20 and gameEnd ~= true) then
        gameEnd = true

    end

    if sceneName == 'one_person' then
        animation.update(one_person_square)

    elseif sceneName == 'first_part_two_people' then
        animation.update(two_people_he)

    elseif sceneName == 'second_part_two_people' then
        animation.update(two_people_she)

    elseif sceneName == 'relationship' then
        animation.update(relationship_he)
        animation.update(relationship_she)
    end
end


function love.draw ()
    background.draw ()

    if sceneName == 'one_person' then
        animation.draw (one_person_square)

    elseif sceneName == 'first_part_two_people' then
        animation.draw (two_people_he)

    elseif sceneName == 'second_part_two_people' then
        animation.draw (two_people_he)
        animation.draw (two_people_she)

    elseif sceneName == 'relationship' then
        animation.draw(relationship_he)
        animation.draw(relationship_she)

        -- TODO: center heart
        -- Reference: https://twitter.com/obey_love/status/831484678066561024?lang=en
        if gameEnd == true then
            for index = 1, 2 do
                love.graphics.circle('fill', 36 * index, 40, 22)
            end

            love.graphics.polygon('fill', 18, 53, 90, 53, 54, 96)
        end

    end

    love.graphics.printf (SCENE_MESSAGE, 0, 20, love.graphics.getWidth (), 'center')
end
