import Data.Char (isUpper)
import Distribution.Types.Condition (cNot)

-- import Main (f1)

-- Create a higher-order function that takes 3 parameters: A function and the two parameters that that function takes, and
-- flips the order of the parameters.
-- For example this: `(/) 6 2` returns `3`. But this: `flip' (/) 6 2` returns `0.3333333333`

f1 f p1 p2 = f p2 p1

-- Create the `uncurry'` function that converts a curried function to a function on pairs. So this: `(+) 1 2` that returns `3` can be written as
-- `uncurry' (+) (1,2)` (with the two different arguments inside a pair).
unc f (a, b) = f a b

-- Create the `curry'` function that converts an uncurried function to a curried function. So this: `fst (1,2)` that returns `1` can be written as
-- `curry' fst 1 2` (with the tuple converted into two different arguments).
cur f (a, b) = f a b

-- Use higher-order functions, partial application, and point-free style to create a function that checks if a word has an uppercase letter.
-- Start with using just higher-order functions and build from there.

hasUp str = any isUpper str

hasUp2 :: (Foldable t) => t Char -> Bool
hasUp2 = any isUpper

-- Create the `count` function that takes a team ("Red", "Blue", or "Green") and returns the amount of votes the team has inside `votes`.

votes :: [String]
votes = ["Red", "Blue", "Green", "Blue", "Blue", "Red"]

count t votes = foldl f 0 votes
  where
    f b v = if v == t then b + 1 else b

-- Create a one-line function that filters `cars` by brand and then checks if there are any left.

cars :: [(String, Int)]
cars = [("Toyota", 0), ("Nissan", 3), ("Ford", 1)]

-- carFunc brand = amt > 0 where
carFunc brand = snd $ head $ filter (\tup -> ("Ford" == (fst tup))) cars
