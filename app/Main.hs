module Main where

import Lib
import System.Directory

main :: IO ()
main = do
  let directory = "./lists/"
  fileNames <- listDirectory directory
  let fullFilePaths = getFullFilePath fileNames directory
  readFiles <- readTodoFiles fullFilePaths
  let finalReadFiles = zipWith (\x y -> x ++ "\n" ++ y) fileNames readFiles
  print (parseTodoFiles finalReadFiles)
