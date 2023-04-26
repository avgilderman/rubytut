def BMI(height, weight)
  height_meter = height / 100
  weight / (height_meter * height_meter)
end

puts BMI()

puts "Какой у Вас рост?"
height = gets.to_f
puts "Какой у Вас вес?"
weight = gets.to_f
puts "Ваш индекс массы тела: "


# Вычисляется этот индекс по простой формуле — масса в килограммах, деленная на квадрат 
# роста в метрах.

# Недостаточная (дефицит) масса тела 

# первый по параметрам вычисляет BMI;
# второй по показателю BMI определяет строку для вывода по таблице из Википедии.
# Для второго подойдет конструкция case.

# def rub_to_usd(rate, how_many_rub)
#     how_many_rub / rate
# end
  
#   def diff(rate, how_many_rub, how_many_usd)
#     (how_many_usd - rub_to_usd(rate, how_many_rub)).abs
#   end
  
#   def how_many_buy(rate, how_many_rub, how_many_usd)
#     (diff(rate, how_many_rub, how_many_usd) / 2).round(2)
#   end
  
#   puts "Какой сейчас курс доллара к рублю?"
#   rate = gets.to_f
#   puts "Сколько у вас рублей?"
#   how_many_rub = gets.to_f
#   puts "Сколько у вас долларов?"
#   how_many_usd = gets.to_f
  
#   if diff(rate, how_many_rub, how_many_usd) <= 0.01
#     puts "Ваш портфель сбалансирован"
#   elsif how_many_usd > rub_to_usd(rate, how_many_rub)
#     puts "Вам следует продать " + how_many_buy(rate, how_many_rub, how_many_usd).to_s + "$"
#   else
#     puts "Вам следует купить " + how_many_buy(rate, how_many_rub, how_many_usd).to_s + "$"
#   end
  