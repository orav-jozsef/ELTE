module Homework where

{- --------------------------------------------- -}
propEq :: Eq b => a -> a -> (a -> b) -> Bool
propEq x y f = (f x) == (f y)

sumVia :: Num b => (a -> b) -> [a] -> b
sumVia _ [] = 0
sumVia f (x : xs) = (f x) + sumVia f xs

concatTuples :: (a, a) -> (a -> [b]) -> [b]
concatTuples (x, y) f = (f x) ++ (f y)

concatWith :: (a -> [b]) -> [a] -> [b]
concatWith _ [] = []
concatWith f (x : xs) = (f x) ++ concatWith f xs

{- --------------------------------------------- -}
function1 :: (Int -> Int) -> Int
function1 g = g 13

function2 :: (Int -> Int -> Int) -> Int
function2 g = 2 * (g 25 11)

function3 :: (Int -> Int) -> (Int -> Int) -> Int
function3 g h = g 14 + h 15

function4 :: (Int -> Int) -> (Int -> Int) -> Int
function4 g h = g (h 1 + h 2) + g 3

function5 :: (Int -> Int -> Int) -> (Int -> Int) -> Int
function5 g h = g (h 1) (g 1 2) + h (g 3 4)

lambda1 :: Int
lambda1 = function1 (\x -> x * 2)

lambda2 :: Int
lambda2 = function2 (\x y -> x - y)

lambda3 :: Int
lambda3 = function3 (\x -> x `div` 2) (\x -> (x `div` 2) - 1)

lambda4 :: Int
lambda4 = function4 (\x -> x ^ 10) (\x -> x + x^2)

lambda5 :: Int
lambda5 = function5 (\x y -> x^y) (\x -> x^100)