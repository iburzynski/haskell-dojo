module TTT.A3 where

import Data.List (transpose)
import TTT.A1
import TTT.A2

-- Q#01

showInts :: [Int] -> [String]
showInts (i : is) = show i : showInts is
showInts [] = []

_HEADER_ :: String
_HEADER_ = ' ' : formatLine (showInts _RANGE_)

-- Q#02

showSquares :: [Square] -> [String]
showSquares (s : ss) = showSquare s : showSquares ss
showSquares [] = []

-- Q#03

formatRows :: [Row] -> [String]
formatRows (r : rs) = formatLine (showSquares r) : formatRows rs
formatRows [] = []

-- Q#04

isColEmpty :: Row -> Int -> Bool
isColEmpty [] _ = False
isColEmpty (c : _) 0 = c == E
isColEmpty (_ : cs) j
  | j > 0 = isColEmpty cs (j - 1)
  | otherwise = False

-- Q#05

dropFirstCol :: Board -> Board
dropFirstCol [] = []
dropFirstCol (x : xs) = tail x : dropFirstCol xs

dropLastCol :: Board -> Board
dropLastCol [] = []
dropLastCol (x : xs) = init x : dropLastCol xs

-- Q#06

getDiag1 :: Board -> Line
getDiag1 [] = []
getDiag1 (x : xs) = head x : getDiag1 (dropFirstCol xs)

getDiag2 :: Board -> Line
getDiag2 [] = []
getDiag2 (x : xs) = last x : getDiag2 (dropLastCol xs)

getAllLines :: Board -> [Line]
getAllLines b = concat [b, transpose b, [getDiag1 b, getDiag2 b]]

-- Q#07

putSquare :: Player -> Board -> Move -> Board
putSquare p (r : rs) (0, j) = replaceSquareInRow p j r : rs
putSquare p (r : rs) (i, j)
  | i > 0 = r : putSquare p rs (i - 1, j)
  | otherwise = r : rs
putSquare _ [] _ = []

-- Q#08

prependRowIndices :: [String] -> [String]
prependRowIndices ss = go (indexRowStrings ss)
  where
    go ((c, rs) : rss) = (c : rs) : go rss
    go [] = []

-- Q#09

isWinningLine_ :: Player -> Line -> Bool
isWinningLine_ p l = go False l
  where
    go b [] = b
    go _ (s : ss)
      | s == p = go True ss
      | otherwise = False

-- Q#10

isValidMove :: Board -> Move -> Bool
isValidMove b m
  | isMoveInBounds m = go b m
  | otherwise = False
  where
    go [] _ = False
    go (r : _) (0, j) = isColEmpty r j
    go (_ : rs) (i, j) = go rs (i - 1, j)