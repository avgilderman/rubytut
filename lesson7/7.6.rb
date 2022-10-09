number = rand(0..15)
puts "Угадайте число с трех попыток!"

count = 0
while count < 3 do

  enter = gets.chomp.to_i
  warm = number - enter

  if enter == number
    abort "Поздравляем с победой"
  else
    if warm.abs > 2
      print "Холодно, "
    else
      print "Тепло, "
    end

    if enter < number
      print "нужно больше. "
    else
      print "нужно меньше. "
    end
  end

  count += 1

end

puts "Попытки закончились. Заданное число было #{number}"
