function _init()
  wall = 0
  debug = "nothing to debug"
  textbox_y_offset = 50
  palette_swap_table = {
    [1] = 5,
    [2] = 4,
    [3] = 11,
    [9] = 10,
    [13] = 6,
    [14] = 7
  }
  -- dialogue text box library by oli414. minimized.
  function dtb_init(n) dtb_q={}dtb_f={}dtb_n=3 if n then dtb_n=n end _dtb_c() end function dtb_disp(t,c)local s,l,w,h,u s={}l=""w=""h=""u=function()if #w+#l>29 then add(s,l)l=""end l=l..w w=""end for i=1,#t do h=sub(t,i,i)w=w..h if h==" "then u()elseif #w>28 then w=w.."-"u()end end u()if l~=""then add(s,l)end add(dtb_q,s)if c==nil then c=0 end add(dtb_f,c)end function _dtb_c()dtb_d={}for i=1,dtb_n do add(dtb_d,"")end dtb_c=0 dtb_l=0 end function _dtb_l()dtb_c+=1 for i=1,#dtb_d-1 do dtb_d[i]=dtb_d[i+1]end dtb_d[#dtb_d]=""sfx(2)end function dtb_update()if #dtb_q>0 then if dtb_c==0 then dtb_c=1 end local z,x,q,c z=#dtb_d x=dtb_q[1]q=#dtb_d[z]c=q>=#x[dtb_c]if c and dtb_c>=#x then if btnp(4) then if dtb_f[1]~=0 then dtb_f[1]()end del(dtb_f,dtb_f[1])del(dtb_q,dtb_q[1])_dtb_c()sfx(2)return end elseif dtb_c>0 then dtb_l-=1 if not c then if dtb_l<=0 then local v,h v=q+1 h=sub(x[dtb_c],v,v)dtb_l=1 if h~=" " then sfx(0)end if h=="." then dtb_l=6 end dtb_d[z]=dtb_d[z]..h end if btnp(4) then dtb_d[z]=x[dtb_c]end else if btnp(4) then _dtb_l()end end end end end function dtb_draw()if #dtb_q>0 then local z,o z=#dtb_d o=0 if dtb_c<z then o=z-dtb_c end rectfill(2,125-z*8,125,125,0)if dtb_c>0 and #dtb_d[#dtb_d]==#dtb_q[1][dtb_c] then print("\x8e",118,120,1)end for i=1,z do print(dtb_d[i],4,i*8+119-(z+o)*8,7)end end end
  dtb_init()
  state_machine = state_machine()
end

function _update60()
  state_machine:update()
  dtb_update()
end

function _draw()
  state_machine:draw()
  camera(0, textbox_y_offset)
  dtb_draw()
  camera()
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
      sfx(6)
      points += 1
    end
  end
end

function x_center(s)
  -- screen center minus the string length times the 
  -- pixels in a char's width, cut in half
  return 64-#s*2
end

function y_center(s)
  -- screen center minus the string height in pixels, cut in half
  return 61
end
