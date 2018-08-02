

(* int list -> int *)
fun sum_of_list xs = (* This is identified of type int as the + operator works on the int 
                        and also the return is a 0 which is int*)
    case xs of
            [] => 0
        |   x::xs' => x + sum_of_list xs'

(* a' list * a' list -> a' list *)
fun append (xs, ys) =   (* as the returen type is ys and we are appending xs to ys, both the lists should of same type as well, 
                            hence the return type is the same *)
    case xs of 
            [] => ys
        |   x :: xs' => x :: append (xs', ys)


(* now for the list data type *)
datatype 'a mylist = Empty | Cons of 'a * 'a mylist

(* binary tree with nodes are of one type and the leaves of another type *)
datatype ('a, 'b) tree = Leaf of 'b | Node of 'a * ('a, 'b) tree * ('a , 'b) tree 
(* leaf is a single branch of type of b , Node has two branches with type tree and a value as well *)


(* (int, int)tree -> int *)
fun sum_of_tree tr =
    case tr of  
            Leaf i => i
        |   Node (i, lft, rht) => i + sum_of_tree lft + sum_of_tree rht


(* ('a, int)tree -> int *)
fun sum_of_leaves tr =
    case tr of  
            Leaf i => i
        |   Node (i, lft, rht) => sum_of_tree lft + sum_of_tree rht

(* ('a, 'b)tree -> int *)
fun num_of_leaves tr = 
    case tr of 
            Leaf i => 1
        |   Node (i, lft, rht) => num_of_leaves lft + num_of_leaves rht

(* Whereas below leaf is a single branch of type of b , Node has two branches with type tree and NOT a value as well *)
datatype ('a, 'b) treeWoVal = VlLeaf of 'b | NVlNode of ('a, 'b) treeWoVal * ('a , 'b) treeWoVal
