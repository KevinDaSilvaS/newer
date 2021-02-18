module Main where

import Cli 
import System.Environment (getArgs)
import ExecuteAction ( executeAction )

main :: IO ()
main = do
  args <- getArgs
  if null args then do
      help []
  else
    do
    let command = head args
    let remainingArgs = tail args

    executeAction (lookup command dispatch) remainingArgs