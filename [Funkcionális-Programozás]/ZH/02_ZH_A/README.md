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

## Elméleti kérdések
- A lista heterogén vagy homogén tároló? Miért? (1 pont)
- Guardba miket lehet írni? (1 pont)

## Gyakorlati feladatok
### Komplex számok arculatváltása (1 pont)
***A komplex számok tanácsában eldöntötték, hogy az eddigi elavult tupleben való tárolás már túlságosan elavult,Így arculatváltásként listákban akarják magukat tárolni.***\
***Írj függvényt, ami megoldja ezt a problémát.***

```faceLift :: Num a => [(a,a)] -> [[a]]```
```haskell
faceLift [] == []
faceLift [(1,1)] == [[1,1]] 
faceLift [(1,3),(5,6),(9,3)] == [[1,3],[5,6],[9,3]]
take 10 (faceLift [(a,a) | a <- [1..]]) == [[1,1],[2,2],[3,3],[4,4],[5,5],[6,6],[7,7],[8,8],[9,9],[10,10]]
```

### Komplex Számháború (1 pont)
***A komplex számok visszatértek tuple ábrázolásmódjukba, de ez nem nyerte el mindenki tetszését.***\
***Azoknak a komplex számoknak nem tetszik ez mód, akiknek a képzetes része nagyobb, mint a valós része, így ők inkább elhagyják az országot.***\
***Szűrjük ki a komplex számok nyilvántartásából ezeket a számokat.***

```complexRemover :: (Num a,Ord a) => [(a,a)] -> [(a,a)]```
```haskell
complexRemover [] == []
complexRemover [(1,1),(1,2),(9,5),(6,8),(1,3)] == [(1,1), (9,5)]
complexRemover [(1,1),(2,2),(3,3)] == [(1,1),(2,2),(3,3)]
take 5 (complexRemover [(5,x) | x <- [1..]]) == [(5,1),(5,2),(5,3),(5,4),(5,5)]
take 7 (complexRemover [(x,y) | x <- [1..], y <- ([1..x] ++ [x+1 .. 10]]) == [(1,1),(2,1),(2,2),(3,1),(3,2),(3,3),(4,1)]
```
### LegKomplexebb
***Az eltávozott komplex számok visszatértek és harcba bocsátkoztak a birodalmat uraló komplex számokkal.***\
***A harc folyamán csak a legerősebbek maradhatnak életben.***\
***Az azonos pozíción lévők vívnak meg egymással.***\
***Két komplex szám közül az az erősebb, akinek a valós és a képzetes részének összege a nagyobb.***\
***Írj függvényt, amely eldönti, kik maradnak életben a csata után.***\
***(Akik nem kűzdenek meg senkivel, automatikusan életben maradnak; egyenlő erőviszonyok mellet, mindkettő elesik.)***

```battle :: (Num a, Ord a) => [(a,a)] -> [(a,a)] -> [(a,a)]```
```haskell
battle [] [] == []
battle [(1,1)] [] == [(1,1)]
battle [] [(1,2)] == [(1,2)]
battle [(1,1)] [(1,2)] == [(1,2)]
battle [(1,1)] [(-1,3)] == []
battle [(1,1)] [(-1,3),(2,3)] == [(2,3)]
battle [(5,3),(4,4),(11,2),(6,1)] [(1,5),(9,10),(1,99),(0,6)] == [(5,3),(9,10),(1,99),(6,1)]
battle [(5,3),(4,4),(11,2),(6,1)] [(1,5),(9,10),(1,99),(0,6),(1,10),(-3,-1)] == [(5,3),(9,10),(1,99),(6,1),(1,10),(-3,-1)]
battle [(1,5),(9,10),(1,99),(0,6),(1,10),(-3,-1)] [(5,3),(4,4),(11,2),(6,1)] == [(5,3),(9,10),(1,99),(6,1),(1,10),(-3,-1)]
take 10 (battle [(x,x) | x <- [1..]] [(5,x) | x <- [1..]]) == [(5,1),(5,2),(5,3),(5,4),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11)]
```