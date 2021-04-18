{-# LANGUAGE TemplateHaskell, QuasiQuotes #-}
{-# OPTIONS_GHC -ddump-splices #-}
module Data where

import UU.UUAGC (uuagcTH)
import Text.RawString.QQ

uuagcTH "dat" ["haskellsyntax","data"] [] [r|
data Tree
  | Node left  :: Tree
         right :: Tree
  | Tip  value :: Int

deriving Tree : Show
|]
