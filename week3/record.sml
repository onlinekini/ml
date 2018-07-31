val x = {t1 = (4, true andalso true), t4 = 4+9, t2 = (false, 100)}
(* the order of the fields does not make any sense as the name of the field is considered important. 
  secondly the evaluation of the variable happens within the loop *)

val my_friend = {name = "Amelia", id = "324-4039" }

val somethingElse = { name = false, id = false} (* exact same params within the record. but the used different values. *)

val name = #name my_friend (* now access the value of the record *)

val some = #name somethingElse

(* something to work versus tuples and a pairs *)

val tpl = (3 + 8 , 1 + 19) 
val recd = {second= 1+ 19, first = 3+8}

val recdToTpl = {2=1+19, 1=3+8} (* Converts it to a tuple, check REPL*)

val recdForced = {3=10, 2=199} (* one is not present, hence is a record *)

(* so tuple are unique ways to write records*)


