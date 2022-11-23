# 2. Büntető Feladat - R-Fa Implementálása

R-Fa implementálása
Feladat ismertetése I. - Minimum Bounding Box
A feladat során egy kétdimenziós R-fát fogunk implementálni. Az R-fák több dimenziós terek reprezentálására
képesekm, ahol egyszerűen és optimálisan kereshetünk objektumokat a pozíciójuk alapján. Minden csúcs
tartalmaz egy úgynevezett Minimum Bounding Box-ot vagy röviden MBB-t, ami a legkisebb téglalap, amibe
az összes gyereke belefér.
Az MBB-t a jobb alsó és a bal felső sarka segítségével fogjuk definiálni:
data MBB = MBB Int Int Int Int deriving (Eq, Show)
bottomRight :: MBB -> (Int, Int)
bottomRight (MBB brx bry _ _) = (brx, bry)
topLeft :: MBB -> (Int, Int)
topLeft (MBB _ _ tlx tly) = (tlx, tly)
Előkészítő Feladat: MBB Unió
A fák használata során fontos lesz két db MBB-ből egyet csinálni. Definiáljuk a mbbUnion függvényt, amely
két darab MBB-nek megadja a közös MBB-ét!
(A feladatban lényegében két darab téglalapot kapunk paraméterként és meg kell adni a legkisebb téglalapot
amibe mindkettő benne van)
mbbUnion :: MBB -> MBB -> MBB
Néhány teszteset:
mbbUnion (MBB 1 0 0 1) (MBB 2 0 0 2) == MBB 2 0 0 2
mbbUnion (MBB 1 0 0 1) (MBB 1 1 0 2) == MBB 1 0 0 2
mbbUnion (MBB 3 1 0 2) (MBB 2 0 1 3) == MBB 3 0 0 3
mbbUnion (MBB 3 0 2 2) (MBB 1 0 0 2) == MBB 3 0 0 2
mbbUnion (MBB 2 2 1 3) (MBB 2 1 1 2) == MBB 2 1 1 3
Feladat ismertetése II. - R-Fa
Egy R-fának (két dimenziós testek tárolása esetén) legfeljebb 3 gyereke lehet, ezért magát a fát rekurzívan
fogjuk modellezni (hasonlóan a listához, vagy egyéb fákhoz):
data RTree a =
Leaf MBB a |
Node1 MBB (RTree a) |
Node2 MBB (RTree a) (RTree a) |
Node3 MBB (RTree a) (RTree a) (RTree a)
deriving (Eq, Show)
A fa egyszerű bejárásához érdemes az MBB-ét tudni a gyerekeinek, ehhez hasznos lesz az alábbi segédfüggvény:
getMBB :: RTree a -> MBB
getMBB (Leaf mbb _) = mbb
getMBB (Node1 mbb _) = mbb
getMBB (Node2 mbb _ _) = mbb
getMBB (Node3 mbb _ _ _) = mbb
A fában való keresés egyszerű, megnézzük melyik gyermekének MBB-je tartalmazza magában a keresett
MBB-t, ha igen a fában az adott ágon tovább keresünk, ha nem, akkor azt az ágat nem nézzük meg. Mivel
egy R-fa ágán belül az MBB-k fedhetik egymást, ezért esetenként több ágat is meg kell nézni.
1
1. Feladat - R-Fa keresés
Definiáljuk az rTreeSearch és a allInMBB függvényeket. Az rTreeSearch függvény keressen olyan leveleket,
amelyek megegyeznek az adott MBB-vel, és adja vissza az annak megfelelő elemet (ha van olyan). Az
allInMBB függvény adja vissza a fából az összes elemet ami az MBB-ben benne van.
Figyeljünk mindkét függvénynél arra, hogy felesleges ágakat ne járjon be!
rTreeSearch :: MBB -> RTree a -> Maybe a
allInMBB :: MBB -> RTree a -> [a]
Néhány teszteset (A tesztesetek nincsenek normálisan tördelve):
rTreeSearch (MBB 1 0 0 1) (Leaf (MBB 1 0 0 1) 10) == Just 10
rTreeSearch (MBB 1 0 0 1) (Leaf (MBB 1 0 0 2) 10) == Nothing
rTreeSearch (MBB 2 1 1 2) (Node1 (MBB 2 0 1 3) (Leaf (MBB 2 1 1 2) 10)) == Just 10
rTreeSearch (MBB 2 1 1 2) (Node2 (MBB 2 0 1 3) (Leaf (MBB 6 6 6 6) 20) (Leaf (MBB 2 1 1 2) 10))
== Just 10
allInMBB (MBB 2 0 0 2) (Leaf (MBB 3 0 0 2) 10) == []
allInMBB (MBB 2 0 0 2) (Node2 (MBB 3 0 0 2) (Leaf (MBB 1 0 0 2) 10) (Leaf (MBB 3 0 2 1) 20))
== [10]
allInMBB (MBB 1 0 0 1) (Node2 (MBB 2 0 0 2) (Leaf (MBB 1 0 0 2) 10) (Leaf (MBB 2 0 0 1) 20))
== []
allInMBB (MBB 2 0 0 2) (Node2 (MBB 2 0 0 2) (Leaf (MBB 1 0 0 2) 10) (Leaf (MBB 2 0 0 1) 20))
== [10,20]
2. Feladat - R-Fa Beszúrás
A beszúrás művelete trükkösebb R-fa esetén. Ha nincs olyan részfa ahova be tudnánk szúrni, az egyiket meg
kell nagyobbítani, ilyen esetben azt a részfát kell kiválasztanunk, amelynek a legkisebbel nőne a területe, ha
megnagyobbítanánk (relatív méretben), hogy beleférjen.
Definiáljuk az enlargementHeuristic függvényt, amely eldönti egy MBB-ről, hogy a területének hány %-val
kell megnövelni, hogy beleférjen a második paraméterként kapott MBB.
enlargementHeuristic :: MBB -> MBB -> Double
Néhány teszteset:
enlargementHeuristic (MBB 1 0 0 1) (MBB 1 0 0 1) == 0.0
enlargementHeuristic (MBB 1 0 0 1) (MBB 2 0 0 1) == 1.0
enlargementHeuristic (MBB 2 0 0 1) (MBB 1 0 0 1) == 0.0
enlargementHeuristic (MBB 2 0 0 2) (MBB 3 0 0 3) == 1.25
enlargementHeuristic (MBB 2 0 0 2) (MBB 2 0 0 3) == 0.5
Beszúrás folyamán mindig azt a részfát kell kiválasztanunk, amit a legkevésbé kéne megnagyobbítani (a
nagyítási heurisztika alapján), hogy beleférjen az elemünk. Ha levélhez jutunk, akkor a levélből és a a
beszúrandó elemből két darab részfát kell csinálnunk.
Definiáljuk a rebalanceMBB és insertR függvényeket. A rebalanceMBB függvény számolja újra egy R-fa (és
az összes gyereke) MBB-jét. Az insertR függvény keresse meg azt a részfát ahova be kéne szúrni az elemet
és szújra be!
rebalanceMBB :: RTree a -> RTree a
insertR :: MBB -> a -> RTree a -> RTree a
Néhány teszteset (a tesztesetek nincsenek normálisan tördelve):
rebalanceMBB (Node1 undefined (Leaf (MBB 1 0 0 1) 10)) == Node1 (MBB 1 0 0 1) (Leaf (MBB 1 0 0 1) 10)
insertR (MBB 1 0 0 1) 20 (Leaf (MBB 2 0 0 2) 10)
== Node2 (MBB 2 0 0 2) (Leaf (MBB 2 0 0 2) 10) (Leaf (MBB 1 0 0 1) 20)
2
3. Feladat - Laposbeszúrás és R-Fa Populáció
Az előző feladatban implementált R-Fa beszúrás nem feltétlenül helyoptimális, és a benne való keresés sem a
leggyorsabb, mivel nem használja ki azt a tulajdonságát az R-fáknak, hogy egy csúcsban, a részfák száma
növelhető.
Definiáljuk a flatInsertR és a populateR függvényeket. A flatInsertR függvény csinálja ugyanazt, mint
az insertR, viszont ha van hely egy csúcsban új részfa beszúrására, akkor inkább szúrjon be egy új részfát a
beszúrandó elemmel benne a fa elejére! A populateR függvény az előző függvény segítségével építsen fel
egy teljes R-fát egy listányi MBB-ből és elemből! Ha nincs elem a listában dobjunk kivételt!
flatInsertR :: MBB -> a -> RTree a -> RTree a
populateR :: [(MBB, a)] -> RTree a
Tesztesetek a csatolt teszt fájlban találhatóak.