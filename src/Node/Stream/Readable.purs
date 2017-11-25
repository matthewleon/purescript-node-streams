module Node.Stream.Readable where

import Prelude

import Control.Monad.Eff (Eff)
import Data.ArrayBuffer.Types (Uint8Array)
import Node.Buffer (Buffer)
import Node.Encoding (Encoding)
import Node.Stream.Types (PushFn, Read, ReadCb, Readable)

foreign import mkReadable
  :: forall r eff
   . ReadCb eff
  -> Readable (read :: Read | r) eff

foreign import pushBuffer :: forall eff. PushFn -> Buffer -> Eff eff Boolean

foreign import pushUint8Array :: forall eff. PushFn -> Uint8Array -> Eff eff Boolean

foreign import pushString :: forall eff. PushFn -> String -> Eff eff Boolean

pushStringWithEncoding :: forall eff. PushFn -> String -> Encoding -> Eff eff Boolean
pushStringWithEncoding p s = pushStringWithEncodingImpl p s <<< show

foreign import pushStringWithEncodingImpl
  :: forall eff
   . PushFn
  -> String
  -> String
  -> Eff eff Boolean

foreign import pushEnd :: forall eff. PushFn -> Eff eff Unit
