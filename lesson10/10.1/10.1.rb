filename = ARGV[0] ||= puts "Введите название файла в параметре запуска"
while filename == nil
exit
end

if Gem.win_platform? && ARGV[0]
  filename = filename.encode("UTF-8")
end

current_path = File.dirname(__FILE__)
file_path = current_path + "/File_10.1/#{filename}"

unless File.exist?(file_path)
 abort "Файл не найден"
end

array = []
file = File.new(file_path, "r:UTF-8")
array = file.readlines
file.close

puts "Вы открыли файл #{filename}"
puts "Всего строк: #{array.size}"
empty_string = 0

array.each_with_index do |string, index|
  if string == "\n"
    empty_string += 1
  end
end

puts "Пустых строк #{empty_string}"
puts array.last(5)
