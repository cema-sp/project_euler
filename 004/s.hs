import Data.List (sortBy)

pairs :: Int -> [(Int, Int)]
pairs n = [ (x, y) | x <- [m, m-1 .. 1], y <- [m, m-1 .. 1]]
          where
            m = (read $ replicate n '9') :: Int

isPalindrome :: Int -> Bool
isPalindrome = let isPStr []     = True;
                   isPStr [_]    = True;
                   isPStr (x:xs) = (x == last xs) && isPStr (init xs)
               in isPStr . show

palindromes :: Int -> [(Int, Int, Int)]
palindromes n = sortBy (\(_,_,p1) (_,_,p2) -> compare p2 p1) [ (x, y, x * y) | (x, y) <- pairs n, isPalindrome (x * y)]

solution :: Int -> String
solution n = "Solution: " ++ show prod ++ " (" ++ show x ++ ", " ++ show y ++ ")"
             where
               (x, y, prod) = head . palindromes $ n

