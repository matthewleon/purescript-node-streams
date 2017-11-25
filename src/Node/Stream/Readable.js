"use strict";

var stream = require("stream");

exports.mkReadable = function (readCb) {
  var stream = new stream.Readable({
    read: function(size) {
      readCb(stream, size);
    }
  });
  return stream;
};
