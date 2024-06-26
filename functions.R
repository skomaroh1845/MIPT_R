# 1 Максимум 3 чисел
let_max <- function(x, y, z){
  if(x <= y){
    if(y >= z){
      return(y)
    }else{
      return(z)
    }
  }else{
    if (x >= z){
      return(x)
    }else{
      return(z)
    }
  }
}
let_max(-2,1,3)

# 2 Cуммирования 4 чисел вектора с(8, 2, 5, 0). 

sum_vec <- function(y){
  sum <- 0
  for (value in y) {
    sum <- sum + value
  }
  return(sum)
}

sum_vec(c(8, 2, 5, 0))


# 3. Напишите функцию для перемножения всех чисел вектора. Обратите внимание, что длина вектора может быть любой.


mult_vec <- function(y){
  res <- 1
  for (value in y) {
    res <- res * value
  }
  return(res)
}
mult_vec(c(8, 2, 5, 1))

# 4. Напишите функцию для обращения строки. 
# Пример строки: «1234abcd»
# Ожидаемый результат: "dcba4321"

revers_str <- function(string) {
  splits <- strsplit(string, "")[[1]]
  reversed <- rev(splits)
  rev_string <- paste(reversed, collapse = "")
  return(rev_string)
}

print(revers_str("1234abcd"))


# 5. Напишите функцию для вычисления факториала числа (неотрицательное целое число). 
# Функция принимает число в качестве аргумента. 
factrorial_num <- function(num){
  res <- 1
  while(num > 0){
    res <- res * num
    num <- num - 1
  }  
  return(res)
}

factrorial_num(6)

# 6. Напишите функцию, чтобы проверить, находится ли число в заданном диапазоне. 
check_interval <- function(num, start, end){
  if((num >= start) && (num<= end)){
    return(T)
  }else{
    return(F)
  }
}
check_interval(-1,-3,2)

# 7. Напишите функцию, которая принимает строку и рассчитывает количество букв верхнего и нижнего регистра. 
# Выведите элементы функции.
# Пример строки: «Быстрая Лиса-58»
# Ожидаемый результат:
# Количество букв в верхнем регистре: 2
# Количество строчных букв: 9

check_upper_lower <- function(s) {
  upper <- grepl("[[:upper:]]", strsplit(s, "")[[1]])
  lower <- grepl("[[:lower:]]", strsplit(s, "")[[1]])
  
  upper <- length(which(unlist(upper)))
  lower <- length(which(unlist(lower)))
  
  print(paste('Количество букв в верхнем регистре:', upper))
  print(paste('Количество строчных букв:', lower))
}
check_upper_lower('Быстрая Лиса-58')


# 8. Напишите функцию, которая берет вектор и возвращает новый вектор с уникальными элементами из исходного. 
# Входящий вектор: (1,2,3,3,3,3,4,5)
# Ожидаемый результат: (1, 2, 3, 4, 5)

return_set <- function(vec){
  return(vec[!duplicated(vec)])
}
return_set(c(1,2,3,3,3,3,4,5))


# 9. Напишите функцию для печати четных чисел из заданного вектора. 
# Входящий вектор: (1, 2, 3, 4, 5, 6, 7, 8, 9)
# Ожидаемый результат: (2, 4, 6, 8)
return_chet <- function(vec){
  return( vec[ vec %% 2 == 0 ] )
}
return_chet(c(1, 2, 3, 4, 5, 6, 7, 8, 9))


# 10. Напишите функцию, которая проверяет, является ли переданная строка палиндромом или нет.
# Примечание. Палиндром - это слово, фраза или последовательность, которые читаются так же, как и вперёд, например, топот.

palindrom_check <- function(line){
  line_reversed <- revers_str(line)
  if(line == line_reversed){
    return(T)
  }else{
    return(F)
  }
}
palindrom_check('топоp')
palindrom_check('топот')

# 11. Напишите функцию, чтобы проверить, является ли строка панграммой или нет. 
# Примечание. Панграммы - это слова или предложения, содержащие каждую букву алфавита хотя бы один раз. Например: «The quick brown fox jumps over the lazy dog»
pangram <- function(line){
  
  line <- paste0(strsplit(tolower(line), " ")[[1]], collapse = '')
  line <- strsplit(line, "")[[1]]
  line <- return_set(line)
  
  return(all(letters %in% line))
}
pangram('The quick brown fox jumps over the lazy dog')
pangram('The quick brown fox jumps over the lazy')


#12. Напишите функцию, которая принимает в качестве входных данных последовательность слов, разделенных дефисами, и печатает слова в последовательности, разделенной дефисами, после сортировки по алфавиту. 
# Образцы элементов: green-red-yellow-black
# Ожидаемый результат: black-green-red-yellow

sort_split <- function(line){
  line <- strsplit(line, '-')[[1]]
  sorted <- sort(line)
  return(paste0(sorted, collapse = '-'))  
}

sort_split('green-red-yellow-black')

# 13. Напишите функцию, чтобы создать список(list), 
# значения которого представляют собой квадрат чисел от 1 до 30 (оба включены). 

squared <- function(start = 1, end = 30){
  return(list( c(start:end)^2 ))
}

squared()
