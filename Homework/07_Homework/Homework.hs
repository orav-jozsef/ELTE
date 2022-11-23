module Homework where

{- --------------------------------------------- -}
spanWhile :: (a -> Bool) -> [a] -> ([a], [a])
spanWhile _ [] = ([], [])
spanWhile f (x : xs)
    | f x = (x : as, bs)
    | True = ([], x : as ++ bs)
    where
        (as, bs) = spanWhile f xs


pairwise :: (a -> a -> b) -> [a] -> [b]
pairwise _ [] = []
pairwise _ [x] = []
pairwise f (x : y : xs) = (f x y) : pairwise f (y:xs)

takeWhilePair :: (a -> a -> Bool) -> [a] -> [a]
takeWhilePair _ [] = []
takeWhilePair _ [x] = [x]
takeWhilePair f (x : y : xs)
    | f x y = x : takeWhilePair f (y : xs)
    | True = [x]

dropWhilePair :: (a -> a -> Bool) -> [a] -> [a]
dropWhilePair _ [] = []
dropWhilePair _ [x] = []
dropWhilePair f l@(x : y : xs)
    | f x y = dropWhilePair f (y : xs)
    | True = l

{- --------------------------------------------- -}
descendingSegments :: Ord a => [a] -> [[a]]
descendingSegments [] = []
descendingSegments [a] = []
descendingSegments (x : xs)
    | length al > 0 = [x : al] ++ descendingSegments bl
    | True = descendingSegments bl
    where
        (al, bl) = firstStrictlyDecreasing x xs

firstStrictlyDecreasing :: Ord a => a -> [a] -> ([a], [a])
firstStrictlyDecreasing _ [] = ([], [])
firstStrictlyDecreasing _ [x] = ([], [])
firstStrictlyDecreasing n l@(x : xs)
    | n > x = (x : al, bl)
    | True = ([], l)
    where
        (al, bl) = firstStrictlyDecreasing x xs

{- --------------------------------------------- -}
{-
    - Mi az az η-redukció?
      Ha függvénynek az utolsó paramétere egy érték és ugyan az az utolsó felvett paraméter, mind a kettőt el lehet hagyni
      Példa:
        g :: (Int -> (Int -> Int))
        g = \x -> (\y -> div x y) => g = \x -> div x => g = div

    - Mi az a curryzés?
      Minden függvény 1 vagy 0 paraméterü.
      Példa:
        f :: (Int -> (Int -> Int))
        f = \x -> (\y -> x + y)

    - Mi az a magasabb rendű függvény?
      Függvény paraméterként vár egy másik függvényt.

    - Miért nem fordul az alábbi kóddal?
      A map-nek megadtuk a listát, illetve a müveletet is, de a müveletnek 2 értéket vár (jelen esetben 2 darab számot) és csak egyet adunk át neki
      Javitva:
-}
f :: [Int] -> [Int]
f xs = map (1+) xs