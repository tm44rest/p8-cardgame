buttons = {}

button = {}
function button:press(inp) 
  if inp == 4 then
    if self.circle_effect then self:circle_effect() end
  elseif inp == 5 then
    if self.cross_effect then self:cross_effect() end
  end
end
function button:move(btn) 
  if btn == 0 then
    if self.left then selected = self.left end
  elseif btn == 1 then
    if self.right then selected = self.right end
  elseif btn == 2 then
    if self.up then selected = self.up end
  elseif btn == 3 then
    if self.down then selected = self.down end
  end
end
function button:draw() end

function create_button(draw, circle_effect, cross_effect)
  btn = {
    __index = button,
    draw = draw,
    circle_effect = cricle_effect or function () end,
    cross_effect = cross_effect or function () end
  }
  setmetatable(btn,btn)
  add(buttons, btn)
  return btn
end

-- please for the love of god refactor this
function create_menu_buttons()
  local menu = {}
  for i=0,6 do
    local f = function () 
      rect(0,71+8*i,28,79+8*i,10) 
      if i < 5 then
        local c = hand[i+1]
        if c then
          print(c.name,60,75,7)
          -- replace with function that line-wraps in box
          print(c.description,62,84)
        end
      end
    end
    local e = function ()
      if i < 5 then
        local c = hand[i+1]
        if c then
          c:effect()
        end
      end
    end
    local b = create_button(f,function () end, e)
    b.effect = function ()

    end
    add(menu, b)
  end
  for i=0,6 do
    local f = function () 
      rect(28,71+8*i,56,79+8*i,10) 
      if i < 5 then
        local c = hand[i+6]
        if c then
          print(c.name,60,75,7)
          -- replace with function that line-wraps in box
          print(c.description,62,84)
        end
      end
    end
    local e = function ()
      if i < 5 then
        local c = hand[i+6]
        if c then
          c:effect()
        end
      end
    end
    local b = create_button(f,function () end, e)
    add(menu, b)
  end
  for i=1,7 do
    local b = menu[i]
    if i > 1 then
      b.up = menu[i-1]
    end
    if i < 7 then
      b.down = menu[i+1]
    end
    b.right = menu[i+7]
  end
  for i=8,14 do
    local b = menu[i]
    if i > 8 then
      b.up = menu[i-1]
    end
    if i < 14 then
      b.down = menu[i+1]
    end
    b.left = menu[i-7]
  end
  return menu
end
