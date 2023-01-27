#! /usr/bin/env node
const { getAndPrint } = require("./util/getAndPrint");
const readline = require("readline");

const interface = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

// const interfaceTwo = readline.createInterface({
//   input: process.stdin
// });

interface.question('Please enter a url: ', (url) => {
  getAndPrint(url, interface);
});
