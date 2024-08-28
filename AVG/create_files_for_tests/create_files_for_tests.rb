# frozen_string_literal: true

require 'fileutils'
FileUtils.mkdir_p('folders')
Dir.chdir('folders')
array = ['test1.txt', 'test2.doc', 'image1.png', 'notes.pdf', 'data.csv']
array.each do |file_name|
  File.open(file_name, 'w') do |item|
    item.puts "Контент файла #{file_name}"
    puts "Тестовый файл #{file_name} успешно создан"
  end
end
