module FormatDocs where

import System.Console.Chalk

docs = do
    putStrLn $ (bold . blue) "------------"
    putStrLn $ (bold . blue) "NEWER - DOCS"
    putStrLn $ (bold . blue) "------------"

    putStrLn $ (bold . blue) "[--v] Displays the current version of newer."
    putStrLn $ (bold . blue) "[--help] Displays this info on screen."
    putStrLn $ (bold . blue) "[latest] Gets the latest news in currents api."
    putStrLn $ (bold . blue) "[search] Gets news based on aditional parameters.[lang, keyword, country]"
    putStrLn $ (bold . blue) "[lang] Filters news by language. Ex: lang=pt"
    putStrLn $ (bold . blue) "[keyword] Filters news by keyword. Ex: keyword=brazil"
    putStrLn $ (bold . blue) "[country] Filters news by country. Ex: country=br"