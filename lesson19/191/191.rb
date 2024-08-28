# frozen_string_literal: true

# Логика работы калькулятора
def calc(operation, first_operand, second_operand)
  case operation
  when '+'
    first_operand + second_operand
  when '-'
    first_operand - second_operand
  when '*'
    first_operand * second_operand
  when '/'
    first_operand / second_operand
  end
end

# округление(если необходимо)
def round(value)
  return format('%.2f', value) unless value.is_a?(Integer)

  value
end

# Проверяем валидность операции
def valid_operation?(value)
  operations = ['+', '-', '*', '/']
  operations.include?(value)
end

# обьявляем переменные
operation = nil
first_operand = nil
second_operand = nil

# ввод первого числа с проверкой на то что бы было введено именно число
until first_operand.is_a?(Numeric)
  puts 'Введите первое число:'
  first_operand = $stdin.gets.chomp.to_f
end

# проверка предложенной пользователем операции на валидность
until valid_operation?(operation)
  puts 'Выберите операцию: (+ - * /)'
  operation = $stdin.gets.chomp
end

# ввод второго числа с проверкой на то что бы было введено именно число
until second_operand.is_a?(Numeric)
  puts 'Введите второе число:'
  second_operand = $stdin.gets.chomp.to_f
end

# запустить метод calc с заранее подставленными данными из переменных
puts calc(operation, first_operand, second_operand)
