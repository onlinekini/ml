(* compute n+x in silly way *)
fun increment_n_times_lame(n,x) = 
    if n = 0
    then x
    else 1 + increment_n_times_lame(n-1, x)

(* doubles x n times or 2^n * x  *)
fun double_n_time_lame (n,x) =
    if n = 0
    then x
    else 2 * double_n_time_lame(n -1 , x)

(* example: 3, [4,5,6,7] returns [7], n tail of the array  *)
fun nth_tail_lame(n,x) =
    if n = 0
    then x
    else tl (nth_tail_lame(n-1, x))

(* all above lame functions are not because they are silly. But can be made into single functions *)

(* ('a -> 'a) * int * 'a -> 'a  
    implies f is function which takes the argument with type same as 'x' 
    and returns the same type as 'x', hence a' is a generic (polymorphic) type*)

fun n_times(f,n,x) =
    if n = 0
    then x
    else f(n_times(f,n-1,x))

fun increment x = x + 1
fun double x = x * 2

val x1_lame = increment_n_times_lame(3,6)
val x2_lame = double_n_time_lame(3,6)
val x3_lame = nth_tail_lame(3, [4,5,6,7])

val x1 = n_times(increment, 3, 6)
val x2 = n_times(double, 3, 6)
val x3 = n_times(tl, 3, [4,5,6,7])
