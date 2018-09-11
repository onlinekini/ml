
(* 
    fn : (int -> bool) -> int -> int 
    f returns a bool and retuns a function returning int.
*)
fun double_or_triple f =
    if f 10
    then fn x => x * 2
    else fn x => x * 3

val double = double_or_triple(fn x => x - 3 = 7) (* get a return function double as 10 - 3 = 7 *)
val six = double_or_triple(fn x => x - 3 = 4) 3 (* get a return function  and apply on arg = 3 *)

val triple1 = double_or_triple(fn x => x - 3 = 3) (* get a return function triple as 10 -3 != 3 *)
val triple = double_or_triple(fn x => x = 42) (* get a return function *)

val nine = (double_or_triple(fn x => x = 42)) 3 (* apply the function returned by double_or_triple on the arg = 3 *)
val nine_1 = triple1 3 (* apply the val triple on arg = 3 *)


(* t1 -> t2 -> t3 -> t4 means t1 -> (t2 -> (t3 -> (t4))) *)