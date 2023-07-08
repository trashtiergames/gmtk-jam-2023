sneaky = class()

function sneaky:init()
  self.gx = 0
  self.gy = 0
  self.x = 0
  self.y = 0
  self.w = 8
  self.h = 8
  self.target_x = self.x
  self.target_y = self.y
  self.sprite = 80
  self.direction = ""
  self.state = "sneaking"
  self.anim_timer = 0
  self.anim_timer_max = 0.2
  self.step = 1
  self.step_timer = 0
  self.step_timer_max = 1
  self.visible = true
  self.footstep_range = 4
  self.path = path_a
  self.tween_fpp = 1
  self.tween_counter = 0
end

function sneaky:update()
  if self.state == "sneaking" then
    -- move sneaky
    self.step_timer += 1/60
    if self.step_timer > self.step_timer_max then
      self.step_timer = 0
      self.step += 1
      -- end of path
      if self.step > #self.path then
        self.state = "gone"
        sfx(01)
        points -= 1
        return
      end
      local coords = self.path[self.step]
      local x_diff = coords[1] - self.gx
      local y_diff = coords[2] - self.gy
      if (x_diff == 1) self.direction = "right"
      if (x_diff == -1) self.direction = "left"
      if (y_diff == -1) self.direction = "up"
      if (y_diff == 1) self.direction = "down"
      self.gx, self.gy = coords[1], coords[2]
      self.target_x = self.gx * 8
      self.target_y = self.gy * 8
      self:make_footstep_sfx()
      self.state = "moving"
    end
  elseif self.state == "discovered" then
    self.anim_timer += 1/60
    if self.anim_timer > self.anim_timer_max then
      self.visible = not self.visible
      self.anim_timer = 0
    end
  elseif self.state == "gone" then
    self.visible = false
  end
  if self.state == "moving" then
    -- tween x or y if not at target yet
    if self.x != self.target_x then
      self.tween_counter += 1
      if self.tween_counter > self.tween_fpp then
        if (self.direction == "left") self.x -= 4
        if (self.direction == "right") self.x += 4
        self.tween_counter = 0
      end
    elseif self.y != self.target_y then
      self.tween_counter += 1
      if self.tween_counter > self.tween_fpp then
        if (self.direction == "up") self.y -= 4
        if (self.direction == "down") self.y += 4
        self.tween_counter = 0
      end
    else
      self.state = "sneaking"
    end
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

function sneaky:make_footstep_sfx()
  x_dist = abs(sneaky.gx - player.gx)
  y_dist = abs(sneaky.gy - player.gy)
  dist =  x_dist + y_dist

  if dist > 2 and dist <= self.footstep_range then
    sfx(02)
  elseif dist == 2 then
    sfx(03)
  elseif dist <= 1 then
    sfx(04)
  end
end