array1 = ["Jenny", "Elena", "Katya", "Jennifer"]
array2 = ["Victor", "Alex", "Diego", "Kostya"]
puts "Women: #{array1}"
puts "Men: #{array2}"
new_array = array1 + array2
puts "Everybody: #{new_array}"
new_array2 = array1.concat(array2)
puts "Everybody2: #{new_array2}"
