# frozen_string_literal: true

require 'find'
require 'text' # Для использования алгоритма Левенштейна

# Метод для получения всех поддиректорий в указанной директории
def subdirectories_in(directory_path)
  Dir.entries(directory_path)
     .select { |entry| File.directory?(File.join(directory_path, entry)) && !['.', '..'].include?(entry) }
     .map { |entry| File.join(directory_path, entry) }
end

# Метод для вычисления расстояния Левенштейна между названиями двух папок
def similar_folders?(folder1, folder2, threshold)
  Text::Levenshtein.distance(folder1, folder2) <= threshold
end

# Метод для поиска похожих папок в пределах одной директории
def check_similar_folders_in_directory(directory_path, similarity_threshold)
  subdirectories = subdirectories_in(directory_path)
  subdirectories.combination(2).each do |dir1, dir2|
    folder1 = File.basename(dir1)
    folder2 = File.basename(dir2)

    if similar_folders?(folder1, folder2, similarity_threshold)
      puts "Похожие папки в #{directory_path}:\n#{dir1}\n#{dir2}\n"
      return true
    end
  end
  false
end

# Основной метод для поиска похожих папок во всех подкаталогах root_directory
def find_similar_folders(root_directory, similarity_threshold)
  duplicates_found = false

  Find.find(root_directory) do |directory_path|
    next unless File.directory?(directory_path)

    duplicates_found = true if check_similar_folders_in_directory(directory_path, similarity_threshold)
  end

  puts 'Похожие папки не найдены' unless duplicates_found
end

# Пример использования:
root_directory = 'I:/books2'
similarity_threshold = 3 # Максимально допустимое расстояние Левенштейна для схожих папок
find_similar_folders(root_directory, similarity_threshold)
