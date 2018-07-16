(*Demo to check the shadowing of variables in ML*)

val a = 10
(* a - int, a -> 10 *)

val b = 1 + 10
(* a -> 10, b - int, b -> 20 *)

val c = a
(* ... c -> 10 *)
val d = c

val a = 100
(* val a shadowed *)

val c = a
val e = c
(* d -> 100*)

val d = e;