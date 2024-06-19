-- determine the type of something in ghci
-- :t "a"
-- "a" :: String
-- :t 12
-- 12 :: Num a => a
-- :t "HELLO"
-- "HELLO" :: [Char]
--
-- :: means "has type of"

{- Quote: When writing our own functions, we can choose to give them an explicit type declaration. This is generally considered to be good practice except when writing very short functions.
-}
-- Int -> Int -> Int -> Int is the types, he last Int is the returned type
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

-- Types
--
-- Int 		= efficient, bound  
-- Integer	= unbound, can be really big 
-- Float	= floating poin numners like 4.2 or 13.37
-- Double 	= real floating point with double the precision!
factorial :: Integer -> Integer
factorial n = product [1..n]

circumference :: Float -> Float
circumference r = 2 * pi * r

circumference' :: Double -> Double
circumference' r = 2 * pi * r

-- Char		= Single character like 'a'
-- String	= list of characters, alias for [Char]

-- Type variables
-- :t head
-- head :: [a] -> a
--
-- a is a variable type like a generic in other languages
--
-- :t fst
-- fst :: (a, b) -> a


