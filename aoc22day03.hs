import Data.Char (isAsciiLower, isAsciiUpper, ord)
import Data.List (intersect)

-- read input.txt and output star1 and star2 solutions
main = do
  content <- readFile "input.txt"
  putStrLn ("The solution to star 1 is " ++ show (star1 content))
  putStrLn ("The solution to star 2 is " ++ show (star2 content))

-- solution for star 1 (groups by splitting lines)
star1 :: String -> Int
star1 = star splits

-- solution for star 2 (groups by taking chunks of lines)
star2 :: String -> Int
star2 = star chunks

-- solution for star 1 or 2 is
-- - the sum
--   - over the scores for
--   - the first element (head) which
--   - all group members have in common (foldr1 intersect)
-- - for each group (f)
-- - obtained from the content lines
star :: ([String] -> [[String]]) -> String -> Int
star f = sum . map (score . head . foldl1 intersect) . f . lines

-- lists split in two parts of equal length (for first star)
splits :: [[a]] -> [[[a]]]
splits = map (\xs -> let n = length xs `div` 2 in [take n xs, drop n xs])

-- lists grouped in chunks of 3 (for second star)
chunks :: [[a]] -> [[[a]]]
chunks [] = []
chunks (x1 : x2 : x3 : xs) = [x1, x2, x3] : chunks xs

-- priority score
score :: Char -> Int
score x
  | isAsciiLower x = ord x - ord 'a' + 1
  | isAsciiUpper x = ord x - ord 'A' + 27
