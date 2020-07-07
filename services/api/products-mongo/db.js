const { MongoClient } = require("mongodb");

async function connectDB() {
  const uri = `mongodb+srv://${process.env.MONGO_USER}:${process.env.MONGO_PASS}@${process.env.MONGO_HOST}/${process.env.MONGO_DB}`;
  const client = new MongoClient(uri, { 
    useUnifiedTopology: true,
    useNewUrlParser: true,
    // connectTimeoutMS: 30000,
    // keepAlive: 1
  });
  try {
    console.log("Connecting DB...")
    // Connect to the MongoDB cluster
    await client.connect();
    console.log("Connected DB")
    return client.db(process.env.MONGO_DB)
  } catch (e) {
    console.error("DB ERROR", e);
  } finally {
    // await client.close();
  }
}


module.exports = connectDB;
