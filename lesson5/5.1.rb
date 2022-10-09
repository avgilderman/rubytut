puts "Программа попомогает найти среднее арифмметическое"
puts "Введите первое число"
number1 = gets.chomp.to_i
puts "Введите второе число"
number2 = gets.chomp.to_i
puts "Введите третье число"
number3 = gets.chomp.to_i
average = (number1 + number2 + number3) / 3.0
puts "Среднее арифметическое числел " + average.to_s
