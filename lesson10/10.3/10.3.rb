puts
puts "Какой файл вам показать? (введите номер)"
puts
files = []
files = Dir.glob("data/*")

files.each.with_index(1) do |file, index|
  print index
  puts ": #{file}"
end

which_file = (gets.chomp.to_i - 1)
array = files[which_file]

current_path = File.dirname(__FILE__)
file_path = current_path + "/#{array}"

filesone = []
filesone = File.new(file_path, "r:UTF-8")
peremen = filesone.readline
filesone.close

puts peremen
