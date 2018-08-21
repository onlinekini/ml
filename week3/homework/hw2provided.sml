(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) = s1 = s2

fun all_except_option (x, xs) =
    let 
        fun compute_all_excpt p =  
            case p of
                (s, []) => false
            |   (s, xs :: []) => same_string(x, xs)
            |   (x, xs :: xs') => same_string(x, xs) andalso compute_all_excpt(x, xs')
     in
        if compute(x, xs) then SOME xs else NONE
    end




(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)