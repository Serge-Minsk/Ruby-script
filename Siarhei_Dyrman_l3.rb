#!/usr/local/rvm/rubies/ruby-2.3.0/bin/ruby

=begin
1.написать метод, который принимает аргументом объект типа Proc и возвращает время затраченное на выполнение
данного прока (примитивный бенчмаркинг).
Текущее время можно узнать с помощью Time.now
=end

def time_nw(pr)
  t_start = Time.now
  pr.call
  t_end = Time.now
  result = (t_end - t_start).round(7)
  print 'Program time ', result, " seconds\n"
end
puts '<<<Starting benchmark>>>'
pr = proc {sleep 3}
time_nw(pr)

=begin
2. Дан массив: array = [1, 2, 3, 4]
Написать метод mega_sum , который поддерживает следующее использование:
mega_sum(array) # => 10 # простая сумма элементов
mega_sum(array, 10) # => 20 # сумма всёх элементов + переданное значение
mega_sum(array) { |i| i ** 2} => 30 # сумма элементов с применённым блоком
mega_sum(array, 10) { |i| i ** 2} => 40 # сумма элементов с применённым блоком + переданное значение Это всё один метод!
=end

array = [1, 2, 3, 4]
def mega_sum(array, a = 0)
  summa = 0
  array.map!{ |e| yield(e) } if block_given?
  array.each{ |i| summa += i }
  p summa + a
end
mega_sum(array)
mega_sum(array, 10)
#mega_sum(array) { |i| i ** 2}
mega_sum(array, 10) { |i| i ** 2}

=begin
3. В диапазоне от 1 до 1_000, найти первое трёхзначное число у которого остаток деления на 7 равен 3
=end

arr1000 = (1..1000).to_a
p arr1000.any?{ |j| j >= 100 && j % 7 == 3 }
arr1000.each do |j|
  if j >= 100 && j % 7 == 3
    print "This number is #{j} \n"
    break
  end
end

=begin
4.Написать метод, с двумя именнованными аргументами, а всеми остальными - не-обязательными (не ограничено
количеством). Если за методом следует блок, то вызвать его на каждом из не обязательных аргументов, если же блок не
следует вывести ‘ERROR”
Пример:
method_name(...) # => "ERROR"
method_name(..., 1, 2, 3) {|i| puts i}
1
2
3
=> nil
=end

def my_method(*args, length: 33, char: "0")
  if block_given?
    if args.size > 0
      args.each {|m| yield(m)}
    else
      puts "ERROR"
    end
  else
    puts "ERROR"
  end
end
my_method()
my_method(1,2,3){|i| puts i}

=begin
5.Апгрейд стандартной библиотеки. Мы напишем метод, который будет возвращать все чётные числа, соответсвующие
переданному в блок условию:
Чтобы это работало, делаем так:
class Array
def ваш_метод
< code >
end
end
puts [1, 2, 3, 4, 5, 6, 7].ваш_метод { |i| i > 2}.inspect # => [4, 6]
puts [1, 2, 3, 4, 5, 6, 7].ваш_метод { |i| i > 10}.inspect # => nil
puts [2, 4, 6, 8, 10, 12, 7].ваш_метод {|i| i.between?(6, 12)}.inspect # => [6, 8, 10, 12]
=end

class Array
  def array_check
    my_arr = []
    self.each do |v|
      if block_given? && v.even? && yield(v)
        my_arr << v
      end
    end
    if my_arr.size > 0
      my_arr
    else
      nil
    end
  end
end
puts [1, 2, 3, 4, 5, 6, 7].array_check { |i| i > 2}.inspect
puts [1, 2, 3, 4, 5, 6, 7].array_check { |i| i > 10}.inspect
puts [2, 4, 6, 8, 10, 12, 7].array_check {|i| i.between?(6, 12)}.inspect