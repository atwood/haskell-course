-- Question 1
-- Write a function called `repeat'` that takes a value and creates an infinite list with
-- the value provided as every element of the list.
--
-- >>> repeat 17
-- [17,17,17,17,17,17,17,17,17...

f1 v = v : (f1 v)

-- Question 2
-- Using the `repeat'` function and the `take` function we defined in the lesson (comes with Haskell),
-- create a function called `replicate'` that takes a number `n` and a value `x` and creates a list
-- of length `n` with `x` as the value of every element. (`n` has to be Integer.)
--
-- >>> replicate 0 True
-- []
-- >>> replicate (-1) True
-- []
-- >>> replicate 4 True
-- [True,True,True,True]

replic n v = take n (f1 v)

-- Question 3
-- Write a function called `concat'` that concatenates a list of lists.
--
-- >>> concat' [[1,2],[3],[4,5,6]]
-- [1,2,3,4,5,6]
{-
concat [] = []
concat ls@(l : []) = l
concat ls@(l : l2 : t) = concat (l ++ l2 : t)
-}

conc' ls = foldl (++) [] ls

-- Question 4
-- Write a function called `zip'` that takes two lists and returns a list of
-- corresponding pairs (zips them) like this:
--
-- >>> zip' [1, 2] ['a', 'b']
-- Variable not in scope:
--   zip' :: [a0_a1tcG[tau:1]] -> [Char] -> t_a1tcD[sk:1]
--
-- If one input list is shorter than the other, excess elements of the longer
-- list are discarded, even if one of the lists is infinite:
--
-- >>> zip' [1] ['a', 'b']
-- Variable not in scope:
--   zip' :: [a0_a1tfs[tau:1]] -> [Char] -> t_a1tfp[sk:1]
-- >>> zip' [1, 2] ['a']
-- Variable not in scope:
--   zip' :: [a0_a1tig[tau:1]] -> [Char] -> t_a1tid[sk:1]
-- >>> zip' [] [1..]
-- Variable not in scope:
--   zip' :: [a0_a1tl4[tau:1]] -> [a1_a1tl5[tau:1]] -> t_a1tl1[sk:1]
-- >>> zip' [1..] []
-- Variable not in scope:
--   zip' :: [a0_a1tnR[tau:1]] -> [a1_a1tnV[tau:1]] -> t_a1tnO[sk:1]

zip' [] l = []
zip' l [] = []
zip' l1 l2 = (head l1, head l2) : zip' (tail l1) (tail l2)

-- Question 5
-- Create a function called `zipWith'` that generalises `zip'` by zipping with a
-- function given as the first argument, instead of a tupling function.
--
-- > zipWith' (,) xs ys == zip' xs ys
-- > zipWith' f [x1,x2,x3..] [y1,y2,y3..] == [f x1 y1, f x2 y2, f x3 y3..]
--
-- For example, `zipWith' (+)` is applied to two lists to produce the list of
-- corresponding sums:
--
-- >>> zipWith (+) [1, 2, 3] [4, 5, 6]
-- [5,7,9]

zipW' f [] l = []
zipW' f l [] = []
zipW' f l1 l2 = (f (head l1) (head l2)) : zip' (tail l1) (tail l2)

-- Question 6
-- Write a function called `takeWhile'` that takes a precate and a list and
-- returns the list up until an element that doesn't satisfy the predicate.
--
-- >>> takeWhile (< 3) [1,2,3,4,1,2,3,4]
-- [1,2]
-- >>> takeWhile (< 9) [1,2,3]
-- [1,2,3]
-- >>> takeWhile (< 0) [1,2,3]
-- []

{-
takeW' pred lst = foldl filt [] lst
  where
    filt accum item = if pred item then accum ++ [item] else accum

-}
takeW' pred [] = []
takeW' pred (h : t) = if (pred h) then h : (takeW' pred t) else []

-- Question 7 (More difficult)
-- Write a function that takes in an integer n, calculates the factorial n! and
-- returns a string in the form of 1*2* ... *n = n! where n! is the actual result.

fact n
  | n < 0 = error "asdf"
  | n == 1 = 1
  | otherwise = n * (fact (n - 1))

factStr n = tail a ++ "=" ++ (show (fact n))
  where
    (a, b) = help ("", 1)
    help (s, v) = if v > n then (s, 0) else help (s ++ "*" ++ (show v), v + 1)

-- Question 8
-- Below you have defined some beer prices in bevogBeerPrices and your order list in
-- orderList + the deliveryCost. Write a function that takes in an order and calculates
-- the cost including delivery. Assume that the two lists have the beers in the same order.

bevogBeerPrices :: [(String, Double)]
bevogBeerPrices =
  [ ("Tak", 6.00),
    ("Kramah", 7.00),
    ("Ond", 8.50),
    ("Baja", 7.50)
  ]

orderList :: [(String, Double)]
orderList =
  [ ("Tak", 5),
    ("Kramah", 4),
    ("Ond", 7)
  ]

deliveryCost :: Double
deliveryCost = 8.50

cost order = deliveryCost + foldl help 0 order
  where
    help acc (item, quant) = quant * itemCost
      where
        itemCost =
          case (lookup item bevogBeerPrices) of
            Just p -> p
            Nothing -> error "afds"
