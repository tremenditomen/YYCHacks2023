import mongoose from "mongoose";

const Event = mongoose.Schema({
    event: {
        type: {
            id: Number,
            name: String,
            date: Date,
            address: String,
            points: Number,
            description: String,
            imageUrl: String,
        }
    },
    saved: {
        type: Boolean,
        default: false,
    },
    user: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Users'
    },
});

const EventList = mongoose.model("EventList", Event);
export default EventList;