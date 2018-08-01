datatype exp = 
        Constant of int
    |   Negate of exp
    |   Add of exp * exp
    |   Mul of exp * exp

fun max_constant_bad e =
    case e of 
            Constant i  =>  i
        |   Negate e2   =>  max_constant_bad(e2)
        |   Add(e1, e2) =>
                            let 
                                val m1 = max_constant_bad e1
                                val m2 = max_constant_bad e2
                            in
                                if m1 > m2 then m1 else m2
                            end
        |   Mul(e1, e2) =>  if max_constant_bad e1 > max_constant_bad e2 
        (* this is bad code, use the above let function here too, but that would be duplicate code.*)
                            then max_constant_bad e1
                            else max_constant_bad e2

(*  ----- Slightly better with larget let code ------ *)
fun max_constant_better e =
    let
     fun max_of_two (e1, e2) =  (*define a function in let to find the max of two value *)
        let  
            val m1 = max_constant_better e1
            val m2 = max_constant_better e2
        in 
            (* This one removes the need to recompute the function *)
            if m1 > m2 then m1 else m2
        end
    in
    case e of (* now the simple case *)
            Constant i  =>  i
        |   Negate e2   =>  max_constant_better(e2)
        |   Add(e1, e2) => max_of_two(e1, e2)
        |   Mul(e1, e2) =>  max_of_two(e1, e2)
    end

(*  ----- OK file ------ *)
fun max_constant_OK e = (* this is a good program to write *)
    let 
        fun max_of_two (e1, e2) = Int.max(max_constant_OK e1, max_constant_OK e2) 
    in
    (* Function gets the params evaulated first, hence calling the functions when calling a function will not cause looping*)
    case e of (* now the simple case *)
            Constant i  =>  i
        |   Negate e2   =>  max_constant_OK(e2)
        |   Add(e1, e2) => max_of_two(e1, e2)
        |   Mul(e1, e2) =>  max_of_two(e1, e2)
    end


(*  ----- Final ------ *)
fun max_constant e = (* this is the best program to write *)
    case e of (* now the simple case *)
            Constant i  =>  i
        |   Negate e2   =>  max_constant(e2)
        |   Add(e1, e2) => Int.max(max_constant e1, max_constant e2) 
        |   Mul(e1, e2) =>  Int.max(max_constant e1, max_constant e2)


val test_exp = Add(Constant 19, Negate (Constant 4))
val nineteen = max_constant test_exp