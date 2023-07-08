sneaky = class()

function sneaky:init()
  self.gx = 0
  self.gy = 0
  self.x = 0
  self.y = 0
  self.w = 8
  self.h = 8
  self.sprite = 65
  self.state = "sneaking"
  self.anim_timer = 0
  self.anim_timer_max = 0.2
  self.step = 1
  self.step_timer = 0
  self.step_timer_max = 1
  self.visible = true
  self.path = {
    {0, 0},
    {1, 0},
    {2, 0},
    {3, 0},
    {4, 0},
    {4, 1},
    {4, 2},
    {4, 3},
    {5, 3},
    {6, 3},
    {6, 4},
    {6, 5},
    {7, 5},
    {7, 6},
    {7, 7}
  }
end

function sneaky:update()
  if self.state == "sneaking" then
    -- move sneaky
    self.step_timer += 1/60
    if self.step_timer > self.step_timer_max then
      self.step_timer = 0
      self.step += 1
      local coords = self.path[self.step]
      self.gx, self.gy = coords[1], coords[2]
      self.x = self.gx * 8
      self.y = self.gy * 8
    end
  elseif self.state == "discovered" then
    self.anim_timer += 1/60
    if self.anim_timer > self.anim_timer_max then
      self.visible = not self.visible
      self.anim_timer = 0
    end
  elseif self.state == "gone" then
  end
end

function sneaky:draw()
  if self.visible then
    spr(
      self.sprite,
      self.x,
      self.y
    )
  end
end