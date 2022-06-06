const express = require('express');
const path = require('path');

const app = express();
const port  = process.env.port || 3000;

app.get('/', function(req, res) {
	res.sendFile(path.join(__dirname, '/index.html'));
})

app.listen(port)
