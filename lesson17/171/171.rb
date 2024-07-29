# frozen_string_literal: true

# класс для хранения объекта типа Праздник
class Holiday
  attr_accessor :day_month, :description

  def initialize(day_month, description)
    @day_month = day_month
    @description = description
  end
end

# Метод для чтения списка праздников из файла
def read_holidays(file_path)
  file = File.open(file_path, 'r:UTF-8')
  holidays_list = file.readlines(chomp: true)
  file.close
  holidays_list.map do |item|
    day_month, description = item.split(' - ')
    Holiday.new(day_month, description)
  end
end

# Метод, проверяющий, является ли сегодня праздничным днем. Возвращает совпавшую дату
def find_today_holiday(holidays, date)
  holidays.find { |holiday| holiday.day_month.include?(date) }
end

# Метод, проверяющий, является ли сегодня выходным днем (суббота или воскресенье)
def weekend?(week_day)
  week_day.zero? || week_day == 6
end

# Метод, говорящий нам праздник/выходной ли сегодня.
def check_holiday(holidays)
  time = Time.now
  date = time.strftime('%d.%m')
  week_day = time.wday

  holiday = find_today_holiday(holidays, date)

  if holiday
    puts "Сегодня выходной в честь праздника \"#{holiday.description}\"!"
  elsif weekend?(week_day)
    puts 'Сегодня выходной!'
  else
    puts 'Сегодня будний день, за работу!'
  end
end

# Чтение списка праздников из файла и создание объектов класса Holiday методом read_holidays
holidays = read_holidays('./data/holidays.txt')

# Вызов метода для проверки и вывода результата
check_holiday(holidays)
