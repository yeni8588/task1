--[[ this is the pause state 
here stop the game 
]]

PauseState = Class{__includes = BaseState}
local PAUSE_IMAGE = love.graphics.newImage('zzz.png')
p = false


function PauseState:update(dt)
	if love.keyboard.wasPressed('p') then
		p = true
        gStateMachine:change('play',p)
    end

end

function PauseState:enter()
	sounds['music']:pause()
	sounds['pop']:play()
	p = false
end

function PauseState:render( ... )
	love.graphics.printf('PAUSE', 0, 44, VIRTUAL_WIDTH, 'center')

	love.graphics.draw(PAUSE_IMAGE, (VIRTUAL_WIDTH/2) - 80, (VIRTUAL_HEIGHT/2) - 70)
	
end

function PauseState:exit( ... )
	sounds['music']:play()
	
end