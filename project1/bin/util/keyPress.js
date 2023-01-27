(() => {
  // Step 4: add key event handler
  const readline = require('readline');
  readline.emitKeypressEvents(process.stdin);
  process.stdin.setRawMode(true);

  global.printSpeed = 1000;
  global.isStopped = false;

  process.stdin.on("keypress", (str, key) => {
    if (key.ctrl && key.name === 'c') {
      process.exit();
    } else {
      switch (str) {
        case "+":
          global.printSpeed -= 500;
          break;
        case "-":
          global.printSpeed += 500;
          break;
        case " ":
          global.isStopped = !global.isStopped;
        default:
          break;
      }
    }
  })
})()