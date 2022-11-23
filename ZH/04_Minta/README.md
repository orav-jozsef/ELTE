# 4. Minta ZH

Konkrét kérdések listája nincs, de pl
Konstruktor,
Data,
Típusosztály,
Deriving,
Instance,
Mintaillesztés,
Paraméteres Data be bele lehet kérdezni vagy esetleg olyanba mint ami a mintában van (ha arra nem tudod a választ megmondhatom),
rossz típusosztály derivingolása (pl odaírom deriving Num),
deriveolható típusosztályok felsorolása,
konstruktor alapú parciális/totálos-e a függvény




## Előzetes tudnivalók
### Használható segédanyagok:
- Haskell könyvtárak dokumentációja,
- Hoogle,
- a tárgy honlapja, és a
- Haskell szintaxis összefoglaló.
- Más segédeszköz nem használható.
> Ha bármilyen kérdés, észrevétel felmerül, azt a gyakorlatvezetőnek kell jelezni, nem a diáktársaknak!

> A feladatsor megoldására 35 perc áll rendelkezésre (+ 5 perc feltöltésre)

> A feladatok tetszőleges sorrendben megoldhatóak. A pontozás szabályai a következők:

> Minden teszten átmenő, a feladat kikötéseinek megfelelő megoldás érhet teljes pontszámot.\
> Funkcionálisan hibás (valamelyik teszteseten megbukó) megoldás nem ér pontot.\
> Fordítási hibás kód esetén a teljes zh 0 pontos.\
> Ha hiányos/hibás részek lennének a feltöltött megoldásban, azok kommentben szerepeljenek.

> Tekintve, hogy a tesztesetek, bár odafigyelés mellett íródnak, nem fedik le minden esetben a függvény teljes működését, határozottan javasolt még külön próbálgatni a megoldásokat beadás előtt!

> Az elméleti kérdésekre adott válaszokat a forráskódban kell elhelyezni, kommentben. Minden függvénynek meg kell adni a típusszignatúráját is. A függvények elvárt neve és típusa meg van adva. Zarthelyi4 néven kell deklarálni a modult. A .hs fájlt .zip-be tömörítve kell beadni.

## Elmélet (1 pont)
- Miért nem fordul az alábbi kód?
```haskell
data MyData = Ctor1 | Ctor2 Int | Ctor3 (Int -> Int) | Ctor4 String String deriving (Show)
```

## Gyakorlat
### Adattípus definiálása (1 pont)
- Definiáljuk a Rectangle datát aminek 1 db konstruktora van aminek ugyanaz a neve mint a típusnak és annak 4 db Int típusú paramétere. Az első két paraméter a bal alsó sarok X és Y koordinátáit a második két paraméter meg a jobb felső sarok X és Y koordinátáit reprezentálja.

- Kérjük meg a fordítót hogy automatikusan generáljon Eq instance-ot erre a típusra!

### Területszámítás (1 pont)
- Definiáljuk a rectangleArea függvényt amely egy téglalap területét kiszámolja! Ha a téglalap nem létezhet adjunk vissza Nothing-ot!
```haskell
rectangleArea :: Rectangle -> Maybe Int
```

#### Tesztek:
```haskell
rectangleArea (Rectangle 0 0 2 2) == Just 4
rectangleArea (Rectangle 1 1 3 3) == Just 4
rectangleArea (Rectangle 3 3 1 1) == Nothing
```

### Távolságtartó téglalapok (3 pont)
- Definiáljuk a noOverlappingRectangles függvényt amely megmondja egy téglalapok listájáról, hogy nincs-e benne kettő amik valamennyire is fedik egymást!
```haskell
noOverlappingRectangles :: [Rectangle] -> Bool
```

#### Tesztesetek: 
```haskell
noOverlappingRectangles [Rectangle 0 0 2 2, Rectangle 2 2 4 4, Rectangle 0 2 2 4, Rectangle 2 0 4 2]
not $ noOverlappingRectangles [Rectangle 0 0 2 2, Rectangle 2 2 4 4, Rectangle 0 2 2 4, Rectangle 2 0 4 2, Rectangle 3 3 5 5]
```