play_state = class()

function play_state:init()
  points = 0
  player = player()
  sneaky = sneaky(0, 0, path_a)
  msg_box = "points: " .. points
  self.msg_timer = 0
  self.msg_timer_max = 3
end

function play_state:update()
  sneaky:update()
  player:update()
  update_light(player.direction)
  check_for_sneaky()

  if msg_box[1] != "p" then
    self.msg_timer += 1/60
    if self.msg_timer > self.msg_timer_max then
      self.msg_timer = 0
      msg_box = "points: " .. points
    end
  end

  if (btnp(5)) state_machine.current_state = state_machine.states.game_over_state
end

function play_state:draw()
  -- clear screen
	cls()
  map(0, 0, 0, 0)
	player:draw()
  clip(
    player.light.x, 
    player.light.y, 
    player.light.w, 
    player.light.h
  )
  
  pal(palette_swap_table)
  map(0, 0, 0, 0)
  pal()

  clip()
  sneaky:draw()
  print(msg_box, 26, 1)
end