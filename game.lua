x = false

function love.update()
    if love.keyboard.isDown("escape") then
        x = true
    elseif x then
        dofile("main.lua")
    end
end

function love.draw()
    love.graphics.print("It works!")
end