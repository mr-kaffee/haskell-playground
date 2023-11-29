fibonacci :: (Integral a, Integral b) => a -> b
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

maximum' :: (Ord a) => [a] -> a
maximum' [] = error "Maximum of an empty list"
maximum' [x] = x
maximum' (x:xs) 
    | x > maxTail = x
    | otherwise   = maxTail
    where maxTail = maximum' xs

quicksort :: (Ord a) => [a] -> [a]  
quicksort [] = []  
quicksort [x] = [x]
quicksort (x:xs) =   
    let smallerSorted = quicksort [a | a <- xs, a <= x]  
        biggerSorted = quicksort [a | a <- xs, a > x]  
    in  smallerSorted ++ (x:biggerSorted)

mulThree :: (Num a) => a -> a -> a -> a
mulThree x y z = x * y * z


applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)
