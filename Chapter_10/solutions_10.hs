-- Warm-up and review

-- 1
stops  = "pbtdkg"
vowels = "aeiou"
-- a
stopVowelStops = [(s1,v,s2) | s1 <- stops, v <- vowels, s2 <- stops]
-- b
stopVowelStopsP = [('p',v,s2) | v <- vowels, s2 <- stops]
-- c
verbs = ["chase", "fly"]
nouns = ["dogs", "owls"]
nounVerbNouns = [n1 ++ " " ++ v ++ " " ++ n2 ++ "." | n1 <- nouns, v <- verbs, n2 <- nouns]

-- 2: average length of the words in x

-- 3
avgLength :: Fractional a => String -> a
avgLength x = s / l
    where 
        ws = words x
        l  = fromIntegral $ length ws
        s  = fromIntegral $ sum $ map length ws 


-- Rewriting functions using folds

-- 1
myOr :: [Bool] -> Bool
myOr = foldr (||) False

-- 2
myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr (\x y -> (f x) || y) False

-- 3
myElem :: Eq a => a -> [a] -> Bool
myElem a = foldr (\x y -> (x == a) || y) False

myElem' :: Eq a => a -> [a] -> Bool
myElem' x = myAny (== x)

-- 4
myReverse :: [a] -> [a]
myReverse = foldr (flip (++) . (: [])) []

-- 5
myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr ((:) . f) []

-- 6
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f = foldr (\x y -> if f x then x:y else y) []

-- 7
squish :: [[a]] -> [a]
squish = foldr (++) []

-- 8
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr ((++) . f) []

-- 9
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

-- 10
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ [] = undefined
myMaximumBy f (x:xs) = foldr (\x y -> if f x y == GT then x else y) x xs

-- 11
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ [] = undefined
myMinimumBy f (x:xs) = foldr (\x y -> if f x y == LT then x else y) x xs