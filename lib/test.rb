class Test

# конструктор, в котором создаем поля для вопросов и подсчета результатов
def initialize
  # массив вопросов, загружаем из файла questions.txt
  current_path = File.dirname(__FILE__)
  file_name = current_path + "/../data/questions.txt"

  if !File.exist?(file_name)
    abort "Невозможно загрузить вопросы теста!"
  end

  f = File.new(file_name, "r:UTF-8") # открываем файл
  @questions = f.readlines # читаем все строки в массив
  f.close # закрываем файл

  # поле, где будем хранить суммарное кол-во баллов за ответы
  @points = 0

  # указатель на текущий вопрос теста, увеличивается на 1 с каждым заданным вопросом
  @current_question = 0
end

# метод, которы задает пользователю очередной вопрос и спрашивает ответ
# если еще остались незаданные вопросы - метод должен вернуть false
# если задан последний вопрос теста – метод должен вернуть true

def next_question
  # вывели очередной вопрос из массива
  puts @questions[@current_question]

  user_input = nil

  until (user_input == 1 or user_input == 2)
    puts "введите число: 1 – да, 2 – нет, и нажмите Enter"
    user_input = gets.to_i
  end

  if (user_input == 1)
    @points += 1 # увеличиваем значение поля на 1 за ответ "да"
  end

  # увеличиваем счетчик заданных вопросов
  @current_question += 1

  # проверяем, если больше вопросов нет, возвращаем false, иначе - true
  if @current_question >= @questions.size
    return false
  else
    return true
  end
end

# метод возвращает значение поля @points – суммарные баллы набранные в тесте
def points
  return @points
end

end
