# frozen_string_literal: true

require 'pony'
require 'io/console'

my_email = 'crayalex@bk.ru'

puts "Введите пароль от вашей почты #{my_email} для отправки письма:"
password = $stdin.noecho(&:gets).chomp

puts 'Кому отправить письмо? Введите адрес:'
send_to = $stdin.gets.encode('UTF-8').chomp

puts 'Какова тема письма?'
subject = $stdin.gets.encode('UTF-8').chomp

puts 'Что написать в письме?'
body = $stdin.gets.encode('UTF-8').chomp

Pony.mail(
  subject:,
  body:,
  to: send_to,
  from: my_email,
  via: :smtp,
  via_options: {
    address: 'smtp.mail.ru',
    port: '465',
    tls: true,
    user_name: my_email,
    password:,
    authentication: :plain
  }
)

puts 'Письмо отправлено!'
