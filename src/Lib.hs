module Lib
    ( getFiles
    ) where

-- someFunc :: IO ()
-- someFunc = putStrLn "someFunc"

getFiles :: [String] -> [String]
getFiles files = filter (\x -> x /= "." && x /= "..") files
