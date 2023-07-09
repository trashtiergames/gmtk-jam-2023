play_state = class()

function play_state:init()
  points = 0
  player = player()
  sneakies = {}
  add(sneakies, sneaky(0, 0, path_a))
  msg_box = "points: " .. points
  footprints = {}
  self.msg_timer = 0
  self.msg_timer_max = 3
  self.sneaky_timer = 0
  self.sneaky_timer_max = 10
  self.next_sneaky_id = 2
  self.g_o_timer = 0
  self.g_o_timer_max = 3
end

function play_state:update()
  for sneaky in all(sneakies) do
    sneaky:update()
  end
  player:update()
  update_light(player.direction)
  check_for_sneakies()

  self.sneaky_timer += 1/60
  if self.sneaky_timer > self.sneaky_timer_max then
    self.sneaky_timer = 0
    if (#sneakies < 5) then
      local p = sneaky_presets[self.next_sneaky_id]
      add(sneakies, sneaky(p[1], p[2], p[3]))
      msg_box = "new intruder!"
      sfx(8)
      self.next_sneaky_id += 1
    end
  end

  if msg_box[1] != "p" then
    self.msg_timer += 1/60
    if self.msg_timer > self.msg_timer_max then
      self.msg_timer = 0
      msg_box = "points: " .. points
    end
  end


  -- game over condition
  if #sneakies == 5 then
    local n_sneaking = 0
    for sneaky in all(sneakies) do
      if sneaky.state == "sneaking" then
        n_sneaking += 1
      end
    end
    if n_sneaking == 0 then
      self.g_o_timer += 1/60
      if self.g_o_timer > self.g_o_timer_max then
        state_machine.current_state = state_machine.states.game_over_state
      end
    end
  end
  -- if (btnp(5)) state_machine.current_state = state_machine.states.game_over_state
end

function play_state:draw()
  -- clear screen
	cls()
  map(0, 0, 0, 0)
  print(msg_box, 26, 1, 7)
	
  clip(
    player.light.x, 
    player.light.y, 
    player.light.w, 
    player.light.h
  )
  
  pal(palette_swap_table)
  map(0, 0, 0, 0)
  pal()

  -- clip()

  for sneaky in all(sneakies) do
    sneaky:draw()
  end

  for fp in all(footprints) do
    fp:draw()
  end

  clip()

  for sneaky in all(sneakies) do
    if (sneaky.state == "discovered") sneaky:draw()
  end

  player:draw()

end