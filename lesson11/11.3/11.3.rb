def rand_method(word)
array = word.chars
rand_array = array.shuffle
return rand_array
end 

puts "введите слово"
user_word = $stdin.gets.chomp
shuffle_word = rand_method(user_word)

rand_string = ''
for item in shuffle_word do
    rand_string << item
end

puts rand_string
