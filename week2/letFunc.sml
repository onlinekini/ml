
fun newCountUp( to : int) =
    let
        fun counter(from : int) = (* This is an inner function used only withing the function*)
            if from = to then from :: [] else from :: counter(from +1)
    in
        counter(1) (* start counting up from 1 to "to"*)
    end

fun newCountDown( from : int) =
    let
        fun counter(value : int) = (* This is an inner function used only withing the function*)
            if value = 1 then value :: [] else value :: counter(value -1)
    in
        counter(from) (* start counting down from "from" value to 1 *)
    end


fun goodComputeMax(xs : int list) =
    if null xs 
    then 0 (* this is a really bad thing. You cannot have a max of a null*)
    else if null (tl xs) then hd xs else 
        let 
            val tailVal = goodComputeMax(tl xs) (* compute the max on the tail *)
        in
            if hd xs > tailVal then hd xs  else tailVal
        end

(* int list -> int option*)
fun ReComputeGoodMax1(xs : int list) =
    if null xs 
    then NONE 
    else let 
            val tailVal = ReComputeGoodMax1(tl xs) (* compute the max on the tail *)
        in
            (* Code which did not work: if isSome (tailVal) andalso  hd xs > valOf(tailVal) then SOME(hd xs) else tailVal  *)
            if isSome (tailVal) andalso valOf(tailVal) > hd xs then tailVal else SOME (hd xs) (* See why my - above code did not work*)
        end