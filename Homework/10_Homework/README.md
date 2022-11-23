# 10. Házi Feladat

A házi feladatot egy Homework10 nevű modulként kell beadni. Figyeljetek arra, hogy a függvényeitek a module szóval egy "oszlopba" kerüljenek, azaz ne legyenek beljebb húzva! Minden definiálandó függvényhez adjuk meg a hozzá tartozó típus szignatúrát is! (Ezt most megadtam, a saját modulotokba is másoljátok be a definíciótok elé.)

Háromállású Bool
Vegyük az alábbi adatszerkezetet:

data TriBool = Yes | No | Maybe deriving (Eq, Show)
Definiáljunk rá Ord instance-ot manuálisan! A konstruktorok közül a Yes a legnagyobb és a No a legkisebb.
Definiáljuk a triAnd és triOr függvényeket amelyek logikai műveleteket végeznek el háromállású boolokra! (triOr :: TriBool -> TriBool -> TriBool, triAnd :: TriBool -> TriBool -> TriBool)
Definiáljuk az incMonotonityTest ami megállapítja hogy a lista növekvő-e! Ehhez a lista első n elemét vizsgálja. Ha a listának ennél több eleme van nem tudhatjuk a többi rész monoton-e, ezért ekkor adjunk vissza Maybe-t. Ha találunk az első n elemben ellenpéldát, akkor nem monoton növekvő, ha a lista hossza kevesebb mint n és azon monoton növekvő akkor az egész lista monoton növekvő. (incMonotonityTest :: Ord a => Int -> [a] -> TriBool)
Tesztesetek:

triOr Maybe No == Maybe
triOr Yes Maybe == Yes
triAnd Yes Maybe == Maybe
triAnd No Maybe == No
incMonotonityTest 3 [1,2,3] == Yes
incMonotonityTest 3 [1,2,3,4] == Maybe
incMonotonityTest 3 [1,2,3,0] == Maybe
incMonotonityTest 4 [1,2,3,0] == No
incMonotonityTest 10 [1..] == Yes
Golf Kifejezések
A golfban a pontozás az alapján megy, hogy hány ütésből tudta valaki belőni a labdát a lyukba - minél kevesebb annál jobb. Ehhez az alábbi terminológiát szokás használni:

Ace - Amikor valaki első ütésre belövi a labdát
Albatross - Amikor valaki a lyuk limitje alatt legalább 3-al lőtte be a golflabdát
Eagle - Amikor valaki a lyuk limitje alatt 2-vel lőtte be a labdát
Birdie - Amikor valaki a lyuk limitje alatt 1-el lőtte be a labdát
Par - Amikor valaki a lyuk limitjével egyező lövésszámmal lőtte be a golflabdát
Bogey - Amikor valaki túllépi a limitet
Definiáljunk egy GolfScore adattípust, aminek a fenti konstruktorai vannak. A Bogey-nak legyen egy Int paramérere ami azt reprezentálja, mennyivel léptük túl a limitet.

Definiáljuk a score függvényt ami egy limit és egy lövésszám alapján kiszámolja mi a pontszáma valakinek! (score :: Int -> Int -> GolfScore)
Definiáljunk Ord és Eq instance-ot kézzel a típusra! Az Ord instance-nál a jobb pontszámok legyen a nagyobbak (pl Albatross > Eagle)
Tesztesetek:

score 2 3 == Bogey 1
score 3 2 == Birdie
score 4 1 == Ace
score 103 1 == Ace
score 103 2 == Albatross
score 103 100 == Albatross
score 103 101 == Eagle