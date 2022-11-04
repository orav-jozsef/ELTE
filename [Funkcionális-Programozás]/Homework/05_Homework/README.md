# 5. Házi Feladat
> A házi feladatot egy Homework5 nevű modulként kell beadni.\
> Figyeljetek arra, hogy a függvényeitek a module szóval egy "oszlopba" kerüljenek, azaz ne legyenek beljebb húzva!\
> Minden definiálandó függvényhez adjuk meg a hozzá tartozó típus szignatúrát is!\
> (Ezt most megadtam, a saját modulotokba is másoljátok be a definíciótok elé.)

> ***Az előző házi feladatban és órákon az alábbi függvényeket definiáltuk:***
> - product ami egy listányi számot összeszoroz (mi mulAll néven írtuk meg)
> - sum ami egy listányi számot összead (mi sum' néven írtuk meg)
> - take ami egy lista első n elemét visszaadja (mi takeN néven írtuk meg)
> - drop ami egy lista első n elemét elhagyja (mi dropN néven írtuk meg)
> - ++ ami két listát össezfűz
> - concat ami egy listák listáját összefűz (mi concatList néven írtuk meg)
> - reverse ami egy listát megfordít (mi reverse' néven írtuk meg)
> - elem ami egy listában megnézi benne van-e az adott elem (mi contains néven írtuk meg)
> - minimum ami egy lista legkisebb elemét adja vissza (mi smallest néven írtuk meg)
> - zip ami két listát párhuzamosan összefűz
> - unzip ami egy tuple listából két listát csinál
> - length ami egy lista hosszát adja meg
> A házi feladat során a fent említett függvényeken és a rekurzión kívül az alábbi függvényeket lehet használni:
> - head
> - tail
> - last
> - init
> - szimpla matematikai függvények (pl +, mod stb)
> - maximum
> - notElem,
> - :
> - konstans értékek (pl 1, "alma", [])

> Egyéb feladatok megengedhetnek egyéb függvények használatát.\
> Nyelvi konstrukciókat (rekurzió, listagenerátor, guardok, where) használata szabad.

## 1. Feladat
> Importáljuk be a Data.Char modult!***

***Az isLower függvényt felhasználva definiáljuk a removeLowers függvényt amely a kisbetűket kiszűrí a karakterláncból!*** ```removeLowers :: String -> String```
> NOTE: A String ugyanaz mint a [Char]!

***Definiáljuk az orderList függvényt amely egy listát szortíroz!*** ```orderList :: Ord a => [a] -> [a]```\
***Definiáljuk a parallelAdd függvényt amely két listát párhuzamosan összead!*** ```parallelAdd :: Num a => [a] -> [a] -> [a]```

### Tesztesetek:
```haskell
removeLowers [] == []
removeLowers "alma" == []
removeLowers "AlMA" == "AMA"
orderList [5,4,3,2,1] == [1..5]
orderList [] == []
orderList [1,3,2,3,5] == [1,2,3,3,5]
parallelAdd [1,2,3] [4,5,6] == [5,7,9]
parallelAdd [] [1..] == []
parallelAdd [1..] [] == []
```

## 2. Feladat
***Definiáljuk a superIndex függvényt amely egy lista n-edik elemét visszaadja! Ha n < 0 akkor a listát hátulról kezdje el indexelni (pl.: ```superIndex (-2) [1,2,3] == 2```). Ha az index kinyúlna a listából, akkor dobjon a program kivételt! (undefined vagy error "HIBA" használatával)!*** ```superIndex :: Int -> [a] -> a```\
***Definiáljuk a uniques függvényt ami egy listából kiszűri a duplikált elemeket (de mindenből egyet hagyjon meg!)*** ```uniques :: Eq a => [a] -> [a]```
> A második függvény a Data.List modulban a nub függvény megfelelője (ezt nem szabad használni, de jó tudni)

### Tesztesetek:
```haskell
superIndex 0 [1..] == 1
superIndex (-1) [1,2,3,4] == 4
superIndex 3 [undefined, undefined, undefined, 3, undefined] == 3
uniques [1,2,3,4] == [1,2,3,4]
uniques [1,1,2,2,3,2,3,3,4,4,4,4,4] == [1,2,3,4]
uniques [4,3,4,2,4,1,4] == [4,3,2,1]
uniques [] == []
```

## 3. Feladat
> A válaszokat írd le szövegesen egy kommentbe!
> - Mi az a statikus típusrendszer?
> - Mondj egy példát arra, amikor hasznos a lusta kiértékelés!
> - Mi az alábbi kifejezés eredménye? Miért? [div 3 0, 1, 2] !! 1
> - Mit jelent az hogy "termináló eset"?
> - Mi a baj az alábbi kóddal?
```haskell
countEvens :: [Integer] -> Integer
countEvens [] = 0
countEvens (x:xs)
  | mod x 2 == 0 = 1 + countEvens (x:xs)
  | mod x 2 == 1 = countEvens xs
```