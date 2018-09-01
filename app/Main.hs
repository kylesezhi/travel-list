module Main where

import Lib
import System.Directory

main :: IO ()
main = do
  let directory = "./lists/"
  files <- listDirectory directory
  print $ getFullFilePath files directory
  -- readFiles <- readTodoFiles files directory
