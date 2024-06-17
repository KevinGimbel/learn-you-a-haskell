-- ceaser cipher
--
-- write out text based on a fixed "shift" in letters
--
--

shiftLetter :: Char -> Int -> Char
shiftLetter ' ' _ = ' '
shiftLetter letter 0 = letter
shiftLetter letter offset = shiftLetter (succ letter) (offset - 1)

encode :: [Char] -> Int -> [Char]
encode input offset = [ shiftLetter x offset | x <- input ]
