module Main where

import Lib
import System.Directory

main :: IO ()
main = do
  let directory = "./lists/"
  fileNames <- listDirectory directory
  let fullFilePaths = getFullFilePath fileNames directory
  print $ fullFilePaths
  readFiles <- readTodoFiles fullFilePaths
  print (parseTodoFiles readFiles)
