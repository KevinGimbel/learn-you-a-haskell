-- pattern matching in functions

{- 
Pattern are matched in order from top to bottom
Each pattern can match a type of parameters, either generic 
by assigning a variable or by value.

Pattern matching can match against a fixed value, a placeholder _ (underscore)
or a variable
-}

number' :: (Integral a) => a -> String
number' 1 = "One"
number' 2 = "Two"
number' 3 = "Three"
number' 4 = "Four"
number' 5 = "Five"
number' x = "Not between 1 and 5"

-- pattern matching to stop a recursion
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial(n - 1)

{- Quoting from Learn-You-A-Haskell
    in a nutshell, this is what happens if we try to get the factorial of, say, 3. 
    It tries to compute 3 * factorial 2.
    The factorial of 2 is 2 * factorial 1
    so for now we have 3 * (2 * factorial 1).
    factorial 1 is 1 * factorial 0, so we have 3 * (2 * (1 * factorial 0))
    
    Now here comes the trick — we've defined the factorial of 0 to be just 1 and because 
    it encounters that pattern before the catch-all one, it just returns 1. 
    
    So the final result is equivalent to 
    3 * (2 * (1 * 1))
-}

-- The following safeguards against division by zero
div' :: Float -> Float -> Float
div' _ 0 = error "cannot divide by 0"
div' a b = a/b

-- get first char of a String,
-- show error if empty String is passed
first' :: String -> Char
first' [] = error "String cannot be empty"
first' (x:_) = x

-- with @ everything can be captured into a variable before splitting it
-- Note: [a] is required in the String concatination because a would be a Char 
-- and [a] is a [Char] which is a String (or so I think)
firstOf' :: String -> String
firstOf' all@(a:_) = "First letter of '" ++ all ++ "' is '" ++ [a] ++ "'"
