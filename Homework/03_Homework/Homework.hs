module Homework where

{- --------------------------------------------- -}
mulThree :: Num a => a -> a -> a -> a
mulThree x y z = x * y * z

comparison :: Ord a => a -> a -> (Bool, Bool)
comparison x y = (x >= y, x <= y)

{- --------------------------------------------- -}
tripletToList :: (a,a,a) -> [a]
tripletToList (x, y, z) = [x, y, z]

second :: [a] -> a
second (x : y : ys) = y

trim :: [a] -> [a]
trim list = tail (init list)

isEmpty :: [a] -> Bool
isEmpty [] = True
isEmpty _ = False

{- --------------------------------------------- -}
divisors :: Int -> [Int]
divisors n = [x | x <- [2 .. (n - 1)], n `mod` x == 0]

primes :: [Int]
primes = [x | x <- [0 ..], is_prime x]

is_prime :: Int -> Bool
is_prime 0 = False
is_prime 1 = False
is_prime n = length [x | x <- [2 .. (n - 1)], n `mod` x == 0] < 1

permutate :: [a] -> [b] -> [(a,b)]
permutate a b = [(x, y) | x <- a, y <- b]

{- --------------------------------------------- -}
permutate' :: [a] -> [b] -> [(a,b)]
permutate' [] _ = []
permutate' _ [] = []
permutate' a b = [(x, y) | x <- a, y <- b]

concatLists :: [[a]] -> [a]
concatLists list = [x | y <- list, x <- y]