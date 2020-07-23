-- Multiple Choice

-- 1: d
-- 2: b
-- 3: d
-- 4: b
-- 5: a


-- Let's write code

-- 1
-- a
tensDigit x = snd $ divMod (fst $ divMod x 10) 10
-- b: yes
-- c
hunsD x = tensDigit $ div x 10

-- 2
foldBool :: a -> a -> Bool -> a
foldBool x y b = case b of 
    True -> x
    False -> y

foldBool' :: a -> a -> Bool -> a
foldBool' x y b 
    | b         = x
    | otherwise = y

-- 3
g :: (a->b) -> (a,c) -> (b,c)
g f (x,y) = (f x,y)        

-- 5
roundTrip :: (Show a, Read a) => a -> a
roundTrip = read . show

-- 6
roundTrip' :: (Show a, Read b) => a -> b
roundTrip' = read . show

main = do
    print $ ((roundTrip' 4) :: Int)
    print $ id 4