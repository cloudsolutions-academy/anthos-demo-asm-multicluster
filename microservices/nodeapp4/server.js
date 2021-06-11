'use strict';

const express = require('express');

// Constants
const PORT = 9000;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
  res.send('This is Service 4\n\n');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
