module Errors where

import System.Console.Chalk

actionNotExist :: IO ()
actionNotExist = do putStrLn $ (bold . underline . bgRed . yellow) " Action does not exist "

errorGettingNews :: IO ()
errorGettingNews = do putStrLn $ (bold . underline . bgRed . yellow) " Unable to get news. :( "