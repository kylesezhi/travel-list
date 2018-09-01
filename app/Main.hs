module Main where

import Lib
import System.Directory

main :: IO ()
main = do
  files <- getDirectoryContents "./lists"
  print files
