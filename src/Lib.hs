module Lib
    ( getFullFilePath,
    parseTodoFiles,
    readTodoFiles,
    getTodoFromUser
    ) where

import System.IO

readTodoFiles :: [String] -> IO [String]
readTodoFiles files = mapM readFile files

getFullFilePath :: [String] -> String -> [String]
getFullFilePath files directory = map (\x -> directory ++ x) files

parseTodoFiles :: [String] -> [ToDoFile]
parseTodoFiles files = map (todoFileToRecord . lines) files

todoFileToRecord :: [String] -> ToDoFile
todoFileToRecord (x:xs) = ToDoFile x (xs !! 0) (drop 1 xs) Nothing

getTodoFromUser :: ToDoFile -> IO ToDoFile
getTodoFromUser toDo = do
    putStrLn (question toDo)
    value <- getLine
    return value

data ToDoFile = ToDoFile { filename :: String
    , question :: String
    , todos :: [String]
    , include :: Maybe Bool
    } deriving (Show)