require_relative 'lib/question'

list_files = []
array_q_a = []
count_right_answers = 0
count_scores = 0
count_right_answers = 0

list_files = Dir[File.join(__dir__, 'data', "*.txt")]

array_q_a =
list_files.map do |file|
  File.readlines(file, chomp: true, encoding: 'UTF-8')
end

five_questions = array_q_a.sample(5)

puts "Мини-викторина. Ответьте на вопросы:"

five_questions.each.with_index(1) do |(questinon, right_answer, scores), index|
  puts "#{index}. #{questinon}"
  puts "Введите ответ:"
  user_answer = $stdin.gets.chomp
  
  if user_answer.downcase == right_answer.downcase
    puts "Вы правильно ответили!"
    puts
    count_scores += scores.to_i
    count_right_answers += 1
  else
    puts "Вы ошиблись, правильный ответ - #{right_answer}"
    puts
  end

end

puts "Правильных ответов: #{count_right_answers} из 5"
puts "Вы набрали #{count_scores} баллов"
