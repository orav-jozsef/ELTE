7. Házi Feladat
A házi feladatot egy Homework7 nevű modulként kell beadni. Figyeljetek arra, hogy a függvényeitek a module szóval egy "oszlopba" kerüljenek, azaz ne legyenek beljebb húzva! Minden definiálandó függvényhez adjuk meg a hozzá tartozó típus szignatúrát is! (Ezt most megadtam, a saját modulotokba is másoljátok be a definíciótok elé.)

Magasabbrendű definiálása
Definiáljuk a spanWhile függvényt amely elválaszt egy listát kétfelé egy adott függvény alapján. Az első listába addig menyjenek az elemek amíg a predikátum igaz, a másodikba az összes többi! (spanWhile :: (a -> Bool) -> [a] -> ([a], [a])
Definiáljuk a pairwise függvényt amely páronként iterál végig egy listán és páronként alkalmaz egy függvényt! (pairwise :: (a -> a -> b) -> [a] -> [b])
Definiáljuk a takeWhilePair függvényt amely ugyanúgy működik, mint a takeWhile, csak páronként alkalmaz egy predikátumot! (takeWhilePair :: (a -> a -> Bool) -> [a] -> [a])
Definiáljuk a dropWhilePair függvényt amely ugyanúgy működik, mint a dropWhile, csak páronként alkalmaz egy predikátumot! (dropWhilePair :: (a -> a -> Bool) -> [a] -> [a])
Magasabbrendűek alkalmazása
Definiáljuk a descendingSegments függvényt amely egy listában a csökkenő szegmenseket adja vissza! (descendingSegments :: Ord a => [a] -> [[a]])

Tesztesetek:

spanWhile (>5) [10,6,7,8,9,10,1,2,3,4,5] == ([10,6,7,8,9,10],[1,2,3,4,5])
spanWhile (>5) [5,6,7,8,9,10,1,2,3,4,5] == ([],[5,6,7,8,9,10,1,2,3,4,5])
spanWhile (>5) [] == ([], [])
spanWhile (>5) [6] == ([6], [])
pairwise (+) [1,3,3,1] == [4,6,4]
pairwise (+) [1] == []
pairwise (-) [1..10] == replicate 9 (-1)
take 10 (pairwise (\x y -> x^2 + y^2) [1..]) == [5,13,25,41,61,85,113,145,181,221]
takeWhilePair (>) [10,9..1] == [10,9..1]
takeWhilePair (<) [1,2,3,4,5,4,6,7,8] == [1,2,3,4,5]
takeWhilePair (<=) [1,2,3,4,4,5,6,5] == [1,2,3,4,4,5,6]
takeWhilePair (>) [1] == [1]
dropWhilePair (>) [10,9..1] == []
dropWhilePair (<) [1,2,3,4,5,4,6,7,8] == [5,4,6,7,8]
dropWhilePair (<=) [1,2,3,4,4,5,6,5] == [6,5]
dropWhilePair (>) [1] == []
descendingSegments [10,9,8,7,8,7,6,5,4,5,6,7] == [[10,9,8,7],[8,7,6,5,4]]
descendingSegments [] == []
descendingSegments [1] == []
descendingSegments [1,2,1,3] == [[2,1]]
descendingSegments [3,3,3] == []
take 10 (descendingSegments $ cycle [3,2,1]) == replicate 10 [3,2,1]
Elméleti Kérdések
Mi az az η-redukció?
Mi az a curryzés?
Mi az a magasabb rendű függvény?
Miért nem fordul az alábbi kóddal?
f :: [Int] -> [Int]
f xs = map (+) xs