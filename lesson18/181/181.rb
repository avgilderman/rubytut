# frozen_string_literal: true

def true_email(email, regexp)
  if email =~ /#{regexp}/
    puts 'Спасибо!'
  else
    puts "Какая-то фигня!\nЭто не email"
  end
end

regexp = /^[\w\d_.+\-]+@[\w\d_.\-]+(\.[\w\d_.\-]+)*\.[\w]+$/

puts 'Введите email:'
user_email = $stdin.gets.chomp
true_email(user_email, regexp)
