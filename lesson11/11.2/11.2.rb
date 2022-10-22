 def initialize(firstname, middlename)
    return "#{firstname[0]}.#{middlename[0]}."
 end


 puts "Введите фамилию:"
 l_name = $stdin.gets.chomp.to_s
 puts "Введите имя:"
 f_name = $stdin.gets.chomp.to_s
 puts "Введите отчество:"
 m_name = $stdin.gets.chomp.to_s

puts "Ваше ФИО сокращенно: #{l_name} #{initialize(f_name, m_name)}"