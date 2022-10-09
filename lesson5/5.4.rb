puts "вы пришли в дом к другу"
puts "1 - поздороваться"
puts "2 - убежать"
puts "3 - позвать маму"
peremen1 = gets.chomp
if peremen1 == "1"
  puts "привет, Саня!"
elsif peremen1 == "2"
  puts "вы убажжали"
elsif peremen1 == "3"
  puts "Вы позвали маму"
elsif peremen1 == "1234"
  puts "сработал чит код"
  exit
else puts "что то не то ввели"
end
puts "продолжение игры"
