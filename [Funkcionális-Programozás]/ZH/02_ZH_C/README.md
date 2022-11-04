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
- Miért nem fordul az alábbi kód? [1, 2, "alma", 3, 4] !! 10 (1 pont)
- Az alábbiak közül melyek NEM függvények haskellben? (0.16 pont / helyes válasz)
- - =>
- - -> 
- - otherwise
- - where
- - ==
- - Int
- - 3

## Gyakorlati feladatok
> A feladatok egyikét legalább rekurzióval kell megoldani!

### Transzfiguráció (1 pont)
***A Harry Potter univerzumban a Roxfortban valaki véletlenül kikapcsolta a mágiát és ezért minden ómodian kell megoldani.***\
***Írjunk egy transfigureCatsToJars függvényt amely a macskákat (Macska stringek) csuporrá (Csupor string) alakítja!***

```transfigureCatsToJars :: [String] -> [String]```

#### Tesztesetek:
```haskell
transfigureCatsToJars ["Macska", "Egér"] == ["Csupor", "Egér"J
transfigureCatsToJars ["Macskaember", "Egér", "Macska"] == ["Macskaember", "Egér", "Csupor"]
transfigureCatsToJars [] == []
```

### Titkok kamrája (1 pont)
***Harrynek meg kell keresnie a titkok kamráját.***\
***Definiáljuk a findChamberOfSecrets függvényt amely egy listából kiszűri azokat a stringeket amelyek nem a Titkok szóval kezdődnek!***
> Segítség: Használjuk az isPrefixOf függvényt a Data.List modulból!

```findChamberOfSecrets :: [String] -> [String]```

#### Tesztesetek:
```haskell
findChamberOfSecrets ["Titkok Kamrája Bejárat", "WC Ajtó"] == ["Titkok Kamrája Bejárat"]
findChamberOfSecrets ["Titok Ház", "WC Ajtó", "Titkok Kamrája!!!"] == ["Titkok Kamrája!!!"]
findChamberOfSecrets ["Titkok Kamrája Kijárat", "Titkok Kamrája Bejárat", "Mágiaügyi Minisztérium"] == ["Titkok Kamrája Kijárat", "Titkok Kamrája Bejárat"]
```

### Mágia visszakapcsolása (2 pont)
***A varázslók rájöttek, hogyan tudnák a mágiát visszakapcsolni - pont időben a vizsgára.***\
***Definiáljuk a rebootMagic függvényt, amely egy listányi tuple-t kap paraméterül.***\
***A listában lévő tupleökben vegye azokat amelyek első eleme "Mágia" és állítsa azon tuple-ök második elemét True-ra!***

```rebootMagic :: [(String, Bool)] -> [(String, Bool)]```

#### Tesztesetek:
```haskell
rebootMagic [("Mágia", False), ("WC", True), ("Mágia", True)] == [("Mágia", True), ("WC", True), ("Mágia", True)]
rebootMagic [("WC", False), ("Mágia", False)] == [("WC", False), ("Mágia", True)]
rebootMagic [("Titkos Ajtó", False)] == [("Titkos Ajtó", False)]
```