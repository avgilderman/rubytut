require_relative "lib/film" # подключили класс
FILMS_PATH = "/data/*.txt" # подключили папку с файлами

# переменные, которые хз что делают
answer_index = 0
scores = 0
direcors = ["режиссёра", "режиссёров"]
user_answer = nil
all_directors = []
uniq_directors = []

# создаем массив адресов
films_files = Dir["#{__dir__}#{FILMS_PATH}"]
.sort
.map do |item| # пройтись по каждому адресу
  File.readlines(item, chomp: true, encoding: 'UTF-8')
end # прочитать каждый адрес, и из каждого адреса прочитать все строки файла в виде отдельных элементов. Получился массив массивов.

objects_films = films_files.map do |item| #пробегаем по массиву с массивами строк и каждый массив разбиваем на строки и добавляем как аргумент при создании класса film. Созданные объекты класса засовываем в новый массив объектов
  Film.new(item[0], item[1], item[2])
end

objects_films.each do |film|
  all_directors << film.director
end

puts 




puts "Программа «Фильм на вечер»"
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
