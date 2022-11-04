# 1. Házi Feladat
> A feladatokat egy Homework1 nevű modulként kell beadni, a TMS a zip fájlokat fogadja el, így a kész kódot tömörítsétek zip-be, és úgy adjátok be. A feladatok végén zárójelben látható néven definiáljátok a függvényeket, kifejezéseket. Ügyeljetek a helyes típusszignatúrára!

## 1. feladat - Kifejezések
***Adjunk meg két Int típusú kifejezést! (intExpr1, intExpr2)***\
***Adjunk meg egy Int típusú kifejezést amely az előző két kifejezés hányadosa! (intExpr1DivIntExpr2)***\
***Adjunk meg két String típusú kifejezést! (stringExpr1, stringExpr2)***\
***Adjunk meg két Bool típusú kifejezést! (boolExpr1, boolExpr2)***

## 2. feladat - Paraméteres függvények
***Adjunk meg egy függvényt ami 3 db Int-et vár paraméterként és azokat összeszorozza! (mult3Ints)***\
***Adjunk meg egy függvényt ami 2 db Int-et vár paraméterként és eldönti, hogy 1566 osztható-e mindkét számmal! A visszatérési érték típusa Bool legyen! Hint: Használjátok a logikai és operátort! && (is1566divisibleBy)***\
***Adjunk meg egy függvényt ami 3 db Bool-t vár paraméterként és eldönti, legalább egy True-e belőlük! Hint: Használjátok a logikai vagy operátort! || (threeOr)***

### Tesztesetek
> Az alábbi összes parancsnak True-ra kell kiértékelődnie a GHCi-ben, hogy helyes legyen a megoldás:
```haskell
mult3Ints 5 10 15 == 750
mult3Ints 2 3 4 == 24
is1566divisibleBy 10 4 == False
is1566divisibleBy 18 27 == True
threeOr True False False == True
threeOr False False False == False
threeOr True True True == True
```

## 3. feladat - 13
***Másoljátok be az alábbi három függvényt a házi feladatotokba:***
```haskell
inc :: Int -> Int
inc x = x + 1

triple :: Int -> Int
triple x = x * 3

zero :: Int
zero = 0
```
***Ennek a három függvénynek a segítségével (inc, triple, zero) csináljatok két Int típusú kifejezést amelynek az értéke 13, ha kiértékelitek GHCi-ben! A feladathoz más függvény nem használható, csak az adott három!***

## 4. Feladat - Szöveges Feladat
***Jancsinak vannak 17 literes hordói és 2514 liter vize. Ha jancsi elkezdei egyesével feltölteni a kancsókat vízzel akkor***
- ***Hány darab kancsóra lesz szüksége? (Int típusú érték. Hint: Használjatok div függvényt!) (howManyJars)***
- ***Mennyi víz lesz az utolsó kancsóban? (Int típusú érték. Hint: Használjatok mod függvényt!) (howMuchInLastJar)***

## Bónusz Feladat
> Az alábbi feladat nem kötelező a házi feladathoz és nem kell beadni. Ha valaki mégis megcsinálja gyakorlás szempontjából szívesen kijavítom neki.

***Definiáljuk az isLeapYear függvényt, amely egy paraméterül kapott évről (Int) eldönti, hogy az szőkőév-e.***

- ***Egy évet szökőévnek tekintünk, ha osztható 4-el és***
- - ***vagy nem osztható 100-al***
- - ***vagy osztható 400-al***

### Tesztesetek
> Az alábbi összes parancsnak True-ra kell kiértékelődnie a GHCi-ben, hogy helyes legyen a megoldás:
```haskell
isLeapYear 1996 == True
isLeapYear 2016 == True
isLeapYear 2008 == True
isLeapYear 1700 == False
isLeapYear 2022 == False
isLeapYear 2300 == False
```