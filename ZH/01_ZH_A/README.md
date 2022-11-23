1. ZH - A Csoport
Előzetes tudnivalók
Használható segédanyagok:

Haskell könyvtárak dokumentációja,
Hoogle,
a tárgy honlapja, és a
Haskell szintaxis összefoglaló.
Más segédezköz nem használható.

Ha bármilyen kérdés, észrevétel felmerül, azt a gyakorlatvezetőnek kell jelezni, nem a diáktársaknak!

A feladatsor megoldására 20 perc áll rendelkezésre (+ 2 perc feltöltésre)

A feladatok tetszőleges sorrendben megoldhatóak. A pontozás szabályai a következők:

Minden teszten átmenő megoldás ér teljes pontszámot.
Funkcionálisan hibás (valamelyik teszteseten megbukó) megoldás nem ér pontot.
Fordítási hibás vagy hiányzó megoldás esetén a teljes megoldás 0 pontos.
Ha hiányos/hibás részek lennének a feltöltött megoldásban, azok kommentben szerepeljenek.

Tekintve, hogy a tesztesetek, bár odafigyelés mellett íródnak, nem fedik le minden esetben a függvény teljes működését, határozottan javasolt még külön próbálgatni a megoldásokat beadás előtt!

Az elméleti kérdésekre adott választ a forráskódban kell elhelyezni, kommentben. Minden függvénynek meg kell adni a típusszignatúráját is. A függvények elvárt neve és típusa zárójelben meg van adva. Zarthelyi1 néven kell deklarálni a modult. A .hs fájlt .zip-be tömörítve kell beadni.

Elméleti kérdések (1 pont / kérdés)
Mi az a totális (teljes) függvény?

Mi az a polimorfizmus? Adj rá példát is! (elég típusszignatúra)

Gyakorlati feladatok
Komplex Szorzás (1 pont)
Adott egy rendezett pár, mely egy a+bi komplex számot (a,b) formátumban, ahol a jelöli a valós részt és b a képzetest. Végezzük el két komplex szám összeszorzását! Két komplex szám összeszorzásának képlete : (a+bi) * (c+di) = ac-bd+(ad+bc)*i 

cMulitply :: (Int, Int) -> (Int, Int) -> (Int, Int)
cMulitply  (1, 0) (5,0) == (5,0)
cMulitply  (0, 5) (5,0) == (0,25)
cMulitply  (3, 2) (5,4) == (7,22)
Ésből vagy (1 pont)
Adjuk meg azt a függvényt, mely összeésel két paramétert, majd az eredményt és a harmadik paraméterért összevagyozza. Használjunk mintaillesztést! Az alábbi igazságtábla segítségünkre jöhet.

A	B	C	ANDTOOR(A,B,C)
Igaz	Igaz	Igaz	Igaz
Igaz	Igaz	Hamis	Igaz
Igaz	Hamis	Igaz	Igaz
Igaz	Hamis	Hamis	Hamis
Hamis	Igaz	Igaz	Igaz
Hamis	Igaz	Hamis	Hamis
Hamis	Hamis	Igaz	Igaz
Hamis	Hamis	Hamis	Hamis
andToOr :: Bool -> Bool -> Bool -> Bool
andToOr True True True
not (andToOr False True False)
andToOr True False True
Szelektív sokszorozás (2 pont)
Adott egy egész számokból álló lista. Adjuk meg egy paraméterül kapott listából azoknak a számoknak a 4-szeresét, melyek oszthatók 7-tel és 2-vel, de 3-mal nem!

selectiveMultiply :: [Int] -> [Int]
selectiveMultiply [1..100] == [56,112,224,280,392]
selectiveMultiply [] == []
selectiveMultiply [2,7,3,42,21,9] == []