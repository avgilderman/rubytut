require_relative 'lib/question'

list_files = []
array_q_a = []
array_questions = []
count_right_answers = 0
count_scores = 0

#поиск файлов, соответствующих шаблону, и создание списка таких файлов
list_files = Dir[File.join(__dir__, 'data', "*.txt")]

#
array_q_a =
list_files.map do |file|
  File.readlines(file, chomp: true, encoding: 'UTF-8')
end

array_q_a.each do |value|
  array_questions << Question.new(value[0], value[1], value[2])
end


puts array_questions[3].right_answer



#class MyClass
 # def initialize(value)
  #  @value = value
  #end
#end

#values = [1, 2, 3, 4, 5]
#objects = []

#values.each do |value|
 # objects << MyClass.new(value)
#end

#five_questions = array_q_a.sample(5)

#puts "Мини-викторина. Ответьте на вопросы:"

#five_questions.each.with_index(1) do |(questinon, right_answer, scores), index|

#  puts "#{index}. #{questinon}"
 # puts "Введите ответ:"
  #user_answer = $stdin.gets.chomp
  
  #if user_answer.downcase == right_answer.downcase
   # puts "Вы правильно ответили!"
    #puts
    #count_scores += scores.to_i
    #count_right_answers += 1
  #else
  #  puts "Вы ошиблись, правильный ответ - #{right_answer}"
   # puts
  #end

#end

#puts "Правильных ответов: #{count_right_answers} из 5"
#puts "Вы набрали #{count_scores} баллов"
