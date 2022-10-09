array1 = [1, 2, 3, 4, 5]
puts array1.to_s
puts "Массив в обратном порядке: "
puts array1.reverse.to_s
puts "Исходный массив (не изменился): "
puts array1.to_s
array2 = array1.reverse!
puts "Исходный массив (после изменения): "
puts array2.to_s
