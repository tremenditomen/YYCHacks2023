import express from 'express';
import { getEvents, getEventsParams } from '../controller/Event.js';
const router = express.Router();

router.get("/:term/", getEventsParams);
router.get("/", getEvents);

export default router;