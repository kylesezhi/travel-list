module Lib
    ( getFullFilePath,
    parseTodoFiles,
    readTodoFiles,
    getTodoFromUser,
    onlyYes,
    formatToPrint
    ) where

import System.IO
import Data.List

readTodoFiles :: [String] -> IO [String]
readTodoFiles files = mapM readFile files

getFullFilePath :: [String] -> String -> [String]
getFullFilePath files directory = map (\x -> directory ++ x) files

parseTodoFiles :: [String] -> [ToDoFile]
parseTodoFiles files = map (todoFileToRecord . lines) files

todoFileToRecord :: [String] -> ToDoFile
todoFileToRecord (x:xs) = ToDoFile x (xs !! 0) (drop 1 xs) Nothing

formatToPrint :: [ToDoFile] -> String
formatToPrint xs = foldr (++) "" (formatTodoToPrint xs)

formatTodoToPrint :: [ToDoFile] -> [String]
formatTodoToPrint xs = map (\x -> filename x ++ "\n" ++ (intercalate "\n" (todos x)) ++ "\n\n") xs

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

onlyYes :: [ToDoFile] -> [ToDoFile]
onlyYes x = filter isYes x
    where
      isYes ToDoFile {include=Just True} = True
      isYes _ = False

data ToDoFile = ToDoFile { filename :: String
    , question :: String
    , todos :: [String]
    , include :: Maybe Bool
    } deriving (Show)