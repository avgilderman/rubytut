puts "Введите слово, а я посчитаю гласные буквы:"
user_word = $stdin.gets.chomp.downcase

def gl_word(word)
  array = []
  array_gl = %w[а у о ы и э я ю ё е]
  count = 0
  array = word.chars
    array.each do |item|
      if array_gl.include?(item)
      count += 1
      end
    end
  return count
end

puts "#{gl_word(user_word)}"
