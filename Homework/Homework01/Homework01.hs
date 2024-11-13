-- Question 1
-- Write a multiline comment below.
{-
comment
-}
-- Question 2
-- Define a function that takes a value and multiplies it by 3.
f v = v * 3

-- Question 3
-- Define a function that calculates the area of a circle.
areaCircle r = 3.14 * (r * r)

-- Question 4
-- Define a function that calculates the volume of a cylinder by composing the previous function together with the height of the cylinder.
volCyl r h = (areaCircle r) * h

-- Question 5
-- Define a function that takes the height and radius of a cylinder and checks if the volume is greater than or equal to 42.
cyl42 h r = (volCyl r h) >= 42