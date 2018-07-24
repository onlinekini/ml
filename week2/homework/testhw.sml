use "homework.sml";

is_older((2,3,4),(2,3,4)) (* false *)

is_older((2,3,4),(2,3,5)) (* true *)

is_older((2,3,9),(2,3,5)) (* false *)

is_older ((1,2,3),(2,3,4)) (* true *)

number_in_month ([(2012,2,28),(2013,12,1)],2) (* 1 *)

number_in_month ([(2012,2,28),(2013,12,1), (2011,2,28), (2012,2,2)],2) (* 3 *)

number_in_month ([(2012,2,28),(2013,12,1), (2011,2,28), (2012,2,2)],2)

number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) (* 3 *)

number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,8,4]); (* 2 *)

number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28), (2011,5,4), (2011,6,4)],[2,3,4]); (* 3 *)

number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28), (2011,4,5), (2011,5,5)],[2,3,4,5]); (* 5 *)

dates_in_month ([(2012,2,28),(2013,12,1)],2); (* [(2012,2,28)] *)

dates_in_month ([(2012,2,28), (2013,12,1), (2018,2,1), (2014,12,2)],2) (* [(2012,2,28),(2018,2,1)] *)

dates_in_month ([(2012,2,28), (2012,2,28), (2013,12,1), (2018,2,1), (2014,12,2), (2012,2,28)],2) (* [(2012,2,28),(2012,2,28),(2018,2,1),(2012,2,28)] *)

dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) (* [(2012,2,28),(2011,3,31),(2011,4,28)] *)

dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28), (2012,2,25), (2011,4,01) ],[2,3,4]) (* dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28), (2012,2,25), (2011,4,01) ],[2,3,4]) *)

get_nth (["hi", "there", "how", "are", "you"], 2) (* there *)

get_nth (["hi", "there", "how", "are", "you"], 4) (* are *)

get_nth (["hi", "there", "how", "are", "you"], 8)  (* blank string *)

date_to_string (2013, 6, 1) (* June 1, 2013 *)

date_to_string (2018, 12, 5) (* December 5, 2018 *)

date_to_string (2018, 1, 1) (* January 1, 2018*)

number_before_reaching_sum (10, [1,2,3,4,5]) (* 3 *)

number_before_reaching_sum (26, [1,2,3,4,4,5,6,7]) (* 7 *)

number_before_reaching_sum (25, [1,2,3,4,4,5,6,7]) (* 6 *)

number_before_reaching_sum (31, [1,2,3,4,4,5,6,7]) (* 7 *)

number_before_reaching_sum (32, [1,2,3,4,4,5,6,7]) (* 7 *)

month_range(31, 60) (* [1,2,2,...] last vlue 3*)

month_range(31, 34) (* [1,2,2,2] *)

month_range(31,91) (*[1,2,2,2,2,2,2,2,2,2,2,2,...] last value 4 *)

oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) (* SOME (2011,3,31) *)
