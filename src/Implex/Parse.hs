module Implex.Parse
  ( Parse
  , spliceMixinResult
  ) where

import Control.Monad.State (State)
import Control.Lens ((%=))
import Implex.Rope (Rope)

newtype Parse a =
  Parse (State ParseState a)

data ParseState =
  ParseState
    { parseStateInput :: Rope Nfg }

-- |
-- After completely parsing a mixin,
-- the parser is supposed to be positioned
-- right after the closing brace of the mixin block.
-- Once the mixin has been evaluated to a string,
-- this routine is called to insert that string
-- into the parser input, so the parser can continue.
spliceMixinResult :: Rope Nfg -> Parse ()
spliceMixinResult mixinResult = Parse $
  _parseStateInput %= (mixinResult <>)
