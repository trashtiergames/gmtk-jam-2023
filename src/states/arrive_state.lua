arrive_state = class()

function arrive_state:init()
  self.player = player()
  self.sneaky = sneaky(-1, 0, path_b)
  self.sneaky.gx = -1
  self.start_wait_timer = 0
  self.start_wait_amount = 0.5
  self.arrived = false
  self.sound_played = false
  self.msg_triggered = false
end

function arrive_state:update()
  -- if (btnp(5)) state_machine.current_state = state_machine.states.day_state
  if self.start_wait_timer < self.start_wait_amount then
    self.start_wait_timer += 1/60
    return
  end

  if self.sneaky.x != 0 then
    self.sneaky:update()
  else
    self.arrived = true
  end

  if self.arrived and not self.sound_played then
    sfx(8)
    self.sound_played = true
    self.start_wait_timer = 0
    self.start_wait_amount = 2
    return
  end

  if self.sound_played and not self.msg_triggered then
    self.msg_triggered = true
    textbox_y_offset = 90
    dtb_disp("it's getting dark!")
    dtb_disp("time to sneak in!")
    dtb_disp("heh he hehe heh he", self.after_textboxes)
  end
end

function arrive_state:draw()
  cls()
  pal(palette_swap_table)
  map(0, 0, 0, 0)
  pal()
  self.sneaky:draw()
  self.player:draw()
end

function arrive_state:after_textboxes()
  textbox_y_offset = 50
  state_machine.current_state = state_machine.states.nightfall_state
end