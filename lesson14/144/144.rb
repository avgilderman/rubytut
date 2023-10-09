require_relative "lib/film"
array_films = []
answer_index = 0
scores = 0
direcors = ["режиссёра", "режиссёров"]
user_answer = nil

list_files_paths = Dir[File.join(__dir__, 'data', "*.txt")]

list_files_paths.each do |file_path|
  array_lines = File.readlines(file_path, chomp: true, encoding: 'UTF-8')
  array_films << Film.new(array_lines[0], array_lines[1], array_lines[2])
end

puts "==========================="
puts "Добрый день, любитель кино!"
puts "Давай посмотрим, хорошо ли ты знаешь какой режиссер какой фильм снял?"

random_three_films = array_films.sample(3)

random_three_films.each do |film|
  user_answer = nil
  puts "\nКто снял \"#{film.title}\" (#{film.year})? \nВарианты:"
  
  uniq_answers = array_films.map(&:director).uniq
  answers = uniq_answers.grep_v(film.director).sample(3)
  answers << film.director
  answers.shuffle!

  answers.each_with_index do |answer, answer_index|
    puts "#{answer_index + 1} #{answer}"
  end

  until (1..4).include?(user_answer)
    puts "\nВведите ответ цифрой от 1 до 4:"
    user_answer = $stdin.gets.chomp.to_i
  end

  if user_answer == (answers.index(film.director) + 1)
    scores += 1
    puts "\nПравильно! #{film.director}"
  else
    puts "\nНеправильно! Правильный ответ — #{film.director}"
  end
  
end

if user_answer == 1
  puts_dir = direcors[0]
else
  puts_dir = direcors[1]
end

puts "\nВы угадали #{scores} #{puts_dir} из #{random_three_films.size}"
