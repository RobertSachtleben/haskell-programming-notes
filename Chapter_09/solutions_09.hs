import Data.Char

-- Data.Char

-- 2
filterUppers :: String -> String
filterUppers = filter isUpper

-- 3
capitaliseHead :: String -> String
capitaliseHead (x:xs) = (toUpper x) : xs

-- 4 
capitaliseAll :: String -> String 
capitaliseAll [] = []
capitaliseAll (x:xs) = (toUpper x) : (capitaliseAll xs)

-- 5,6
capitaliseHead' :: String -> Char
capitaliseHead' = toUpper . head


-- Ciphers 
-- see Ciphers.hs


-- Writing your own standard functions

-- 1
myOr :: [Bool] -> Bool
myOr [] =  False
myOr (x:xs) = x || myOr xs

-- 2
myAny :: (a->Bool) -> [a] -> Bool
myAny f [] =  False
myAny f (x:xs) = f x || myAny f xs

-- 3
myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem a (x:xs) = a == x || myElem a xs

myElem' :: Eq a => a -> [a] -> Bool
myElem' a = myAny (== a)

-- 4
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = (++ [x]) $ myReverse xs

-- 5
squish :: [[a]] -> [a]
squish [] = []
squish (x:xs) = x ++ squish xs

-- 6
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ [] = []
squishMap f (x:xs) = f x ++ squishMap f xs

-- 7
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

-- 8
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ [] = undefined
myMaximumBy f (x:xs) = go xs x 
    where
        go [] m = m
        go (x:xs) m = case f x m of
            GT -> go xs x 
            _  -> go xs m

-- 9
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ [] = undefined
myMinimumBy f (x:xs) = go xs x 
    where
        go [] m = m
        go (x:xs) m = case f x m of
            LT -> go xs x 
            _  -> go xs m            

-- 10
myMaximum :: Ord a => [a] -> a
myMaximum = myMaximumBy compare            

myMinimum :: Ord a => [a] -> a
myMinimum = myMinimumBy compare