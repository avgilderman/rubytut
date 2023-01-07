#Вычислаяем сколько у нас "долларов в рублях""
def rub_to_usd(rate, how_many_rub)
  rub_to_usd = how_many_rub / rate
end
#Подсчитываем разницу между "долларами в рублях" и долларами
def diff(rub_to_usd, how_many_usd)
  (rub_to_usd - how_many_usd).abs
end
#Считаем сколько нужно купить/продать долларов
def how_many_buy(diff)
  (diff / 2).round(2)
end
#Опрашиваем пользователя
puts "Какой сейчас курс доллара?"
rate = gets.to_f
puts "Сколько у вас рублей?"
how_many_rub = gets.to_f
puts "Сколько у вас долларов?"
how_many_usd = gets.to_f
#Решаем, что посоветовать  пользователю
if diff(rub_to_usd(rate, how_many_rub), how_many_usd)<= 0.01
  puts "Ваш портфель сбалансирован"
elsif how_many_usd > rub_to_usd(rate, how_many_rub)
  puts "Вам следует продать " + how_many_buy(diff(rub_to_usd(rate, how_many_rub), how_many_usd)).to_s + "$"
else
  puts "Вам следует купить " + how_many_buy(diff(rub_to_usd(rate, how_many_rub), how_many_usd)).to_s + "$"
end
