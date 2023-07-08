player = class()


function player:init()
  -- grid x and y
  self.gx = 8
  self.gy = 9
  self.x = self.gx * 8
  self.y = self.gy * 8
  self.target_x = self.x
  self.target_y = self.y
  self.sprite = 64
  self.direction = "up"
  self.state = "ready"
  -- frames per pixel when tweening
  self.tween_fpp = 1
  self.tween_counter = 0
  self.light = {}
end

function player:update()
  if self.state == "ready" then
    -- move
    new_x = player.gx
    new_y = player.gy
    
    if (btnp(0)) new_x -= 1 player.direction = "left"
    if (btnp(1)) new_x += 1 player.direction = "right"
    if (btnp(2)) new_y -= 1 player.direction = "up"
    if (btnp(3)) new_y += 1 player.direction = "down"
    
    if can_move(new_x,new_y) then
      player.gx = mid(0,new_x,15)
      player.gy = mid(0,new_y,15)
    else
      sfx(05)
    end 
    player.target_x = player.gx * 8
    player.target_y = player.gy * 8
    self.state = "moving"
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
      self.state = "ready"
    end
  end
end

function player:draw()
  spr(
    player.sprite,
    player.x,
    player.y
  )
  -- rect(
  --   player.light.x,
  --   player.light.y,
  --   player.light.x + player.light.w,
  --   player.light.y + player.light.h,
  --   10
  -- )
end