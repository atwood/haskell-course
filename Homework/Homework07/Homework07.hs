-- Question 1
-- Investigate the `Bounded` type class. What behaviours it provides?
{-
this type class requires methods minBound and Maxbound. This describes many common datatypes such as a byte,
  which can only hold 0 to 255, or unit16, which can only hold 0 to (2^16 - 1)
-}

-- Question 2
-- The types Int and Word bellong to the same type classes. What is the difference
-- between them? Check maybe the maxBound and minBound parameter for both types.
{-
Hmm, on my machine,
ghci> maxBound::Int
9223372036854775807
ghci> maxBound::Word
18446744073709551615

I notice that the Word value is twice the Int value, so Int is signed? Is that what's going on?

-}

-- Question 3
-- Investigate the `Enum` type class. What behaviours provides?
{-
successor, predecessor
MINimal: toEnum, fromEnum

this class allows the creation of Enumerated values, such as to iterate over
-}

-- Question 4
-- Add the most general type signatures possible to the functions below.
-- Then uncomment the functions and try to compile.

f1 :: (Show a, Fractional a) => a -> a -> [Char] -> [Char]
f1 x y z = show (x / y) ++ z

f2 :: (Eq a, Bounded a, Enum a) => a -> a
f2 x = if x == maxBound then minBound else succ x

-- Question 5
-- Investigate the numeric type classes to figure out which behaviors they provide to change between numeric types.
{-
fromIntgral,
-}