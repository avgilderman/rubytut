#расчет сколько у нас будет долларов, если поменяем свои рубли.
def rub_to_usd(rate, how_many_rub)
    how_many_rub / rate
end
#подсчитывает разницу между долларами которые у нас будут после обмена и долларами, что мы уже имеем.
def diff(rate, how_many_rub)
    rub_to_usd = rub_to_usd(rate, how_many_rub)
    (how_many_usd - rub_to_usd).abs
end
#Считаем сколько нужно купить/продать долларов, что бы выровнять портфель
def how_many_buy(diff)
    (diff / 2).round(2)
end
#Решаем, что посоветовать  пользователю
if diff(rate, how_many_rub)<= 0.01
  puts "Ваш портфель сбалансирован"
elsif how_many_usd > rub_to_usd(rate, how_many_rub)
  puts "Вам следует продать " + how_many_buy.to_s + "$"
else
  puts "Вам следует купить " + how_many_buy.to_s + "$"
end

#Опрашиваем пользователя
puts "Какой сейчас курс доллара к рублю?"
rate = gets.to_f
puts "Сколько у вас рублей?"
how_many_rub = gets.to_f
puts "Сколько у вас долларов?"
how_many_usd = gets.to_f


