-- Notes and codes from 
-- https://learnyouahaskell.com/starting-out

-- function definition
-- fn_name fn_val = fn_body
-- double x = x * 2

{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
import Distribution.Simple.Program.HcPkg (list)
{-# HLINT ignore "Use camelCase" #-}

-- simple function which takes x
-- and returns x + x
doubleMe x = x + x

-- could be written as doubleUs x y = x*2 + y*2
doubleUs x y = doubleMe x + doubleMe y 

half x = x / 2

{- 
if then else can be written in one line or multiple 
doubleSmallNumer x = if x > 100
		     then x
		     else x*2 
-}
doubleSmallNumber x = if x > 100 then x else x*2
-- ' is a valid char for function names
doubleSmallNumber' x = (if x > 100 then x else x*2) + 1

-- NOTE: functions can't begin with uppercase letters

{- 
 - NOTE: Lists are put together with ++ between them, which walks the whole list on the left
 - putting something at the beginning of a list using the : operator (also called the cons operator) is instantaneous.
-}
list_plusplus = [1,2,3,4] ++ [11,12,13,14] -- [1,2,3,4,11,12,13,14]
list_b = 5: [1,2,3,4] -- [5,1,2,3,4]

-- Even if you're adding an element to the end of a list with ++, you have to surround it with square brackets so it becomes a list.


-- If you want to get an element out of a list by index, use !!. The indices start at 0
first_letter = "Hello, world" !! 0
-- first_letter == "H"
--
{- 
 - Lists can be compared if the stuff they contain can be compared. When using <, <=, > and >= to compare lists, they are compared in lexicographical order. First the heads are compared. If they are equal then the second elements are compared, etc.
 -}

list_gt = [3,2,1] > [2,1,0] -- True
list_gt_2 = [3,2,1] > [2,10,100] -- True
list_gt_3 = [3,4,2] > [3,4] -- True
list_eq = [3,4,2] == [3,4,2] -- True

-- LIST functions

-- head: first element of list
first_el = head [1,2,3] -- 1
-- tail: all but the first
rest_el = tail [1,2,3] -- [2,3]
-- last: last element
last_el = last [1,2,3] -- 3
-- init: all but last
init_el = init [1,2,3] -- [1,2]

-- if lists are empty, the head tail last and init function will return an error. With `null` we can check if the list is empty
-- If it is, it returns True, otherwise it returns False.
is_not_null = null [1,2,3]
is_null = null []

-- reverse: reverse the list
reverse_list = reverse [1,2,3] -- [3,2,1]

-- take: takes X elements of list, starting from the head (beginning)
take_list = take 3 [1,2,3,4,5] 
take_list_and_tail = take 2 (tail [1,2,3,4,5,6,7])


-- `elem` returns true if the element is in the list
-- its an infix (?) of "elem 4 [1,2,3,4]"
elem_true = elem 4 [1,2,3,4]
elem_false = 5 `elem` [1,2,3,4]

-- ranges are awesome
-- they produce a list of things without typing everything
range_1_10 = [1..10]
range_az = ['a'..'z']

-- ranges can take steps: [start,step..end]
range_2_20 = [2,2..20]
range_odd_letters = ['a','c'..'z']

-- reversed steps must start from big to small with one-step defined
-- [20..1] doesnt work, [20,19..1] does
range_reverse = [20,19..1]

-- infinite lists: no upper limit specified
range_infinitei_do_not_call_or_haskell_hangs = [1..]
-- with "take" the infinite list is only evaluated up to the point which is needed
range_with_take = take 12 [13,26..] -- takes the first 12 multiples of 13 from the infinite list

-- cycle cycles through a list forever
cycle_take = take 10 (cycle [1,2,3]) -- [1,2,3,1,2,3,1,2,3,1]
-- repeat does the same but with one element
repeat_take = take 10 (repeat 5) -- [5,5,5,5,5,5,5,5,5,5]

-- replicate replicates the given number x times
replicate_output = replicate 3 10 -- [10,10,10]

-- list comprehension
-- syntax: [output function | input set, predicate]
list_comp = [x*2 | x <- [1..10]]

list_comp_with_predicate = [x*3 | x <- [3,6..30], even x]

-- all numbers from 50 to 100 which when divided by 7 are 3. 
list_comp_mod_7 = [ x | x <- [50..100], x `mod` 7 == 3] -- [52,59,66,73,80,87,94]

-- exclude results with x /= y as predicate
list_comp_exclude = [ x | x <- [10..20], x /= 11, x/= 14, x/=17]

-- get values from two lists
list_comp_multi_list = [x*y | x <- [1,3,5,7], y <- [2,4,6,8] {-, predicate -}]

-- take from list of words
word_fun=do
  let adj = ["cool", "rad", "funny"]
  let nouns = ["wizard", "frog", "painter"]
  [ a ++ " " ++ n | a <- adj, n <- nouns]
-- returns the following list 
-- ["cool wizard","cool frog","cool painter","rad wizard","rad frog","rad painter","funny wizard","funny frog","funny painter"]

-- custom length function: take 1 for each element of a list, then sum
-- "_ <- xs" takes the element but doesn't assign it to a number
length' xs = sum [1 | _ <- xs]
len_test = length' [1,2,3] -- 3

-- list comps can be used to alter strings :mind_blown: - because strings are just lists of chars!
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]
test_removeNonUppercase = removeNonUppercase "I dont LIKE FROGS!" -- ILIKEFROGS
