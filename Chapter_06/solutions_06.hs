import Data.List

-- Multiple Choice

-- 1: c
-- 2: b
-- 3: a
-- 4: c
-- 5: a


-- Does it type check

-- 1: does not type check, as Person has no Show instance -> possible fix: provide a Show instance
data Person = Person Bool

instance Show Person where
    show (Person x) = show x

printPerson :: Person -> IO ()
printPerson person = putStrLn $ show person    

-- 2: does not type check, as Mood has no Eq instance -> possible fix: provide an Eq instance
data Mood = Blah
          | Woot deriving (Show, Eq)

settleDown x = if x == Woot then Blah else x          

-- 3
-- a) any value of type Mood (i.e.: Blah and Woot)
-- b) will not type check, as 9 ist not of type Mood
-- c) will not type check, as Mood has no Ord instance

-- 4: does type check


-- Given a datatype, what can we do?

-- 1: does not type check, as "chases" is not of type Rocks and True not of type Yeah
-- 2: does type check
-- 3: does type check
-- 4: does not type check, as Papu has no Ord instance


-- Match the types

-- 1: no
-- 2: no
-- 3: yes
-- 4: yes
-- 5: yes
-- 6: yes
-- 7: no
-- 8: no
-- 9: yes
-- 10: yes
-- 11: no


-- Type-Kwon-Do Two

-- 1
chk :: Eq b => (a->b) -> a -> b -> Bool
chk f x = (== (f x))

-- 2
arith :: Num b => (a->b) -> Integer -> a -> b
arith f x y = f y + fromInteger x -- the addition of (fromInteger x) is not strictly necessary, arith f _ y = f y would suffice