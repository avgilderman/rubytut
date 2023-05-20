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
    array = []
    
    if !@street.to_s.empty?
      array << "Улица #{@street}"
    end
    
    if !@house.to_s.empty?
      array << @house
    end
    
    if !@flat.to_s.empty?
      array << "квартира #{@flat}"
    end
    
    if !@city.to_s.empty?
      array << "гор. #{@city}"
    end
    
    if !@area.to_s.empty?
      array << "#{@area} район"
    end
    
    if !@district.to_s.empty?
      array << "#{@district} обл."
    end

    return array.join(", ")
  end
end

address_1 = Address.new("Московская", nil, "Орехово-Зуево", "Первый колхозный проезд", 
  "Дом", "3")
address_2 = Address.new("Московская область", "Орехово-Зуевский район", "Орехово-Зуево", "Гагарина", "23А", "12")

puts "Первый адрес: #{address_1.full_address}"
puts
puts "Второй адрес: #{address_2.full_address}"
