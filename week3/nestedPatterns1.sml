fun zip_bad (l1, l2, l3) = (* all three are supposed to be 'a lists *)
    if null l1 andalso null l2 andalso null l3 then []
    else (hd l1, hd l2, hd l3) :: zip_bad (tl l1, tl l2, tl l3) (* ignore the length mismatch for now *)

