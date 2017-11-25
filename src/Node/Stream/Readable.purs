module Node.Stream.Readable where

--import Prelude

import Node.Stream.Types (Readable, Read, ReadCb)

foreign import mkReadable
  :: forall r eff
   . ReadCb r eff
  -> Readable (read :: Read | r) eff
