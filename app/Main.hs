module Main where

import Data.Foldable (traverse_)
import Data.Map.Strict (Map)
import Data.Map.Strict qualified as Map
import HM.A8 (runHM)
import System.IO (BufferMode (..), hSetBuffering, stdout, stdin)
import TTT.A5 (runTTT)
import Text.Printf (printf)
import Text.Read (readMaybe)

data App = App {appName :: !String, runApp :: !(IO ())}

apps :: Map Int App
apps =
  Map.fromList $
    zip
      [1 ..]
      [ App "Tic-Tac-Toe" runTTT,
        App "Hangman" runHM
      ]

printApp :: (Int, App) -> IO ()
printApp (i, App name _) = putStrLn $ printf "  %d. %s" i name

parseChoice :: Map Int App -> Char -> Maybe App
parseChoice apps c = do
  i <- readMaybe [c]
  Map.lookup i apps

main :: IO ()
main = do
  logo <- readFile "./assets/dojo-logo.txt"
  putStrLn logo
  menu
  where
    menu :: IO ()
    menu =
      do
        hSetBuffering stdin NoBuffering
        hSetBuffering stdout NoBuffering
        putStrLn "λ SELECT APPLICATION:\n"
        traverse_ printApp $ Map.toList apps
        putStrLn ""
        putStr "λ "
        c <- getChar
        putStrLn ""
        let notFound = putStrLn "Invalid selection: try again.\n" >> menu
        maybe notFound runApp $ parseChoice apps c