module HM.Provided where

import System.IO (hSetEcho, stdin)

-- *** PROVIDED CODE *** --

_LOGO_ :: String
_LOGO_ =
  unlines
    [ " __   __  _______  _______  ___   _  _______  ___      ___     ",
      "|  | |  ||   _   ||       ||   | | ||       ||   |    |   |    ",
      "|  |_|  ||  |_|  ||  _____||   |_| ||    ___||   |    |   |    ",
      "|       ||       || |_____ |      _||   |___ |   |    |   |    ",
      "|       ||       ||_____  ||     |_ |    ___||   |___ |   |___ ",
      "|   _   ||   _   | _____| ||    _  ||   |___ |       ||       |",
      "|__| |__||__| |__||_______||___| |_||_______||_______||_______|",
      " __   __  _______  __    _  _______  __   __  _______  __    _ ",
      "|  | |  ||   _   ||  |  | ||       ||  |_|  ||   _   ||  |  | |",
      "|  |_|  ||  |_|  ||   |_| ||    ___||       ||  |_|  ||   |_| |",
      "|       ||       ||       ||   | __ |       ||       ||       |",
      "|       ||       ||  _    ||   ||  ||       ||       ||  _    |",
      "|   _   ||   _   || | |   ||   |_| || ||_|| ||   _   || | |   |",
      "|__| |__||__| |__||_|  |__||_______||_|   |_||__| |__||_|  |__|"
    ]

_CHANCES_ :: Int
_CHANCES_ = 7

_SPACE_ :: IO ()
_SPACE_ = putStrLn ""

showInput :: Bool -> IO ()
showInput = hSetEcho stdin

_STARS_ :: String
_STARS_ = '\n' : replicate 50 '*' ++ "\n"

_LENGTH_ :: (Int, Int)
_LENGTH_ = (3, 20)

_DICT_FILE_ :: FilePath
_DICT_FILE_ = "assets/dict.txt"

promptGuess :: IO ()
promptGuess = putStr "Guess?\t"