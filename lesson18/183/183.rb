# frozen_string_literal: true

def hashtags(user_input)
  hashtags = user_input.scan(/#[\p{L}\p{N}_-]+/)
  if hashtags.empty?
    puts 'Не нашли хэштеги. Нужно указать их символом #'
  else
    puts hashtags.join(', ')
  end
end

puts 'Введите строку с хэштегами:'
user_input = $stdin.gets.chomp

hashtags(user_input)
