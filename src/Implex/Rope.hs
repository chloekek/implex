module Implex.Rope
  ( Rope
  , empty
  , singleton
  ) where

data Rope a
  = Empty
  | Leaf a
  | Branch (Rope a) (Rope a)

instance Semigroup (Rope a) where (<>) = Branch
instance Monoid (Rope a) where mempty = Empty

empty :: Rope a
empty = Empty

singleton :: a -> Rope a
singleton = Leaf
