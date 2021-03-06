{-# OPTIONS_GHC -fwarn-incomplete-patterns #-}      -- cover all cases!
{-# OPTIONS_GHC -fwarn-unused-matches #-}           -- use all your pattern matches!
{-# OPTIONS_GHC -fwarn-missing-signatures #-}       -- write all your toplevel signatures!
{-# OPTIONS_GHC -fwarn-name-shadowing #-}           -- use different names!
{-# OPTIONS_GHC -fwarn-incomplete-uni-patterns #-}  -- no incomplete patterns in lambdas!

-- TODO: ghci + text editor

-- В контраст със Scheme, Haskell е:
-- 0) Статично типизиран
-- 1) С мързеливо оценяване (TODO: примери)
-- 2) Чист (без странични ефекти)

-- * Няма имплицитно кастване (силно типизиран)
-- * Зависим от идентация (+ не харесва табулации)


-- Типове:
-- Bool - булев тип с константи True и False.
-- Char - Unicode символи.
-- Int - целочислен тип.
-- Integer - целочислен тип с неограничен размер.
-- Float - десетични числа с единична точност.
-- Double - десетични числа с двойна точност.

-- Съставни типове:
-- [a] - тип списък с произволна дължина и елементи от фиксиран тип a.
-- String = [Char] - низ (списък от символи).
-- (a,b,c) - тип кортеж (tuple) с фиксирана дължина и
--           произволни типове на компонентите.

-- * Типовете (и техните конструктори) винаги започват с главна буква


-- Променливи:

-- Типова декларации на
-- name :: type

-- Дефиниция
-- name = expression

num :: Int
num = 5

-- Често Haskell сам се сеща за типовата декларация.
-- Но е по-добре да я пишем експлицитно.


-- Функции (на 1 аргумент)

-- Типова декларации
-- name :: t1 -> t2
-- функция, която взима аргумент от тип t1
-- и връща резултат от тип t2

-- Дефиниция
-- name arg = expression
-- първия аргумент се свързва с името arg
-- и може да се използва в expression


-- * Имената на идентификаторите винаги започват с малка буква или "_".
-- Не могат да съдържат и "-", така че ще се придържаме към camel case

-- Можем и да имаме по-общи декларации (полиморфични)
-- Например функцията id
-- id :: a -> a
-- Тя взима нещо от тип a (а е само име) и връща нещо от същия тип
-- TODO: примери

-- Операциите в Haskell се прилагат инфиксно. Пример: 1 + 2 * 3
-- също така си имат съответните приоритети
succ' :: Int -> Int
succ' n = n + 1
-- тук ' не е запазен символ

-- А функции на повече аргументи?
-- name :: t1 -> ... -> tn -- функция, която взима n-1 аргумента от съответните типове
-- t1 ... tn-1 и връща резултат от тип tn


mult :: Int -> (Int -> Int)
mult a b = a * b

-- Прилагане на функции:
-- f x1 x2 .. xn, където f е идентификатора на функцията, x1 .. xn са аргументи
-- <space> e разделител, няма скоби.
-- Пример: mult 2 3

-- Прилагането на функция в Haskell е с най-висок приоритет пред други операции.

-- mult 2 3 + 7  -- 13
-- mult 2 (3 + 7)  -- 20

-- mult 2 succ 3  -- Грешка
-- mult бърза да се изпълни и като втори аргумент не вижда резултата от succ 3,
-- а функцията succ

-- Вече споменах как операциите се прилагат инфиксно.
-- можем всяка функция на 2 аргумента да я приложим като бинарна операция (инфиксно).
-- Пример: 2 `mult` 3

-- от друга страна всеки оператор можем да го използваме като функция:
-- (+) 2 3


-- Всъщност ви излъгах, в Haskell има само функции на 1 аргумент
-- Нека разгледаме типа на следната функци
-- plus :: Int -> Int -> Int
-- Типа на plus би изглеждал по-скоро така:
-- plus :: Int -> (Int -> Int)
-- Приема число и връща функция на 2 аргумента: ((plus 1) 2)
-- Тоест функциите на повече аргументи са функции от по-висок ред.
-- (->) е дясно асоциативна операция
-- Заради начина по който се прилагат функциите в Haskell
-- няма нужда от грозни скоби, пишем просто:
-- plus 1 2
-- TODO: примери
-- TODO: частично прилагане, currying

-- if <cond> then <expr> else <expr>
-- Сравняваме неща с (==)

-- ламбда функции
-- (\arg1 ... argn -> expr)
-- Пример:
-- square = (\ x -> x * x)
-- разглеждане на случаи - guards
fib :: Int -> Int
fib n
  | n == 0 = 0
  | n == 1 = 1
  | otherwise = fib (n - 1) + fib (n - 2)

-- [1,2,3] - списък

-- TODO: Полезни ресурси, т.е. вижте практикума

-- Имплементирайте следните функции на Haskell.
-- Като пишете и типови декларации.

-- * Решете задачите със списъци без рекурсия,
-- само с готови конструкции за работа със списъци

-- модул от n
abs' = undefined

-- най-голям общ делител на n и m
-- използвайте div за целочислено делене
gcd' = undefined

-- най-малко общо кратно
lcd' = undefined

-- прилага дадена (едноаргументна) функция над даден аргумент
apply = undefined

-- за дадени две функции връща композицията им
compose = undefined

-- проверява дали първия списък е префикс на втория
-- Списъците са само от числа
prefix = undefined

-- проверява дали първия списък е суфикс на втория
-- Списъците са само от числа
suffix = undefined

-- по дадени списък xs, предикат p и функция f
-- връща списък от елементите на xs, за които е изпълнен предиката p,
-- като над тези елементи е приложена функцията f.
weakListComprehension = undefined

-- по даден списък xs и функция f
-- връща списък от тези елементи x на xs, за които f(x) е от xs
closed = undefined

-- По даден списък от двойки (интервали) (a,b), връща списък
-- от всички подинтервали на най-дългият интервал
longestIntervalSubset = undefined

