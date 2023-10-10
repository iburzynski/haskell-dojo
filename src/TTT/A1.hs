{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}
module TTT.A1 where

import Data.Char (toUpper, isHexDigit)
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

data Square = X | O | Empty 
 deriving (Eq,Show)


-- Q#07
--Defining a 
data GameState = Xwon | Owon | Tie | In_Progress
 deriving(Eq,Show)

-- Q#08
--Defining synonyms and their types
type Player = Square
type Row = [Square]
type Line = [Square]
type Board = [Row]
type Move = (Int, Int)
-- Q#09

getFirstPlayer :: Bool -> Player 
getFirstPlayer isX = if isX then X else O 

getFirstPlayer_ :: Bool -> Player
getFirstPlayer_ isX 
    | isX = X
    |otherwise = O


-- Q#10

showGameState :: GameState -> String
showGameState gState = case gState of
    Xwon -> "Player X Won the game"
    Owon -> "Player O Won the game"
    Tie -> "The game is a tie"
    In_Progress -> "The game is in progress"

-- Q#11

switchPlayer :: Player -> Player
switchPlayer X = O
switchPlayer O = X
switchPlayer x = x

-- Q#12

showSquare :: Square -> String
showSquare X =  "X"
showSquare O = "O"
showSquare Empty = "_"