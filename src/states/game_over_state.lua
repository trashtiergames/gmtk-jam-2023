game_over_state = class()

function game_over_state:init()
  self.wait_timer = 0
  self.wait_amount = 0.5
end

function game_over_state:update()
  if (btnp(5)) then
    state_machine = state_machine()
    state_machine.current_state = state_machine.states.title_state
    music(0, 100)
  end
end

function game_over_state:draw()
	cls()
  str1 = "game over"
  str2 = "you got " .. points .. " points"
  str3 = "press ❎ to restart"
  print(str1, x_center(str1), y_center(str1) - 20, 7)
  print(str2, x_center(str2), y_center(str2), 7)
  print(str3, x_center(str3), y_center(str3) + 20, 7)
end