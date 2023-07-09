day_state = class()

function day_state:init()
  self.blink_timer = 0
  self.blink_max = 1
  self.msg_timer = 0
  self.msg_trigger = 1
  self.msg_triggered = false
  self.red = false
  self.player = player()
end

function day_state:update()
  self.blink_timer += 1/60
  self.msg_timer += 1/60
  if self.blink_timer > self.blink_max then
    self.red = not self.red
    self.blink_timer = 0
  end
  if (self.msg_timer > self.msg_trigger) and not self.msg_triggered then
    self.msg_triggered = true
    dtb_disp("night is about to fall!")
    dtb_disp("stop the intruders!")
    dtb_disp("they will arrive at the blinking dots at the top and make their way to the blinking dots at the bottom", self.after_textboxes)
  end
end

function day_state:draw()
  cls()
  pal(palette_swap_table)
  map(0, 0, 0, 0)
  pal()
  self.player:draw()
  if (not self.red) pal(8, 5)

  -- top left
  spr(49, 0, 0)
  print("in", 8, 1, 8)

  -- top right
  spr(49, 15 * 8, 0)
  print("in", 14 * 8, 1, 8)

  -- bottom left
  spr(49, 0, 15 * 8)
  print("out", 8, 15 * 8 + 1, 8)

  -- bottom right
  spr(49, 15 * 8, 15 * 8)
  print("out", 14 * 8 - 2, 15 * 8 + 1, 8)
end

function day_state:after_textboxes()
  state_machine.current_state = state_machine.states.arrive_state
end