const addKeyEvents = require("./keyPress");
const { printText, printByte } = require("./print");

const http = require("http");
const https = require("https");

const getAndPrint = (url, interface) => {
  // interfaceOne.close();
  addKeyEvents(interface);

  const client = url.indexOf("https") === -1 ? http : https;

  const req = client.request(url, (res) => {
    console.log(`STATUS: ${res.statusCode}`);
    console.log(`HEADERS: ${JSON.stringify(res.headers)}`);

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
        console.log(bufferData.length);
        printByte(bufferData);
      }
    });
  });

  req.on("error", (e) => {
    console.error(e);
  });

  req.end();
}

module.exports = {
  getAndPrint
};
