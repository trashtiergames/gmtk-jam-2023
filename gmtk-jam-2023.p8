pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- gmtk jam 2023 game
-- by trash tier games
#include class.lua
#include my_script.lua
__gfx__
00000000111111110000000055555555000000003333333311111111000000000000000000000000000000000000000000000000000000000000000000000000
00000000111111110000000055555555000000003333333311111111000000000000000000000000000000000000000000000000000000000000000000000000
00700700111111110000000055555555000000003333333311111111000000000000000000000000000000000000000000000000000000000000000000000000
00077000111111110000000055555555000000003333333311111111000000000000000000000000000000000000000000000000000000000000000000000000
00077000111111110000000055555555000000003333333311111111000000000000000000000000000000000000000000000000000000000000000000000000
00700700111111110000000055555555000000003333333311111111000000000000000000000000000000000000000000000000000000000000000000000000
00000000111111110000000055555555000000003333333311111111000000000000000000000000000000000000000000000000000000000000000000000000
00000000111111110000000055555555000000003333333311111111000000000000000000000000000000000000000000000000000000000000000000000000
00000000cccccccc111111116666666655555555bbbbbbbbdddddddd000000000000000000000000000000000000000000000000000000000000000000000000
00000000cccccccc111111116666666655555555bbbbbbbbdddddddd000000000000000000000000000000000000000000000000000000000000000000000000
00000000cccccccc111111116666666655555555bbbbbbbbdddddddd000000000000000000000000000000000000000000000000000000000000000000000000
00000000cccccccc111111116666666655555555bbbbbbbbdddddddd000000000000000000000000000000000000000000000000000000000000000000000000
00000000cccccccc111111116666666655555555bbbbbbbbdddddddd000000000000000000000000000000000000000000000000000000000000000000000000
00000000cccccccc111111116666666655555555bbbbbbbbdddddddd000000000000000000000000000000000000000000000000000000000000000000000000
00000000cccccccc111111116666666655555555bbbbbbbbdddddddd000000000000000000000000000000000000000000000000000000000000000000000000
00000000cccccccc111111116666666655555555bbbbbbbbdddddddd000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000005555555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000505505555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000550000005555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000005555555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000005550555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000005555555550500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000005555555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000050000005055555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000555555556666666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000555555656656666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000665555556666666500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000555555556666666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000555555556665666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000555556666666665600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000555555556666666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000565555556566666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00099000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00099000000220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00999900000220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09999990002222000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09999990022222200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09999990022222200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00999900002002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00900900002002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
2222222222212221000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2121222122222222000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2222222122212122000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2221222122222222000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2221222121212221000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2221222222222222000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2221222122212122000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2221222122222122000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100000000000000000001005014050180501b0501f050210502205023050240502405024050240502405024050240501b0501b0501b0501b0501b0501c0501e05022050250502f0503c0503f0500000000000
001000000f0500f0500d0500d0500f0500f0500f0500f0500f0500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 01424344

