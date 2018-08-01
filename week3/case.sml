datatype myType =  TwoInts of int * int (* function TwoInts: int * int -> myType ==> Evaluation*)
                  | Str of string (* function Str: string -> myType ==> Evaluation *)
                  | Pizza  (* value not a function Pizza : myType*)



fun f (x : myType) =  (* f has the type mytype -> int *)
    case x of 
            Pizza => 3 
        |   Str s => 8 (* or it could be String.size instead of hardcoded value*)
        |   TwoInts(i1, i2) => i1 + i2 (* The calue of i1 and i2 will be valid for within the branch *)

fun newFunc() = 
    "Welcome1"



val c1 = f Pizza
val c3 = f (TwoInts(3,4))
val c2 =  f (Str "hi")
(*val c =  f "hi"*) (* operator and operand don't agree, *)
val x = Str "hi"
val c3 = f x (* this works *)

