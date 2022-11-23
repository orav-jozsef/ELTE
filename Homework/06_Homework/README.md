6. Házi Feladat
A házi feladatot egy Homework6 nevű modulként kell beadni. Figyeljetek arra, hogy a függvényeitek a module szóval egy "oszlopba" kerüljenek, azaz ne legyenek beljebb húzva! Minden definiálandó függvényhez adjuk meg a hozzá tartozó típus szignatúrát is! (Ezt most megadtam, a saját modulotokba is másoljátok be a definíciótok elé.)

1. Feladat - Magasabb rendű függvények
Definiáljuk a propEq függvényt amely kap két polimorf típusú értéket és egy függvényt paraméterül. A függvény ezeket az értékeket egy olyan típusú értékre alakítja át, melyre van Eq definiálva! Átalakítás után döntsük el, ezek az értékek egyenlőek-e! (propEq :: Eq b => a -> a -> (a -> b) -> Bool)
Definiáljuk a sumVia függvényt amely egy listát és egy függvényt kap paraméterül. A függvény a lista elemeit át tudja alakítani számszerű típusokká. Átalakítás után adjuk össze ezeket az elemeket! (sumVia :: Num b => (a -> b) -> [a] -> b)
Definiáljuk a concatTuples függvényt amely egy tuplet kap és egy függvényt ami a tuple egyes elemeit listává alakítja! A listákká való alakítás után fűzzük össze a két listát! (concatTuples :: (a,a) -> (a -> [b]) -> [b])
Definiáljuk a concatWith függvényt amely egy listányi elemet és a lista azon elemeiből egy listába képző függvényt visszaadó függvényt kap paraméterül. Az elemenként generált listákat fűzzük össze egy nagy listába! (concatWith :: (a -> [b]) -> [a] -> [b])
Tesztesetek:

propEq 1 2 (\x -> abs x) == False
propEq (-1) 1 (\x -> abs x) == True
sumVia (\x -> length x) ["alma", "körte"] == 9
sumVia (\x -> x + 1) [1,2,4] == 10
sumVia (\x -> x) [1,2,3] == 6
concatTuples (1,2) (\x -> [x]) == [1,2]
concatTuples (1,2) (\x -> [x,x]) == [1,1,2,2]
concatTuples (3,2) (\x -> replicate x x) == [3,3,3,2,2]
concatWith (\x -> x) [[1,2,4],[],[4,5]] == [1,2,4,4,5]
concatWith (\x -> [x,x]) [1,2,3,4,5] == [1,1,2,2,3,3,4,4,5,5]
concatWith (\x -> replicate x x) [1,2,3,4,5] == [1,2,2,3,3,3,4,4,4,4,5,5,5,5,5]
2. Feladat - Lambda függvények
Írjuk be az alábbi kódrészletet a fájlunkba:

function1 :: (Int -> Int) -> Int
function1 g = g 13

function2 :: (Int -> Int -> Int) -> Int
function2 g = 2 * (g 25 11)

function3 :: (Int -> Int) -> (Int -> Int) -> Int
function3 g h = g 14 + h 15

function4 :: (Int -> Int) -> (Int -> Int) -> Int
function4 g h = g (h 1 + h 2) + g 3

function5 :: (Int -> Int -> Int) -> (Int -> Int) -> Int
function5 g h = g (h 1) (g 1 2) + h (g 3 4)
Definiáljuk az lambda1, lambda2, lambda3, lambda4 és lambda5 Int típusú értékeket, amelyek meghívják a fenti function1, function2, function3, function4 és function5 függvényeket! Példa:

function6 :: (Int -> Int) -> Int
function6 g = g 0

lambda6 :: Int
lambda6 = function6 (\x -> x + 14)
A feladatok során a lambdákban mindkét paramétert használjuk fel az eredmény számításához. A különböző függvények eredménye legyen:

Függvény	Eredmény
lambda1	26
lambda2	28
lambda3	13
lambda4	tetszőleges
lambda5	tetszőleges