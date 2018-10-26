(* (b' -> c') * (a' -> b') -> (a' -> c') *)
fun compose (f, g) = fn x =>  f(g x) 

(* int -> real *)
fun sqrt_of_abs1 i = Math.sqrt ( Real.fromInt (abs i))
fun sqrt_of_abs2 i = (Math.sqrt o Real.fromInt o abs) i
val sqrt_of_abs =  Math.sqrt o Real.fromInt o abs

(* using the infix operator to handle the left to right function call from right to left *)
infix !>
fun x !> f = f x
fun sqrt_of_abs_infx i = i !> abs !> Real.fromInt !> Math.sqrt
(* Now you could read from left to right where i is used by abs whose result is used by Real.fromInt .... *)

(* fn : ('a -> 'b option) * ('a -> 'b) -> 'a -> 'b 
        get the option b' from F and then apply a' and return value b' not option, hence always return b' *)
fun backup1 (f,g) = 
    fn x => case f x of 
                NONE => g x
            |   SOME y => y



