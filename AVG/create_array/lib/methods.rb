# frozen_string_literal: true

# вернуть чисто имя файла
def clear_file_name(path_to_file)
  File.basename(path_to_file, File.extname(path_to_file))
end

# создаём директорию для создаваемых файлов
def create_directory(name)
  new_directory_path = File.join(File.expand_path('..', __dir__), name.to_s)
  return "Директория #{name} уже существует" if Dir.exist?(new_directory_path)

  FileUtils.mkdir_p(new_directory_path)
  puts "Директория #{name} создана"
end

# есть ли файл из которого будем создавать выходные файлы?
# вернуть его адрес
def file_path(path)
  file = File.join(File.expand_path('..', __dir__), path)
  raise "Файл не найден: #{file}" unless File.exist?(file)

  file
end

# читает строку исходного файла, разрубает на части, создает новый файл, записывает разрубленное в новый файл
def create_files(full_file_path, folder_name, file_name)
  File.foreach(full_file_path).with_index(1) do |line, index|
    new_file_name = "#{file_name}_#{index}.txt"
    new_file_path = File.join(folder_name, new_file_name)
    File.open(new_file_path, 'w') do |newfile|
      formatted_line = line.split(',').map(&:strip).join("\n")
      newfile.puts formatted_line
    end
  end
  puts "Файлы созданы в папке #{folder_name}"
end
