class Address
  def initialize(district, area, city, street, house, flat)
    @district = district
    @area = area
    @city = city
    @street = street
    @house = house
    @flat = flat
  end

  def full_address
    return "#{@district} #{@area} #{@city} #{@street} #{@house} #{@flat}"
  end

end

address_1 = Address.new("Московская область", "Орехово-Зуевский район", 
  "Орехово-Зуево", "Первый колхозный проезд", "Дом", "3")
address_2 = Address.new("Московская область", "Орехово-Зуевский район", 
  "Орехово-Зуево", "Гагарина", "23А", "12")

puts "1 адрес #{address_1.full_address}"
puts
puts "2 адрес #{address_2.full_address}"
