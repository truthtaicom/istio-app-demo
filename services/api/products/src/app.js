'use strict';
require('dotenv').config()
const fs = require('fs').promises;
const path = require('path')
const express = require('express');
const cors = require('cors')

// Constants
const PORT = process.env.PORT || 3000;

async function main() {
  const app = express();
  app.use(express.urlencoded({extended: true}));
  app.use(express.json());

  app.use(cors())

  app.get('/', async (req, res) => {
    try {
      const data = await fs.readFile(path.join(__dirname, '..','/mocks/products.json'), 'utf8')
      res.status(200).json(JSON.parse(data))
    } catch (err) {
      res.status(500).json(err)
    }
  })

  app.listen(PORT, () => {
    console.log(`Server is up and running on port numner ${PORT}`);
  });
}

main()