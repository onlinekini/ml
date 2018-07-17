
val y = [] (* empty list, 'a list or called alpha list, takes any type*)

val x = [5,6,7,8]

val p = null y (*is it an empty list*)

val q = null x

val r = hd x

val tlr = tl x

val s = hd (tl (tl x)) (* 678 => 78 => 7 *)

val listOfList = [[5,6], [7,8],[9],[7,8,9]]

val single = [8]

val temp = hd single (* tail of  a single list is []*)

(*val t = hd tl tl x*) (*same as above, but without paranthesis it does not work*)

val test = 5::single (*prepend 5 to list*)

val tplList = [(7,8), (4,6)] (* the tuple have to be of the same type, so cannot add (true, 5) to this*)

val someOther = (0,0) :: tplList; (* prepend tuple to a list*)