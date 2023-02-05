import express from 'express';
import { getEventList } from '../controller/Event.js';
const router = express.Router();

router.get("/eventList", getEventList)

export default router;