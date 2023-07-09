nightfall_state = class()

function nightfall_state:init()
  self.player = player()
  self.sneaky = sneaky(0, 0, path_a)
  self.clip_w = 128
  self.start_wait_timer = 0
  self.start_wait_amount = 1
end

function nightfall_state:update()
  if self.clip_w > 0 then
    self.clip_w -= 1
  elseif self.clip_w == 0 then
    if self.start_wait_timer < self.start_wait_amount then
      self.start_wait_timer += 1/60
    else
      state_machine.current_state = state_machine.states.play_state
    end
  end
end

function nightfall_state:draw()
	cls()

  -- draw dark part
  map(0, 0, 0, 0)

  -- draw bright part
  clip(0, 0, self.clip_w, 128)
  pal(palette_swap_table)
  map(0, 0, 0, 0)
  pal()
  self.sneaky:draw()
  clip()
  self.player:draw()
end