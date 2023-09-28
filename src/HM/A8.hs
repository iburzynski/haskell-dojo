module HM.A8 where

import Control.Monad (when)
import Data.Char (toUpper)
import HM.A6
import HM.A7 hiding (validateNoDict, validateWithDict)
import HM.Provided
import System.Directory (doesFileExist)

-- Q#01

getUpperChar :: IO Char
getUpperChar = toUpper <$> getChar

-- Q#02

_DICT_ :: IO Dictionary
_DICT_ = do
  exists <- doesFileExist _DICT_FILE_
  if exists then words <$> readFile _DICT_FILE_ else pure []

isDictNonEmpty :: IO Bool
isDictNonEmpty = not . null <$> _DICT_

-- Q#03

makeGameIfValid :: Either GameException Secret -> Either GameException Game
makeGameIfValid secret = makeGame <$> secret

-- Q#04

getDict :: IO (Maybe Dictionary)
getDict = toMaybe <$> isDictNonEmpty <*> _DICT_

-- Q#05

validateNoDict :: Secret -> Either GameException Secret
validateNoDict s = hasValidChars s >>= isValidLength

validateWithDict :: Dictionary -> Secret -> Either GameException Secret
validateWithDict dict s = validateNoDict s >>= isInDict dict

-- Q#06

playGame :: Game -> IO ()
playGame game = do
  promptGuess
  move <- getUpperChar
  _SPACE_
  case processTurn move game of
    Left GameOver -> print GameOver >> putStrLn ("The word was: " ++ getSecret game)
    Left e        -> print e >> playGame game
    Right game'   -> do
      print game'
      if   getGuess game' == getSecret game'
      then putStrLn "Yay, correct!"
      else playGame game'

-- Q#07

startGame :: (Secret -> Either GameException Secret) -> IO ()
startGame validator = do
  secret <- setSecret
  case makeGameIfValid (validator secret) of
    Left  e -> print e >> startGame validator
    Right g -> print g >> playGame g

-- Q#08

runHM :: IO ()
runHM = do
  maybeDict <- getDict
  case maybeDict of
    Just dict -> startGame (validateWithDict dict)
    Nothing   -> do
      putStrLn "Missing dictionary! Continue without dictionary? [Y/N]"
      c <- getUpperChar
      when (c == 'Y') $ startGame validateNoDict

runHM' :: IO ()
runHM' = do
  dict <- _DICT_
  case dict of
    []   -> do
      putStrLn "Missing dictionary! Continue without dictionary? [Y/N]"
      c <- getUpperChar
      when (c == 'Y') $ startGame validateNoDict
    words -> startGame (validateWithDict words)