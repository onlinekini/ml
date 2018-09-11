
(* 
    ('a -> 'b) * 'a list -> 'b list 
    takes 'a (ALPHA) returns 'b (BETA) from the ALPHA list and finally returns a list of BETA

    MAP returns the same number of items as the source list. And maps the function on all the elemts on the list
*)
fun map(f,x) =
    case x of 
            [] => []
        |   (x::xs') => f (x) :: map(f,xs')

(* map increment on an array --> (int -> int) * init list -> int list *)
val v1 = map(fn x => x + 1, [3,4,5,6,10])

(* map had of the array on an array or arrays --> (int list -> int) * int list list -> int list *)
val v2 = map(hd, [[3,4],[5,6],[8,9,10]])


(*
    fn : ('a -> bool) * 'a list -> 'a list
    takes ALPHA from ALPHA list and returns a boolean and depending on the boolean true value  returns ALPHA list

    FILTER returns subset of elements in the source list
*)
fun filter(f, xs) =
    case xs of
            [] => []
        |   (x::xs') => if f x then x :: (filter(f, xs')) else filter(f, xs')


fun is_even v = (v mod 2  = 0)

fun all_even xs = filter(is_even, xs)

(* fn : ('a * int) list -> ('a * int) list *)
fun all_even_snd xs = filter ((fn (_,v) => is_even v), xs)

val even_list_1 = all_even([3,4,6,7,8,19,20])
val even_list_2 = all_even_snd([(3,3),(4,3),(6,7),(7,2),(8,9),(19,19),(20,1)])

(* val even_list_X = all_even([(3,3),(4,3),(6,7),(7,2),(8,9),(19,19),(20,1)])*) (* mismatch of args for filter as is_even takes an int*)