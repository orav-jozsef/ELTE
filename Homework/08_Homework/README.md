8. Házi Feladat
A házi feladatot egy Homework8 nevű modulként kell beadni. Figyeljetek arra, hogy a függvényeitek a module szóval egy "oszlopba" kerüljenek, azaz ne legyenek beljebb húzva! Minden definiálandó függvényhez adjuk meg a hozzá tartozó típus szignatúrát is! (Ezt most megadtam, a saját modulotokba is másoljátok be a definíciótok elé.)

Hajtogatás
Definiáljuk az alábbi műveleteket foldr, foldl és foldr1 segítségével!

Egy függvény ami megkeresi egy lista legkisebb elemét! (minimum' :: Ord a => [a] {- nem üres -} -> a)
Egy függvényt ami egy lista összes elemére alkalmaz egy függvényt, amivel listákat generál, majd azokat összefűzi! (concatMap' :: (a -> [b]) -> [a] -> [b])
Egy függvény ami megnézi egy lista tartalmaz-e egy kapott elemet (elem' :: Eq a => a -> [a] -> Bool)
Egy függvény ami eldönti egy lista üres-e! (null' :: [a] -> Bool)
Tesztesetek:

minimum' [1..10] == 1
minimum' (reverse [1..10]) == 1
concatMap' id [] == []
concatMap' id [[1,2,3],[4,5,6]] == [1,2,3,4,5,6]
concatMap' (\x -> replicate x x) [1,2] == [1,2,2]
elem' 1 [1..10] == True
elem' 0 [1..10] == False
elem' 1 [1..] == True
null' [] == True
null' [1,2] == False
null' [1..] == False
Magasabbrendű függvények és Rekurzió
Definiáljuk a sortBy függvényt amely egy listát szortíroz egy adott tulajdonság alapján! (sortBy :: Ord b => (a -> b) -> [a] -> [a])
Definiáljuk a peekN függvényt amely egy lista n hosszú részlistáin végez átalakításokat! (peekN :: ([a] -> b) -> Int -> [a] -> [b])
Definiáljuk a dropEveryNth függvényt amegy lista minden n-edik elemét elhagyja! (dropEveryNth :: Int -> [a] -> [a])
Tesztesetek:

sortBy (1/) [1..10] == reverse [1..10]
sortBy (\a -> -1529 * a ^ 5 / 15120 + 12119 * a ^ 4 / 5040 - 380147 * a ^ 3 / 15120 + 81527 * a ^ 2 / 720 - 1528549 * a / 7560 + 1096 / 9) [1..10] == [10,9,8,7,6,5,2,1,3,4]
sortBy sin [1..10] == [5,4,10,6,3,9,7,1,2,8]
peekN sum 3 [1,2,3,4,5] == [6,9,12]
peekN sum 1 [1,2,3,4,5] == [1,2,3,4,5]
peekN sum 2 [1,2,3,4,5] == [3,5,7,9]
peekN product 4 [1,2,3,4,5] == [24,120]
dropEveryNth 3 [1..10] == [1,2,4,5,7,8,10]
dropEveryNth 2 [2..10] == [2,4,6,8,10]
dropEveryNth 1 [1..10] == []
take 10 (dropEveryNth 3 [1..]) == [1,2,4,5,7,8,10,11,13,14]
η-redukció (Bónusz Feladat)
Ezt a feladatot nem kötelező megcsinálni! A megoldásait lejebb csatoltam!
Tanult (és egyéb) ekvivalenciák:

a <> b        ≡ (<>) a b   -- ha <> egy tetszőleges operátor
f a b         ≡ flip f b a -- ha f nem kommutatív
f a b         ≡ f b a      -- ha f kommutatív
\x -> f x     ≡ f          -- η-redukció
f (g x)       ≡ f $ g x    -- dollár átalakítás
\x -> f $ g x ≡ f . g      -- kompozíció átalakítás
\x -> x       ≡ id         -- identitás függvény
\x -> c       ≡ const c    -- ha c egy érték független x-től
Ezek segítségével η-redukáljuk az alábbi kifejezéseket!

f a b = a / b
f a = 2 * negate a
f a = 1 + abs (1 + a)
Kicsit nehezebb feladatok:

f a b = 1 + abs (a - b)
f a b c = a + b + c