module Homework where

import Data.List

{- --------------------- -}
groupBy' :: (a -> a -> Bool) -> [a] -> [[a]]
groupBy' _ [] = []
groupBy' f (x : xs) = [x : takeWhile (f x) (xs)] ++ groupBy' f (dropWhile (f x) (xs))

{- --------------------- -}
---- Nem rekurziós
indexedMap :: Integral index => (index -> a -> b) -> [a] -> [b]
indexedMap _ [] = []
indexedMap f list = map (\(i,v) -> f i v) $ zip [0..] list

{- --------------------- -}
dropZip :: (a -> b -> Bool) -> [a] -> [b] -> [(a,b)]
dropZip f xlist ylist = [(x, y) | (x,y) <- zip xlist ylist, (not (f x y))]

{- --------------------- -}
sepByHead :: Eq a => [a] -> [[a]]
sepByHead [] = []
sepByHead [x] = [[]]
sepByHead (x : xs) = [takeWhile (not . (== x)) xs] ++ sepByHead (dropWhile (not . (== x)) xs)

{- --------------------- -}
---- Nem rekurziós
insertions :: a -> [a] -> [[a]]
insertions n [] = [[n]]
insertions n list = (map (\(i,a) -> insertElement i n list) $ zip [0..] (n : list))
--- Help fg.
insertElement :: Int -> a -> [a] -> [a]
insertElement x y xs = (take x xs) ++ y : (drop x xs)

{- --------------------- -}
differences :: Num a => [a] -> [a]
differences [] = []
differences [x] = []
differences (x : y : zs) = (x - y) : differences (y:zs)

{- --------------------- -}
---- Nem rekurziós
pascalTriangle :: Integral a => [[a]]
pascalTriangle = iterate (\l -> zipWith (+) ([0] ++ l) (l ++ [0])) [1]

{- --------------------- -}
fib :: [Integer]
fib = 1 : 1 : [a + b | (a, b) <- zip fib (tail fib)]