-- will probably refactor this at some point as i figure out what's needed
-- and what isn't needed
-- also this is absolutely flooding the global namespace LOL
cardtypes = {}
cards = {}
card_id = 0

-- default card object
default_card = {}
default_card.name = "unimplemented"
default_card.abbreviation = "unimp"
default_card.description = "unimplemented"
default_card.cost = -1
function default_card:discard()
  del(hand,self)
  add(discard,self)
end
function default_card:play()
  if self.cost <= player_curenergy then
    player_curenergy -= self.cost
    self:effect()
    -- only discard if played from hand
    if del(hand,self) then add(discard,self) end
  else 
    -- mean sound effect
  end
end

function new_cardtype(type, rarity)
  -- type:
  -- 0 = atk
  -- 1 = skl
  -- rarity:
  -- 0 = basic
  -- 1 = common
  -- 2 = uncommon
  -- 3 = rare
  local crd = {
    __index = default_card,
    type = type,
    rarity = rarity
  }
  setmetatable(crd, crd)
  add(cardtypes, crd)
  return crd
end

function create_card(card)
  card_id += 1
  local crd = {
    __index = card,
    id = card_id
  }
  setmetatable(crd, crd)
  add(cards, crd)
  return crd
end

-- test cards
test = new_cardtype(0,0)
test.name = "strike"
test.abbreviation = "strk"
test.description = "deal 5 damage"
test.cost = 1
function test:effect() 
  sfx(0)
end

test2 = new_cardtype(1,0)
test2.name = "defend"
test2.abbreviation = "dfnd"
test2.description = "gain 5 block"
test2.cost = 1
function test2:effect()
  sfx(1)
end

-- shuffle any table, but used for draw pile primarily
function shuffle(t)
  -- Knuth Shuffle
  for x=0,count(t)-2 do
    local i=count(t)-x
    local j = flr(rnd(i))+1
    swap(t,i,j) 
  end
end

-- swap elements i and j in table t
function swap(t,i,j)
  local temp = t[i]
  t[i] = t[j]
  t[j] = temp
end