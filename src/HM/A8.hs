module HM.A8 where

import Control.Monad (when)
import Data.Char (toUpper)
import HM.A6
import HM.A7 hiding (validateNoDict, validateWithDict)
import HM.Provided
import System.Directory (doesFileExist)

-- Q#01

getUpperChar = undefined

-- Q#02

_DICT_ = do
  fileExists <- doesFileExist _DICT_FILE_
  if fileExists then undefined else undefined

isDictNonEmpty :: IO Bool
isDictNonEmpty = undefined

-- Q#03

makeGameIfValid = undefined

-- Q#04

getDict = undefined

-- Q#05

validateNoDict = undefined

validateWithDict = undefined

-- Q#06

playGame = undefined

-- Q#07

startGame = undefined

-- Q#08

runHM :: IO ()
runHM = putStrLn "Not implemented... yet!"