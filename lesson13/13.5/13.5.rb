list_files = []
array_q_a = []

list_files = Dir[File.join(__dir__, 'data', "*.txt")]

#Oбрабатываем элементы массива list_files прочитывая по порядку его содержимое методом readlines, и записывая обработанные элементы в массив array_q_a

array_q_a =
list_files.map do |file|
  File.readlines(file, chomp: true, encoding: 'UTF-8')
end



puts "Мини-викторина. Ответьте на вопросы:"


binding.irb

puts 