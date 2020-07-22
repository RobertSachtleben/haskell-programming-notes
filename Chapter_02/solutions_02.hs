-- Parenthesization

exp01_orig  = 2 + 2 * 3 - 1
exp01_paren = 2 + (2*3) - 1

exp02_orig  = (^) 10 $ 1 + 1
exp02_paren = (^) 10 (1 + 1)

exp03_orig  = 2 ^ 2 * 4 ^ 5 + 1
exp03_paren = ((2^2)*(4^5)) + 1


-- Equivalent expressions

-- 1: equivalent
-- 2: equivalent
-- 3: not equivalent (flipped arguments to (-))
-- 4: not equivalent (first division truncates)
-- 5: not equivalent 


-- More Fun with Functions

-- 1: REPL requires order z,y,x,waxOn; waxOn == 1125
-- 3: (triple waxOn) == (\x -> x * 3) == (waxOn * 3) == 3375

waxOn = x*5
    where
        z = 7
        x = y^2
        y = z+8

triple x = x * 3

waxOff x = triple x