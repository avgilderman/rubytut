# frozen_string_literal: true

def bill(money)
  (money + ((money * 10) / 100) - ((money * 20) / 100))
end

puts 'Введи сумму, которую должен перевести Ярославу Анатольевичу'
money = gets.chomp.to_i
puts "Вы должны вернуть Ярославу Анатольевичу #{bill(money)} тенге!"
puts 'Не заставляйте его ждать!'
