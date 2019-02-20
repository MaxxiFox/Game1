rot = 0             -- Rotierung des Logos
gameSelect = 0      -- Spielselektierung
s = 0.2             -- Zeitsetzung
lastActionTime = 0  -- Letzte Zeit von Aktion
squareY = -100


-- Alle zu ladenden Elemente sind hier drin
function love.load()
     -- Grafiken
     imageData = love.image.newImageData("graphics/block1.png")
     block1 = love.graphics.newImage("graphics/block1.png")

     -- Titel und Icons
     love.window.setTitle("Bloxxs")
     love.window.setIcon(imageData)

     -- Soundsources
     introMusik = love.audio.newSource("sounds/intro.ogg", "stream")
     selectSound = love.audio.newSource("sounds/Tropfen.mp3", "static")
end


-- Eigene Funktionen beginnen hier

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
    love.graphics.draw(block1, 200, 600/7, rot, 6, 6, 5, 5)
    love.graphics.setColor(0.5, 0.6, 0.2)
    love.graphics.print("Bloxxs", 500/2, 600/20, 0, 7, 7)
    love.graphics.setColor(100, 100, 100)
end

function helpBox ()
    helpTitle = "Hilfe"
    helpMessage = "Menü:\nMit den Pfeiltasten kannst du deine Optionen auswählen.\nMit Enter bestätigst du eine Auswahl."
    helpButtons = {"OK", escapebutton = 1}
    love.window.showMessageBox(helpTitle, helpMessage, info, false)
end

function chooseButton ()
    love.graphics.setColor(50, 100, 0)
    squareYbefore = squareY
    squareY = (squareY*3+(600/4+20+90*gameSelect))/4
    love.graphics.rectangle("fill", 700/2-50, squareY, 30, 30,math.abs(squareY-squareYbefore))
    love.graphics.setColor(100, 100, 100)
end

function gameSelector (dt)
    
        if gameSelect > 0  and love.keyboard.isDown("up") 
           and lastActionTime + s < love.timer.getTime() 
        then
             gameSelect = gameSelect - 1
             lastActionTime = love.timer.getTime()
             love.audio.play(selectSound)
        end
        if gameSelect < 2 and love.keyboard.isDown("down") 
           and lastActionTime + s < love.timer.getTime() 
        then
             gameSelect = gameSelect + 1
             lastActionTime = love.timer.getTime()
             love.audio.play(selectSound)   
        end 
end

function chooseSelect ()
    if love.keyboard.isDown("return") then
        if gameSelect == 0 then
            startTitle = "Error"
            startMessage = "Spiel noch nicht fertig!"
            startButtons = {"UwU", escapebutton = 1}
            love.window.showMessageBox(startTitle, startMessage, startButtons, warning, false)
        elseif gameSelect == 1 then
            scoreTitle = "SCORE"
            scoreMessage = "Score noch nicht fertig!"
            scoreButtons = {"UwU", escapebutton = 1}
            love.window.showMessageBox(scoreTitle, scoreMessage, scoreButtons, warning, false)
        elseif gameSelect == 2 then
            creditTitle = "Credits"
            creditMessage = "Dieses Spiel wurde entwickelt von:\n\nTobias Kraus\nLeo Hubert\n\nAlle Inhalte sind geschützt!"
            creditButtons = {"Ok", escapebutton = 1}
            love.window.showMessageBox(creditTitle, creditMessage, creditButtons, warning, false)
        end
    end
end

-- Eigene Funktionen Enden hier

-- Update-Funktion für Bewegungen und immer wiederkehrende Funktionen
function love.update(dt)
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end
    if love.keyboard.isDown("f1") then
        helpBox()
    end
    rot = rot + 0.3*dt
    gameSelector()
    love.audio.play(introMusik)
end

-- Zeichnen des Spielfeldes
function love.draw()
    drawing()
    titletext()
    chooseButton()
    chooseSelect()
    love.graphics.print("START", 700/2, 600/4, 0, 5, 5)
    love.graphics.print("SCORE", 700/2, 600/2.5, 0, 5, 5)
    love.graphics.print("CREDITS", 700/2, 600/1.8, 0, 5, 5)
    love.graphics.print("Drücke F1 für Hilfe und ESC um das Spiel zu beenden.", 700/2, 600/1.3, 0, 1, 1)
    love.graphics.print("Erstellt von Tobias Kraus 2019", 700/2, 600/1.3+15, 0, 1, 1)
end