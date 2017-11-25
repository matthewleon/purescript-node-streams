module Yes where

import Prelude

import Control.Monad.Eff.Console (CONSOLE)
import Node.Stream.Readable (mkReadable)
import Node.Stream.Types (Writable)

foreign import stdout :: forall eff. Writable () (console :: CONSOLE | eff)

yesCb :: forall eff. ReadCb eff
yesCb pushFn _ = whileE (pushString "yes") $ pure unit

main = do
  readable <- mkReadable yesCb
  _ <- readable `pipe` stdout
