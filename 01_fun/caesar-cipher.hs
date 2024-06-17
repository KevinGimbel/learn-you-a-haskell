-- ceaser cipher
-- write out text based on a fixed "shift" in letters
-- see https://en.wikipedia.org/wiki/Caesar_cipher
-- Blog post https://kevingimbel.de/blog/2024/06/learning-haskell-caesar-cipher/

-- shiftLetter performs a caesar cipher on a letter.
-- Char -> Letter to shift
-- Int  -> Amount to shift by
-- Book -> Direction (True -> Encode, False -> Decode)
shiftLetter :: Char -> Int -> Bool -> Char
shiftLetter ' ' _ _ = ' '
shiftLetter letter 0 _ = letter
shiftLetter letter offset True = shiftLetter (succ letter) (offset - 1) True
shiftLetter letter offset False = shiftLetter (pred letter) (offset - 1) False

-- encode sentences
encode :: [Char] -> Int -> [Char]
encode input offset = [shiftLetter x offset True | x <- input]

-- decode sentences
decode :: [Char] -> Int -> [Char]
decode input offset = [shiftLetter x offset False | x <- input]
