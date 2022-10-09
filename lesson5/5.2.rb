puts "Какую валюту вы хотите обменять?"
puts "Выберите вариант 1 или 2"
puts "1 - доллары в рубли"
puts "2 - рубли в доллары"
change = gets.to_i
puts "Сколько сейчас стоит 1 доллар в рублях?"
cost = gets.to_f
if change == 1
  puts "Сколько  у вас долларов?"
  dollars = gets.to_f
  exchange2 = (dollars * cost).round(2)
  puts "Ваши запасы:" + exchange2.to_s + " $"
else
  puts "Сколько  у вас рублей?"
  rub = gets.to_f
  exchange = (rub / cost).round(2)
  puts "Ваши запасы:" + exchange.to_s + " $"
end
