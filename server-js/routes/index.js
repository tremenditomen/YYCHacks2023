import  express from "express";
import EventListRouter from "./EventListRouter.js";
import EventRouter from "./EventRouter.js";
const rootRouter = express.Router();
rootRouter.use('/eventList',EventListRouter);
rootRouter.use('/events', EventRouter);
rootRouter.get('/',(req,res)=>{
    res.status(200).json({"message":"You have accessed the api"})
});


export default rootRouter;