{-# LANGUAGE NoMonomorphismRestriction #-}

-- Multiple choice

-- 1: c
-- 2: a
-- 3: b
-- 4: c


-- Determine the type

-- 1: 54 :: Num a => a
-- 2: (0,"doge") :: Num a => (a,[Char])
-- 3: 100 :: Num a => a
-- 4: 0.4 :: Fractional a => a
-- 5: "Julie <3 Haskell" :: [Char]


-- Does it compile?

-- 1: wahoo does not compile as bigNum does not take any arguments -> possible fix: rewrite bigNum to take a single argument
bigNum x = (^) x $ 10
wahoo = bigNum $ 10
-- 2: compiles
-- 3: does not compile, as b does not take any arguments -> possible fix as above
-- 4: does not compile, c is undefined -> possible fix: define c


-- Type variable or specific type constructor?

-- 2: f :: zed -> Zed -> Blah       zed is fully polymorhpic, the other two are concrete
-- 3: f :: Enum b => a -> b -> c    b is constrained, the other two are fully polymorphic
-- 4: f :: f -> g -> c              all (f,g,c) are fully polymorphic


-- Write a type signature

-- 1
functionH :: [a] -> a
functionH (x:_) = x

-- 2
functionC :: Ord a => a -> a -> Bool
functionC x y = x > y

-- 3
functionS :: (a,b) -> b
functionS (x,y) = y


-- Given a type, write a function

-- 1
i :: a -> a
i x = x

-- 2
c :: a -> b -> a
c x _ = x

-- 3
c'' :: b -> a -> b
c'' = c -- yes, same

-- 4
c' :: a -> b -> b
c' _ y = y

-- 5
r :: [a] -> [a]
r = i -- also possible: reverse, take/drop (for fixed n), tail, init, ...

-- 6
co :: (b->c) -> (a->b) -> a -> c
co = (.) -- i.e.: co g f x = g (f x)

-- 7
a :: (a->c) -> a -> a
a _ x = x

-- 8
a' :: (a->b) -> a -> b
a' = ($) -- i.e.: a' f x = f x


-- Fix it
-- (skipped the module declarations)

-- 1 
fstString :: [Char] -> [Char]
fstString x = x ++ " in the rain"

sndString :: [Char] -> [Char]
sndString x = x ++ " over the rainbow"

sing = if (x > y) then fstString x else sndString y
    where 
        x = "Singin"
        y = "Somewhere"        

-- 2
sing' = if (x < y) then fstString x else sndString y
    where 
        x = "Singin"
        y = "Somewhere"

-- 3
main :: IO ()
main = do
    print $ 1 + 2
    putStrLn "10"
    print (negate (-1))
    print ((+) 0 blah)
        where 
            blah = negate 1


-- Type-Kwon-Do

-- 1
f :: Int -> String
f = undefined

g :: String -> Char
g = undefined

h :: Int -> Char
h = g . f 

-- 2
data A
data B
data C

q :: A -> B
q = undefined

w :: B -> C 
w = undefined

e :: A -> C 
e = w . q

-- 3
data X
data Y 
data Z

xz :: X -> Z
xz = undefined

yz :: Y -> Z 
yz = undefined

xform :: (X,Y) -> (Z,Z)
xform (x,y) = (xz x, yz y)

-- 4
munge :: (x -> y) -> (y -> (w,z)) -> x -> w
munge xy ywz = fst . ywz . xy 



