puts "Какой сейчас курс доллара?"
rate = gets.chomp.to_f
puts "Сколько у вас рублей?"
how_many_rub = gets.chomp.to_f
puts "Сколько у вас долларов?"
how_many_usd = gets.chomp.to_f

def diff_usdrur(rate, how_many_rub, how_many_usd)
  rub_to_usd = (how_many_rub / rate)
  diff = (rub_to_usd - how_many_usd).abs
  how_many_buy = (diff / 2).round(2)
  return rub_to_usd, diff, how_many_buy
end

def buy_or_sell(how_many_usd, rub_to_usd, diff, how_many_buy)
  if diff <= 0.01
    print_string = "Ваш портфель сбалансирован"
  elsif how_many_usd > rub_to_usd
    print_string = "Вам следует продать " + how_many_buy.to_s + " $"
  else
    print_string = "Вам следует купить " + how_many_buy.to_s + " $"
  end
  return print_string
end

rub_to_usd = diff_usdrur(rate, how_many_rub, how_many_usd)[0]
diff = diff_usdrur(rate, how_many_rub, how_many_usd)[1]
how_many_buy = diff_usdrur(rate, how_many_rub, how_many_usd)[2]

puts buy_or_sell(how_many_usd, rub_to_usd, diff, how_many_buy)
