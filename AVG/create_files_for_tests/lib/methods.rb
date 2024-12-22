# frozen_string_literal: true

require 'fileutils'

def create_test_files(folder_name, files_names)
  FileUtils.mkdir_p(folder_name)
  Dir.chdir(folder_name)
  files_names.each do |file_name|
    File.open(file_name, 'w') do |item|
      item.puts "Контент файла #{file_name}"
      puts "Тестовый файл #{file_name} успешно создан"
    end
  end
end
