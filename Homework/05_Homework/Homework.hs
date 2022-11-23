module Homework where

{- --------------------------------------------- -}
import Data.Char

removeLowers :: String -> String
removeLowers [] = []
removeLowers (c : cs)
    | isLower(c) = removeLowers cs
    | otherwise = c : removeLowers cs

orderList :: Ord a => [a] -> [a]
orderList [] = []
orderList l = y : orderList ys
    where
        (y, ys) = minElem l

minElem :: Ord a => [a] -> (a, [a])
minElem [x] = (x, [])
minElem (x : xs)
    | x <= y = (x, xs)
    | x > y = (y, x : ys)
    where
        (y, ys) = minElem xs

parallelAdd :: Num a => [a] -> [a] -> [a]
parallelAdd [] _ = []
parallelAdd _ [] = []
parallelAdd (x : xs) (y : ys) = (x + y) : parallelAdd xs ys

{- --------------------------------------------- -}
superIndex :: Int -> [a] -> a
superIndex _ [] = error "Hiba"
superIndex n l@(x : xs)
    | n == 0 = x
    | n > 0 = superIndex (n - 1) xs
    | otherwise = superIndex ((length l) + n) l

uniques :: Eq a => [a] -> [a]
uniques [] = []
uniques (x : xs)
    | elem x xs = x : uniques (deleteElem x xs)
    | otherwise = x : uniques xs

deleteElem :: Eq a => a -> [a] -> [a]
deleteElem _ [] = []
deleteElem e (x : xs)
    | e == x = deleteElem e xs
    | otherwise = x : deleteElem e xs
