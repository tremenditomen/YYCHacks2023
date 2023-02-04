import express from "express";
import rootRouter from "./routes/index.js"
import compression from "compression";
import bodyParser from "body-parser";
import mongoose from "mongoose";
import cors from "cors";
import dotenv from "dotenv";
const app = express();
app.use(compression());
app.use(bodyParser.json({limit:"30mb",extended:true}));
app.use(bodyParser.urlencoded({limit:"30mb",extended:true}));
app.use(cors());
app.use('/',rootRouter);
const CONNECTION_URL = process.env.DB;
const port = process.env.PORT||5000;
console.log(CONNECTION_URL);
 
mongoose.connect("mongodb+srv://ryanpang:pcsQwmC3ZdThNjZh@cluster0.jh1pjcx.mongodb.net/?retryWrites=true&w=majority",{useNewUrlParser:true,useUnifiedTopology:true})
.then(()=>app.listen(port,()=>console.log(`Server running on port: ${port}`)))
.catch((error)=>console.log(error.message));