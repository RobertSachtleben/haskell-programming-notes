module Reverse where


-- Reading Syntax

-- 1 a: correctly written
-- 1 b: incorrectly written: ++ is an infix fun
b = (++) [1,2,3] [4,5,6]
-- 1 c: correctly written
-- 1 d: incorrectly written: missing closing '"' after world
d = ["hello" ++ " world"]
-- 1 e: incorrectly written: incorrect order of arguments to (!!)
e = "hello" !! 4
-- 1 f: correctly written
-- 1 g: incorrectly written: 4 inside of the string
g = take 4 "lovely"
-- 1 h: correctly written

-- 2 a-d
-- 2 b-c
-- 2 c-e
-- 2 d-a
-- 2 e-b


-- Building functions

-- 1
fa = "Curry is awesome" ++ "!"
fb = drop 4 $ take 5 "Curry is awesome!" 
fc = drop 9 "Curry is awesome!" 

-- 2
fa' x = x ++ "!"
fb' x = [x !! 4]
fc' = drop 9  

-- 3
thirdLetter :: String -> Char
thirdLetter x = x !! 2

-- 4
letterIndex :: Int -> Char
letterIndex x = "Curry is awesome!" !! x

-- 5
testString = "Curry is awesome"

rvrs :: String -> String
rvrs str = (substr 9 16) ++ (substr 5 9) ++ (substr 0 5)
    where 
        substr i j = drop i $ take j str

-- 6
main :: IO ()
main = print $ rvrs testString