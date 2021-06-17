-- can probably be refactored to share default functions/values with monsters,
-- but worry about that later

player_maxhp = 80
player_curhp = 80
player_maxenergy = 3
player_curenergy = 3
deck = {}
draw = {}
discard = {}
exhaust = {}
hand = {}

-- testing features of the hand
for i=0,12 do
  if i % 3 == 0 then
    add(deck,create_card(test2))
  else
    add(deck,create_card(test))
  end
end

function draw_card()
  local c = draw[1]
  -- if draw pile is not empty
  if c then
    add(hand,c)
    del(draw,c)
  end
  return c
end

function reshuffle_discard()
  if count(discard) > 0 then
    for c in all(discard) do
      add(draw,c)
      del(discard,c)
    end
    shuffle(draw)
  end
end