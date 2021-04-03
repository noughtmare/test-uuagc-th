{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# OPTIONS_GHC -ddump-splices #-}
module Main where

import UU.UUAGC (uuagcTH)
import Text.RawString.QQ

pure $ either error id $ uuagcTH ["--data"] [r|
DATA Test
  | Test a : Int b : Bool
  | Cool c : String d : {[Int]}
|]

main :: IO ()
main = putStrLn "Hello, Haskell!"
