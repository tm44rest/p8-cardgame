-- will probably refactor this at some point as i figure out what's needed
-- and what isn't needed
-- also this is absolutely flooding the global namespace LOL
cardtypes = {}
cards = {}

-- default card object
default = {}
default.name = "unimplemented"
default.abbreviation = "unimp"
default.description = "unimplemented"
default.cost = -1

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
    __index = default,
    type = type
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

function play_card(card)
  card:effect()
  -- if card is played from hand, discard it
  if del(hand,card) then add(discard,card) end
end

-- test cards
test = new_cardtype(0,1)
test.name = "test"
test.abbreviation = "test"
test.description = "this is a test card"
test.cost = 0
function test:effect() 
  sfx(0)
end

test2 = new_cardtype(2,0)
test2.name = "test2"
test2.abbreviation = "hi"
test2.description = "hello world"
test2.cost = 1
function test2:effect()
  sfx(1)
end