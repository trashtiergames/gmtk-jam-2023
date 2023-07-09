footprint = class()

function footprint:init(gx, gy, direction)
  -- grid x and y
  self.gx = gx
  self.gy = gy
  self.x = self.gx * 8
  self.y = self.gy * 8
  self.sprite = 34
  if direction == "left" or direction == "right" then
    self.sprite = 35 
  end
  self.flip_x = false
  self.flip_y = false
  if (direction == "left") self.flip_x = true
  if (direction == "down") self.flip_y = true
end

function footprint:update()
  
end

function footprint:draw()
  spr(
    self.sprite,
    self.x,
    self.y,
    1, 1,
    self.flip_x,
    self.flip_y
  )
end

function footprint:log_sth()
  msg_box = "footprint says: " .. rnd(2)
end