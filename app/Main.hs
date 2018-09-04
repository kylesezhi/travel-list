module Main where

import Lib
import System.Directory
import Data.Typeable
import Data.Maybe

main :: IO ()
main = do
  let directory = "./lists/"
  fileNames <- listDirectory directory
  let fullFilePaths = getFullFilePath fileNames directory
  readFiles <- readTodoFiles fullFilePaths
  let finalReadFiles = zipWith (\x y -> x ++ "\n" ++ y) fileNames readFiles
  let parsedTodoFiles = parseTodoFiles finalReadFiles
  responses <- mapM getTodoFromUser parsedTodoFiles
  print responses
  -- let onlyYes = [x | x <- responses, x.include == Just True]
  -- let onlyYes = filter (\x -> include x == Just True) responses
  -- print onlyYes
  -- print . typeOf $ responses
  -- print filter (\x -> include x) responses