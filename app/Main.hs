{-# LANGUAGE TemplateHaskell, QuasiQuotes #-}
{-# OPTIONS_GHC -ddump-splices #-}
module Main where

import UU.UUAGC (uuagcTH)
import Text.RawString.QQ
import Data

uuagcTH "sem" ["haskellsyntax","signatures","catas","wrappers","semfuns"] [dat] [r|
attr Tree
  syn max :: {Int}

sem Tree
  | Node lhs.max = max @left.max @right.max
  | Tip  lhs.max = @value
|]

main :: IO ()
main = print $ max_Syn_Tree $ wrap_Tree (sem_Tree (Node (Tip 1) (Node (Tip 2) (Tip 3)))) Inh_Tree
