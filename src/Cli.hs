module Cli where

import Query ( buildQuery, apiKey )
import FetchNews
import FormatDocs

dispatch :: [(String, [String] -> IO())]
dispatch = [
    ("--v", version),
    ("--help", help),
    ("latest", latest),
    ("search", search)]

version :: p -> IO ()
version _ = do print "version 0.0.1"

latest :: p -> IO ()
latest _ = do 
    let url = "https://api.currentsapi.services/v1/latest-news?"++apiKey
    fetchNews url

help :: p -> IO ()
help _ = do docs

search :: [String] -> IO ()
search args = do
    let query = buildQuery args
    let url = "https://api.currentsapi.services/v1/search?"++query++apiKey
    print url
    fetchNews url