require_relative 'lib/question'

#объявляем все, что нам понадобиться:
array_q_a = []
array_questions = []
count_right_answers = 0
count_scores = 0
user_answer = nil

#поиск файлов, соответствующих шаблону, и создание списка таких файлов
list_files = Dir[File.join(__dir__, 'data', "*.txt")]

#Итератор применяет к списку адресов файлов - метод фаилз с параметрами и добавляет значения в массив вопросов и ответов. Затем итератор проходит по массиву вопросов и ответов, добавляя строчки с вопросами/ответами/баллами в конструктор класса и затем добавляет создавшиеся обьекты класса в массив

list_files.map do |file|
  array_q_a = File.readlines(file, chomp: true, encoding: 'UTF-8')
  array_questions << Question.new(array_q_a[0], array_q_a[1], array_q_a[2])
end

puts "Мини-викторина. Ответьте на вопросы:"
puts 

5.times do |index|
  shuffle_questions = array_questions.sample
  array_questions.delete(shuffle_questions)
  puts "Вопрос #{index + 1}. #{shuffle_questions.question}"
  puts "Введите ответ:"
  user_answer = $stdin.gets.chomp
  #проверка ответа
 if user_answer.downcase == shuffle_questions.right_answer.downcase
    puts "Вы правильно ответили!"
    puts
    count_scores += shuffle_questions.scores.to_i
    count_right_answers += 1
  else
    puts "Вы ошиблись, правильный ответ - #{shuffle_questions.right_answer}"
    puts
  end
end

puts "Правильных ответов: #{count_right_answers} из 5"
puts "Вы набрали #{count_scores} баллов"

