# frozen_string_literal: true

require 'fileutils'

file_url = 'data/data.txt'

def create_directory(name)
  directory_path = File.join(__dir__, name.to_s)
  return if Dir.exist?(directory_path)

  FileUtils.mkdir_p(directory_path)
end


create_directory('archive')

# адрес файла с которым будем работать
file = File.join(__dir__, file_url)
unless File.exist?(file)
  puts "Файл не найден: #{file}"
  exit 1
end

# вернуть чисто имя файла
file_name = File.basename(file, File.extname(file))

# читает построчной файл и создает новый файл и разрубает каждую строку исходного и записывает в новый файл
File.foreach(file).with_index(1) do |line, index|
  new_file_name = "#{file_name}_#{index}.txt"
  new_file_path = File.join(archive_dir, new_file_name)
  File.open(new_file_path, 'w') do |new_file|
    line.split(',').each do |part|
      new_file.puts part.strip.chomp
    end
  end
end
