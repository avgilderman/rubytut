def BMI(height, weight)
  height_meter = height / 100
  (weight / (height_meter * height_meter)).round(1)
end

def index_bmi_string(index)
  index = index
  case index
    when 0..16
      puts "Ваш индекс: #{index} - Выраженный дефицит массы тела" 
    when 16..18,5
      puts "Ваш индекс: #{index} - Недостаточная (дефицит) масса тела"
    when 18,5..25
      puts "Ваш индекс: #{index} - Норма"
    when 25..30
      puts "Ваш индекс: #{index} - Избыточная масса тела (предожирение)"
    when 30..35
      puts "Ваш индекс: #{index} - Ожирение 1 степени"
    when 35..40
      puts "Ваш индекс: #{index} - Ожирение 2 степени"
    else
      puts "Ваш индекс: #{index} - Ожирение 3 степени"
  end
end

puts "Введите ваш рост (в cм.):"
height = gets.to_f
puts "Введите ваш вес (в кг.):"
weight = gets.to_f

index = BMI(height, weight)

puts index_bmi_string(index)