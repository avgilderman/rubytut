# frozen_string_literal: true

def find_folders_in_directory(directory_path)
  # Получаем список всех элементов в указанной директории
  Dir.entries(directory_path)
  # entries = Dir.entries(directory_path)

  # Фильтруем список, оставляя только папки
  # entries.select do |entry|
  #   File.directory?(File.join(directory_path, entry)) &&
  #     entry != '.' && entry != '..'
  # end
end

puts find_folders_in_directory('.')
