{-
-- Question 1 --
Continuing with the logistics software of the lesson:
 1. After using the `Container` type class for a while, you realize that it might need a few adjustments:
  	- First, write down the `Container` type class and its instances, same as we did in the lesson
  	  (try to do it without looking and check at the end or if you get stuck).
  	- Then, add a function called `unwrap` that gives you back the value inside a container.
 2. Create an instance for the `MailedBox` data type.
 	- The MailedBox data type represents a box sent through the mail.
 	- The parameter `t` is a tag with a person's identifier
 	- The parameter `d` is the person's details (address,etc).
 	- The parameter `a` is the content of the MailedBox
-}

data MailedBox t d a = EmptyMailBox t d | MailBoxTo t d a

mdBx1 = EmptyMailBox "Bob" [""]

mdBx2 = MailBoxTo "Bob" [""] "Hi Bob"

-- Question 2 --
-- Create instances for Show, Eq, and Ord for these three data types (use
-- automatic deriving whenever possible):

data Position = Intern | Junior | Senior | Manager | Chief
  deriving (Show, Eq, Ord)

data Experience = Programming | Managing | Leading
  deriving (Show, Eq, Ord)

type Address = String

data Salary = USD Double | EUR Double
  deriving (Show, Eq, Ord)

data Relationship
  = Contractor Position Experience Salary Address
  | Employee Position Experience Salary Address
  deriving (Show, Eq, Ord)

data Pokemon = Pokemon
  { pName :: String,
    pType :: [String],
    pGeneration :: Int,
    pPokeDexNum :: Int
  }
  deriving (Show, Eq, Ord)

charizard = Pokemon "Charizard" ["Fire", "Flying"] 1 6

venusaur = Pokemon "Venusaur" ["Grass", "Poison"] 1 3

-- Question 3 -- EXTRA CREDITS
-- Uncomment the next code and make it work (Google what you don't know).

-- -- Team memeber experience in years
-- newtype Exp = Exp Double
type Exp = Double

--
-- -- Team memeber data
-- type TeamMember = (String, Exp)
type TeamMember = (String, Exp)

--
-- -- List of memeber of the team
-- team :: [TeamMember]
-- team = [("John", Exp 5), ("Rick", Exp 2), ("Mary", Exp 6)]
team = [("John", 5), ("Rick", 2), ("Mary", 6)]

--
-- -- Function to check the combined experience of the team
-- -- This function applied to `team` using GHCi should work
-- combineExp :: [TeamMember] -> Exp
-- combineExp = foldr ((+) . snd) 0
-- combineExp :: (a, Integer) -> Integer
combineExp tm = foldr ((+) . snd) 0 tm -- why doesn't this work in pointfree style?
