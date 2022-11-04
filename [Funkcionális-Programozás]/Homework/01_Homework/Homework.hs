module Homework where

{- --------------------------------------------- -}
intExpr1 :: Int
intExpr1 = 3

intExpr2 :: Int
intExpr2 = 2

intExpr1DivIntExpr2 :: Int
intExpr1DivIntExpr2 = intExpr1 `div` intExpr2

stringExpr1 :: String
stringExpr1 = "ASD #1"

stringExpr2 :: String
stringExpr2 = "ASD #2"

boolExpr1 :: Bool
boolExpr1 = True

boolExpr2 :: Bool
boolExpr2 = False

{- --------------------------------------------- -}
mult3Ints :: Int -> Int -> Int -> Int
mult3Ints x y z = x * y * z

is1566divisibleBy :: Int -> Int -> Bool
is1566divisibleBy x y = (1566 `mod` x == 0) && (1566 `mod` y == 0)

threeOr :: Bool -> Bool -> Bool -> Bool
threeOr x y z = x || y || z

{- --------------------------------------------- -}
inc :: Int -> Int
inc x = x + 1

triple :: Int -> Int
triple x = x * 3

zero :: Int
zero = 0

int1 :: Int
int1 = inc (inc (inc (inc (triple (triple (inc zero))))))

int2 :: Int
int2 = inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (zero)))))))))))))

{- --------------------------------------------- -}
howManyJars :: Int
howManyJars = 2514 `div` 17

howMuchInLastJar :: Int
howMuchInLastJar = 2514 `mod` 17

{- --------------------------------------------- -}
isLeapYear :: Int -> Bool
isLeapYear x = (x `mod` 4 == 0) && (not (x `mod` 100 == 0) || (x `mod` 400 == 0))