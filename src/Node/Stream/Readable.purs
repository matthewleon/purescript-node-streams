module Node.Stream.Readable where

import Prelude

import Control.Monad.Eff (Eff)
import Data.ArrayBuffer.Types (Uint8Array)
import Node.Buffer (Buffer)
import Node.Encoding (Encoding)
import Node.Stream.Types (Read, ReadCb, Readable, Push)

foreign import mkReadable
  :: forall r p eff
   . ReadCb r p eff
  -> Eff eff (Readable r eff)

foreign import pushBuffer
  :: forall r p eff
   . Readable r eff
  -> Buffer
  -> Eff (push :: Push p | eff) Boolean

foreign import pushUint8Array
  :: forall r p eff
   . Readable r eff
  -> Uint8Array
  -> Eff (push :: Push p | eff) Boolean

foreign import pushString
  :: forall r p eff
   . Readable r eff
  -> String
  -> Eff (push :: Push p | eff) Boolean

pushStringWithEncoding
  :: forall r p eff
   . Readable r eff
  -> String
  -> Encoding
  -> Eff (push :: Push p | eff) Boolean
pushStringWithEncoding rs s = pushStringWithEncodingImpl rs s <<< show

foreign import pushStringWithEncodingImpl
  :: forall r p eff
   . Readable r eff
  -> String
  -> String
  -> Eff (push :: Push p | eff) Boolean

foreign import pushEnd :: forall p eff. Eff (push :: Push p | eff) Unit
