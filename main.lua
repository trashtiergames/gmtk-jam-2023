function _init()
  wall = 0
  debug = "nothing to debug"
  points = 0
  sunny = false
  player = player()
  sneaky = sneaky()
end

function _update60()
  if (btnp(5)) sunny = true debug = "btn 5 pressed"
  sneaky:update()
  player:update()
  update_light(player.direction)
  check_for_sneaky()
end

function _draw()
	-- clear screen
	cls()
  palette_swap_table = {
    [1] = 5,
    [2] = 4,
    [3] = 11,
    [9] = 10,
    [13] = 6,
    [14] = 7
  }
  map(0, 0, 0, 0)
	player:draw()
  clip(
    player.light.x, 
    player.light.y, 
    player.light.w, 
    player.light.h
  )
  if sunny then
    pal(palette_swap_table)
    -- pal(5, 6)
    -- -- palt(0, false)
    -- pal(0, 5)
    map(0, 0, 0, 0)
  end
  -- sneaky:draw()
  pal()
  clip()
  sneaky:draw()
  print(debug, 0, 100)
  print("points: " .. points)
end

function is_tile(tile_type,x,y)
	-- returns true if tile has flag
	-- false otherwise
	tile = mget(x,y)
	has_flag = fget(tile, tile_type)
	return has_flag
end

function can_move(x,y)
	return not is_tile(wall,x,y)
end

function update_light(direction)
  if (player.direction == "left") then
    player.light.x = (player.gx - 1) * 8
    player.light.y = (player.gy - 1) * 8
    player.light.w = 8
    player.light.h = 8 * 3
  elseif (player.direction == "right") then
    player.light.x = (player.gx + 1) * 8
    player.light.y = (player.gy - 1) * 8
    player.light.w = 8
    player.light.h = 8 * 3
  elseif (player.direction == "up") then
    player.light.x = (player.gx - 1) * 8
    player.light.y = (player.gy - 1) * 8
    player.light.w = 8 * 3
    player.light.h = 8
  elseif (player.direction == "down") then
    player.light.x = (player.gx - 1) * 8
    player.light.y = (player.gy + 1) * 8
    player.light.w = 8 * 3
    player.light.h = 8
  end
end

function collides(a, b)
  -- AABB collision detection (a and b need to have x, y, w, h)
  if (a.x < b.x + b.w
      and a.x + a.w > b.x
      and a.y < b.y + b.h
      and a.y + a.h > b.y) then
    return true
  else
    return false
  end
end

function check_for_sneaky()
  if collides(sneaky, player.light) then
    if sneaky.state == "sneaking" then
      debug = "collision detected"
      sneaky.state = "discovered"
      sfx(00)
      points += 1
    end
  end
end
