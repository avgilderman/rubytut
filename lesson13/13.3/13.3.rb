require 'date'

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

class Patient
  def initialize(name, patronymic_name, family_name, date_of_birth, address)
    @name = name
    @patronymic_name = patronymic_name
    @family_name = family_name
    @date_of_birth = Date.parse(date_of_birth)
    @address = address
  end

  def name
    return @name
  end

  def full_name
    return "#{@family_name} #{@name[0]}.#{@patronymic_name[0]}."
  end

  def age
    today = Date.today
    result = today.year - @date_of_birth.year - 1

    if (today.month > @date_of_birth.month) ||
      (today.month == @date_of_birth.month &&
       today.day >= @date_of_birth.day)
      result += 1
    end

    return result
  end

  def adult?
    return age >= 18
  end

  def address
    return @address
  end

end

address_vadik_misha = Address.new("Московская", nil, "Орехово-Зуево", "Первый колхозный проезд", "Дом", "3")
address_eremey = Address.new("Московская область", "Орехово-Зуевский район", "Орехово-Зуево", "Гагарина", "23А", "12")
vadik = Patient.new("Вадим", "Аркадьевич", "Венедиктов", "14.09.1984", address_vadik_misha)
misha = Patient.new("Михаил", "Анатольевич", "Бутлицкий", "22.12.1982", address_vadik_misha)
eremey =Patient.new("Еремей", "Комерсантович", "Агафонов", "13.09.2017", address_eremey) 

puts "Пациент 1:"
puts "ФИО: #{vadik.full_name}"
puts "Сколько лет: #{vadik.age}"
puts "Совершеннолетний: #{vadik.adult?}"
puts "Адрес: #{vadik.address.full_address}"
puts
puts "Пациент 2:"
puts "ФИО: #{misha.full_name}"
puts "Сколько лет: #{misha.age}"
puts "Совершеннолетний: #{misha.adult?}"
puts "Адрес: #{misha.address.full_address}"
puts
puts "Пациент 3:"
puts "ФИО: #{eremey.full_name}"
puts "Сколько лет: #{eremey.age}"
puts "Совершеннолетний: #{eremey.adult?}"
puts "Адрес: #{eremey.address.full_address}"
