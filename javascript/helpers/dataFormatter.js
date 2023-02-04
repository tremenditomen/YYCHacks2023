export const dataFormatter = (data)=>{
    let formatedData = {}
    data.map((info)=>{
                formatedData = {title : info["title"],
                                host:info["host_organization"],
                                event_type: info["event_type"],
                                notes:info["notes"],
                                all_dates:info["all_dates"],
                                more_info_url:info["more_info_url"],
                                latitude :info["latitude"],
                                longitude: info["longitude"],
                                }
    })
}