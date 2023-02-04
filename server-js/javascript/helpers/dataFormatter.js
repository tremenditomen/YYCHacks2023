export const dataFormatter = (data)=>{
    let formatedData = {}
    data.map((info)=>{
                formatedData = {title : info["title"],
                                adress: info["address"],
                                host:info["host_organization"],
                                event_type: info["event_type"],
                                notes:info["notes"],
                                all_dates:info["all_dates"],
                                more_info_url:info["more_info_url"],
                                latitude :info["latitude"],
                                longitude: info["longitude"],
                                }
    })
    // console.log(formatedData);
}
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
  export const servicesFormatter = (res) => {
    let formattedData = {};
    let foodInc = []

    res.map((info) => {
      if (
        info["licencetypes"] === "FOOD SERVICE - PREMISES (SEATING)" ||
        info["licencetypes"] === "FOOD SERVICE - PREMISES (NO SEATING)"
      ) {
        formattedData = {
          name: info["tradename"],
          address: info["address"],
          licentype: info["licencetypes"],
          latitude: info["latitude"],
          longitude: info["longitude"],
          community: info["comdistnm"]
        };
      }
      foodInc.push(formattedData)
      const filterd = new Set([... foodInc])
      for (const item of filterd){
        // console.log("item~!!!!!",item);
      }
     
      
    });
  };