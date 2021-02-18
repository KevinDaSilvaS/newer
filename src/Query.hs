module Query where

import qualified Data.Text as Dt

apiKey :: [Char]
apiKey = "apiKey=isMFbKAb6-aFJ_wA2h8cZSCYg-6ubAxDUZ71VjDrqI7yrvZ2"

buildQuery :: [String] -> [Char]
buildQuery [] = ""
buildQuery (x:xs) = query ++ "&" ++ buildQuery xs
    where
        listParams = Dt.splitOn (Dt.pack "=") (Dt.pack x)
        listParamsString = map Dt.unpack listParams
        query = queryElem listParamsString

queryElem :: [String] -> String
queryElem xs
    | length xs == 2 = validFn fn args
    | otherwise = ""
    where
        fn = lookup (head xs) searchOpts
        args = tail xs

validFn :: Maybe (t -> [Char]) -> t -> [Char]
validFn (Just fn) args = fn args
validFn Nothing _ = ""

searchOpts :: [(String, [String] -> String)]
searchOpts = [
    ("lang", language),
    ("keyword", keyword),
    ("country", country)]

language :: [String] -> String
language [code] = "language="++code
language [] = error "Expecting language code ex: lang=BR"
language _ = error "Expecting just language code parameter ex: lang=BR. Too many arguments passed"

keyword :: [String] -> String
keyword [code] = "keywords="++code
keyword [] = error "Expecting keyword ex: keyword=Brazil"
keyword _ = error "Expecting just keyword parameter ex: keyword=Brazil. Too many arguments passed"

country :: [String] -> String
country [code] = "country="++code
country [] = error "Expecting country code ex: country=BR"
country _ = error "Expecting country code ex: country=BR. Too many arguments passed"