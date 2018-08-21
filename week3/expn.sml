val x = List.Empty;

val res = (hd [], 0) handle List.Empty => raise x



exception MyException of int (* Check out the int value output  => output of the function, is 16 *)
fun f n =
    if n=0
    then raise List.Empty
    else if n=1
    then raise (MyException 4)
    else n * n
val x = (f 1 handle List.Empty => 42) handle MyException n => f n