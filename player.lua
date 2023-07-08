player = class()


function player:init()
  -- grid x and y
  self.gx = 4
  self.gy = 5
  self.x = 32
  self.y = 40
  self.sprite = 64
  self.direction = "up"
  self.light = {}
end

function player:update()
  -- move
  new_x = player.gx
	new_y = player.gy
	
	if (btnp(0)) new_x -= 1 player.direction = "left"
	if (btnp(1)) new_x += 1 player.direction = "right"
	if (btnp(2)) new_y -= 1 player.direction = "up"
	if (btnp(3)) new_y += 1 player.direction = "down"
	
	if can_move(new_x,new_y) then
		player.gx = mid(0,new_x,7)
		player.gy = mid(0,new_y,7)
	else
		-- sfx(0)
	end 
  player.x = player.gx * 8
  player.y = player.gy * 8
  print(player.direction)
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