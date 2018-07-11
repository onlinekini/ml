(* this is a comment *)

val x = 34; (*int *)
(*dynamic environment: x --> 34*)

val y = 17;
(*dynamic environment: x --> 34 & y --> 17*)

val z = (x + y) + (y +2);
(*dynamic environment: x --> 34 & y --> 17 & z--> 70 *)


val q = z + 1;
(*dynamic environment: x --> 34 & y --> 17 & z--> 70 && q --> 71 *)


val abs_of_z = if z < 0 then 0 -z else z;
(*dynamic environment: ... all and abs_of_z = 71 *)
(*satic environment: output of the expression 0 -z & z is all int, hence abs_of_z is all int, not bool*)
