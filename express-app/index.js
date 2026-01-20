const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send(
    "<p>This is an Express.js application running in a Docker container.</p>",
  );
});

const PORT = 8080;

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
