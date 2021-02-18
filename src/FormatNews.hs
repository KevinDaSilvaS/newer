{-# LANGUAGE NamedFieldPuns #-}
module FormatNews where

import News
import System.Console.Chalk

formatNews (News { author,
                   description,  
                   language,
                   published,
                   title,
                   url }) = [author, description, language, published, title, url]

printNews [author, description, language, published, title, url] = do
    putStr $ (bold . bgBlack . white) "Author: "
    putStr $ (bold . bgBlack . white) author

    putStr $ (bold . bgBlack . white) " / Lang: "
    putStrLn $ (bold . bgBlack . white) language

    putStrLn $ (underline . italic . bold . bgBlack . magenta) title

    putStrLn $ (italic . bold . bgBlack . white) description

    putStrLn $ (italic . blue) published

    putStrLn $ (underline . blue) url
    print "............."