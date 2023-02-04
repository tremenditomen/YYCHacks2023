import EventList from "../models/Events.js";

export const getEventList = async(req, res)=> {
    try {
        const events = await EventList.find({users:req.userId});
        res.status(200).json(events);
    }catch(error){
        res.status(400).json({message:error.message});

    }
}

export const  getEvents = async(req, res) => {
    // try {
    //     const event = 
    // }
}