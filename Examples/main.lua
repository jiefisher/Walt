local animator = require 'animator'
local anim, anim2, anim3
local rotation

function love.load()
    love.graphics.setDefaultFilter( 'nearest', 'nearest' )
    local one = love.graphics.newImage( 'Images/1.png' )
    local quadImage = love.graphics.newImage( 'Images/2 and 4.png' )
    local three = love.graphics.newImage( 'Images/3.png' )
    local two = love.graphics.newQuad( 0, 0, 32, 32, 64, 32 )
    local four = love.graphics.newQuad( 32, 0, 32, 32, 64, 32 )

    anim = animator.newAnimation( { one, two, three, four }, { 1, 1, 1, 1 }, quadImage )
    anim:setLooping()
    rotation = 0

    local bigQuad = love.graphics.newImage( 'Images/Quad.png' )
    local grid = animator.newGrid( 32, 32, bigQuad, 0, 0, bigQuad:getDimensions() )
    anim2 = animator.newAnimation( grid( 1,1, 2,'2 - 4', '2 - 4',1, 1,2, 4,'4 - 2', 1,4, 3,'4-2', 1,3 ), 1, bigQuad )
    anim2:setLooping( true )

    grid = animator.newGrid( 32, 32, bigQuad, 32, 32, bigQuad:getDimensions() )
    anim3 = animator.newAnimation( grid( 1,'1-3', 3,'3-1', 2,'3-1' ), 1, bigQuad )
end

function love.update( dt )
    rotation = rotation + dt

    anim:update( dt )
    anim2:update( dt )
    anim3:update( dt )
end

function love.draw()
    anim:draw( 400, 300, rotation, 1, 1, anim:getWidth() / 2, anim:getHeight() / 2 )
    anim2:draw()
    anim3:draw( 32, 32 )
end

function love.keyreleased( key )
    if key == 'escape' then 
        love.event.quit()
    else 
        anim:restart()
        anim2:restart()
        anim3:restart()
    end
end
