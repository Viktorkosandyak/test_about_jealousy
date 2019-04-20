
# класс, выводящий результаты теста, читая их из файла

class TestResult

  def initialize
    # массив результатов, загружаем из файла results.txt
    current_path = File.dirname(__FILE__)
    file_name = current_path + "/../data/results.txt"

    if !File.exist?(file_name)
      abort "Невозможно загрузить результаты теста!"
    end

    f = File.new(file_name, "r:UTF-8") # открываем файл
    @results = f.readlines # читаем все строки в массив
    f.close # закрываем файл
  end

  # метод, выводящий на экран результаты теста
  # в качестве параметра в метод должен передаваться объект класса Test
  def result_test(test)
    # выводим ответы на тест в зависимости от результатов ответов
    puts "\n\nРезультат теста (всего баллов - #{test.points}):"

    # логика вывода результатов в зависимости от баллов
    if (test.points >= 10)
      puts @results[0]
    elsif (test.points >= 5)
      puts @results[1]
    else
      puts @results[2]
    end
  end

end
