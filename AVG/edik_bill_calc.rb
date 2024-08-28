def Bill(cry_money)
    bill = (cry_money + ((cry_money * 10) / 100) - ((cry_money * 20) / 100))
end

puts "Введи сумму, которую должен перевести Ярославу Анатольевичу"
cry_money = gets.chomp.to_i
puts "Вы должны вернуть Ярославу Анатольевичу #{Bill(cry_money)} тенге!"
puts "Не заставляйте его ждать!"
