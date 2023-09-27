module HM.A7 where

import Data.Char (toUpper)
import HM.A6
import HM.Provided
import System.Directory (doesFileExist)
import Data.List (intersperse, sort)

-- Q#01
data Game

-- Q#02

repeatedMove = undefined

-- Q#03

makeGame = undefined

-- Q#04

updateGame = undefined

-- Q#05

showGameHelper :: String -> [Char] -> Int -> String
showGameHelper game moves chances =
  unlines
    [ _STARS_,
      "\tSecret Word:\t" ++ intersperse ' ' game ++ "\n",
      "\tGuessed:\t" ++ intersperse ' ' (sort moves) ++ "\n",
      "\tChances:\t" ++ show chances,
      _STARS_
    ]

-- Q#06


-- Q#07

toMaybe = undefined

-- Q#08

validateSecret = undefined

-- Q#09

hasValidChars = undefined

isValidLength = undefined

isInDict = undefined

-- Q#10

validateNoDict = undefined

validateWithDict = undefined

-- Q#11

processTurn = undefined