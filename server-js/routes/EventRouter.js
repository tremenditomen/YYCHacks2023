import express from 'express';
import { getEvents, getEventsParams, getArt } from "../controller/Event.js";
const router = express.Router();

router.get("/art/", getArt);
router.get("/:term/", getEventsParams);
router.get("/", getEvents);

export default router;