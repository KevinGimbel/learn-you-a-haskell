-- ceaser cipher
--
-- write out text based on a fixed "shift" in letters

-- shiftLetter performs a caesar cipher on a letter. 
-- Char -> Letter to shift
-- Int  -> Amount to shift by
-- Book -> Direction (True -> Encode, False -> Decode) 
shiftLetter :: Char -> Int -> Bool -> Char
shiftLetter ' ' _ _ = ' '
shiftLetter letter 0 _ = letter
shiftLetter letter offset True = shiftLetter (succ letter) (offset - 1) True
shiftLetter letter offset False = shiftLetter (pred letter) (offset - 1) False

encode :: [Char] -> Int -> [Char]
encode input offset = [ shiftLetter x offset True | x <- input ]

decode :: [Char] -> Int -> [Char]
decode input offset = [ shiftLetter x offset False | x <- input ]
