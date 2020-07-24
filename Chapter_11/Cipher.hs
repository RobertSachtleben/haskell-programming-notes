module Ciphers where

import Data.Char

-- Chapter 09

charSetInitial c = if isLower c then ord 'a' else ord 'A'
charSetSize = 26

shiftCharacter :: Int -> Char -> Char
shiftCharacter n c = chr $ (+) (charSetInitial c) $ ((ord c) - (charSetInitial c) + n) `mod` charSetSize

caesar :: Int -> String -> String
caesar n = map (shiftCharacter n)  

unCaesar :: Int -> String -> String
unCaesar n = caesar (negate n)        


-- Chapter 11
type Keyword = String


spreadKeyword :: Keyword -> String -> String
spreadKeyword k s = go k s 0
    where
        go _ [] _ = []
        go k (x:xs) n = if isLetter x then (:) (k !! (mod n (length k))) $ go k xs (n+1)
                                      else x : go k xs n

vigenere :: Keyword -> String -> String
vigenere keyword message = map (\(k,m) -> if isLetter m then shiftCharacter (ord k - ord 'A') m else m) $ zip (spreadKeyword keyword message) message
    
unVigenere :: Keyword -> String -> String
unVigenere keyword message = map (\(k,m) -> if isLetter m then shiftCharacter (negate (ord k - ord 'A')) m else m) $ zip (spreadKeyword keyword message) message

