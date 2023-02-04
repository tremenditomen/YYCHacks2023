export const farmFoodFormatter = (data) => {
  let farmStandFormatted = {};
  data.map((info) => {
    farmStandFormatted = {
      vendor_name: info["vendor_name"],
      vendor_description: info["vendor_description"],
      product_description: info["product_description"],
      community: info["community"],
      location: info["location_name"],
      address: info["address"],
      sector: info["sector"],
      hours: info["hours"],
      duration: info["duration"],
      latitude: info["point"]["coordinates"][0],
      longitude: info["point"]["coordinates"][1],
    };
  });
};

export const yelpApi = (response) => {
  let formatedData = {};
  let arr = [];

  response.data.businesses.map((info) => {
    //eviews 3 or 3.5 and review count less than 200
    //   console.log(info);

    if (parseInt(info["rating"])>=4) {
      formatedData = {
        name: info["name"],
        img_url: info["image_url"],
        url: info["url"],
        rating: info["rating"],
        review_count: info["review_count"],
        address: info["location"]["address1"],
        longitude: info["coordinates"]["longitude"],
        latitude: info["coordinates"]["latitude"],
        phone_number: info["phone"],
      };
      arr.push(formatedData);
      arr.map((item) => {});
    //   console.log("INSIDE INFO:~",info);
    }
    // console.log("YELP ARRAYS", );
  });
};

// export const improvmentAreas = (res) => {
//   let formatedData = {};
//   let Arr = [];

//   res.data.map((info) => {
//     formatedData = {
//       name: info["brz_name"],
//     };
//     // console.log("HERE!!!",formatedData);
//     // console.log(info);
//     // console.log(info["multipolygon"]["coordinates"].map((item)=>{

//     //     console.log("WOOOOOOOOOOOO",item);
//     // }));
//   });
// };
