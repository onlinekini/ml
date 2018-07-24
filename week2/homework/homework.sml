fun is_older(inDate1 : int * int * int,  inDate2 : int * int * int) =
    #1 inDate1 < #1 inDate2 
        orelse ((#1 inDate1 = #1 inDate2) andalso (#2 inDate1 < #2 inDate2)) 
        orelse ((#1 inDate1 = #1 inDate2) andalso (#2 inDate1 = #2 inDate2) andalso (#3 inDate1 < #3 inDate2))
    (*year 1 < year 2 OR both years equal AND month 1 < month2 OR both years AND months equal AND the date1 < date 2 *)


fun number_in_month(dates : (int * int * int) list, monthNumber : int) =
    let 
       fun monthinDate(dates : (int * int * int) list) =  (*function inside let to ensure it does not pollute the other codes *)
            if null dates 
            then 0 
            else
                if (#2(hd dates) = monthNumber)
                then 1 + monthinDate(tl dates)
                else  monthinDate(tl dates)
    in
        monthinDate(dates)
    end

fun number_in_months (dates : (int * int * int) list, monthNumbers : int list) =
    if null monthNumbers
    then 0
    else 
       number_in_month(dates, hd monthNumbers) + number_in_months(dates, tl monthNumbers)

fun dates_in_month (dates : (int * int * int) list, monthNumber : int) = 
    let 
        fun datesInMonth(dates : (int * int * int) list) = 
            if null dates 
            then []
            else 
                if (#2(hd dates) = monthNumber)
                then hd dates :: datesInMonth(tl dates)
                else datesInMonth(tl dates)
    in 
        datesInMonth(dates)
    end

fun dates_in_months (dates : (int * int * int) list, monthNumbers : int list) =
    if null monthNumbers
    then []
    else 
        dates_in_month(dates, hd monthNumbers) @ dates_in_months (dates, tl monthNumbers)

fun get_nth (words : string list, nth : int) =
    if null words 
    then ""
    else 
        let 
            fun get_word_pos(word : string, words: string list, pos: int) =
                if pos = nth 
                then word
                else if null words
                then ""
                else get_word_pos(hd words, tl words, pos + 1)
        in
            get_word_pos(hd words, tl words, 1)
        end    

val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

fun date_to_string(date : (int * int * int)) =
    get_nth(months, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)

fun number_before_reaching_sum(sumVal : int, datas : int list) =
    let 
        fun check_sum(datas : int list, count : int) =
            if currentsum < sumVal
            then count
            else hd datas + checkSum(tl datas, , pos + 1)
        in
            get_word_pos(hd words, tl words, 1)
        end
