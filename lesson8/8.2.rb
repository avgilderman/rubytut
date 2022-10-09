original_string = ''

while original_string == ''
  puts "Введите строку, которую надо проверить на «палиндромность»:"
  original_string = gets.chomp.to_s
end

stripped_string = original_string.downcase.delete("^a-zа-я")
reverse_string = stripped_string.reverse

if reverse_string == stripped_string
  puts "Вы ввели строку #{stripped_string}"
  puts "Да, эта строка палиндром"
else
  puts "Нет, эта строка не палиндром"
end
