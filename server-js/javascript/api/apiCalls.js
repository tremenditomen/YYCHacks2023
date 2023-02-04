import axios from "axios";
import express from "express";
import { dataFormatter, farmFoodFormatter , servicesFormatter } from "../helpers/dataFormatter.js";

const app = express();
axios({
  method: "get",
  url: "https://data.calgary.ca/resource/n625-9k5x.json",
}).then((res) => {
  dataFormatter(res.data);
});

axios({
  methode: "get",
  url: "https://data.calgary.ca/resource/ipm6-y48y.json",
}).then((res) => {
  farmFoodFormatter(res.data);
});
axios({
  methode: "get",
  url: "https://data.calgary.ca/resource/vdjc-pybd.json",
}).then((res) => {
 
  servicesFormatter(res.data);
});

