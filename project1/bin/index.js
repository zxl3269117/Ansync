#! /usr/bin/env node
require("./util/keyPress");
const { printText, printByte } = require("./util/print");

// Step 1: get the url from command line
const url = process.argv[process.argv.length - 1];

// Step 2: get the resource from url
const http = require("http");
const https = require("https");

const client = url.indexOf("https") === -1 ? http : https;

const req = client.request(url, (res) => {
  // console.log(`STATUS: ${res.statusCode}`);
  // console.log(`HEADERS: ${JSON.stringify(res.headers)}`);

  let data = [];
  res.on("data", (chunk) => {
    data.push(chunk);
  });

  res.on("end", () => {
    let bufferData = Buffer.concat(data);

    // Step 3: print to stdout based on resource type
    if (res.headers["content-type"].includes("text")) {
      const textData = bufferData.toString().split("\n");
      printText(textData);
    } else {
      console.log(bufferData.length);
      printByte(bufferData);
    }
  });
});

req.on("error", (e) => {
  console.error(e);
});

req.end();
