datatype myType =  TwoInts of int * int (* function TwoInts: int * int -> myType ==> Evaluation*)
                  | Str of string (* function Str: string -> myType ==> Evaluation *)
                  | Pizza  (* value not a function Pizza : myType*)



fun f (x : myType) = 
    case x of 
            Pizza => 3 
        |   Str s => 8
        |   TwoInts (i1, i2) => i1 + i2

f Pizza
f (Str "hi")
f "hi" (* invalid arguments, *)
