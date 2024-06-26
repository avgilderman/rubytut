require_relative "lib/film"
FILMS_PATH = "/data/*.txt"

all_directors = []
uniq_directors = []
user_answer = nil

films_files = Dir["#{__dir__}#{FILMS_PATH}"]
.sort
.map do |item|
  File.readlines(item, chomp: true, encoding: 'UTF-8')
end

objects_films = films_files.map do |item|
  Film.new(item[0], item[1], item[2])
end

objects_films.each do |item|
  all_directors << item.director
end

puts "Программа «Фильм на вечер»"
puts "Фильм какого режиссера вы хотите сегодня посмотреть?"

uniq_directors = all_directors.uniq
.sort
.each_with_index do |item, index|
  index += 1
  puts "#{index}: #{item}"
end

until (1..uniq_directors.size).include?(user_answer)
  puts "\nВведите ответ цифрой от 1 до #{uniq_directors.size}:"
  user_answer = $stdin.gets.chomp.to_i
end

user_answer_text = uniq_directors[user_answer -= 1]

puts "Вы выбрали: #{user_answer_text}"

offer_films = objects_films.select { |film| film.director == user_answer_text }
.sample

puts "#{user_answer_text} снял много интересных фильмов! \nИ сегодня вечером рекомендую посмотреть: \n#{offer_films.title} #{offer_films.year}г."
