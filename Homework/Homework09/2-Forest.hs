import Distribution.Utils.Generic (fstOf3)

{-

\**************************** IMPORTANT ****************************

Solve this homework after completing and checking the "Maze" one.

\*******************************************************************

We're going to build on top of the "Maze" challenge by coding a similar
but a bit more complicated game.

It works the same as the "Maze" game, with the difference that the player
is now in a forest. Because we're in a forest, there are no walls. And,
if you walk long enough, you're guaranteed to find the exit.

So, what's the challenge in playing this game? The challenge lies in that
now we have "stamina." Stamina is a number (we start with 10). And, each
time the player makes a move, its stamina gets reduced by the amount of work
needed to cross the current trail (represented by a number contained in the
value constructor).

The data types and functions are pretty much the same, with a few caveats:

- We don't have walls.
- We don't want to choose a specific numeric type, but we want to make sure
we can do basic numeric operations regardless of the type we pass to the functions.
- Because now we have to keep track of the player's stamina, we'll need to
move it around with our current forest. This would be an awesome use case
for monads, but because we don't know how to use them yet, a "(stamina, forest)"
pair will have to do.

Using GHCi, like the "Maze" game, this game should look like this:

\*Main> solveForest testForest []
"You have 10 stamina, and you're still inside the Forest. Choose a path, brave adventurer: GoLeft, GoRight, or GoForward."
\*Main> solveForest testForest [GoForward ]
"You have 7 stamina, and you're still inside the Forest. Choose a path, brave adventurer: GoLeft, GoRight, or GoForward."
\*Main> solveForest testForest [GoForward, GoForward]
"You have 4 stamina, and you're still inside the Forest. Choose a path, brave adventurer: GoLeft, GoRight, or GoForward."
\*Main> solveForest testForest [GoForward, GoForward, GoLeft  ]
"You ran out of stamina and died -.-!"
\*Main> solveForest testForest [GoForward, GoLeft , GoRight]
"YOU'VE FOUND THE EXIT!!"
-}
data Move = GoLeft | GoForward | GoRight deriving (Eq, Show)

data Maze = Exit | Clearing Int Maze Maze Maze deriving (Eq, Show)

testForest = Clearing 2 f1 f2 f3

f1 = Clearing 2 f1 f1 f1

f2 = Clearing 2 f1 f1 f3

f3 = Exit

-- solveMaze mz lstMvs =
-- solveTestMaze
--  move (move (move (move testMaze GoForward) GoRight) GoForward) GoLeft

moves1 = [GoForward, GoRight, GoForward, GoLeft]

-- solveMaze testMaze moves1
-- q4
solveMaze (st, mz) lstMvs = foldl move (st, mz) lstMvs

-- q5

-- showCurrentChoice Wall = "hit a wall"
showCurrentChoice Exit = "Success! Found an Exit"
showCurrentChoice (Clearing st l f r) = "choose next move"

-- q6
play (st, mz) = do
  print "Play the Forest game"
  play2 (st, mz)

play2 (st, mz) = do
  if st == 0
    then do
      print "Sorry, out of stamina."
      return ()
    else do
      print $ "You have " ++ (show st) ++ " stamina.\n"
      print "Enter your move: GoLeft, GoForward, or GoRight"
      s <- getLine
      m <- return $ s2m s
      let (st2, mz2) = move (st, mz) m
      print $ showCurrentChoice mz2
      if mz2 == Exit
        then return ()
        else play2 (st2, mz2)

s2m "GoLeft" = GoLeft
s2m "GoForward" = GoForward
s2m "GoRight" = GoRight
s2m _ = error "Invalid input"

move (st, Exit) mv = (st, Exit)
move (st, mz@(Clearing n l f r)) GoLeft = (st - n, l)
move (st, mz@(Clearing n l f r)) GoForward = (st - n, f)
move (st, mz@(Clearing n l f r)) GoRight = (st - n, r)
