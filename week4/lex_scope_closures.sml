(* 1 *) val x  = 1  (* value of x is mapped to 1 *)
(* 2 *) fun f y = x + y  (* this function adds ONE to the argument, Note x is 1 when the function was defined *)
(* 3 *) val x = 3 (* value of x is changed, this does not effect output of function  = x + y as x = 1 when the function was defined *)
(* 4 *) val y = 2 (* value of x has been shadowed in this environment not in the function CLOSURE *)
(* 5 *) val output1 = f (3); (* output = 4 *)
(* 6 *) val output2 = f ( x + y); (* output = 1 + (2 + 3) = 6, note that f (y) still adds 1 when the value of x has changed *)

(* 
    Function f created two parts 
    1. The codeor the body of the function
    2. the environment in which it was supposed to operate. So this environment had the value of x = 1
    This couple is called a CLOSURE.

    line #6 / #5, took the closure and applied it to the new environment
*)
