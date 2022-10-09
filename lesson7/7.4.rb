original_array = [1, 2, 3, 4, 5, 6, 7]
puts "Исходный массив: #{original_array}"
new_array = []
for item in original_array do
  new_array.unshift(item)
endметода unshift
puts "Новый массив полученный из исходного #{new_array}"
