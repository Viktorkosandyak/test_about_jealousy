require_relative './lib/test.rb'
require_relative './lib/test_result.rb'

puts "Тест на ревнивость\n\n"

#  создаем объекты
test = Test.new
test_result = TestResult.new

# основной цикл программы
while test.next_question == true do
end


# Выводим результат
test_result.result_test(test)
