# Подключаем библиотеку для работы с классом Date
require 'date'

# Наш класс Пациент
class Patient
  # Конструктор — принимает на вход все данные и "раскладывает" их по полочкам:
  # соответствующим переменным экземпляра с @.
  def initialize(name, patronymic_name, family_name, date_of_birth)
    @name = name
    @patronymic_name = patronymic_name
    @family_name = family_name
    @date_of_birth = Date.parse(date_of_birth)
  end

  # Метод name — геттер, который возвращает содержимое переменной экземпляра
  def name
    return @name
  end

  # Метод full_name — вычисляемое значение, возвращает строку, содержащую
  # фамилию и инициалы
  #
  # Венедиктов В.А.
  def full_name
    return "#{@family_name} #{@name[0]}.#{@patronymic_name[0]}."
  end

  # Метод age — возвращает количество полных лет пациента
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

  # Методы adult? — возвращает true, если пациент совершеннолетний или
  # false, если нет
  def adult?
    return age >= 18
  end
end

# ---

# Создаем экземпляр класса Patient и передаем ему все необходимые параметры: имя,
# отчество, фамилию и дату рождения
vadik = Patient.new("Вадим", "Аркадьевич",
  "Венедиктов", "14.09.1984")

# Выводим всю информацию о пациенте, вызывая соответствующие методы у экземпляра
# класса Patient
puts "Пациент 1:"
puts vadik.full_name
puts "Возраст: #{vadik.age}"
puts "Совершеннолетний: #{vadik.adult?}"
puts
