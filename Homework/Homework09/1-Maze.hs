{-

\**************************** IMPORTANT ****************************

This week is a two-step homework. First, you have to solve the
"Maze" challenge, and then the "Forest" challenge. The challenges
are in two separate files in both the homework and solution, so
you can check the solution for the first "Maze" challenge without
spoilers of the "Forest" one. Make sure to check the solution for
"Maze" (and only "Maze," I see you 🥸👀) before starting with the
"Forest" challenge!

\*******************************************************************

Today, you'll build the simplest and most basic game imaginable.
It'll be a maze game where the player has to write a list of moves, and the game will perform them
and tell the player where it ends up. Then, the player can change the moves and check again until it
finds the exit.

To play the game, the player will open GHCi, load this file, and run a "solveMaze" function that
takes a maze and a list of moves and returns a String with the resulting state.

It should look like this:

\*Main> solveMaze testMaze []
"You're still inside the maze. Choose a path, brave adventurer: GoLeft, GoRight, or GoForward."
\*Main> solveMaze testMaze [GoLeft]
"You've hit a wall!"
\*Main> solveMaze testMaze [GoForward]
"You're still inside the maze. Choose a path, brave adventurer: GoLeft, GoRight, or GoForward."
\*Main> solveMaze testMaze [GoForward, GoRight]
"You've hit a wall!"
\*Main> solveMaze testMaze [GoForward, GoLeft]
"YOU'VE FOUND THE EXIT!!"

How are you going to achieve this? You can try it on your own, but here you have a
step-by-step just in case:

1. Write two data types. One for the moves (Move) you can make, and another for the maze (Maze).
(Use the example above to figure them out.)

2. Write a function called "move" that takes a maze and a move and returns the maze after the move.

3. Write a "testMaze" value of type "Maze" and test the "move" function in GHCi.

4. Write the "solveMaze" function that will take a maze and a list of moves and returns the maze
after making those moves.

5. If you test the "solveMaze" function, you'll see that each time you try to solve the maze,
it'll print the whole maze for the player to see. To avoid that, write a "showCurrentChoice" function
that takes a maze and returns a different string depending on if you hit a wall, found the exit, or
still need to make another choice.

6. Adapt adapt "solveMaze" function to use "showCurrentChoice" and play with your new game using GHCi! :D
-}

-- q1
data Move = GoLeft | GoRight | GoForward

data Maze = Exit | Wall | Hall Maze Maze Maze deriving (Read, Show, Eq)

-- q2
move Exit mv = Exit
move Wall mv = Wall
move mz@(Hall l f r) GoLeft = l
move mz@(Hall l f r) GoForward = f
move mz@(Hall l f r) GoRight = r

-- q3

testMaze = Hall Wall (Hall Wall Wall t2) Wall
  where
    t2 = Hall Wall t3 Wall
    t3 = Hall t4 Wall Wall
    t4 = Exit

-- solveTestMaze
--  move (move (move (move testMaze GoForward) GoRight) GoForward) GoLeft

moves1 = [GoForward, GoRight, GoForward, GoLeft]

-- solveMaze testMaze moves1
-- q4
solveMaze mz lstMvs = foldl move mz lstMvs

-- q5

showCurrentChoice Wall = "hit a wall"
showCurrentChoice Exit = "Success! Found an Exit"
showCurrentChoice (Hall l f r) = "choose next move"

-- q6
play mz = do
  print "Play the maze game"
  print "Enter your move: GoLeft, GoForward, or GoRight"
  s <- getLine
  m <- return $ s2m s
  let mz2 = move mz m
  print $ showCurrentChoice mz2
  play mz2

s2m "GoLeft" = GoLeft
s2m "GoForward" = GoForward
s2m "GoRight" = GoRight
s2m _ = error "Invalid input"
