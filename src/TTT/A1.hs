module TTT.A1 where

import Data.Char (toUpper)
import Data.Sequence.Internal.Sorting (QList(Nil))

-- Q#01
_SIZE_ :: Int
_SIZE_ = 3

-- Q#02
_DISPLAY_LOGO_ :: Bool
_DISPLAY_LOGO_ = True

-- Q#03
convertRowIndex :: Char -> Int
convertRowIndex  rowValue = fromEnum (toUpper(rowValue)) - 65 

-- Q#04

_INVALID_MOVE_ = (-1,-1)

-- Q#05

_SEP_ = ['_','|','_']

-- Q#06

data Square = X| O|Nil
 --deriving show

-- Q#07

data GameState

-- Q#08

-- Q#09

getFirstPlayer = undefined

getFirstPlayer_ = undefined

-- Q#10

showGameState = undefined

-- Q#11

switchPlayer = undefined

-- Q#12

showSquare = undefined