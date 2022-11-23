3. Házi Feladat
A házi feladatot egy Homework3 nevű modulként kell beadni. Figyeljetek arra, hogy a függvényeitek a module szóval egy "oszlopba" kerüljenek, azaz ne legyenek beljebb húzva! Minden definiálandó függvényhez adjuk meg a hozzá tartozó típus szignatúrát is! (Ezt most megadtam, a saját modulotokba is másoljátok be a definíciótok elé.)

A feladatok során rekurzió vagy elágazás semmilyen formában nem használható, csak lista generáto.r

1. Feladat - Ad-hoc Polimorfizmus
A feladat folyamán a megfelő kikötéseket kihagytam a típusszignatúrából, ezeket nektek kell kitalálni mi megy oda! Ismert típusosztályok: Num, Eq, Ord. Ha valamelyikről elfelejtetted mit tud, GHCi-ben a :i paranccsal meg tudod nézni (pl :i Ord). A megfelelő típusosztályt a ??? helyére rakjátok!

Definiáljuk a mulThree függvényt amely három polimorf értéket összeszoroz! (mulThree :: ??? a => a -> a -> a -> a)
Defiiáljuk a comparison függvényt amely két értékről eldönti a kapott paraméterekről, hogy nagyobb egyenlő-e illetve kisebb egyenlő-e és ezt egy tuple-ben visszaadja! (comparison :: ??? a => a -> a -> (Bool {- első nagyobb egyenlő-e -} , Bool {- első kisebb egyenlő-e -}))
2. Feladat - Egyszerű Listák
Definiáljuk a tripletToList függvényt ami egy rendezett hármasból listát csinál! (tripletToList :: (a,a,a) -> [a])
Definiáljuk a second függvényt amely egy lista második elemét adja vissza (a függvénynek nem kell totálisnak lennie)! (second :: [a] -> a)
Definiáljuk a trim függvényt, amely eldobja egy lista első és utolsó elemét (a függvénynek nem kell totálisnak lennie)! (trim :: [a] -> [a])
Definiáljuk az isEmpty függvényt amely egy listáról eldönti üres-e! (isEmpty :: [a] -> Bool)
3. Feladat - Listagenerátorok
Definiáljuk a divisors függvényt amely egy szám osztóit generálja le (A lista a magát a számot és az 1-et ne tartalmazza)! (divisors :: Int -> [Int])
Definiáljuk a primes végtelen listát amely a prímszámokat adja vissza növekvő sorrendbe (segédfüggvény használata ajánlott!) (primes :: [Int])
Definiáljuk a permutate függvényt amely egy két elemű tuple-t csinál két lista összes lehetséges elemeinek permutációjából! (permutate :: [a] -> [b] -> [(a,b)])
Tesztesetek:

mulThree 1 2 3 == 6
mulThree 1.0 2.0 3.0 == 6.0
comparison 1 2 == (False, True)
comparison 1 1 == (True, True)
comparison () () == (True, True)
tripletToList (1,2,3) == [1,2,3]
length (tripletToList (undefined, undefined, undefined)) == 3
second [1,2,3] == 2
second [1..] == 2
trim [1..10] == [2..9]
trim [1,2] == []
isEmpty [] == True
isEmpty [1,2] == False
isEmpty [1..] == False
divisors 10 == [2,5]
divisors 20 == [2,4,5,10]
divisors 1 == []
head primes == 2
second primes == 3
head (drop 10 primes) == 31
permutate [1,2,3] [4,5,6] == [(1,4),(1,5),(1,6),(2,4),(2,5),(2,6),(3,4),(3,5),(3,6)]
permutate [] [1..] == []
Bónusz Feladat - Nem kötelező
Old meg a permutate feladatot, hogy mindkét paraméterére lusta legyen! Tesztesetek:
permutate [1..] [] == []
permutate [] [1..] == []
Definiáld a concatLists függvényt amely listába ágyazott listákat összefűz! (concatLists :: [[a]] -> [a]). Tesztesetek:
concatLists [[1,2,3], [4,5,6], [7,8,9,10], []] == [1..10]