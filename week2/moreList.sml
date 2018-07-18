fun sumList(xs: int list) =
    if null xs
        then 0
    else hd xs + sumList(tl xs)

val x = sumList([2,3,4])


fun listProduct(ps : int list) =
    if null ps 
        then 1
    else hd ps * listProduct(tl ps)


fun countDown(input : int) = 
    if input = 0
        then []
    else input  :: countDown(input -1)


fun appendList(xs: int list, ys : int list) =
    if null xs
        then ys
    else hd xs :: appendList(tl xs, ys)

fun sumOfPairs(xs : (int * int) list) =
    if null xs 
        then 0
    else #1 (hd xs) + #2 (hd xs) + sumOfPairs(tl xs)

fun firstOfPairs(xs : (int * int) list) = 
    if null xs
        then []
    else #1 (hd xs) :: firstOfPairs(tl xs)

fun secondsOfPairs(xs : (int * int) list) = 
    if null xs
        then []
    else #2 (hd xs) :: secondsOfPairs(tl xs)


val y = listProduct([3,4,5])

val z = countDown(7)

val aa = appendList(countDown(5), countDown(4))

val ab = sumOfPairs([(1,2), (2,2), (3,5)])

val ac = firstOfPairs([(1,2), (2,3), (3,4), (4,5)])

val ad = secondsOfPairs([(1,2), (2,3), (3,4), (4,5)])