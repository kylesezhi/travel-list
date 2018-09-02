module Lib
    ( getFullFilePath,
    parseTodoFiles,
    readTodoFiles
    ) where

import System.IO

readTodoFiles :: [String] -> IO [String]
readTodoFiles files = mapM readFile files

getFullFilePath :: [String] -> String -> [String]
getFullFilePath files directory = map (\x -> directory ++ x) files

parseTodoFiles :: [String] -> [ToDoFile]
parseTodoFiles files = map (todoFileToRecord . lines) files

todoFileToRecord :: [String] -> ToDoFile
todoFileToRecord (x:xs) = ToDoFile x (xs!!0) (drop 1 xs) Nothing

data ToDoFile = ToDoFile { filename :: String
    , question :: String
    , todos :: [String]
    , include :: Maybe Bool
    } deriving (Show)