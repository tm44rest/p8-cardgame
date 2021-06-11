pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
-- card game

#include main.lua
#include controllers.lua
#include cards.lua
#include buttons.lua

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100001d0502205026050290502b0502a0502c0502a05028050230501f050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00010000131500f1500e1500c1500b1500c1500d1500d150101501315015150000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
