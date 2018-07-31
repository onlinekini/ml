(* this is a ONE of type *)

datatype myType =  TwoInts of int * int (* function TwoInts: int * int -> myType ==> Evaluation*)
                  | Str of string (* function Str: string -> myType ==> Evaluation *)
                  | Pizza  (* value not a function Pizza : myType*)

(* dataType evaultes to <datatype myType = Pizza | Str of string | TwoInts of int * int> sort by alphabets *)

val a = Str "hi" (* create with String *)
val b = Str (* create with nothing *)
val c = Pizza (* type myType *)
val d = TwoInts(3+5, 5+7)
val e = a

(* each of Str, TwoInts are constructor functions to create a type myType. So Str returned a Type and Str "hi" evaluated to a type myType *)

(* b is a function not a value, hence b "online" now evaluates to myType *)