module MintaZH4 where

{-
    data MyData = Ctor1 | Ctor2 Int | Ctor3 (Int -> Int) | Ctor4 String String deriving (Show)
    
    mivel a Ctor3 egy fg.-t vár, és a fg.t nem lehet automatikus deriving kiiratni
-}

data Rectangle = Rectangle Int Int Int Int deriving (Eq)

rectangleArea :: Rectangle -> Maybe Int
rectangleArea (Rectangle x1 y1 x2 y2)
    | x1 < x2 && y1 < y2 = Just ((x2 - x1) + (y2 - y1))
    | True = Nothing

noOverlappingRectangles :: [Rectangle] -> Bool
noOverlappingRectangles [] = False
noOverlappingRectangles (x : xs)
    | isIn x xs = True
    | True = noOverlappingRectangles (xs)
    where
        {- 1 Rectangle végignézi hogy metszi e a többi közül egy is-}
        isIn :: Rectangle -> [Rectangle] -> Bool
        isIn _ [] = False
        isIn x (y : ys)
            | isInBox x y = True
            | True = False || isIn x ys

{- Megkap 2 darab Rectangle és eldönti hogy metszik e egymást -}
isInBox :: Rectangle -> Rectangle -> Bool
isInBox (Rectangle x1 y1 x2 y2) (Rectangle x3 y3 x4 y4)
    | (x1 <= x3 && x1 >= x3) || (x1 <= x4 && x2 >= x4) = True
    | (y1 <= y3 && y1 >= y3) || (y1 <= y4 && y2 >= y4) = True
    | True = False