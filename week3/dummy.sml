
(* int *'a * int -> int as we are not using the y *)
fun test (x,y,z) = 
    x * z

val c1 = test (2,3,4) (* works *)
val c2 = test (2, "h1", 4) (* works as well as the type check for y is generic , polymorphic type *)

(* a' list * a' list -> a' list *)
fun append (xs, ys) = 
    case xs of 
            [] => ys
        |   x::xs' => x :: append (xs', ys) 

(* append String arrays, hence string list * string list -> string list *)
val ok1 = append (["hello", "world"], ["hello", "to", "you", "too"]) 
val ok2 = append ([1,2], [3,4,5,6])
(* val notOk = append ([1,2], ["Vivek", "dumbo"]) -- not ok *)

type foo = int * int (* create a type for int * int *)
fun typeOne {qux: 'b, bar : int * 'a , baz : 'b} = 0(* is a more generic version equilavent to *)
fun typeTwo  {qux: string, bar : foo , baz : string } = 0 (* Note two things, 'a is int and int * in is replaced by foo and 'b is string *)
fun typeThree  {bar: int * int, baz : string, qux: string } = 0 (* reorder of record *)


(* ''a * ''b -> string -- note the '' for a & b which supports the "=" operator, Note the warning *)
fun equality (x, y) =
    if x = y then "yes" else "no"

(* int * 'a -> string -- note the '' is not there for a as well *)
fun equality2 (z,y) =
    if z = 3 then "foo" else "boo"