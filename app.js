const express = require("express");
const morgan = require("morgan");

const { ping } = require("./controller/ping");
const { error } = require("./controller/error");

const SLSLabeler = require("./controller/sls-labeler");
const SLSTransaction = require("./controller/sls-transaction");

const app = express();

//trust proxy
app.set("trust proxy", true);

//middlewares
process.env.NODE_ENV === "production" || app.use(morgan("dev"));
app.use(express.json({ type: "application/json" }));

// Add CORS headers
app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept, Authorization"
  );
  if (req.method === "OPTIONS") {
    return res.sendStatus(200);
  }
  next();
});

//routes
app.get("/ping", ping);

app.post("/fhir/sls/label", SLSLabeler.post);
app.post("/fhir/sls/transaction", SLSTransaction.post);

app.use(error);

module.exports = {
  app
};
