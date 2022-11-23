3. ZH - A Csoport
Előzetes tudnivalók
Használható segédanyagok:

Haskell könyvtárak dokumentációja,
Hoogle,
a tárgy honlapja, és a
Haskell szintaxis összefoglaló.
Más segédeszköz nem használható.

Ha bármilyen kérdés, észrevétel felmerül, azt a gyakorlatvezetőnek kell jelezni, nem a diáktársaknak!

A feladatsor megoldására 25 perc áll rendelkezésre (+ 5 perc feltöltésre)

A feladatok tetszőleges sorrendben megoldhatóak. A pontozás szabályai a következők:

Minden teszten átmenő, a feladat kikötéseinek megfelelő megoldás érhet teljes pontszámot.
Funkcionálisan hibás (valamelyik teszteseten megbukó) megoldás nem ér pontot.
Fordítási hibás kód esetén a teljes zh 0 pontos.
Ha hiányos/hibás részek lennének a feltöltött megoldásban, azok kommentben szerepeljenek.

Tekintve, hogy a tesztesetek, bár odafigyelés mellett íródnak, nem fedik le minden esetben a függvény teljes működését, határozottan javasolt még külön próbálgatni a megoldásokat beadás előtt!

Az elméleti kérdésekre adott válaszokat a forráskódban kell elhelyezni, kommentben. Minden függvénynek meg kell adni a típusszignatúráját is. A függvények elvárt neve és típusa meg van adva. Zarthelyi3 néven kell deklarálni a modult. A .hs fájlt .zip-be tömörítve kell beadni.

Elméleti kérdés (0.2 pont/függvény)
Az alábbi típusok közül melyik jelöl magasabb rendű függvényt?

f :: (a -> b) -> [a] -> [b]
g :: [Int -> Bool] -> (a) -> (b)
h :: a -> (b -> [a]) -> b
i :: a -> b -> ([a] -> [b])
j :: a -> (b -> [a] -> [b])
Gyakorlati feladatok
Szűrés több információval (2 pont)
Definiáld az indexedFilter függvényt, amely egy listát és egy predikátumot kap paraméterül, és a predikátum alapján szűri a listát. A predikátum várja a lista egy elemét és indexét paraméterként!

indexedFilter :: Integral i => (i -> a -> Bool) -> [a] -> [a]
indexedFilter (const (>5)) [10,9..1] == [10,9..6]
indexedFilter (\i _ -> i < 4) ["alma", "banán", "citrom", "durian", "eper"] == ["alma", "banán", "citrom", "durian"]
indexedFilter (\i a -> i `mod` 2 == 0 && a > 5) [1..10] == [7,9]
indexedFilter (\i a -> i + a == 10) [1..10] == []
indexedFilter (\i _ -> i < 2) [1,1,1,div 1 0] == [1,1,1]
indexedFilter (\i a -> i < 2 && a == 3) (map (div 9) [3,2..0]) == [3]
take 75 (indexedFilter (\i a -> i < 100 && a /= 3) (cycle [1..4])) == take 75 (cycle [1,2,4])
Elem törlések (3 pont)
Definiáld a dipsOn függvényt! A függvény megtartja mindazon elemeket a listából, amelyek kisebbek az összes előtte lévő elemnél egy függvény alapján.

Példa:

dipsOn id [3,2,3,1,2,3] -> 
Első elem mindig van [3] ->
id 3 > id 2 igaz [3,2] ->
id 2 > id 3 hamis [3,2] marad ->
id 2 > id 1 igaz [3,2,1] ->
id 1 > id 2 hamis [3,2,1] marad ->
id 1 > id 3 hamis [3,2,1] marad.
Végig értünk, a megoldás [3,2,1]
dipsOn :: Ord b => (a -> b) -> [a] -> [a]
dipsOn id [3 :: Int,2,3,1,2,1,1,1,3] == [3,2,1]
dipsOn (1/) [3 :: Double,2,3,1,2,1,1,1,3] == [3]
take 10 (dipsOn id [(1000 :: Integer),999..]) == [1000,999,998,997,996,995,994,993,992,991]
take 10 (dipsOn sin [1000,999..]) == [1000,999,998,997,991,985,966,765,721,344]