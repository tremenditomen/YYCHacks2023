import axios from "axios";
import express from "express";
import { farmFoodFormatter ,yelpApi} from "../helpers/dataFormatter.js";
import * as dotenv from "dotenv";
dotenv.config()
console.log("here",process.env.API_KEY);
axios({
  methode: "get",
  url: "https://data.calgary.ca/resource/ipm6-y48y.json",
}).then((res) => {
  farmFoodFormatter(res.data);
});


const options = {
  method: 'GET',
  headers: {
    accept: 'application/json',
    Authorization: `Bearer ${process.env.API_KEY}`
  }
};

axios('https://api.yelp.com/v3/businesses/search?location=calgary&xsort_by=review_count&limit=50', options)
  .then(response => {
    
    yelpApi(response)
   


})
  .catch(err => console.error(err));

  axios('https://api.yelp.com/v3/businesses/search?location=calgary&term=skiing&xsort_by=review_count&limit=25', options)
  .then(response => {
    
   const skiingHelper = ()=>{
    // console.log("HERE",response.data.businesses);
    response.data.businesses.map((info)=>{
      // console.log("INFO",info["categories"]);
      info["categories"].map((i)=>{
        if (i["title"].includes("Resorts") || i["title"].includes("Schools")){

          console.log("MARKER",info)
        }
      })


    })




   }
   
skiingHelper()

})
  .catch(err => console.error(err));



