-- Question 1
-- Add the type signatures for the functions below and then remove the comments and try to compile.
-- (Use the types presented in the lecture.)
f1 :: (Floating a) => a -> a -> a -> a
f1 x y z = x ** (y / z)

f2 :: (Floating a) => a -> a -> a -> a
f2 x y z = sqrt (x / y - z)

f3 :: Bool -> Bool -> [Bool]
f3 x y = [x == True] ++ [y]

f4 :: (Eq a) => [a] -> [a] -> [a] -> Bool
f4 x y z = x == (y ++ z)

-- Question 2
-- Why should we define type signatures of functions? How can they help you? How can they help others?
{-
type signatures can serve as design guidelines, both for sketching out our ideas in writing code,
and for understanding code
-}
-- Question 3
-- Why should you define type signatures for variables? How can they help you?
{-
Adding a type signature for a variable helps us understand the variable, how it's used, and helps prevent us from misusing it
-}
-- Question 4
-- Are there any functions in Haskell that let you transform one type to the other? Try googling for the answer.
{-
Yes!  In a sense, every function in haskell does this, but sometimes the resulting value may just happen to be of the same type as the input(s)
-}
-- Question 5
-- Can you also define in Haskell list of lists? Did we showed any example of that? How would you access the inner
-- most elements?
{-
Yes, access it by either pattern matching on it, or using some of the list accessor functions
-}
