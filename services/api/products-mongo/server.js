'use strict';
const express = require('express');
const cors = require('cors');
const connectDB = require('./db')

// Constants
const PORT = process.env.PORT || 3000;

async function main() {
  const clientDB = await connectDB()

  const app = express();
  app.use(express.urlencoded({extended: true}));
  app.use(express.json());

  app.use(cors())

  app.get('/', async (req, res) => {
    try {
      const products = await clientDB.collection("product").find().toArray()
      res.status(200).json(products)
    } catch (err) {
      res.status(500).json(err)
    }
  })


  app.listen(PORT, () => {
    console.log(`Server is up and running on http://localhost:${PORT}`)
  });
}
main()