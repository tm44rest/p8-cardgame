buttons = {}

button = {}
function button:up() end
function button:down() end
function button:right() end
function button:left() end
function button:press(inp) end
function button:draw() end

function create(draw)
  btn = {
    __index = button,
    draw = draw
  }
  setmetatable(btn,btn)
  add(buttons, btn)
  return btn
end

