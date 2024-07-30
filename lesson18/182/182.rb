# frozen_string_literal: true

def true_phone(phone, regexp)
  if phone =~ /#{regexp}/
    puts 'Спасибо!'
  else
    puts 'Это не номер телефона'
  end
end

regexp = /^[\d+]+[\d+()\- ]+[\d+\-]+$/

puts 'Введите номер телефона:'
user_phone = $stdin.gets.chomp
true_phone(user_phone, regexp)
