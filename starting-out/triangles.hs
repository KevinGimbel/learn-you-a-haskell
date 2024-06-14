{- calculating triangles wih tuples and list comprehensions
 - from https://learnyouahaskell.com/starting-out#tuples
 -  
 - Here's a problem that combines tuples and list comprehensions: 
 - which right triangle that has integers for all sides and all sides 
 - equal to or smaller than 10 has a perimeter of 24?
-}

	-- create a list containing all triangles with sides equal to or smaller than 10
	-- let triangles = [ (a,b,c) | c <- [1..10], b <- [1..10], c <- [1..10] ]
	-- right-sided riangles 
triangles = do
	let rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2 ]
	-- triangles with perimeter of 24
	let rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24 ]
	print(rightTriangles')
