require_relative "lib/film"
FILMS_PATH = "/data/*.txt"

# амнистированные
all_directors = []

# пока не амнистированные
answer_index = 0
scores = 0
direcors = ["режиссёра", "режиссёров"]
user_answer = nil
uniq_directors = []

# массив адресов
films_files = Dir["#{__dir__}#{FILMS_PATH}"]
.sort
.map do |item| # пройтись по каждому адресу файла
  File.readlines(item, chomp: true, encoding: 'UTF-8')
end # прочитать каждый адрес, и из каждого адреса прочитать все строки файла в виде отдельных элементов массива. Получился массив массивов.

objects_films = films_files.map do |item| #пробегаем по массиву с массивами строк, и каждый массив разбивая на строки - добавляем их как аргумент при создании экземпляра класса film. Созданные экземпляры класса засовываем в новый массив экземпляров класса
  Film.new(item[0], item[1], item[2])
end

objects_films.each do |item| #создаем массив директоров с уникальными данными
  all_directors << item.director
end

puts "Программа «Фильм на вечер»" #
puts

uniq_directors.uniq
.each_with_index do |film, index|
puts "#{index} #{film}"
end

puts
puts "Фильм какого режиссера вы хотите сегодня посмотреть?"


  until (1..4).include?(user_answer)
    puts "\nВведите ответ цифрой от 1 до 4:"
    user_answer = $stdin.gets.chomp.to_i
  end

# ======


# random_three_films.each do |film|
#   user_answer = nil
#   puts "\nКто снял \"#{film.title}\" (#{film.year})? \n Варианты:"
  
#   uniq_answers = array_films.map(&:director).uniq
#   answers = uniq_answers.grep_v(film.director).sample(3)
#   answers << film.director
#   answers.shuffle!

#   answers.each_with_index do |answer, answer_index|
#     puts "#{answer_index + 1} #{answer}"
#   end



#   if user_answer == (answers.index(film.director) + 1)
#     scores += 1
#     puts "\nПравильно! #{film.director}"
#   else
#     puts "\nНеправильно! Правильный ответ — #{film.director}"
#   end
  
# end

# if user_answer == 1
#   puts_dir = direcors[0]
# else
#   until (1..4).include?(user_answer)
#     puts "\nВведите ответ цифрой от 1 до 4:"
#     user_answer = $stdin.gets.chomp.to_i
#   end#   puts_dir = direcors[1]
# end

# puts "\nВы угадали #{scores} #{puts_dir} из #{random_three_films.size}"
