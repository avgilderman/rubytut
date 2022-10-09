temp_now = ARGV[0]

if temp_now == nil
  puts "Какая сейчас температура?"
  temp_now = STDIN.gets.chomp.to_i
else
  temp_now = temp_now.to_i
end

season = ARGV[1]

if season == nil
  puts "Какое время года? (0 - весна, 1 - лето, 2 - осень, 3 - зима)"
  season == STDIN.gets.chomp.to_i
else
  season = season.to_i
end

if season == 1вы, даже летом для соловьев сейчас неподходящие условия"
  if temp_now >= 15 && temp_now <= 35
    puts "Скорее идите в парк, соловьи поют!"
  else
    puts "Увы, даже летом для соловьев сейчас неподходящие условия"
  end
else
  if temp_now >= 22 && temp_now <= 30
    puts "Скорее идите в парк, соловьи поют!"
  else
    puts "Сейчас соловьи молчат, греются или прохлаждаются :)"
  end
end
