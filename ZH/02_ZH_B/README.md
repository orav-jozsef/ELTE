2. ZH - B Csoport
2. ZH szerda 18:00 - 20:00 B csoport
Előzetes tudnivalók
Használható segédanyagok:

Haskell könyvtárak dokumentációja,
Hoogle,
a tárgy honlapja, és a
Haskell szintaxis összefoglaló.
Más segédeszköz nem használható!

Ha bármilyen kérdés, észrevétel felmerül, azt a gyakorlatvezetőnek kell jelezni, nem a diáktársaknak!

A feladatsor megoldására 20 perc áll rendelkezésre (+ 2 perc feltöltésre)

A feladatok tetszőleges sorrendben megoldhatóak. A pontozás szabályai a következők:

Minden teszten átmenő megoldás ér teljes pontszámot.
Funkcionálisan hibás (valamelyik teszteseten megbukó) megoldás nem ér pontot.
Fordítási hibás vagy hiányzó megoldás esetén a teljes megoldás 0 pontos.
Ha hiányos/hibás részek lennének a feltöltött megoldásban, azok kommentben szerepeljenek.
Tekintve, hogy a tesztesetek, bár odafigyelés mellett íródnak, nem fedik le minden esetben a függvény teljes működését, határozottan javasolt még külön próbálgatni a megoldásokat beadás előtt!

Az elméleti kérdésekre adott választ a forráskódban kell elhelyezni, kommentben. Minden függvénynek meg kell adni a típusszignatúráját is. A függvények elvárt neve és típusa meg van adva. Zarthelyi2 néven kell deklarálni a modult. A .hs fájlt .zip-be tömörítve kell beadni.

Elméleti kérdések (2 pont)
A tuple heterogén vagy homogén tároló? Miért? (1 pont)

Az alábbi mintaillesztések közül melyek illeszkedik rendezett párok listájára? (1 pont)

[x,y]
[(x,y)]
(x:xs)
[x:xs]
[(x:xs)]
((x,y):xs)
Gyakorlati feladatok
Prímadonnaválasztás (1 pont)
Prímiában a prímadonnaválasztásra neves családok érkeznek. Igazi prímadonna csak a 'P'-vel kezdődő családnevű prímek lehetnek. Kik lehetnek prímadonnák? Prímiában csak prímek élnek, így nem kell semmilyen más ellenőrzésen átesniük.

primadonna :: [(String,Int)] -> [(String,Int)]

primadonna [] == []
primadonna [("Prima",2),("P",3),("Keksz",7),("Priko",13)] == [("Prima",2),("P",3),("Priko",13)]
primadonna [("Keksz",7),("",11)] == []
primadonna [("Prime", 17)] == [("Prime", 17)]
primadonna [("Keksz",7),("Pista",13)] == [("Pista", 13)]
primadonna [("Keksz",7),("Keksz",29),("Pista",13)] == [("Pista", 13)]
primadonna [("Keiko",17),("Pali",23),("Prog",11),("Eila",37),("Pop",43)] == [("Pali",23),("Prog",11),("Pop",43)]
Prím Keksz (1 pont)
"Keksz" már 3-szor is próbálkozott a tesztesetekben, hogy prímadonna legyen, de sose sikerült neki. Kitalálta, hogy nevet változtat és "Peksz" lesz az ő új neve. Segítsünk csak "Keksz"-nek "Peksz"-nek lenni, mindenki más tartsa meg az eredeti nevét.

keksz2Peksz :: [(String,Int)] -> [(String,Int)]

keksz2Peksz [] == []
keksz2Peksz [("Prima",2),("P",3),("Keksz",7),("Priko",13)] == [("Prima",2),("P",3),("Peksz",7),("Priko",13)]
keksz2Peksz [("Prima",2),("P",3),("Keksz",7),("",11),("Priko",13)] == [("Prima",2),("P",3),("Peksz",7),("",11),("Priko",13)]
keksz2Peksz [("Keksz",7)] == [("Peksz",7)]
take 10 (keksz2Peksz (cycle [("Keksz",7),("Keksz",11),("Prima",2),("Kaz",13)])) == [("Peksz",7),("Peksz",11),("Prima",2),("Kaz",13),("Peksz",7),("Peksz",11),("Prima",2),("Kaz",13),("Peksz",7),("Peksz",11)]
keksz2Peksz [("Prime", 17)] == [("Prime", 17)]
keksz2Peksz [("Keksz",7),("Pista",13)] == [("Peksz",7),("Pista", 13)]
keksz2Peksz [("Kaksz",3),("Kolt",5),("Keksz",7),("Keigo",19),("Pista",17),("Keksz",11)] == [("Kaksz",3),("Kolt",5),("Peksz",7),("Keigo",19),("Pista",17),("Peksz",11)]
Relatív prímadonna (2 pont)
Az újdonsült Peksz nagyon boldog lett, hogy túl jutott az első fordulón és prímadonna lett. A második fordulón kaphatja meg a relatív prímadonna címet. Ebben a fordulóban csak azok maradhatnak bent a versenyben, akik száma nagyobb, mint az előző versenyzőé a listában. Kik lesznek a relatív prímadonnák?

relativePrimadonna :: [(String,Int)] -> [(String,Int)]

relativePrimadonna [] == []
relativePrimadonna [("Prima",2),("P",3),("Peksz",7),("Priko",13)] == [("Prima",2),("P",3),("Peksz",7),("Priko",13)]
relativePrimadonna [("Peksz",7)] == [("Peksz",7)]
relativePrimadonna [("Prime", 17)] == [("Prime", 17)]
relativePrimadonna [("Prista",13),("Peksz",7)] == [("Prista", 13)]
relativePrimadonna [("Priko",13),("Peksz",7),("P",3),("Prima",2)] == [("Priko",13)]
relativePrimadonna [("Priko",7),("Peksz",2),("P",3),("Prima",11)] == [("Priko",7),("Prima",11)]
relativePrimadonna [("Priko",7),("Peksz",2),("P",11),("Prima",3)] == [("Priko",7),("P",11)]
take 5 (relativePrimadonna (("P",11):("Pali",17):zip (cycle ["Priko","Pista","Prima","Peksz"]) (2:[x | x <- [3,5..], x /= 11, x /= 17, null [y | y <- [2.. x `div` 2], x `mod` y == 0]]))) == [("P",11),("Pali",17),("Pista",19),("Prima",23),("Peksz",29)]