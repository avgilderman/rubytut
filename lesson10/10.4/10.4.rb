list_files = []
array_q_a = []
number_of_questions = 3
count_right_answers = 0
puts "Мини-викторина. Ответьте на вопросы:"

# создаем список файлов в директории и записываем список в массив list_files
list_files = Dir[File.join(__dir__, 'data', "*.txt")]

# Oбрабатываем элементы массива list_files прочитывая по порядку его содержимое методом readlines, и записывая обработанные элементы в массив array_q_a
array_q_a =
list_files.map do |file|
  File.readlines(file, chomp: true, encoding: 'UTF-8')
end

# кладем три случайных вопроса в отдельный массив
three_questions = array_q_a.sample(number_of_questions)

# обрабатываем вопросы и ответы. Заранее делим массив на вопрос и ответ

three_questions.each.with_index(1) do |(question, right_answer), index|
  # вывести первую строчку из файла
  puts "#{index}. #{question}"
  puts "Введите ответ:"
  user_answer = $stdin.gets.chomp

  if user_answer.downcase == right_answer.downcase
    puts "Вы правильно ответили!"
    puts
    count_right_answers += 1
  else
    puts "Вы ошиблись, правильный ответ - #{right_answer}"
    puts
  end

end

puts "Правильных ответов: #{count_right_answers} из #{number_of_questions}"
