const express = require("express");
const app = express();
const port = 1234;

app.use(express.static("sampleFiles"));
app.listen(port, () => {
  console.log("sample server listening on port", port);
})