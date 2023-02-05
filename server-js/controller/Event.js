import EventList from "../models/Events.js";
import axios from "axios";
import {
    farmFoodFormatter,
    yelpApi,
    skating,
    skiingHelper,
    museum,
  } from "../javascript/helpers/dataFormatter.js";

  import * as dotenv from "dotenv";
dotenv.config();

  const options = {
    method: "GET",
    headers: {
      accept: "application/json",
      Authorization: `Bearer ${process.env.API_KEY}`,
    },
  };

export const getEventList = async(req, res)=> {
    try {
        const events = await EventList.find({users:req.userId});
        res.status(200).json(events);
    }catch(error){
        res.status(400).json({message:error.message});

    }
}

export const getEvents = async(req, res) => {
    try {

        axios(
            `https://api.yelp.com/v3/businesses/search?location=calgary&xsort_by=review_count&limit=50`,
            options
          )
            .then((response) => {
                
              const data = yelpApi(response);
              console.log(data);
              res.status(200).json(data);
            })
            .catch((err) => console.error(err));
    }catch(error){
        
        res.status(400).json({message:error.message});

    }
}

export const getEventsParams = async(req, res) => {
    try {
        const term =  req.params.term;

        axios(
            `https://api.yelp.com/v3/businesses/search?location=calgary&term=${term}&xsort_by=review_count&limit=50`,
            options
          )
            .then((response) => {
                
              const data = yelpApi(response);
              console.log(data);
              res.status(200).json(data);
            })
            .catch((err) => console.error(err));
    }catch(error){
        res.status(400).json({message:error.message});
    }
}