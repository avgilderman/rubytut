product_array = ["melon", "масло", "молоко", "хлопья", "картошка", "курица", "помидоры"]
puts "Нужно купить: #{product_array}"

until product_array.empty?
  puts "Еще нужно купить #{product_array}"
  puts "Что Вы купили?"
  bought = gets.chomp
  product_array.delete(bought)
end
  puts "Вы купили все, что нужно"
