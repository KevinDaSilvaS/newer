{-# LANGUAGE OverloadedStrings #-}

module FetchNews where

import Data.Typeable
import Network.Wreq
import Data.Aeson
import Data.Map as Map
import Data.Aeson.Lens 
import Control.Lens
import Data.Text
import News
import FormatNews
import Errors

instance FromJSON News

fetchNews url = do
    response <- get url
    let status = response ^. responseStatus . statusCode
    if status == 200 then
        do
            let (Just news) = response ^? responseBody . key (pack "news")

            let encodedNews = encode news
            let (Just decodedNews) = decode encodedNews :: Maybe [News]
            let listNewsInfo = Prelude.map (formatNews) decodedNews
            mapM_ (printNews) listNewsInfo
    else
        do 
            errorGettingNews
