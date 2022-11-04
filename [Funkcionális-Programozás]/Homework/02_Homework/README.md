# 2. Házi Feladat
> A házi feladatot egy Homework2 nevű modulként kell beadni. Figyeljetek arra, hogy a függvényeitek a module szóval egy "oszlopba" kerüljenek, azaz ne legyenek beljebb húzva! Minden definiálandó függvényhez adjuk meg a hozzá tartozó típus szignatúrát is! (Ezt most megadtam, a saját modulotokba is másoljátok be a definíciótok elé.)

## 1. Feladat - Mintaillesztés
***Definiáljuk az isBanana függvényt amely edönti a kapott paraméterről, hogy banán-e (angolul vagy magyarul) vagy nem!*** ```isBanana :: String -> Bool```\
***Definiáljuk az implies függvényt amely a logikai implikáció-t modellezi. [Ennek az igazságtáblázata.](https://shorturl.at/bcdhs)*** ```implies :: Bool -> Bool -> Bool```\
***Definiáljuk az addTriplet függvényt amely egy rendezett hármas elemeit összeadja!*** ```addTriplet :: (Int, Int, Int) -> Int```

### Tesztesetek:
```haskell
isBanana "banana" == True
isBanana "banán" == True
isBanana "alma" == False
isBanana "banána" == False
implies True False == False
implies True True == True
implies (5 == 3) (3 == 5) == True
addTriplet (1,2,3) == 6
addTriplet (4,5,6) == 15
addTriplet (0,0,0) == 0
```

## 2. Feladat - Polimorfizmus
***Definiáljuk a shiftTriplet függvényt amely fog egy rendezett hármast és az utolsó elemét az elejére rakja!*** ```shiftTriplet :: (a,b,c) -> (c,a,b)```\
***Definiáljuk a tuplify függvényt amely a két kapott polimorf paramétert egy rendezett párba rakja!*** ```tuplify :: a -> b -> (a,b)```\
***Definiáljuk a firstOfBoth függvényt amely egy rendezett párokban lévő rendezett párok első elemeit adja vissza!*** ```firstOfBoth :: ((a,b),(c,d)) -> (a,c)```\
***Definiáljuk az identity függvényt amely csak simán, visszaadja a kapott paramétert eredményül!*** ```identity :: a -> a```

### Tesztesetek:
```haskell
shiftTriplet (1, "alma", 'c') == ('c', 1, "alma")
shiftTriplet ("banán", True, 29) == (29, "banán", True)
tuplify 1 "alma" == (1, "alma")
tuplify "kókuszdió" True == ("kókuszdió", True)
firstOfBoth ((1, "alma"), (True, 'c')) == (1, True)
firstOfBoth (("banán", 'c'), (2, True)) == ("banán", 2)
identity 1 == 1
identity "alma" == "alma"
```

## 3. Feladat - Koordináta rendszer
> A feladat során az (Int, Int) típus fog egy pontot reprezentálni egy két dimenziós koordináta rendszerben.

***Definiáljuk az addPoints függvényt amely két pontot összead (mint vektorokat)!*** ```addPoints :: (Int, Int) -> (Int, Int) -> (Int, Int)```\
***Definiáljuk a mirrorPointAroundOrigo függvényt amely tükröz egy pontot az origóra (a 0,0 koordinátára)!*** ```mirrorPointAroundOrigo :: (Int, Int) -> (Int, Int)```\
***Definiáljuk az isOrigo függvényt amely eldönti hogy a kapott pont az origó-e (a 0,0 koordináta)! A feladathoz használjatok mintaillesztést és ne használjatok ==-t!*** ```isOrigo :: (Int, Int) -> Bool```

### Tesztesetek:
```haskell
addPoints (1,2) (3,4) == (4,6)
addPoints (0,0) (1,10) == (1,10)
addPoints (-1, -2) (1,2) == (0,0)
mirrorPointAroundOrigo (1,2) == (-1, -2)
mirrorPointAroundOrigo (-1, 4) == (1, -4)
mirrorPointAroundOrigo (0,0) == (0,0)
isOrigo (0,0) == True
isOrigo (1,1) == False
isOrigo (0,1) == False
```

## Bónusz Feladat - Ad-hoc Polimorfizmus
> EZT A FELADATOT NEM KÖTELEZŐ MEGCSINÁLNI!

> Emlékeztető:
> - A Num kikötés polimorf típusokra enged számszerű műveleteket használni (+, *)
> - Az Eq kikötés polimorf típusokra enged egyenlőséget használni (==)
### Feladatok:
***Definiáljuk a polyAdd függvényt amely összead három polimorf számot*** ```polyAdd :: Num a => a -> a -> a -> a```
- ***Teszteljük le, hogy ez működik e különböző számtípusokkal is!***
- ***Figyeljük meg, hogy más típusok esetén az eredmény is más típusú!***

***Definiáljuk a eqAndAdd függvényt amely két polimorf értékről eldönti hogy egyenlő-e és összeadja őket*** ```eqAndAdd :: (Eq a, Num a) => a -> a -> (Bool, a)```
- ***Teszteljük le, hogy ez működik e különböző számtípusokkal is!***
- ***Figyeljük meg, hogy a két különböző kikötés egy tuple-szerű szerkezetbe kerül bele.***
- - ***Teszteljük le az alábbi típusszignatúrával is:*** ```Eq a => Num a => a -> a -> (Bool, a)```


### Tesztesetek:
```haskell
polyAdd 1 2 3 == 6
polyAdd 1.5 2.5 3.5 == 7.5
eqAndAdd 3 3 == (True, 6)
eqAndAdd 3 2 == (False, 5)
eqAndAdd 1.5 1.5 == (True, 3.0)
```