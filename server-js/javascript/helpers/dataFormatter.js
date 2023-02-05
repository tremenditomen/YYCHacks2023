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

    if (parseInt(info["rating"]) >= 4) {
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
    }
    // console.log("YELP ARRAYS",arr );
  });
};

export const skating = (response) => {
  let formatedData = {};
  let arr = [];

  response.data.businesses.map((info) => {
    info.categories.map((i) => {
      if (i["title"].includes("Rinks") || i["title"].includes("Arenas"))
        formatedData = {
          name: info["name"],
          image: info["image_url"],
          address: info["location"]["address1"],
          rating: info["rating"],
          view: info["review_count"],
          latitude: info["coordinates"]["latitude"],
          longitude: info["coordinates"]["longitude"],
          url: info["url"],
        };
    });
    arr.push(formatedData);
  });

  // console.log("in arr", arr);
};
export const skiingHelper = (response) => {
  let formatedData = {};
  let arr = [];
  response.data.businesses.map((info) => {
    info["categories"].map((i) => {
      if (i["title"].includes("Resorts") || i["title"].includes("Schools")) {
        formatedData = {
          name: info["name"],
          image: info["image_url"],
          address: info["location"]["address1"],
          rating: info["rating"],
          view: info["review_count"],
          latitude: info["coordinates"]["latitude"],
          longitude: info["coordinates"]["longitude"],
          url: info["url"],
          phone_number: info["phone"],
        };
      }

      arr.push(formatedData);
    });
  });
  //   console.log("ARRRRR",arr);
};
export const museum = (response) => {
  let formatedData = {};
  let arr = [];
  response.data.businesses.map((info) => {
    formatedData = {
      name: info["name"],
      image: info["image_url"],
      address: info["location"]["address1"],
      rating: info["rating"],
      view: info["review_count"],
      latitude: info["coordinates"]["latitude"],
      longitude: info["coordinates"]["longitude"],
      url: info["url"],
      phone_number: info["phone"],
    };
    arr.push(formatedData);
  });
  //   console.log("HERE",arr);
};
