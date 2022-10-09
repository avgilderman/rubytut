def generate_password
   chars = ("a".."z").to_a + ("0".."9").to_a
   puts chars
   Array.new(6, '').collect{chars[rand(chars.size)]}.join
 end

puts generate_password
