module Lib
    ( getFullFilePath
    ) where

-- readTodoFiles :: [String] -> String -> IO [String]
-- readTodoFiles files directory = map (\x -> readFile directory ++ x) files

getFullFilePath :: [String] -> String -> [String]
getFullFilePath files directory = map (\x -> directory ++ x) files

data ToDoFile = ToDoFile { filename :: String
    , question :: String
    , todos :: [String]
    , include :: Bool
    } deriving (Show)