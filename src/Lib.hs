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

yesOrNo :: String -> Maybe Bool
yesOrNo input
    | input == "y" = Just True
    | input == "yes" = Just True
    | input == "n" = Just False
    | input == "no" = Just False
    | otherwise = Nothing

getTodoFromUser :: ToDoFile -> IO ToDoFile
getTodoFromUser toDo = do
    putStrLn (question toDo)
    value <- getLine
    return toDo { include = yesOrNo value}

data ToDoFile = ToDoFile { filename :: String
    , question :: String
    , todos :: [String]
    , include :: Maybe Bool
    } deriving (Show)