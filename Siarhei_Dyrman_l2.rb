#!/usr/local/rvm/rubies/ruby-2.3.0/bin/ruby
#1.скрипт, который выводит последовательность чисел Фибонначи:
arg = ARGV[0].to_i
i = 0
c = []
a = 0
b = 1
while i <= arg
  i += 1
  c[i]=a
  a,b = b,a+b
end
p c.compact
=begin
2.Создать переменную для строки "dniMyMdegnahCybuR" . Написать однострочную инструкцию, которая поменяет порядок
букв на противоположный и понизит все буквы в регистре кроме первой. Вывести результат. Значение переменной должно
быть изменено.
=end
stroka_ = "dniMyMdegnahCybuR"
stroka_.reverse!.downcase!.capitalize!
puts stroka_
#3.Дано семизначное число. Вывести на экран число, где первая цифра стала последней, вторая - предпоследней и тд.
chislo7 = 1234567
puts chislo7.to_s.reverse.to_i
#4.Дано целое число. Найти и вывести сумму его цифр.
celoe_chislo = 123456789
array = celoe_chislo.to_s.chars
puts array.inject(0){ |result, elem| result + elem.to_i }
#5.Дана строка. Необходимо подсчитать количество букв "а" в этой строке (независимо от регистра)
stroka_new = 'Asdaasdsdscasd'
puts stroka_new.downcase.count('a')
#6.Дана строка. Проверить, является ли она палиндромом
stroka_polindrom = 'texttxet'
puts stroka_polindrom == stroka_polindrom.reverse
#7.Вывести на экран числа от 10 до 3 не влючая 5, причём числа, кратные 3м, вывести в квадрате
#p p(3..10).to_a.each{ |e| e**2 div(3) && e != 5 }
#8.Ответить на вопрос: если ли в магазине какой-либо продукт с ценой в 15?
shop = {
    milk: 10,
    bread: 8,
    cornflakes: 12,
    ice_cream: 15,
    pie: 20
}
puts shop.value?(15)
#9.Прибавить 100 к его максимальному элементу:
ar = [1, 6,1,8,2,-1,3,5]
ar[ar.index(ar.max)] = ar.max + 100
p ar
#10.Вывести отсортированный по убыванию массив из уникальных элементов начального массива:
ar = [7, 3, [4, 5, 1], 1, 9, [2, 8, 1]]
p ar.flatten!.uniq!.sort.reverse

