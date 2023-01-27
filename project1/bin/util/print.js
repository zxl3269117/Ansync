
const printText = (textData) => {
  let i = 0;
  const printPerInterval = () => {
    if (!isStopped) {
      console.log(textData[i], i + 1);
      i ++;
    }

    if (i < textData.length) {
      setTimeout(printPerInterval, global.printSpeed);
    } else {
      process.exit();;
    }
  };

  printPerInterval();
}

const printByte = (byteData) => {
  let i = 0;
  const printPerInterval = () => {
    if(!isStopped) {
      let toPrint = "";
      const hexString = byteData.slice(i, i + 16).toString("hex");
      for (let j = 0; j < hexString.length; j += 2) {
        toPrint += (hexString.substring(j, j + 2) + " ");
      }
      console.log(toPrint, i);

      i += 16;
    }

    if (i < byteData.length) {
      setTimeout(printPerInterval, global.printSpeed);
    } else {
      process.exit();
    }
  };

  printPerInterval();
}

module.exports = {
  printText,
  printByte
}