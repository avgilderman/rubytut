list_files = []
array_file = []
array_questions = []
three_questions = []
count_right_answers = 0

puts "Мини-викторина. Ответьте на вопросы:"

#делаем массив с именами файлов
list_files = Dir.glob("data/*")
current_path = File.dirname(__FILE__)

list_files.each.with_index do |file, index|
  #получаем путь до файлов
  file_path = current_path + "/#{file}"
  #присоединям файл к массиву файлов
  array_file = File.new(file_path, "r:UTF-8")
  #добавляем построчно новый файл в построчный массив
  array_questions.push(array_file.readlines)
  #закрываем файл
  array_file.close
end

#кладем три случайных вопроса в отдельный массив
three_questions = array_questions.sample(3)

#обрабатываем вопросы и ответы
three_questions.each do |question|
#вывести первую строчку из файла
puts question[0]
puts "Введите ответ:"
user_answer = STDIN.gets.chomp.to_i
if user_answer == question[1].to_i
  puts "Вы правильно ответили!"
  puts
count_right_answers += 1
else
  puts "Вы ошиблись, правильный ответ - #{question[1]}"
  puts
end
end
puts "Правильных ответов: #{count_right_answers} из 3"
