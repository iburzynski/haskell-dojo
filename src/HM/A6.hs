module HM.A6 where

import Data.Char (isAlpha)
import HM.Provided

-- Q#01

type Chances    = Int
type Guess      = String
type Move       = Char
type Secret     = String
type Dictionary = [String]

-- Q#02

data GameException =  InvalidChars | InvalidLength | NotInDict | InvalidMove | RepeatMove | GameOver

-- Q#03

lengthInRange :: Secret -> Bool
lengthInRange s = length s >= fst _LENGTH_ && length s <= snd _LENGTH_

-- Q#04

invalidMove :: Move -> Bool
invalidMove move = not (isAlpha move)

-- Q#05

revealLetters :: Move -> Secret -> Guess -> Guess
revealLetters move secret guess = zipWith (\s g -> if s == move then s else g) secret guess

-- Q#06

updateChances :: Move -> Secret -> Chances -> Chances
updateChances move secret chances = if move `elem` secret then chances else chances - 1

-- Q#07

setSecret :: IO Secret
setSecret = do
  putStr "Enter a secret word:\t"
  showInput False
  secret <- getLine
  showInput True
  _SPACE_
  return secret