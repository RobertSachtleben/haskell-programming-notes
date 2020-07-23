import Data.List (intersperse)

-- Review of types

-- 1: d
-- 2: b
-- 3: d
-- 4: b


-- Reviewing currying

cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"

-- 1 to 6 can be obtained via application


-- Recursion

-- 1
{-
      dividedBy 15 2
    = go 15 2 0
    = go (15-2) 2 (0+1) -- intermediate step shown only once
    = go 13 2 1
    = go 11 2 2
    = go  9 2 3
    = go  7 2 4
    = go  5 2 5
    = go  3 2 6
    = go  1 2 7 -- n < d now holds
    = (7,1)
-}

-- 2
recSum :: (Eq a, Num a) => a -> a
recSum x 
    | signum (x-1) == -1 = 0 
    | otherwise          = x + (recSum $ x - 1)

-- 3
recMul :: (Integral a) => a -> a -> a    
recMul x y = signum y * go x (abs y) 0
    where
        go x 0 c = c
        go x y c = go x (y-1) (c+x)


-- Fixing dividedBy

data DividedByResult = Result Integer Integer 
                     | DivByZero 
                        deriving Show

dividedBy :: Integral a => a -> a -> DividedByResult
dividedBy x y = if y == 0 
    then DivByZero 
    else Result (toInteger d) (toInteger m)
        where
            (d,m) = go x y 0
            go x y c = if x < y then (c,x)
                                else go (x-y) y (c+1)


-- McCarthy 91 function

mc91 n 
    | n > 100   = n - 10
    | otherwise = mc91 $ mc91 $ n + 11


-- Numbers into words

digitToWord :: Int -> String
digitToWord 0 = "zero"
digitToWord 1 = "one"
digitToWord 2 = "two"
digitToWord 3 = "three"
digitToWord 4 = "four"
digitToWord 5 = "five"
digitToWord 6 = "six"
digitToWord 7 = "seven"
digitToWord 8 = "eight"
digitToWord 9 = "nine"
digitToWord _ = undefined

digits :: Int -> [Int]
digits n = if n < 10 then [n] -- will fail for negative inputs
                     else let (d,m) = divMod n 10 
                          in  digits d ++ [m]

wordNumber :: Int -> String
wordNumber = concat . (intersperse "-") . (map digitToWord) . digits                          
