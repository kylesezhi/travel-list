module Main where

import Lib
import System.Directory
import Data.Typeable
import Data.Maybe

main :: IO ()
main = do
  let directory = "./lists/"
  let outputFile = directory ++ "output.md"
  fileNames <- listDirectory directory
  let fullFilePaths = getFullFilePath fileNames directory
  readFiles <- readTodoFiles fullFilePaths
  let finalReadFiles = zipWith (\x y -> x ++ "\n" ++ y) fileNames readFiles
  let parsedTodoFiles = parseTodoFiles finalReadFiles
  responses <- mapM getTodoFromUser parsedTodoFiles
  let yeses = formatToPrint (onlyYes responses)
  writeFile outputFile yeses