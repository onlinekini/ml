(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) = s1 = s2


fun contains expr =  
            case expr of
                (s, []) => false
            |   (s, xs :: []) => same_string(s, xs)
            |   (s, xs :: xs') => same_string(s, xs) orelse contains(s, xs')

fun all_except_option expr =
    case expr of
            (s, []) => []
        |   (s, xs :: []) => if not(same_string(s, xs)) then xs::[] else []
        |   (s, xs :: xs') => if not(same_string(s, xs)) then xs :: all_except_option(s, xs') else all_except_option(s, xs')


fun get_substitutions1 expr = 
    case expr of 
            ([], _) => []
        |   (xs::[], s) => if contains(s,xs) then all_except_option(s, xs) else []
        |   (xs::xs', s) => if contains(s,xs) then all_except_option(s, xs) @ get_substitutions1(xs', s) else get_substitutions1(xs', s)

(*tail Recursion*)
fun get_substitutions2 expr = 
     case expr of 
            ([], _) => []
        |   (xs::[], s) => if contains(s,xs) then all_except_option(s, xs) else []
        |   (xs::xs', s) => if contains(s,xs) then all_except_option(s, xs) @ get_substitutions1(xs', s) else get_substitutions1(xs', s)


fun similar_names (xs, {first, middle, last}) = 
    let 
        val substituted_lsts = get_substitutions1(xs, first)
        fun replaceFirst expr = 
            case expr of 
                [] => [{first=first,middle=middle, last=last}]
            |   (x::xs') => {first=x, middle=middle, last=last} :: replaceFirst (xs')
    in    
      replaceFirst(substituted_lsts)
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
fun card_color card = 
    case card of
        Clubs => Black
    |   Spades => Black
    |   Diamonds => Red
    |   Hearts => Red

fun card_value card =
    case card of
        Ace => 11
    |   Num i => i
    |   _   => 10

fun same_card(c1 : card, c2 : card) = c1 = c2

fun contains_card (c, cs) = 
    case (c, cs) of
        (c, []) => false
    |   (c, cs :: []) => same_card(c, cs)
    |   (c, cs :: cs') => same_card(c, cs) orelse contains_card(c, cs')



fun remove_card (c, cs, e) =
    let
        fun all_except_card expr =
            case expr of
            (s, []) => []
        |   (s, xs :: []) => if not(same_card(s, xs)) then xs::[] else []
        |   (s, xs :: xs') => if not(same_card(s, xs)) then xs :: all_except_card(s, xs') else all_except_card(s, xs')
    in
        if contains_card(c, cs)
        then 
            all_except_card (c, cs)
        else 
            raise e
    end

fun all_same_color cs = 
    case cs of
        [] => false
    |   ((s,r) :: []) => true
    |   ((s1,r1) :: (s2,r2) :: []) => card_color(s1) = card_color(s2)
    |   ((s1,r1) :: (s2,r2) :: cs') => (card_color(s1) = card_color(s2)) andalso   all_same_color((s2,r2) :: cs')


fun sum_cards xs =
    let
        fun summation (xs, acc) =
            case xs of 
                [] => acc
            |   ((s,r) :: xs') => summation(xs', acc + card_value(r))
    in  
        summation(xs, 0)
    end


fun score (cs, goal) =
    let 
        val divided_by = if all_same_color(cs) then 2 else 1 
        val sum_of_cards = sum_cards (cs) 
    in
        if  sum_of_cards > goal
            then  (3 *(sum_of_cards - goal)) div divided_by
        else 
            (goal - sum_of_cards) div divided_by
    end



