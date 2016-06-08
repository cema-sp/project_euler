primes :: [Int]
primes = sieve [2..]
         where
           sieve (x:ys) = x : sieve [ y | y <- ys, y `mod` x /= 0 ]

factors :: Int -> [Int]
factors 1 = []
factors x = factor : factors (x `div` factor)
            where
              factor = head (filter ((==) 0 . mod x) primes)

greatestFactor :: Int -> Int
greatestFactor = last . factors

