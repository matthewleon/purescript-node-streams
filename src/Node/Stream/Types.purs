module Node.Stream.Types where

import Prelude
import Control.Monad.Eff (kind Effect, Eff)

-- | A stream.
-- |
-- | The type arguments track, in order:
-- |
-- | - Whether reading and/or writing from/to the stream are allowed.
-- | - Effects associated with reading/writing from/to this stream.
foreign import data Stream :: # Type -> # Effect -> Type

-- | A phantom type associated with _readable streams_.
data Read

-- | A readable stream.
type Readable r = Stream (read :: Read | r)

-- | The read callback for readable streams
type ReadCb eff = PushFn -> Size -> Eff eff Unit

foreign import data PushFn :: Type

-- | A phantom type associated with _writable streams_.
data Write

-- | A writable stream.
type Writable r = Stream (write :: Write | r)

type Size = Int

foreign import data Chunk :: Type

-- | A duplex (readable _and_ writable stream)
type Duplex = Stream (read :: Read, write :: Write)

