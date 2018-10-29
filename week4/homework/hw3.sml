exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

fun check x =  Char.isUpper(String.sub (x, 1))

(* Problem 1 *)
fun only_capitals xs = List.filter (fn x => Char.isUpper(String.sub (x,0))) xs
(*TC:Problem 1*) (*val Prob1TC = only_capitals ["Only", "only",  "Abcd", "Abcd", "abcd"]*) (* returns ["Only","Abcde","Abcd"] *)

(* Problem 2 *)
fun longest_string1 xs = 
    List.foldl (fn (x,y) => if (String.size x > String.size y) then x else y) "" xs
(*TC:Problem 2*) (*val Prob2TC = longest_string1 ["Only", "only",  "Abcde", "Abcd", "Abcdf", "abcd"]*) (*returns "Abcde" *)

(* Problem 3 *)
fun longest_string2 xs = 
    List.foldl (fn (x,y) => if (String.size x >= String.size y) then x else y) "" xs
(*TC:Problem 3*) val Prob3TC = longest_string2 ["Only", "only",  "Abcde", "Abcd", "Abcdf", "abcd"] (*returns "Abcdf" *)
