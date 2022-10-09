cars_array = ["Chevrolet", "Scion", "Mercedes - Benz", "Lincoln", "Porsche", "Honda", "Cadillac", "Toyota", "Buick", "Lexus"]
puts "У нас всего #{cars_array.size} машин. Вам какую?"
answer = gets.to_i - 1
if answer >= 0 && answer < cars_array.size
  puts "Поздравляем, вы получили:
#{cars_array[answer]}"
else
  puts "Извините, машины с таким номером у нас нет :("
end
