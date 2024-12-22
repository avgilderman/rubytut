# frozen_string_literal: true

require_relative 'lib/methods'

coin_toss = 1000

stats = coin_toss_stat(coin_toss)

puts "Монетка упала третьей стороной #{stats[:rib]} раз"
puts "Выпал орел #{stats[:even]} раз"
puts "Выпал решка #{stats[:odd]} раз"
