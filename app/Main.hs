{-# LANGUAGE TemplateHaskell, QuasiQuotes, ScopedTypeVariables #-}
{-# OPTIONS_GHC -ddump-splices #-}
module Main where

import UU.UUAGC (uuagcTH)
import Text.RawString.QQ
import Data

uuagcTH ["haskellsyntax","signatures","catas","wrappers","semfuns"] [Data.ag] [r|
attr Tree
  syn max :: {@a}

sem Ord {a} => Tree
  | Node lhs.max = max @left.max @right.max
  | Tip  lhs.max = @value

{
ex :: Tree Int
ex = Node (Tip 1) (Node (Tip 2) (Tip 3))

maxTree :: Tree Int -> Int
maxTree x = max_Syn_Tree $ wrap_Tree (sem_Tree x) Inh_Tree
}
|]

main :: IO ()
main = print (maxTree ex)
