monstertypes = {}
monsters = {} -- monsters in current encounter

-- default monster
monster = {}
--refactor individual draw functions to accomodate a sprite table (with
-- height and width accounted for)


function new_monstertype()
  local m = {
    __index = monster
  }
  setmetatable(m,m)
  add(monstertypes, m)
  return m
end

function create_monster(mnstr,x,y)
  local m = {
    __index = mnstr,
    x = x,
    y = y,
    curhp=mnstr.maxhp
  }
  setmetatable(m,m)
  add(monsters, m)
  return m
end

green_slime = new_monstertype()
green_slime.maxhp = 12
green_slime.name = "green slime"
function green_slime:draw()
  spr(207,self.x,self.y)
  print(self.curhp .. "/" .. self.maxhp,self.x-6,self.y+10,8)
end