(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) = s1 = s2


fun contains (x, xs) =  
            case (x, xs) of
                (s, []) => false
            |   (s, xs :: []) => same_string(x, xs)
            |   (x, xs :: xs') => same_string(x, xs) orelse contains(x, xs')

fun all_except_option (x, xs) =
    case (x, xs) of
            (s, []) => []
        |   (s, xs :: []) => if not(same_string(x, xs)) then xs::[] else []
        |   (x, xs :: xs') => if not(same_string(x, xs)) then xs :: all_except_option(x, xs') else all_except_option(x, xs')


fun get_substitutions1 (xs : string list list, s : string) = 
    case (s,xs) of 
            (s, []) => []
        |   (s, xs::[]) => if contains(s,xs) then all_except_option(s, xs) else []
        |   (s, xs::xs') => if contains(s,xs) then all_except_option(s, xs) @ get_substitutions1(xs', s) else get_substitutions1(xs', s)

(*tail Recursion*)
fun get_substitutions2 (xs : string list list, s : string) = 
    case (s,xs) of 
            (s, []) => []
        |   (s, xs::[]) => if contains(s,xs) then all_except_option(s, xs) else []
        |   (s, xs::xs') => if contains(s,xs) then all_except_option(s, xs) @ get_substitutions2(xs', s) else get_substitutions2(xs', s)


fun similar_names expr = 
    case expr of
            ([], {first=x, middle=y, last=z}) => [{first=x, middle=y, last=z}]
        |   ()



(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)