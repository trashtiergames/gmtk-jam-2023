title_state = class()

function title_state:init()
  
end

function title_state:update()
  if (btnp(5)) state_machine.current_state = state_machine.states.intro_state
end

function title_state:draw()
	cls()
  map(16, 0)
  spr(128, 0, 0, 8, 8)
  spr(136, 64, 0, 8, 8)
  local str = "press v to advance"
  print(str, x_center(str), y_center(str) + 20, 9)
end