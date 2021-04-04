{-# LANGUAGE TemplateHaskell, QuasiQuotes #-}
{-# OPTIONS_GHC -ddump-splices #-}
module Main where

import UU.UUAGC (uuagcTH)
import Text.RawString.QQ

uuagcTH ["haskellsyntax","data","signatures","catas","wrappers","semfuns"] [r|
data Tree
  | Node left  :: Tree
         right :: Tree
  | Tip  value :: Int


attr Tree
  syn max :: {Int}

sem Tree
  | Node lhs.max = max @left.max @right.max
  | Tip  lhs.max = @value

deriving Tree : Show
|]

main :: IO ()
main = print $ max_Syn_Tree $ wrap_Tree (sem_Tree (Node (Tip 1) (Node (Tip 2) (Tip 3)))) Inh_Tree
