# 4. Házi Feladat
> A házi feladatot egy Homework4 nevű modulként kell beadni.\
> Figyeljetek arra, hogy a függvényeitek a module szóval egy "oszlopba" kerüljenek, azaz ne legyenek beljebb húzva!\
> Minden definiálandó függvényhez adjuk meg a hozzá tartozó típus szignatúrát is!\
> (Ezt most megadtam, a saját modulotokba is másoljátok be a definíciótok elé.)

> A feladatokat kötelező rekurzióval megoldani!

## Egyszerű Rekurzió
***Definiáljuk a mulAll függvényt amely egy lista összes elemét összeszorozza.*** ```mulAll :: Num a => [a] -> a```\
***Definiáljuk a zipLists függvényt amely két lista elemeit párhuzamosan összefűzi! Ha valamelyik listából elfogy az elem, hagyjuk abba a rekurziót!*** ```zipLists :: [a] -> [b] -> [(a,b)]```\
***Definiáljuk a concatList függvényt amely egy listák listáját összefűz egy listába!*** ```concatList :: [[a]] -> [a]```

### Tesztesetek:
```haskell
mulAll [] == 1
mulAll [1,2,3] == 6
mulAll [1,0,2,3] == 0
zipLists [] [1..] == []
zipLists [1..] [] == []
zipLists [1,2,3] [4,5,6,7] == [(1,4), (2, 5), (3, 6)]
concatList [[]] == []
concatList [[1,2,4], [], [5]] == [1,2,4,5]
concatList [[], [], [], [1,2,3]] == [1,2,3]
```

## Végtelen Rekurzió
***Definiáljuk a doublingFrom függvényt amely egy végtelen listád ad vissza, ahol az elemek egymás után duplájukra nőnek!*** ```doublingFrom :: Num a => a -> [a]```

### Tesztesetek:
```haskell
take 3 (doublingFrom 1) == [1,2,4]
take 5 (doublingFrom 2) == [2,4,8,16,32]
head (doublingFrom 1000) == 1000
```

## Guardok
***Definiáljuk a onlyIncreasing függvényt, amely egy listából leszűri azon tupleöket amelyekben nem növekvő sorrendben vannak az elemek!*** ```onlyIncreasing :: Ord a => [(a,a,a)] -> [(a,a,a)]```\
***Definiáljuk a takeN függvényt amely az első n elemet kiszedi egy listából! A függvény legyen lusta! Ha kevesebb mint n elem van a listában akkor adjon vissza annyi elemet amennyit tud! n <= 0 esetén adjon vissza üres listát!*** ```takeN :: Int -> [a] -> [a]```\
***Definiáljuk a dropN függvényt amely az első n elemet elhagyja egy listából! A függvény legyen lusta! Ha kevesebb mint n elem van a listában vagy n < 0 adjon vissza üres listát!*** ```dropN :: Int -> [a] -> [a]```

### Tesztesetek:
```haskell
onlyIncreasing [(1,2,3), (4,5,6)] == [(1,2,3), (4,5,6)]
onlyIncreasing [(4,5,6), (1,2,3)] == [(4,5,6), (1,2,3)]
onlyIncreasing [(1,2,2), (6,5,7)] == []
takeN 3 [1..10] == [1,2,3]
takeN 0 [1..] == []
takeN 100 [1..] == [1..100]
takeN 10 [1,2] == [1,2]
dropN 3 [1..10] == [4..10]
dropN 3 [undefined, undefined, undefined, 1] == [1]
dropN 2 [1] == []
```

## Lokális függvények
***Definiáljuk a triUnzip függvényt amely egy listányi tuplet felbont három listára!*** ```triUnzip :: [(a,b,c)] -> ([a], [b], [c])```\
***Definiáljuk az indexList függvényt amely minden elemet egy tuplebe rak, ami tartalmazza azt is, milyen távol van az elem a lista végétől! A megoldásban length-et ne használjunk!*** ```indexList :: [a] -> [(Int, a)]```

### Tesztesetek:
```haskell
triUnzip [(1,2,3), (4,5,6)] == ([1,4], [2,5], [3,6])
triUnzip [] == ([], [], [])
indexList [True, False, True] == [(2, True), (1, False), (0, True)]
indexList [] == []
```

## Bónusz Feladatok
> Ezt a feladatot kérlek aki megcsinálja teamsen küldje el, ne itt TMS-en!

***Definiáljuk a splitOn függvényt ami az adott elem mentén felbontja a listát!*** ```splitOn :: Eq a => a -> [a] -> [[a]]```

### Tesztesetek:
```haskell
splitOn 'A' "ÉnAelmentemAaAvásárbaAfélApénzzel!" == ["Én","elmentem","a","vásárba","fél","pénzzel!"]
splitOn 1 [1] == [[],[]]
splitOn 1 [] == [[]]
splitOn "a" [] == [[]]
(take 50 $ splitOn 5 [1..] !! 1) == take 50 [6..]
```