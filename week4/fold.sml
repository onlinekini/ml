(* apply f on multiple values of xs and accumulator *)
fun fold (f, acc, xs) = 
    case xs of 
            [] => acc
        |   (x :: xs') => fold (f, f(acc, x), xs')

(* Not using private data *)
fun f1 xs = fold ((fn (x,y) => x + y), 0, xs)

(* check if all elements in the list are greater than zero => note x is boolean and y >=0 passes boolean *)
fun f2 xs = fold ((fn (x,y) => x andalso y >= 0), true, xs)

(* count of elements between lo and hi *)
fun f3 (xs, lo, hi) = fold ( (fn (x, y) => x + (if y >= lo andalso y <= hi then 1 else 0)), 0, xs))

(* check if all strings have length lesser than *)
fun f4 (xs ,s) = fold ( 
        (
            fn(x, y) => let val len = String.size s in x andalso (String.size y < len)) end),
            true,
            xs
        )

(* do all elements pass g y test as true*)
fun f5 (g, xs) = fold ((fn(x,y) => x andalso g y), true, xs))

(* f4 again by using f5 - doing the same thing *)
fun f4again (xs ,s) = let val len = String.size s in f5(fn y => String.size y > len, xs) end

