"use strict";

var stream = require("stream");

exports.mkReadable = function (readCb) {
  var stream = new stream.Readable({
    read: function(size) {
      readCb(stream.push, size);
    }
  });
  return stream;
};

function push(pushFn) {
  return pushFn;
};

exports.pushBuffer = pushFn;

exports.pushUint8Array = pushFn;

exports.pushString = pushFn;

exports.pushStringWithEncodingImpl = function (pushFn) { 
  return function (string) {
    return function (encoding) {
      return pushFn(string, encoding);
    };
  };
};

exports.pushEnd = function (pushFn) {
  pushFn(null);
};