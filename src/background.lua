local background = {}

-- Reference https://love2d.org/wiki/love.graphics.point
function background.load()
    local screen_width, screen_height = love.graphics.getDimensions()
    local max_stars = 100   -- how many stars we want
  
    stars = {}   -- table which will hold our stars
  
    for i=1, max_stars do   -- generate the coords of our stars
       local x = love.math.random(5, screen_width-5)   -- generate a "random" number for the x coord of this star
       local y = love.math.random(5, screen_height-5)   -- both coords are limited to the screen size, minus 5 pixels of padding
       stars[i] = {x, y}   -- stick the values into the table
    end
 end
  
 function background.draw()
    for i, star in ipairs(stars) do   -- loop through all of our stars
       love.graphics.points (star[1], star[2])   -- draw each point
    end
 end

 return background
