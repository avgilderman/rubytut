# frozen_string_literal: true

require 'translit'

def transliterator(text)
  translate_to_english = Translit.convert(text, :english)
  if translate_to_english == text
    Translit.convert(text, :russian)
  else
    translate_to_english
  end
end

puts 'Введите фразу для транслитерации:'
input = gets.chomp
puts transliterator(input)
