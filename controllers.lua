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

combat = {}
function combat:init() 
  -- create menu buttons
  menu = create_menu_buttons()
  selected = menu[1]

  -- testing features of the hand
  hand = {}
  for i=0,7 do
    add(hand,create_card(test))
  end
end
function combat:update()
  if btnp(0) then selected:move(0)
  elseif btnp(1) then selected:move(1)
  elseif btnp(2) then selected:move(2)
  elseif btnp(3) then selected:move(3)
  end
  if btnp(4) then selected:press(4)
  elseif btnp(5) then selected:press(5)
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
  -- character info + relic bars
  rectfill(0,0,127,7,6)
  rectfill(0,8,127,15,13)

  -- draw hand
  for n,c in pairs(hand) do
    -- clean this up
    if n < 6 then
      print(c.abbreviation,2,65+n*8,7)
      print(c.cost,24,65+n*8,7)
    else
      print(c.abbreviation,30,65+(n-5)*8,7)
      print(c.cost,52,65+(n-5)*8,7)
    end
  end

  -- draw menu button
  selected.draw()

end