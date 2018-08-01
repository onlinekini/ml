datatype suit = Heart | Clubs | Spade | Diamond
datatype rank = Ace | King | Queen | Jack | card_num of int

type card = suit * rank; (* this is a type pair of suit  & rank *)

type name_record = {
        student_num :   int option,
        first_name  :   string,
        last_name   :   string,
        middle_name :   string option    
}

fun isHeartQueen (c: card) =
    #1 c = Heart andalso #2 c = Queen

val c1 : card =  (Heart, King)  (* type card *)
val c2 : suit * rank = (Spade, Ace) (* type suit * rank *)
val c3 = (Heart, Queen)  (* type card or suit * rank *)

val c5 = isHeartQueen c1;
val c6= isHeartQueen c2;
val c7 = isHeartQueen c3;