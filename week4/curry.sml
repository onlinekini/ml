fun sorter3Vals(x,y,z) = z >= y andalso y >= x
val t1 = sorter3Vals(6,7,8) (* checks if the triple are sorted *)

fun sorter3ValsCurry x = fn y => fn z => z >= y andalso y >= x 
val t2 = ((sorter3ValsCurry 6) 7) 8 (* currying by returning a function on every execution, until the last function processes all the args *)
val t3 = sorter3ValsCurry 6 7 8 (* without the brackets *)

(* val sorter3ValsCurry = fn : int -> int -> int -> bool 
IMPLIES 
sorter3ValsCurry = function takes an int returns a function (int -> int -> bool) which takes an int returns a function (int -> bool)*)
fun sorter3ValsCurry_nicer x y z =  z >= y andalso y >= x (* syntactic sugar for currying *)
val t4 = sorter3ValsCurry_nicer 6 7 8

fun adder a b c = a + b + c
val t5 = adder 3 4 5

fun fold f acc xs =
    case xs of 
            [] => acc
        |   x :: xs' => fold f (f(acc, x)) xs'
fun sum xs = fold (fn (x, y) => x + y) 0 xs
val total = sum [1,2,3,4,5]

val sum_func_part = fold (fn (x, y) => x + y) 0 (* PARTIAL curried function return, so returns a function "waiting" for xs in the fold *)
(* same as *)
fun sum_func_extd xs = fold (fn (x, y) => x + y) 0  xs  (* here we explicitly mention xs *)

(* more partial application *)
fun range x y = if x > y then [] else x :: range (x+1) y
val r1 = range 3 6
val r2 = range 3
fun r3 y = range 3 y (* not partial curry *)

(* Check video #9 for errors for polymorphic functions - Currying *)

fun curry f x y z = f (x,y,z) (* convert curried function from one taking tuple *)
val sortCurryWeird = curry sorter3Vals 6 7 8 (* converted sorted3Vals taking a tuple to a curried form, can convert to partial also *)
val sortCurryWeirdPartial = curry sorter3Vals 6 7
(* val pp = sortCurryWeirdPartial 8  (* call the partial function *) *)
fun uncurry f(x,y,z) = f x y z (* uncurried a curried function to take a tuple *)
val sortUncurryWeird = uncurry sorter3ValsCurry (6,7,8)

fun swapArgs f x y = f y x