#! /usr/bin/env node
require("./util/keyPress");
const { printText, printByte } = require("./util/print");

const url = process.argv[process.argv.length - 1];

const http = require("http");
const https = require("https");

const client = url.indexOf("https") === -1 ? http : https;

const req = client.request(url, (res) => {

  let data = [];
  res.on("data", (chunk) => {
    data.push(chunk);
  });

  res.on("end", () => {
    let bufferData = Buffer.concat(data);

    if (res.headers["content-type"].includes("text")) {
      const textData = bufferData.toString().split("\n");
      printText(textData);
    } else {
      printByte(bufferData);
    }
  });
});

req.on("error", (e) => {
  console.error(e);
});

req.end();
