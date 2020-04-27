--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

local gift = false
local bronze = false
local silver = false
local gold = false
local EGG_GOLD = love.graphics.newImage('goldegg.png')
local EGG_SILVER = love.graphics.newImage('silveregg.png')
local EGG_BRONZE = love.graphics.newImage('brrr.png')
--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score

    if self.score >= 3 then
        gift = true
        if self.score >= 3 and self.score < 6 then
            bronze = true
        elseif self.score >= 6 and self.score < 9 then
            silver = true
        elseif self.score >= 9 then
            gold = true
        end
    end
end

function ScoreState:update(dt)

    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
        gift = false
        bronze = false
        silver = false
        gold = false
    end
end

function ScoreState:render()
    if gift == true then
        if bronze then 
            love.graphics.printf('YOU WIN A BRONZE EGG!!!', 0, 30, VIRTUAL_WIDTH, 'center')
            love.graphics.printf('Score: ' .. tostring(self.score), 0, 150, VIRTUAL_WIDTH, 'center')
            love.graphics.printf('Press Enter to Play Again!', 0, 210, VIRTUAL_WIDTH, 'center')
            love.graphics.draw(EGG_BRONZE, (VIRTUAL_WIDTH / 2) - 60, 60 )
        elseif silver then
            love.graphics.printf('YOU WIN A SILVER EGG!!!', 0, 30, VIRTUAL_WIDTH, 'center')
            love.graphics.printf('Score: ' .. tostring(self.score), 0, 150, VIRTUAL_WIDTH, 'center')
            love.graphics.printf('Press Enter to Play Again!', 0, 210, VIRTUAL_WIDTH, 'center')
            love.graphics.draw(EGG_SILVER, (VIRTUAL_WIDTH / 2) - 60, 60 )
        elseif gold then
            love.graphics.printf('YOU WIN A GOLD EGG!!!', 0, 30, VIRTUAL_WIDTH, 'center')
            love.graphics.printf('Score: ' .. tostring(self.score), 0, 150, VIRTUAL_WIDTH, 'center')
            love.graphics.printf('Press Enter to Play Again!', 0, 210, VIRTUAL_WIDTH, 'center')
            love.graphics.draw(EGG_GOLD, (VIRTUAL_WIDTH / 2) - 60, 60 )
        end
        
    else

        -- simply render the score to the middle of the screen
        love.graphics.setFont(flappyFont)
        love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

        love.graphics.setFont(mediumFont)
        love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

        love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
    end
end