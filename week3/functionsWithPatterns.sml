(* Pattern matching of Each of *)


(* int * int * int -> int *)
fun sum_triple_bad tpl =
   case tpl of (* Bad coding practice as the case condition has only one arm, hence issue with more conditions *)
	   (x, y, z) => x + y + z

(*  {first:string, last:string, middle:string} -> string  *)
fun full_name_bad r =
   case r of (* sigle arm case *)
	   {first=x, middle=y, last=z} => 
         x ^ " " ^ y ^ " " ^ z

fun sum_triple_better tpl =
   let val (x, y, z) = tpl 
   in
       x + y + z
   end

fun full_name_better r =
   let val {first=x, middle=y, last=z} = r 
   in
       x ^ " " ^ y ^ " " ^ z
   end


fun sum_triple_best (x,y,z) = 
    x + y + z;

fun full_name_best (x,y,z) =
    x ^ " " ^ y ^ " " ^ z



(* This is a rotate function which returns a tuple / triple with rotated values *)
fun rotate (x,y,z) = (y,z,x) 

val p = rotate (rotate (3,4,5))  (* here we are return the tuple wich forms an input to a 
so called multi arg function, which is a single arg triple / tuple *)
