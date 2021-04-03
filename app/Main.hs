{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -ddump-splices #-}
module Main where

import UU.UUAGC (uuagcTH)

pure $ either error id $ uuagcTH ["--data"]
  "DATA Test\n\
  \  | Test a : Int b : Bool\n\
  \  | Cool c : String d : {[Int]}\n"

main :: IO ()
main = putStrLn "Hello, Haskell!"
