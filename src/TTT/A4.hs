module TTT.A4 where

import Data.List (transpose)
import TTT.A1
import TTT.A2
import TTT.A3 (getAllLines, putSquare)

-- Q#01

_HEADER_ :: String
_HEADER_ = ' ' : formatLine (map show _RANGE_)

-- Q#02

showSquares :: [Square] -> [String]
showSquares xs = map showSquare xs

-- Q#03

dropFirstCol :: Board -> Board
dropFirstCol b = map tail b

-- Q#04

dropLastCol :: Board -> Board
dropLastCol b = map init b

--Q#05

formatRows :: [Row] -> [String]
formatRows rs = map (\r -> formatLine (map showSquare r)) rs

-- Q#06

isWinningLine_ :: Player -> Line -> Bool
isWinningLine_ p l = not (null l) && null (filter (/= p) l)

-- Q#07

isWinningLine :: Player -> Line -> Bool
isWinningLine p l = not (null l) && foldr (\s acc -> acc && s == p) True l

-- Q#08

hasWon :: Player -> Board -> Bool
hasWon p b = foldr (\l acc -> acc || isWinningLine p l) False $ getAllLines b

-- Q#09

getGameState :: Board -> GameState
getGameState b
  | hasWon X b = XWon
  | hasWon O b = OWon
  | isTied b = Tie
  | otherwise = InProgress

playMove :: Player -> Board -> Move -> (GameState, Board)
playMove p b m = (getGameState b', b')
  where
    b' = putSquare p b m

-- Q#10

prependRowIndices :: [String] -> [String]
prependRowIndices ss = zipWith (:) ['A' ..] ss

-- Q#11

formatBoard :: Board -> String
formatBoard b = unlines . (_HEADER_ :) . prependRowIndices $ formatRows b