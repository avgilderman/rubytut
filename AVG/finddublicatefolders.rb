# frozen_string_literal: true

require 'find' # подключаем удобный метод
def find_duplicate(root_directory)
  # в этом юните находим адреса всех директорий
  hash_directories = {} # здесь храним пути ко всем найденным директориям
  duplicates_found = false # флаг для понимания найдены ли дубликаты?
  Find.find(root_directory) do |path| # рекурсивно проходит по всем директориям
    hash_directories[path] = true if File.directory?(path) # если path является директорией - записываем его в хэш
  end

  # в этом юните проходим по каждой директории и ищем дубликаты имён
  hash_directories.each_key do |directory_path|
    all_files_and_folders = Dir.entries(directory_path)
    duplicates = # пройтись по всем элементам и выбрать из общего массива файлов элементы соответствующие условию - встречается больше 1 раза
      all_files_and_folders.select do |item|
        all_files_and_folders.count(item) > 1
      end
    next unless duplicates.any? # если дубликатов не найдено, пропустить код снизу

    duplicates_found = true # Устанавливаем флаг, если дубликаты найдены
    puts "В директории #{directory_path} найдены дубликаты имен:"
    puts duplicates
  end

  return if duplicates_found # если дубликаты найдены(вообще) - выход из программы. Если не найдены - код идёт дальше:

  puts 'Дубликаты не найдены'
end

root_directory = '.'
find_duplicate(root_directory)
