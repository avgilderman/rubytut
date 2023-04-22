def rub_to_usd(rate, how_many_rub)
  how_many_rub / rate
end

def diff(rate, how_many_rub, how_many_usd)
  rub_to_usd = rub_to_usd(rate, how_many_rub)
  (how_many_usd - rub_to_usd).abs
end

def how_many_buy(rate, how_many_rub, how_many_usd)
  diff = diff(rate, how_many_rub, how_many_usd)
  (diff / 2).round(2)
end

puts "Какой сейчас курс доллара к рублю?"
rate = gets.to_f
puts "Сколько у вас рублей?"
how_many_rub = gets.to_f
puts "Сколько у вас долларов?"
how_many_usd = gets.to_f

if diff(rate, how_many_rub, how_many_usd) <= 0.01
  puts "Ваш портфель сбалансирован"
elsif how_many_usd > rub_to_usd(rate, how_many_rub)
  puts "Вам следует продать " + how_many_buy(rate, how_many_rub, how_many_usd).to_s + "$"
else
  puts "Вам следует купить " + how_many_buy(rate, how_many_rub, how_many_usd).to_s + "$"
end
