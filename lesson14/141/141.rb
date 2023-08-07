heroes_array = ["Бэтмен - Джокер", "Буратино - Карабас-Барабас", "Фродо Бэггинс - Саурон", "Моцарт - Сальери"]

puts "Здравствуйте"
puts "У нас есть массив персонажей:"

heroes_array.each do |item|
  puts item.split("-").first
  sleep 0.2
end 

puts "Врага какого персонажа вы хотите узнать?"
hero = STDIN.gets.encode("UTF-8").chomp.to_s

case hero.downcase
when "batman", "бэтмен"
  puts "Джокер"  
when "буратино", "pinocchio"
  puts "Карабас-Барабас"
when "фродо бэггинс", "frodo baggins"
  puts "Саурон"
when "моцарт", "mozart"
  puts "Сальери"  
else
  puts "Не удалось найти врага!"
end
