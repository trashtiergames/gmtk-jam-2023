intro_state = class()

function intro_state:init()
  
end

function intro_state:update()
  if (btnp(5)) state_machine.current_state = state_machine.states.day_state
end

function intro_state:draw()
	cls()
  spr(8, 8, 8, 4, 4)
  print("this is some text", 46, 8, 10)
end