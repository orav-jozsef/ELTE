module Homework where

{- --------------------------------------------- -}
isBanana :: String -> Bool
isBanana "banana" = True
isBanana "banán" = True
isBanana _ = False

implies :: Bool -> Bool -> Bool
implies True False = False
implies _ _ = True

addTriplet :: (Int, Int, Int) -> Int
addTriplet (x, y, z) = x + y + z

{- --------------------------------------------- -}
shiftTriplet :: (a, b, c) -> (c, a, b)
shiftTriplet (a, b, c) = (c, a, b)

tuplify :: a -> b -> (a, b)
tuplify x y = (x, y)

firstOfBoth :: ((a, b), (c, d)) -> (a, c)
firstOfBoth ((a, b), (c, d)) = (a, c)

identity :: a -> a
identity x = x

{- --------------------------------------------- -}
addPoints :: (Int, Int) -> (Int, Int) -> (Int, Int)
addPoints (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

mirrorPointAroundOrigo :: (Int, Int) -> (Int, Int)
mirrorPointAroundOrigo (x, y) = (-x, -y)

isOrigo :: (Int, Int) -> Bool
isOrigo (0, 0) = True
isOrigo _ = False

{- --------------------------------------------- -}
polyAdd :: Num a => a -> a -> a -> a
polyAdd x y z = x + y + z

eqAndAdd :: (Eq a, Num a) => a -> a -> (Bool, a)
eqAndAdd x y = (x == y, x + y)