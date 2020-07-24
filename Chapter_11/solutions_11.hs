import Data.Char
import Data.List

-- Multiple choice

-- 1: a
-- 2: c
-- 3: b
-- 4: c


-- As-patterns

-- 1
isSubseqOf :: Eq a => [a] -> [a] -> Bool
isSubseqOf [] _ = True
isSubseqOf _ [] = False
isSubseqOf xxs@(x:xs) (y:ys) = if x == y then isSubseqOf xs ys 
                                         else isSubseqOf xxs ys

-- 2
capitalizeWords :: String -> [(String, String)]
capitalizeWords = map capitalizeWord . words
    where
        capitalizeWord [] = ([],[])
        capitalizeWord xxs@(x:xs) = (xxs, (toUpper x) : xs)


-- Language exercises

-- 1
capitalizeWord :: String -> String
capitalizeWord x = (toUpper $ head x) : tail x

-- 2
capitalizeParagraph :: String -> String
capitalizeParagraph = go True
    where
        go _    []         = []
        go _    ('.':str)  = '.' : go True str
        go True (s:str)    = if isLetter s then toUpper s : go False str -- could be done by capitalizeWord
                                           else s : go True str
        go False (s:str)   = s : go False str

-- 3
type Digit = Char
type Presses = Int
data Phone = Phone [(Digit,[Char])]  

convo :: [String]      
convo = ["hello world", "TeSt, tEsT."]

examplePhone = Phone [ ('1',"1")
                     , ('2',"abc2")
                     , ('3',"def3")
                     , ('4',"ghi4")
                     , ('5',"jkl5")
                     , ('6',"mno6")
                     , ('7',"pqrs7")
                     , ('8',"tuv8")
                     , ('9',"wxyz9")
                     , ('0',"+ 0")
                     , ('*',"^*")  
                     , ('#',".,#")
                     ]




-- 1
reverseTaps :: Phone -> Char -> [(Digit,Presses)]
reverseTaps p@(Phone keypad) x = if isUpper x then [capTaps,lowerTaps] else [lowerTaps]
    where
        lowerTaps = reverseTapsLowercase p $ toLower x
        capTaps   = reverseTapsLowercase p '^'
        reverseTapsLowercase :: Phone -> Char -> (Digit,Presses)
        reverseTapsLowercase (Phone keypad) x = (d, indexOf (toLower x) 1 cs)
            where
                (d,cs) = head $ filter (elem (toLower x) . snd) keypad -- undefined for invalid char
                indexOf y n (x:xs) = if x == y then n else indexOf y (n+1) xs -- undefined if y is not contained
                
-- 2
reverseTapsString :: Phone -> String -> [(Digit,Presses)]
reverseTapsString p = concat . map (reverseTaps p)

-- 3
fingerTaps :: [(Digit,Presses)] -> Presses
fingerTaps = sum . map snd

-- 4
countOccurrences :: Eq a => [a] -> [(a,Int)]
countOccurrences xs = map (\x -> (x,length $ filter (==x) xs)) xs -- inefficient and contains duplicate entries

mostPopularEntry :: Eq a => [a] -> (a,Int)
mostPopularEntry = maximumBy (\x y -> compare (snd x) (snd y)) . countOccurrences

mostPopularLetter :: String -> Char 
mostPopularLetter = fst . mostPopularEntry

-- this implementation does differentiate betwenn uppercase and lowercase characters and does not combine their counts
costOfMostPopularLetterForMessage :: Phone -> String -> (Char,Presses)
costOfMostPopularLetterForMessage p msg = (c, cnt * fingerTaps taps)
    where
        (c,cnt) = mostPopularEntry msg
        taps = reverseTaps p c 


-- 5
coolestLtr :: [String] -> Char
coolestLtr = fst . mostPopularEntry . concat

coolestWord :: [String] -> String
coolestWord = fst . mostPopularEntry . concat . map words 


-- Hutton's Razor

-- 1
data Expr = Lit Integer | Add Expr Expr

eval :: Expr -> Integer
eval (Lit n) = n
eval (Add e1 e2) = eval e1 + eval e2

-- 2
printExpr :: Expr -> String
printExpr (Lit n) = show n
printExpr (Add e1 e2) = printExpr e1 ++ " + " ++ printExpr e2