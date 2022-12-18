puts "Какой сейчас курс доллара?"
currency = gets.chomp.to_f
puts "Сколько у вас рублей?"
how_many_rub = gets.chomp.to_f
puts "Сколько у вас долларов?"
how_many_usd = gets.chomp.to_f

def difference_usdrur (currency, how_many_usd, how_many_rub)
  rub_to_usd = (rub / usd_rate)
  diff = (rub_to_usd - usd).abs
  average_diff = (diff / 2).round(2)
    return (rub_to_usd, diff, average_diff)
end

def buy_or_sell (diff, usd, rub_to_usd, average_diff)
if diff <= 0.01
  puts "Ваш портфель сбалансирован"
elsif usd > rub_to_usd
  puts "Вам следует продать " + average_diff.to_s + " $"
else
  puts "Вам следует купить " + average_diff.to_s + " $"
end

end
