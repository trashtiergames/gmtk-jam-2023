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
  self.step = 1
  self.step_timer = 0
  self.step_timer_max = 1
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
  -- move sneaky
  sneaky.step_timer += 1/60
  if sneaky.step_timer > sneaky.step_timer_max then
    sneaky.step_timer = 0
    sneaky.step += 1
    local coords = sneaky.path[sneaky.step]
    sneaky.gx, sneaky.gy = coords[1], coords[2]
    sneaky.x = sneaky.gx * 8
    sneaky.y = sneaky.gy * 8
  end
end

function sneaky:draw()
  spr(
    sneaky.sprite,
    sneaky.x,
    sneaky.y
  )
end