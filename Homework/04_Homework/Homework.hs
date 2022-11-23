module Homework where

{- --------------------------------------------- -}
mulAll :: Num a => [a] -> a
mulAll [] = 1
mulAll (x : xs) = x * mulAll xs

zipLists :: [a] -> [b] -> [(a,b)]
zipLists [] _ = []
zipLists _ [] = []
zipLists (x : xs) (y : ys) = [(x, y)] ++ zipLists xs ys

concatList :: [[a]] -> [a]
concatList [x] = x
concatList (x : xs) = x ++ concatList xs

{- --------------------------------------------- -}
doublingFrom :: Num a => a -> [a]
doublingFrom x = [x] ++ doublingFrom (x*2)

{- --------------------------------------------- -}
onlyIncreasing :: Ord a => [(a,a,a)] -> [(a,a,a)]
onlyIncreasing [] = []
onlyIncreasing ((x, y, z) : as)
    | x < y && y < z = [(x, y, z)] ++ onlyIncreasing as
    | otherwise = onlyIncreasing as

takeN :: Int -> [a] -> [a]
takeN _ [] = []
takeN n (x : xs)
    | n > 0 = [x] ++ takeN (n - 1) xs
    | otherwise = []

dropN :: Int -> [a] -> [a]
dropN _ [] = []
dropN n (x : xs)
    | n > 1 = dropN (n - 1) xs
    | otherwise = xs

{- --------------------------------------------- -}
triUnzip :: [(a,b,c)] -> ([a], [b], [c])
triUnzip [] = ([], [], [])
triUnzip ((x, y, z) : xs) = (x : as, y : bs, z : cs)
    where
        (as, bs, cs) = triUnzip xs

indexList :: [a] -> [(Int, a)]
indexList [] = []
indexList [x] = [(0, x)]
indexList (x : xs) = ((a + 1), x) : as
    where
        as@((a, s) : bs) = indexList xs

{- --------------------------------------------- -}
{-
splitOn :: Eq a => a -> [a] -> [[a]]
??
-}