awesome = ["Papuchon", "curry", ":)"]
also = ["Quake", "The Simons"]
allAwesome = [awesome, also]

-- 1: length :: [a] -> Int

-- 2 a: 5
-- 2 b: 3
-- 2 c: 3
-- 2 d: 5

-- 3: (6 / length [1,2,3]) will as length returns an Int while (/) requires a Fractional

-- 4: div

-- 5: Bool, True

-- 6 a: no type, as = is not a function, would be Bool for ==
-- 6 b: no type, as variable x is not in scope

-- 7 a: works, reduces to True
-- 7 b: does not work, as the "list" contains both Nums and Chars
-- 7 c: works, reduces to 5
-- 7 d: works, reduces to False
-- 7 e: does nit work, as 9 is no Bool

-- 8
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = x == reverse x

-- 9
myAbs :: Integer -> Integer
myAbs x = if x >= 0 then x else -x

-- 10
f :: (a,b) -> (c,d) -> ((b,d),(a,c))
f ab cd = ((snd ab, snd cd), (fst ab, fst cd))


-- Correcting syntax
-- (note: function names may differ to avoid name clashes)

-- 1
x = (+)
f1 xs = w `x` 1
    where 
        w = length xs

-- 2
f2 = \x -> x        

-- 3
f3 (a,b) = a


-- Match the functions names to their types

-- 1: c

-- 2: b

-- 3: a

-- 4: d