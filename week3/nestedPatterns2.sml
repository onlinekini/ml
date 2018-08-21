datatype sgn = Z | P | N (* data type which is zero postive or negative *)

fun multsign (x1, x2) =  (* sign of multiplied values *)
    let fun sign x = if x = 0 then Z else if x > 0 then P else N
    in
        case (sign x1, sign x2) of 
                (_, Z) => Z
            |   (Z, _) => Z (* _ means match anything *)
            |   (P, P) => P
            |   (N, N) => P (* stop till here, you get "nestedPatterns2.sml:6.9-10.28 Warning: match nonexhaustive "*)
            |   (N, P) => N
            |   (P, N) => N
            (* |  _ => N -- simply use this instead of the above two lines*)
    end


fun f (a::b::c) = 2 + f c
    |   f [] = 0
    |   f c  = 1


fun f1 xs =
    case xs of 
        [] => []
    |   _ => 1::xs


fun     f2 [] = []
    |   f2 xs  = 1::xs