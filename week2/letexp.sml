fun temp1 (x : int) =
    let  
        val x = 10 (* trying to shadow the argument *)
    in
        10
    end


fun temp3 (y : int, z : bool) = 
   let 
        val p = if z then y + 1 else y + 2
        val q = y - 10 (* shadow Y*)
        val r = if q < 0 then z = false  else true (* more shadowing *)
    in
        (* val z = (p,q,r) *** does not work as the in clause cannot contain local variables *)
         (p,q,r) (* see whats the output here, totally reversed the types, does that work ? *)
    end (* can the out put be set to val "m" *)

    (* val b = (x, y, z) *)
   (* val c = (p, q, r) ** can I actually use the outcome of the let expr outside ?*)

(*
    Now for using the let expression to have a function
*)

(* function inside a function*)
fun count(from : int, to : int) =
    if from = to
    then
        from :: []
    else 
        from :: count (from+1 , to)

fun countFrom1(to : int) = 
    count(1, to)


(* rewriting the the above two functions using a let expression *)
fun newCountFrom1( to : int) =
    let
        fun counter(from : int) = (* This is an inner function used only withing the function*)
            if from = to
            then    
                from :: []
            else
                from :: counter(from +1)
    in
        counter(1) (* start counting from 1*)
    end