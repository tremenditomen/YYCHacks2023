import mongoose from "mongoose";
import Events from "./Events"

const User = mongoose.Schema({
    userId: String,
    name: String,
    Points: Number,
    SavedEvents: [Events],
});

