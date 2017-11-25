module Yes where

import Prelude

import Control.Monad.Eff (Eff, untilE)
import Control.Monad.Eff.Console (CONSOLE)
import Node.Stream (pipe)
import Node.Stream.Readable (mkReadable, pushString)
import Node.Stream.Types (Writable, ReadCb)

foreign import stdout :: forall eff. Writable () (console :: CONSOLE | eff)

repeatCb :: forall r p eff. String -> ReadCb r p eff
repeatCb str stream _ = untilE $ not <$> pushString stream str

main :: forall eff. Eff (console :: CONSOLE | eff) Unit
main = do
  readable <- mkReadable $ repeatCb "yes\n"
  void $ readable `pipe` stdout
