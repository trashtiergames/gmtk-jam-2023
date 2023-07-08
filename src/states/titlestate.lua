titlestate = class()

function titlestate:init()
  
end

function titlestate:update()
  if (btnp(5)) statemachine.current_state = statemachine.states.playstate
end

function titlestate:draw()
	cls()
  spr(128, 0, 0, 8, 8)
  spr(136, 64, 0, 8, 8)
end