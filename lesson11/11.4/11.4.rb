def shuffle_word(word)
    word.downcase.chars.shuffle.join
end

def shuffle_quote(quote)
   array_words = quote.split
   results = []

   array_words.each do |word|
   results << shuffle_word(word)
   end

   return results.join(" ")
end

puts "Введите фразу:"
puts
quote = gets.chomp

puts shuffle_quote(quote)
