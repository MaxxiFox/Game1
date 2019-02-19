

--Alle zu ladenden Elemente sind hier drin
function love.load()
     block1 = love.graphics.newImage("graphics/block1.png")
end

function drawing ()
    for j = 0, 59 do
        if j == 0 or j == 59 then
            for i = 0, 79 do
                love.graphics.draw(block1, i*10, j*10)
            end
        else
            love.graphics.draw(block1, 0, j*10)
            love.graphics.draw(block1, 790, j*10)
        end
    end
end

function titletext ()
    love.graphics.setColor(0.5, 0.6, 0.2)
    love.graphics.print("Sellorx", 500/2, 600/20, 0, 7, 7)
    love.graphics.setColor(100, 100, 100)
end

--Update-Funktion für Bewegungen und immer wiederkehrende Funktionen
function love.update()
end

--Zeichnen des Spielfeldes
function love.draw()
    drawing()
    titletext()
    love.graphics.print("START", 700/2, 600/4, 0, 5, 5)
    love.graphics.print("SCORE", 700/2, 600/2.5, 0, 5, 5)
    love.graphics.print("CREDITS", 700/2, 600/1.8, 0, 5, 5)
end