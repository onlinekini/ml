fun is_older(inDate1 : int * int * int,  inDate2 : int * int * int) =
    #1 inDate1 < #1 inDate2 
        orelse ((#1 inDate1 = #1 inDate2) andalso (#2 inDate1 < #2 inDate2)) 
        orelse ((#1 inDate1 = #1 inDate2) andalso (#2 inDate1 = #2 inDate2) andalso (#3 inDate1 < #3 inDate2))
    (*year 1 < year 2 OR both years equal AND month 1 < month2 OR both years AND months equal AND the date1 < date 2 *)


fun number_in_month(dates : (int * int * int) list, monthNumber : int) =
    let 
       fun monthinDate(dates : (int * int * int) list) = 
            if null dates 
            then 0 
            else
                if (#2(hd dates) = monthNumber)
                then 1 + monthinDate(tl dates)
                else  monthinDate(tl dates)
    in
        monthinDate(dates)
    end


