module Main where

import Lib
import System.Directory

main :: IO ()
main = do
  files <- listDirectory "./lists"
  print files
