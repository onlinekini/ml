(* 1 *) val x  = 1  (* value of x is mapped to 1 *)
(* 2 *) fun f y = x + y  (* this function adds ONE to the argument, Note x is 1 when the function was defined *)
(* 3 *) val x = 2 (* value of x is changed, this does not effect output of function  = x + y as x = 1 when the function was defined *)
(* 4 *) val y = 3 (* value of x has been shadowed in this environment not in the function CLOSURE *)
(* 5 *) val output1 = f (3); (* output = 4 *)
(* 6 *) val output2 = f ( x + y); (* output = 1 + (2 + 3) = 6, note that f (y) still adds 1 when the value of x has changed *)

(* Function f created two parts 
    1. The codeor the body of the function
    2. the environment in which it was supposed to operate. So this environment had the value of x = 1
    This couple is called a CLOSURE.
    line #6 / #5, took the closure and applied it to the new environment*)

(* ======================= Higher order functions with Func as a return param ======================= *)
val x = 1 (* The value of X here is irrelevat as X is evaluated in the LET expression *)
fun f y = 
    let 
        val x = y + 1
    in  
        fn z => x + y + z
    end (* take a Z and return y + 1 + y + z, because x = y + 1 in the let expression *)

val x = 3 (* this is irrelevant *)
val g = f 4 (* return a function that adds 9 to z *)
val y = 5 (* This too is irrelevant *)
val p = g 6 (* get 15 *)
val z = (f 8) 2 (* This adds 17 to the value of Z, hence output is 19 *)

(* ======================= Higher order functions with Func as an argument ======================= *)
fun f g = let val n = 5 in g 2 end (* n having value 5 does nothing to the function and can be safely ignored *)
val n = 4
fun h m = n + m (* now h adds 4 to m in this closure *)
val z = f h (* Even if n = 5 is in the let expression, 'h' has a closure which has n = 4 adding to m which is 2, hence output is 6*)
val n = 8 (* irrelevant as h adds 4 and does nothing *)
val q = f h (* output is still 6 *)