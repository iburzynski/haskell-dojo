module HM.A7 where

import Data.Char (isAlpha, toLower, toUpper)
import HM.A6
import HM.Provided
import System.Directory (doesFileExist)
import Data.List (intersperse, sort)

-- Q#01

data Game =
  Game { getSecret  :: Secret
       , getGuess   :: Guess
       , getMoves   :: [Move]
       , getChances :: Int
       }

-- Q#02

repeatedMove :: Move -> Game -> Bool
repeatedMove move game = move `elem` getMoves game

-- Q#03

makeGame :: Secret -> Game
makeGame secret =
  Game { getSecret  = map toUpper secret
       , getGuess   = map (const '_') secret
       , getMoves   = []
       , getChances = _CHANCES_
       }

-- Q#04

updateGame :: Move -> Game -> Game
updateGame move game =
  game { getGuess = newGuess
       , getMoves = move : getMoves game
       , getChances = newChances
       }
  where
    newGuess   = revealLetters move (getSecret game) (getGuess game)
    newChances = updateChances move (getSecret game) (getChances game)

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

instance Show Game where
  show :: Game -> String
  show (Game _ g ms cs) = showGameHelper g ms cs

-- Q#06

instance Show GameException where
  show :: GameException -> String
  show InvalidChars  = "Word contains invalid characters: try again!"
  show InvalidLength = concat ["Word must be between ", lb, " and ", ub, " characters: try again!"]
    where
      lb = show $ fst _LENGTH_
      ub = show $ snd _LENGTH_
  show NotInDict   = "Word is not in dictionary: try again!"
  show InvalidMove = "Invalid character: try again!"
  show RepeatMove  = "You guessed that already: try again!"
  show GameOver    = "Sorry, game over!"

-- Q#07

toMaybe :: Bool -> a -> Maybe a
toMaybe b a = if b then Just a else Nothing

-- Q#08

validateSecret :: (Secret -> Bool) -> GameException -> Secret -> Either GameException Secret
validateSecret p e s = if p s then Right s else Left e

-- Q#09

hasValidChars :: Secret -> Either GameException Secret
hasValidChars = validateSecret (all isAlpha) InvalidChars

isValidLength :: Secret -> Either GameException Secret
isValidLength = validateSecret lengthInRange InvalidLength

isInDict :: Dictionary -> Secret -> Either GameException Secret
isInDict dict = validateSecret (\s -> map toLower s `elem` dict) NotInDict

-- Q#10

validateNoDict :: Secret -> Either GameException Secret
validateNoDict s = case hasValidChars s of
  Right s' -> isValidLength s'
  err -> err

validateWithDict :: Dictionary -> Secret -> Either GameException Secret
validateWithDict dict s = case validateNoDict s of
  Right s' -> isInDict dict s'
  err -> err

-- Q#11

processTurn :: Move -> Game -> Either GameException Game
processTurn move game
  | invalidMove move        = Left InvalidMove
  | repeatedMove move game  = Left RepeatMove
  | getChances newGame == 0 = Left GameOver
  | otherwise               = Right newGame
  where
    newGame = updateGame move game