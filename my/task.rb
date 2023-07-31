При чтении содержимого файла передавайте все прочитанные значения в конструктор:

Question.new(lines[0], lines[1], lines[2])

Складывайте экземпляра класса Question в массив.

А потом получайте нужную информацию из экземпляра вопросам соотв. методом:

puts "Следующий вопрос"
puts question.text




#five_questions = array_q_a.sample(5)

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
