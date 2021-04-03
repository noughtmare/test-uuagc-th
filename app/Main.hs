{-# LANGUAGE TemplateHaskell, QuasiQuotes #-}
module Main where

import UU.UUAGC (uuagcTH)
import Text.RawString.QQ

uuagcTH ["haskellsyntax","data"] [r|
data Tree
  | Node left  :: Tree
         right :: Tree
  | Tip  value :: Int

deriving Tree : Show
|]

main :: IO ()
main = print (Node (Tip 1) (Node (Tip 2) (Tip 3)))
