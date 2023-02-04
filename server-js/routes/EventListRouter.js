import express from 'express';
import { getEventList } from '../controller/Event.js';
const router = express.Router();

router.get("/", getEventList)

export default router;