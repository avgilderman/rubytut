# frozen_string_literal: true

# Логика работы калькулятора (доработать обработку ошибки деления на 0)
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

# округление
def round(value)
  return format('%.2f', value) unless value.is_a?(Integer)

  value
end

# Проверяем валидность операции
def valid_operation?(value)
  operations = ['+', '-', '*', '/']
  operations.include?(value)
end

def input
  yield
  input
end

puts 'Введите первое число:' until input.is_a?(Numeric)

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
calc(operation, first_operand, second_operand)
puts
operation = nil
first_operand = nil
second_operand = nil
