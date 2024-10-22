# frozen_string_literal: true

PATH = '/Volumes/Android SD/books2' # путь для работы программы
COMPARE_LEVEL = 3 # степень сравнение алгоритма

require 'text'

# список всех директорий
def find_all_directories(path)
  Dir.glob("#{path}/**/*").select { |item| File.directory?(item) }
end

# похожие папки
def find_similar_directories(list_directories, compare_level)
  similar_directories = []

  list_directories.combination(2) do |dir1, dir2|
    directories_name1 = File.basename(dir1)
    directories_name2 = File.basename(dir2)

    # Рассчитываем расстояние Левенштейна
    distance = Text::Levenshtein.distance(directories_name1, directories_name2)

    # Если расстояние меньше порога, добавляем в список
    similar_directories << [directories_name1, directories_name2, distance] if distance <= compare_level
  end

  similar_directories
end

list_directories = find_all_directories(PATH)
similar_directories = find_similar_directories(list_directories, COMPARE_LEVEL)

puts 'Найденные похожие папки:'
similar_directories.each do |directory1, directory2, distance|
  puts "#{directory1} - #{directory2}"
end
