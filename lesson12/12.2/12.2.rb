puts "Введите слово, а я посчитаю гласные и согласные буквы:"
#записываем в переменную ввод пользователя
user_word = $stdin.gets.chomp.downcase #Записываем ввод пользователя
def letters(letter)
  array = []
  array_gl = %w[а у о ы и э я ю ё е] #обьявляем массив с гласными буквами
  count = 0
  array = letter.chars #Возвращает массив, содержащий символы строки, из которой вызывается
    array.each do |item|
      if array_gl.include?(item) #если элемент из массива введенного слова имеется в массие гласных, то
      count += 1 #добавляем в переменную счетчика +1
      end
    end
  return count
end

def letters2(letter)
  array = []
  array_sg = %w[б в г д ж з й к л м н п р с т ф х ц ч ш щ]
  count = 0
  array = letter.chars
    array.each do |item|
      if array_sg.include?(item)
        count += 1
      end
    end
    return count
  end

puts "Гласных букв: #{letters(user_word)}"
puts "Согласных букв: #{letters2(user_word)}"
puts "Всего букв букв: #{letters(user_word) + letters2(user_word)}"
