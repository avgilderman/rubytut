# frozen_string_literal: true

puts 'Подбросим монетку!'

random = rand(1000)
if random == 1
  puts 'Монетка упала третьей стороной'
elsif random.even?
  puts 'Выпал орел'
elsif random.odd?
  puts 'Выпал решка'
end
