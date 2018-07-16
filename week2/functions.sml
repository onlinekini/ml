fun pow (x : int, y : int) = 
    if y <= 0
        then 1
    else 
        x * pow (x, y -1)


(*trying to use the same variable diff type*)
fun simplex (x : bool, y : int) =  
    if x
        then 1
    else 
       100


fun cube(y:int) = pow (3,2)

val x = cube(3)

val z = simplex(true, 100)