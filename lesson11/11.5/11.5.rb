puts "Сколько вам енотов?"
puts
answer = $stdin.gets.chomp.to_i

def inclination(number, word1, word2, word3)
big_number = number % 100
other_number = number % 10
  if big_number >= 11 && big_number <= 14
    return word3
  end

  case other_number
  when 1
    return word1
  when (2..4)
    return word2
  else
    return word3
  end
end

puts "Вот Вам #{answer} #{inclination(answer, "енот", "енота", "енотов")}"
