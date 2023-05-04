require 'open-uri'
require 'json'

def random_cat_fact
  data = URI.open("https://catfact.ninja/fact").read
  json = JSON.parse(data)

  return json["fact"]
end

puts "Сколько фактов о котах Вам выдать?"
number_of_facts = gets.to_i

i = 0

while i < number_of_facts do
  i += 1
  puts "#{i} факт: #{random_cat_fact.to_s}"
  puts
end
