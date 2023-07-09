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
    
    -- if not already looking in that direction, just turn
    if btnp(0) then 
      if player.direction == "left" then
        new_x -= 1 
      else
        player.direction = "left"
      end
    elseif btnp(1) then
      if player.direction == "right" then
        new_x += 1
      else
        player.direction = "right"
      end
    elseif btnp(2) then
      if player.direction == "up" then
        new_y -= 1
      else
        player.direction = "up"
      end
    elseif btnp(3) then
      if player.direction == "down" then
        new_y += 1
      else
        player.direction = "down"
      end
    end
    
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
    self.sprite,
    self.x,
    self.y
  )
  -- rect(
  --   player.light.x,
  --   player.light.y,
  --   player.light.x + player.light.w,
  --   player.light.y + player.light.h,
  --   10
  -- )
end