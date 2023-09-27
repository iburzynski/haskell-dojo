module TTT.A2 where

import Data.List (intercalate)
import TTT.A1

-- Q#01

promptPlayer :: Player -> String
promptPlayer p =
  concat
    [ "Player ",
      showSquare p,
      "'s turn: enter a row and column position (ex. A1)"
    ]

-- Q#02

_RANGE_ :: [Int]
_RANGE_ = [0 .. _SIZE_ - 1]

-- Q#03

isDigit :: Char -> Bool
isDigit c = c `elem` ['0' .. '9']

readDigit :: Char -> Int
readDigit c = if isDigit c then read [c] else -1

-- Q#04

_EMPTY_ROW_ :: Row
_EMPTY_ROW_ = replicate _SIZE_ E

_EMPTY_BOARD_ :: Board
_EMPTY_BOARD_ = replicate _SIZE_ _EMPTY_ROW_

-- Q#05

isTied :: Board -> Bool
isTied b = E `notElem` concat b

_TIED_BOARD_ :: Board
_TIED_BOARD_ =
  [ [X, O, E],
    [O, X, X],
    [O, X, O]
  ]

-- Q#06

indexRowStrings :: [String] -> [(Char, String)]
indexRowStrings rowStrs = zip ['A' ..] rowStrs

-- Q#07

formatLine :: [String] -> String
formatLine strs =
  concat
    [ _SEP_,
      intercalate _SEP_ strs,
      _SEP_
    ]

-- Q#08

isMoveInBounds :: Move -> Bool
isMoveInBounds (r, c) =
  and [r >= 0, r <= _SIZE_ - 1, c >= 0, c <= _SIZE_ - 1]

-- Q#09

stringToMove :: String -> Move
stringToMove [x, y] = (convertRowIndex x, readDigit y)
stringToMove _ = _INVALID_MOVE_

-- Q#10

replaceSquareInRow :: Player -> Int -> Row -> Row
replaceSquareInRow p j r = xs ++ ys'
  where
    (xs, ys) = splitAt j r
    ys'
      | null ys = []
      | j < 0 = ys
      | otherwise = p : tail ys