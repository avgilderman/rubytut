token = []
count = 1
while count <= 8 do
  array = [*("A".."Z"),*("0".."9"),*("a".."z")].sample(1)
  token << array
  count += 1
end
puts token.join
