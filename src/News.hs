{-# LANGUAGE DeriveGeneric #-}
module News where
    
import GHC.Generics

data News = News { author :: String,
                   category :: [String],
                   description :: String, 
                   id :: String,  
                   image :: String,
                   language :: String,
                   published :: String,
                   title :: String,
                   url :: String } deriving (Show, Generic)