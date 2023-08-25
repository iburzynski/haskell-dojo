module HM.A6 where

import Data.Char (isAlpha, toLower, toUpper)
import Data.List (intersperse, sort)
import HM.Provided

-- *** A6-0: WARM-UP *** --

-- Q#01

-- Q#02
data GameException

-- Q#03

lengthInRange = undefined

-- Q#04

invalidMove = undefined

-- Q#05

revealLetters = undefined

-- Q#06

updateChances = undefined

-- Q#07

setSecret = undefined

-- *** A6-1: Records & Instances *** --

-- Q#08
data Game

-- Q#09

repeatedMove = undefined

-- Q#10

makeGame = undefined

-- Q#11

updateGame = undefined

-- Q#12

showGameHelper :: String -> [Char] -> Int -> String
showGameHelper game moves chances =
  unlines
    [ _STARS_,
      "\tSecret Word:\t" ++ intersperse ' ' game ++ "\n",
      "\tGuessed:\t" ++ intersperse ' ' (sort moves) ++ "\n",
      "\tChances:\t" ++ show chances,
      _STARS_
    ]

-- Q#13

-- *** A6-2: Exception Contexts *** --

-- Q#14

toMaybe = undefined

-- Q#15

validateSecret = undefined

-- Q#16

hasValidChars = undefined

isValidLength = undefined

isInDict = undefined

-- Q#17

validateNoDict = undefined

validateWithDict = undefined

-- Q#18

processTurn = undefined