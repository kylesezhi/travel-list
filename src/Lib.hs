module Lib
    ( getFiles
    ) where

getFiles :: [String] -> [String]
getFiles files = filter isMdFile files

isMdFile :: String -> Bool
isMdFile text = drop (length text - 3) text == ".md"

data ToDoFile = ToDoFile {
    filename :: String
    question :: String
    todos :: [String]
    include :: Bool
} deriving (Show)