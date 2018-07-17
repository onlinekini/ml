fun swap(pr : int * int) = 
    (#2 pr, #1 pr)

fun sumOfPairs(pr1 : int * int, pr2 : int * int) =
    #1 pr1 + #2 pr1 + #1 pr2 + #2 pr2


fun divMod(val1: int, val2: int) = 
    (val1 div val2, val1 mod val2)

fun sort(x: int * int) = 
    if (#1 x < #2 x)
    then x
    else swap(x)

(* val t = swap(4, 10) *)

val t = sort(4,3)

val s = sumOfPairs((2,3), (4,5))

val u = divMod(14,5)