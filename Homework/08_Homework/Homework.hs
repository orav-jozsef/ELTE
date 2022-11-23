module Homework where

{- --------------------------------------------- -}
minimum' :: Ord a => [a] -> a
minimum' (x:xs) = foldr min x xs

concatMap' :: (a -> [b]) -> [a] -> [b]
concatMap' f x = foldr ((++) . f) [] x

elem' :: Eq a => a -> [a] -> Bool
elem' x l = foldr (\y z -> x == y || z) False l

null' :: [a] -> Bool
null' x = foldr (\_ _ -> False) True x

{- --------------------------------------------- -}
sortBy :: Ord b => (a -> b) -> [a] -> [a]
sortBy _ [] = []
sortBy f l = y : sortBy f ys
    where
        (y, ys) = getElements f l

getElements :: Ord b => (a -> b) -> [a] -> (a, [a])
getElements _ [x] = (x, [])
getElements f (x : xs)
    | f x <= f y = (x, xs)
    | True = (y, x : ys)
    where
        (y, ys) = getElements f xs

peekN :: ([a] -> b) -> Int -> [a] -> [b]
peekN _ _ [] = []
peekN _ 0 _ = []
peekN f n l
    | n > length ys = []
    | True = f ys : peekN f n zs
    where
        (ys, zs) = getSet n n l

getSet :: Int -> Int -> [a] -> ([a], [a])
getSet _ _ [] = ([], [])
getSet z n l@(x : xs)
    | n > length l = ([], [])
    | z == n = (x : as, bs)
    | n >= 1 = (x : as, x : bs)
    | True = (as, l)
    where
        (as, bs) = getSet z (n - 1) xs



dropEveryNth :: Int -> [a] -> [a]
dropEveryNth _ [] = []
dropEveryNth n l = take (n - 1) l ++ dropEveryNth n (drop n l)


dropEveryNth' :: Int -> [a] -> [a]
dropEveryNth' _ [] = []
dropEveryNth' n l = ys ++ dropEveryNth' n zs
    where
        (ys, zs) = dropElement n l

dropElement :: Int -> [a] -> ([a], [a])
dropElement _ [] = ([], [])
dropElement n (x : xs)
    | n > 1 = (x : as, bs)
    | True = (as, xs)
    where
        (as, bs) = dropElement (n - 1) xs
{- --------------------------------------------- -}
{-
    (=>) végeredmény


    f a b = a / b =>
    f a b = (/) a b
    f a = (/) a
    => f = (/)

    f a = 2 * negate a
    => f = 2 * negate

    f a = 1 + abs (1 + a)
    => f = (+) 1 . abs . (+) 1
-}

{-
    f a b = 1 + abs (a - b)
    f a b = 1 + ((abs .) . (-)) a b
    ???
    => ???


    f a b c = a + b + c
    f a b c = (a + b) + c
    f a b c = (+) (a + b) c
    f a b = (+) (a + b)
    f a b = (+) ((+) a b)
    ???
    => ???
-}
