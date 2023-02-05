import express from "express";
import rootRouter from "./routes/index.js"
import compression from "compression";
import bodyParser from "body-parser";
import mongoose from "mongoose";
import cors from "cors";

const app = express();

import * as dotenv from "dotenv";
dotenv.config();

app.use(compression());
app.use(bodyParser.json({ limit: "30mb", extended: true }));
app.use(bodyParser.urlencoded({ limit: "30mb", extended: true }));
app.use(cors());
app.use("/api1/", rootRouter);
const CONNECTION_URL = process.env.DB;
const port = process.env.PORT || 5000;

mongoose
  .connect(CONNECTION_URL, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() =>
    app.listen(port, () => console.log(`Server running on port: ${port}`))
  )
  .catch((error) => console.log(error.message));