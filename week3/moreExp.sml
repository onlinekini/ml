(* More expressions - Data types -- Expression trees *)

datatype exp = (* expression having nested - one or more self expressions*)
        Constant of int
    |   Negate of exp (* self expression, something similar to list having other lists *)
    |   Add of exp * exp   (* more than one self expression *)
    |   Mul of exp * exp

val c5 = Add(Constant(10 + 2), Negate (Constant (3)))

(* This is a tree structure  like -- 

                   Add
                    |
        Constant            Negate
           |                   |
           12               Constant
                               |
                               3
*)

datatype eval = (* expression having nested - one or more self expressions*)
        Constant of int
    |   Negate of eval (* self expression, something similar to list having other lists *)
    |   Add of eval * eval   (* more than one self expression *)
    |   Mul of eval * eval


(* the definition of the datatype eval is *)
fun eval e = 
    case e of 
            Constant i     => i
        |   Negate e2      => ~(eval e2)
        |   Add (e1, e2)   => eval e1 + eval e2 (* notice the recursive call to the same function *)
        |   Mul (e1, e2)   => eval e1 * eval e2 (* notice the usage of same variable *)


val example_exp : eval = Add(Constant 10, Negate (Constant (3 +5)))

val example_ans = eval example_exp

(* computes the number of additions in the entire expression *)
fun number_of_adds e = 
    case e of 
            Constant i => 0
        |   Negate e => number_of_adds e
        |   Add (e1, e2) => 1 + number_of_adds e1 + number_of_adds e2
        |   Mul (e1, e2) => number_of_adds e1 + number_of_adds e2

val example_addCount = number_of_adds (Add(Add (Constant 10, Constant (11 + 3)), Constant (3+2)))