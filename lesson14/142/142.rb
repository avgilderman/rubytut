# Подключаем необходимые классы
require_relative 'lib/sociability_test'
require_relative 'lib/results_class'

# Объявлляем необходимые переменные и массив
scores = 0
number_question = 0
incorrect_questions = [5, 10, 11]

# Узнаем путь до файлов с вопросами и результатами
question_file_path = File.join(__dir__, 'data', 'questions.txt')
results_file_path = File.join(__dir__, 'data', 'results.txt')

# Прочитываем оба файла
text_q = File.read(question_file_path, encoding: 'UTF-8')
text_r = File.read(results_file_path, encoding: 'UTF-8')

# Создаём массив, закладывая туда разделенный на части прочитанный текст
array_q = text_q.split(";\n")
array_r = text_r.split(";\n\n")

# Спрашиваем имя, как аргумент командной строки
name = ARGV[0] ||= "username"
if Gem.win_platform? && ARGV[0]
  name = name.encode("UTF-8")
end

# Приветствие
puts
puts "Добрый день, #{name}! Тест поможет определить ваш уровень коммуникабельности.\nДля этого необходимо правдиво ответить" \
" на следующие вопросы:"
puts

# Проходим по массиву добавляя в новый класс каждый вопрос
array_q.each_with_index do |question, index|
  number_question = (index += 1)
  question_class = SociabilityTest.new(question, number_question,  incorrect_questions)
  puts question_class.question
  scores += question_class.score
end

results_test = ResultsClass.new(scores, array_r)

print "#{name}, "
print "Ваш результат теста - #{scores} #{results_test.results}"

