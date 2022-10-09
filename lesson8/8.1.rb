puts
original_string = gets.chomp
stripped_string = original_string.downcase.delete(",.' '")
reverse_string = stripped_string.reverse
if reverse_string == stripped_string
  puts "Да, это палиндром"
else
  puts "Нет, это не палиндром"
end
