puts "Введите N"
number = gets.chomp.to_i
count = 0
array = []
while count < number do
  count += 1
  array << count
end
puts array.to_s
puts "summa = #{array.sum}"
