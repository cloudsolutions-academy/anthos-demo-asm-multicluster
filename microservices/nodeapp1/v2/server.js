'use strict';

const express = require('express');

// Constants
const PORT = 9000;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Service 1: version 2.0\n\n');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
