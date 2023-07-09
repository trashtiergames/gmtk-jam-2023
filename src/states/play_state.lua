play_state = class()

function play_state:init()
  points = 0
  player = player()
  sneaky = sneaky(0, 0, path_a)
end

function play_state:update()
  sneaky:update()
  player:update()
  update_light(player.direction)
  check_for_sneaky()
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
  print(debug, 0, 100)
  print("points: " .. points)
end