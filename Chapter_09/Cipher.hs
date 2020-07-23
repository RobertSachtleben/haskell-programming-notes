module Ciphers where

import Data.Char

charSetInitial c = if isLower c then ord 'a' else ord 'A'
charSetSize = 26

caesar :: Int -> String -> String
caesar n = map (shiftCharacter n)
    where
        shiftCharacter n c = chr $ (+) (charSetInitial c) $ ((ord c) - (charSetInitial c) + n) `mod` charSetSize  

unCaesar :: Int -> String -> String
unCaesar n = caesar (negate n)        