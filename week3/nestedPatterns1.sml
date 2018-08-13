exception ListLengthMismatch

fun zip_bad (l1, l2, l3) = (* all three are supposed to be 'a lists *)
    if null l1 andalso null l2 andalso null l3 then []
    else (hd l1, hd l2, hd l3) :: zip_bad (tl l1, tl l2, tl l3) (* ignore the length mismatch for now *)

fun zip_good lst_trpl =
    case lst_trpl of 
            ([],[],[]) => []
        |   (hd1::tl1, hd2::tl2, hd3::tl3) => zip_good(tl1, tl2, tl3)
        |   _  => raise ListLengthMismatch


fun unzip_good trpl_list =
    case trpl_list of 
            [] => ([], [],[])
        |   (a,b,c)::tls => let val (l1, l2, l3) = unzip_good(tls)
                            in 
                                (a::l1, b::l2, c::l3)
                            end

