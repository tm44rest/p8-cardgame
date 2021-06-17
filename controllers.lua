-- current setup is flooding the global namespace but lol who cares

function switch_controller(ctrl)
  controller = ctrl
  if ctrl.init then ctrl.init(ctrl) end
end

titlescreen = {}
function titlescreen:init() end
function titlescreen:update()
  if btn(5) or btn(4) then
    switch_controller(combat)
  end
end
function titlescreen:draw()
  cls()
  print("card game :)", 32, 40)
end

-- potentially break combat update fn into player turn vs enemy turn
combat = {}
function combat:init() 
  -- test with encounter 1
  encounter1()

  -- create menu buttons
  menu = create_menu_buttons()
  for c in all(deck) do
    add(draw,c)
  end
  shuffle(draw)
  player_turn_init()
end
function combat:update()
  if player_turn then
    if btnp(0) then selected:move(0)
    elseif btnp(1) then selected:move(1)
    elseif btnp(2) then selected:move(2)
    elseif btnp(3) then selected:move(3)
    end
    if btnp(4) then selected:press(4)
    elseif btnp(5) then selected:press(5)
    end
  else --enemy turn
    player_turn_init()
  end
end
function combat:draw()
  cls()

  -- draw menu borders
  -- card menu
  -- RECT???? bruh
  line(0,71,127,71,7)
  line(28,71,28,127,7)
  line(0,71,0,127,7)
  line(0,127,127,127,7)
  line(127,71,127,127,7)
  line(56,71,56,127,7)
  for j=0,5 do
    line(0,79+j*8,56,79+j*8,7)
  end
  rect(0,63,14,71,7)

  -- character info + relic bars
  rectfill(0,0,127,6,6)
  rectfill(0,7,127,14,13)

  -- draw hand
  for n,c in pairs(hand) do
    -- clean this up, put default draw fn into buttons
    if n < 6 then
      print(c.abbreviation,2,65+n*8,7)
      print(c.cost,24,65+n*8,7)
    else
      print(c.abbreviation,30,65+(n-5)*8,7)
      print(c.cost,52,65+(n-5)*8,7)
    end
  end
  print("end",37,121,7)

  -- draw character stats
  print(player_curhp .. "/" .. player_maxhp .. "♥",1,1,8)
  print(player_curenergy .. "/" .. player_maxenergy,2,65,3)

  -- draw menu button
  selected.draw()

  -- draw monsters
  for m in all(monsters) do
    m:draw()
  end

  -- draw player
  spr(1,20,35,1,2)
  print(player_curhp .. "/" .. player_maxhp,14,52,8)

end

function player_turn_init() 
  player_turn = true
  player_curenergy = player_maxenergy
  for i=0,4 do
    local c = draw_card()
    if c == nil then
      reshuffle_discard()
      draw_card()
    end
  end
  selected = menu[1]
end

function enemy_turn_init()
  player_turn = false
end