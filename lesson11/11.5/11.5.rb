def inclination(number, word1, word2, word3)
big_number = number % 100
other_number = number % 10
  if big_number >= 11 && big_number <= 14
    return word3
  end

  case other_number
  when 1
    word1
  when (2..4)
    word2
  else
    word3
  end
end

puts "Сколько вам енотов?"
answer = $stdin.gets.to_i

puts
puts "Вот Вам #{answer} #{inclination(answer, "енот", "енота", "енотов")}"
