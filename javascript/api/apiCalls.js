
import axios from 'axios';
import express from "express";
import { dataFormatter } from '../helpers/dataFormatter.js';

const app = express();
axios({
    method: 'get',
    url: 'https://data.calgary.ca/resource/n625-9k5x.json',
  })
    .then((res) => {
        dataFormatter(res.data)
    })