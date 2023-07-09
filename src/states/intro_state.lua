intro_state = class()

function intro_state:init()
  
end

function intro_state:update()
  if (btnp(5)) state_machine.current_state = state_machine.states.day_state
end

function intro_state:draw()
	cls(2)
  spr(8, 8, 8, 4, 4)
  print("guard! please watch", 46, 8, 10)
  print("the castle tonight,", 46, 18, 10)
  print("and make sure that", 46, 28, 10)
  print("no princesses sneak", 46, 38, 10)
  print("through to me!", 46,48, 10)
end