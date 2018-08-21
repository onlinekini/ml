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