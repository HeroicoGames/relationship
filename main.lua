local square = require 'src/figures/square'
local animation = require 'src/figures/animation'
local background = require 'src/background'

local deltaTotal = 0
-- local sceneName = 'one_person'
local SCENE_MESSAGE = 'One Person'


function love.load ()
    background.load ()
    one_person_square = square.create (200, 150, 200)

    two_people_he = square.create (400, 340, 200)   
    two_people_she = square.create (420, 390, 200)   

    relationship_he = square.create (500, 240, 200)   
    relationship_she = square.create (500, 240, 200)
end


function love.update (deltaTime)
    deltaTotal = deltaTotal + deltaTime

    if (deltaTotal < 5 and sceneName ~= 'one_person') then
        sceneName = 'one_person'

    elseif (deltaTotal > 5 and deltaTotal < 10 and sceneName ~= 'two_people') then
        sceneName = 'two_people'

        SCENE_MESSAGE = 'Two people'

    elseif (deltaTotal > 10 and deltaTotal < 15 and sceneName ~= 'relationship') then
        sceneName = 'relationship'

        SCENE_MESSAGE = 'Relationship'

    end

    if sceneName == 'one_person' then
        animation.update(one_person_square)

    elseif sceneName == 'two_people' then
        animation.update(two_people_he)
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

    elseif sceneName == 'two_people' then
        animation.draw (two_people_he)
        animation.draw (two_people_she)

    elseif sceneName == 'relationship' then
        animation.draw(relationship_he)
        animation.draw(relationship_she)

    end

    -- TODO: center in X (screen size)
    love.graphics.print (SCENE_MESSAGE, 500, 0)
end

