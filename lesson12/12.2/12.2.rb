#Выводим сообщение приветственное
puts "Введите слово, а я посчитаю гласные и согласные буквы:"

#записываем в переменную ввод пользователя
user_word = $stdin.gets.chomp.downcase

#обьявляем метод который
def letters(letter) #объявляем метод и его параметр
  array = [] #обьявляем пустой массив
  array_gl = %w[а у о ы и э я ю ё е] #обьявляем массив с гласными буквами
  count = 0 #объявляем переменную со счетчиком
  array = letter.chars #
    array.each do |item|
      if array_gl.include?(item)
      count += 1
      end
    end
  other_letters = array.size - count
  return count
  return other_letters
end

puts "Гласных буков: #{letters(user_word)}"
