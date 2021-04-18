{-# LANGUAGE TemplateHaskell, QuasiQuotes #-}
{-# OPTIONS_GHC -ddump-splices #-}
module Data where

import UU.UUAGC (uuagcTH)
import Text.RawString.QQ

uuagcTH ["haskellsyntax","data"] [] [r|
data Tree a
  | Node left  :: (Tree {a})
         right :: (Tree {a})
  | Tip  value :: {a}

deriving Tree : Show
|]
