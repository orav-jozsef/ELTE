# Előzetes tudnivalók
## Használható segédanyagok:
- [Haskell könyvtárak dokumentációja](http://lambda.inf.elte.hu/haskell/doc/libraries/),
- [Hoogle](http://lambda.inf.elte.hu/haskell/hoogle/),
- [a tárgy honlapja](http://lambda.inf.elte.hu/Index.xml), és a
- [Haskell szintaxis összefoglaló](http://lambda.inf.elte.hu/CheatSheet.xml).
- **Más segédezköz nem használható**.

> Ha bármilyen kérdés, észrevétel felmerül, azt a gyakorlatvezetőnek kell jelezni, nem a diáktársaknak!

> A feladatsor megoldására 20 perc áll rendelkezésre (+ 2 perc feltöltésre)

> A feladatok tetszőleges sorrendben megoldhatóak. A pontozás szabályai a következők:

> Minden teszten átmenő megoldás ér teljes pontszámot.\
> Funkcionálisan hibás (valamelyik teszteseten megbukó) megoldás nem ér pontot.\
> Fordítási hibás vagy hiányzó megoldás esetén a teljes megoldás 0 pontos.\
> Ha hiányos/hibás részek lennének a feltöltött megoldásban, azok kommentben szerepeljenek.

> Tekintve, hogy a tesztesetek, bár odafigyelés mellett íródnak, nem fedik le minden esetben a függvény teljes működését, határozottan javasolt még külön próbálgatni a megoldásokat beadás előtt!

> Az elméleti kérdésekre adott választ a forráskódban kell elhelyezni, kommentben. Minden függvénynek meg kell adni a típusszignatúráját is. A függvények elvárt neve és típusa zárójelben meg van adva. Zarthelyi1 néven kell deklarálni a modult. A .hs fájlt .zip-be tömörítve kell beadni.

## Elméleti kérdések (1 pont / kérdés)
- Mit jelent a lusta kiértékelés?
- Írj egy példát ad-hoc polimorfizmusra! (Elég a típusszignatúra)

## Gyakorlati feladatok
### Beléptetés (1 pont)
***Egy helységbe csak a seniorok, vagy akik sürgős esetben járnak el léphetnek be.***\
***Seniornak számít aki 60 fölött van.***\
***Deffiniáld az access függvényt, ami ezt a beléptetést végzi el.***\
***Ha az adott személy beléphet a függvény True-val térjen vissza egyébként False-al.***

```access :: (Int,Bool) -> Bool```
```haskell
not (access (60,False))
not (access (59,False))
access (5,True)
access (61,False)
access (60,True)
```

### Műveletket vagy mik? (1 pont)
***Írj egy függvényt, ami 3 paraméterrek dolgozik.***\
***Az első paraméter egy Char típusú műveleti jelet kap a másik két paraméteren 1-1 számot vár el.***\
***A függvény '+' és '-' esetén elvégzi az összeadást/kivonást, minden más esetben összeszorozza a két számot.***

```operatorOrWhat :: Num a => Char -> a -> a -> a```
```haskell
operatorOrWhat '+' 1 2 == 3
operatorOrWhat '-' 1 2 == (-1)
operatorOrWhat ' ' 1 2 == 2
operatorOrWhat '*' 1 2 == 2
operatorOrWhat '/' 1 2 == 2
operatorOrWhat '&' 0 8 == 0
operatorOrWhat 't' (-5) 6 == (-30)
````

### Relatív prímek (2 pont)
***Írj függvényt, ami megadja, hogy két szám relatív prím-e egymáshoz viszonyítva.***\
***Relatív prímek azok a számpárok, akiknek egyedül az 1 a pozitív közös osztójuk.***
> Segítség: Használhatjuk a ```min :: Ord a => a -> a -> a``` függvényt amely két szám közül a kisebbiket adja vissza!

```relativePrimes :: Int -> Int -> Bool```
```haskell
relativePrimes 12 13 
relativePrimes 12 25
relativePrimes 13 32
relativePrimes 101 203
not (relativePrimes 3 15)
not (relativePrimes 4 2)
not (relativePrimes 102 3)
```