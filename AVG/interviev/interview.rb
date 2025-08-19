# frozen_string_literal: true

require_relative 'lib/library'

data_path = '/data/'

# Получаем массив "вопросов с ответами" quiz
array_quiz = load_quizzes(data_path).shuffle
total_questions = array_quiz.length
known_answers_count = 0
VALID_RESPONSES = %w[да yes y].freeze

array_quiz.each do |quiz|
  puts "Тема: #{question_topic(quiz.filename)}"
  puts "Вопрос: #{quiz.question}"
  puts 'Вы знаете ответ? (да/нет)'
  user_input = gets.chomp.downcase
  known_answers_count += 1 if VALID_RESPONSES.include?(user_input)
  puts "Проверим ответ: #{quiz.answer}"
  puts '---'
end

puts "Закончили тестирование!\nВы знаете ответы на #{known_answers_count} вопросов из #{total_questions}\nУчи!"
