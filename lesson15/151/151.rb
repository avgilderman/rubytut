require_relative "lib/test"
require_relative "lib/result_printer"
path_to_question = "/data_questions/*.txt"
path_to_results = "/data_results/*.txt"

test = Test.new(path_to_question)
result_printer = ResultPrinter.new(path_to_results)

puts "Ваш уровень общительности. Тест поможет определить ваш уровень коммуникабельности.\n\n"

# Основной цикл программы. Конструкция until работает также, как и while, только пока условие НЕ выполнено.

until test.finished?
  test.next_question
end

# Вводим результаты теста
print result_printer.print_result(test)
