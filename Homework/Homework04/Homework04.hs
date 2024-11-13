-- Question 1
-- Lets say you have the nested values defined bellow. How would you get the value of
-- 4 by using only pattern matching in a function?

nested :: [([Int], [Int])]
nested = [([1, 2], [3, 4]), ([5, 6], [7, 8])]

gv4 (a : tl) = ha a

ha (a, b) = hb b

hb (a : b : tl) = b

-- Question 2
-- Write a function that takes a list of elements of any type and, if the list has 3 or more elements, it
-- removes them. Else, it does nothing. Do it two times, one with multiple function definitions and one with
-- case expressions.
f2a l = if length l > 3 then [] else l

f2b [] = []
f2b l@(a : t) = l
f2b l@(a : b : t) = l

fb2 l = l

f2c l = case l of
  [] -> []
  l@(a : []) -> l
  l@(a : b : []) -> l
  l -> l

-- Question 3
-- Create a function that takes a 3-element tuple (all of type Integer) and adds them together
f3 (a, b, c) = a + b + c

-- Question 4
-- Implement a function that returns True if a list is empty and False otherwise.
f4 l = null l

-- Question 5
-- Write the implementation of the tail function using pattern matching. But, instead of failing if
-- the list is empty, return an empty list.

f5 [] = []
f5 l@(a : t) = t

-- Question 6
-- write a case expression wrapped in a function that takes an Int and adds one if it's even. Otherwise does nothing.
-- (Use the `even` function to check if the number is even.)
f6 i = case (even i) of
  True -> i + 1
  False -> i -- "does nothing"? Should we return i; should we error out? should we throw an exception?