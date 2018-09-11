fun n_times(f,n,x) =
    if n = 0
    then x
    else f(n_times(f,n-1,x))

fun triple x = x * 3

fun triple_n_times_one (n,x) = n_times(triple, n,x)

fun triple_n_times_two (n,x) = 
    let
        fun triple_inner x = x * 3
    in
        n_times(triple_inner, n,x)
    end

(* we need this function only internally here, so use an internal LET expression, but BAD style*)
fun triple_n_times_three (n,x) = n_times(let fun triple_internal x = x *3 in triple_internal end, n,x) 

(* rewriting above style, this wont compile, as triple_internal is a binding not an expression ...*)
(* fun triple_n_times_four (n,x) = n_times(fun triple_internal x = x *3, n,x) *)

(* we need this function only internally here, so use an internal LET expression, but BAD style*)
fun triple_n_times_five (n,x) = n_times(fn x => x * 3, n,x) (* fn does not have a name. so fn x => x * 3 is an anonymous function*)
(* you cannot use recursive function in anon funcs. because we call recursion, we calls it by the name*)

val val_1 = triple_n_times_one(3,6)
val val_2 = triple_n_times_two(3,6)
val val_3 = triple_n_times_three(3,6)
val val_5 = triple_n_times_five(3,6)
