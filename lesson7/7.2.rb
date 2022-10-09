big = 0
array = []
puts "Какой длинны должен быть массив?"
answer = gets.chomp.to_i
count = 0

while count < answer do
  array << rand(100)
  count += 1
end
puts array.to_s

for item in array do
if big < item
big = item
end
end

puts "Самое большое число: #{big}"
