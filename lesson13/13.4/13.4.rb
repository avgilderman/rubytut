class Chameleon
  def initialize(color)
    @color = color
  end
  #геттер
  def color
    return @color
  end
  #сеттер
  def change_color(color)
    @color = color
  end   
end

user_color = nil

chameleon = Chameleon.new("синий")
puts "Сейчас я #{chameleon.color}"

while user_color != ""
  puts "Какой цвет сделать?"
  user_color = gets.chomp.to_s
    if user_color == "" 
      break
    end

  chameleon.change_color(user_color)
  puts "Теперь я #{chameleon.color}"
end
