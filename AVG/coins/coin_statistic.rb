# frozen_string_literal: true

even = 0
odd = 0
rib = 0
anim = '*'

1000.times do
  item = rand(1000)
  anim += '*'
  sleep 0.0005
  puts anim

  if item == 1
    rib += 1
  elsif item.even?
    even += 1
  elsif item.odd?
    odd += 1
  end
end

puts "Монетка упала третьей стороной #{rib} раз"
puts "Выпал орел #{even} раз"
puts "Выпал решка #{odd} раз"
