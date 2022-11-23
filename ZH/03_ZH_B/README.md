3. ZH - B Csoport
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

f :: a -> b -> [a] -> [b]
g :: (Int -> Int) -> [Int] -> [Int]
h :: (a -> b) -> ([a] -> [b])
i :: a -> (b) -> [a] -> [b]
j :: (a -> (b -> [a]) -> [b])
Gyakorlati feladatok
Párosítás (2 pont)
Definiáld a zipIf függvényt, amely két listából rendezett párokat tartalmazó listát készít. Az eredményben csak azok az azonos indexeken szereplő értékek legyenek benne, amelyekre a két függvényt alkalmazva az eredményük egyenlő. A függvény csak a rövidebb lista hosszáig működik.

A tesztek futtatásához szükséges a Data.List modult importálni.

zipIf :: Eq b => (a -> b) -> (c -> b) -> [a] -> [c] -> [(a,c)]
null (zipIf even odd [1..20] [])
null (zipIf even odd [] [2..21])
null (zipIf even even [1..20] [2..21])
zipIf (> 2) (< 5) [1..10] [10,9..1] == [(1,10),(2,9),(7,4),(8,3),(9,2),(10,1)]
zipIf (**2) (**2) [1..10] [(-1),(-2)..] == [(1.0,-1.0),(2.0,-2.0),(3.0,-3.0),(4.0,-4.0),(5.0,-5.0),(6.0,-6.0),(7.0,-7.0),(8.0,-8.0),(9.0,-9.0),(10.0,-10.0)]
zipIf (^2) (^2) [1,2..] [(-1),(-2)..(-5)] == [(1,-1),(2,-2),(3,-3),(4,-4),(5,-5)]
zipIf (`isPrefixOf` "alma") ("a" `isSuffixOf` ) ["almafa","al","a","alk","Halskell","Lager"] ["alm","a","alma","C#","amla","Ser"] == [("almafa","alm"),("al","a"),("a","alma"),("alk","C#"),("Lager","Ser")]
Lista darabolása (3 pont)
Adott egy predikátum és egy lista. Adjuk meg azt a függvényt, amely kap egy predikátumot, egy listát és azt darabokra szeleteli! A szeletek sorozatában a feltételnek megfelelő, majd a feltételnek nem megfelelő csoportok váltják egymást az eredeti lista sorrendjének megfelelően. Mindig az igaz állítással kezdődik a listák sorrendje.

sliceBy :: (a -> Bool) -> [a] -> [[a]]
sliceBy odd [] == []
sliceBy odd [1..5] == [[1],[2],[3],[4],[5]]
sliceBy odd [1,3,2,4,5,7,4,6] == [[1,3],[2,4],[5,7],[4,6]]
sliceBy even [1,3,2,4,5,7,4,6] == [[],[1,3],[2,4],[5,7],[4,6]]
sliceBy ((/= 0).(`mod` 5)) [1..10] == [[1,2,3,4],[5],[6,7,8,9],[10]]
sliceBy (`elem` "aeiou") "Nem minden tarka fajta szarka farka tarka, csak a tarka farku szarkafajta szarka farka tarka." == ["","N","e","m m","i","nd","e","n t","a","rk","a"," f","a","jt","a"," sz","a","rk","a"," f","a","rk","a"," t","a","rk","a",", cs","a","k ","a"," t","a","rk","a"," f","a","rk","u"," sz","a","rk","a","f","a","jt","a"," sz","a","rk","a"," f","a","rk","a"," t","a","rk","a","."]
take 30 (sliceBy (\x -> x `mod` 5 > 1) [0..]) == [[],[0,1],[2,3,4],[5,6],[7,8,9],[10,11],[12,13,14],[15,16],[17,18,19],[20,21],[22,23,24],[25,26],[27,28,29],[30,31],[32,33,34],[35,36],[37,38,39],[40,41],[42,43,44],[45,46],[47,48,49],[50,51],[52,53,54],[55,56],[57,58,59],[60,61],[62,63,64],[65,66],[67,68,69],[70,71]]
take 10 (sliceBy (\x -> x `mod` 5 < 2) [0..]) == [[0,1],[2,3,4],[5,6],[7,8,9],[10,11],[12,13,14],[15,16],[17,18,19],[20,21],[22,23,24]]