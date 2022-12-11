puts "Какой сейчас курс доллара?"
usd_rate = gets.chomp.to_f
puts "Сколько у вас рублей?"
rub = gets.chomp.to_f
puts "Сколько у вас долларов?"
usd = gets.chomp.to_f

def ()
usdrub = (rub / usd_rate)
diff = (usdrub - usd).abs
average_diff = (diff / 2).round(2)
if diff <= 0.01
  puts "Ваш портфель сбалансирован"
elsif usd > usdrub
  puts "Вам следует продать " + average_diff.to_s + " $"
else
  puts "Вам следует купить " + average_diff.to_s + " $"
end
