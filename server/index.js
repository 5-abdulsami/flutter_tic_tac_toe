const express = require("express");
const http = require("http");
const mongoose = require("mongoose");

const app = express();
const port = process.env.PORT || 3000;

var server = http.createServer(app);
const Room = require("./models/room");

var io = require("socket.io")(server);

// middle ware
app.use(express.json());

const DB = "mongodb+srv://abdulsami3804:test123@cluster1.ttdfu.mongodb.net/?retryWrites=true&w=majority&appName=Cluster1";

io.on("connection", (socket) => {
    console.log("connected");
    socket.on("createRoom", async ({ nickname }) => {
        console.log(nickname);
        // room is created
        try {
            let room = new Room();
            let player = {
                socketID: socket.id,
                nickname: nickname,
                playerType: "X",
            };

            // player is stored in the room
            room.players.push(player);
            room.turn = player;
            room = await room.save();

            // we get this room._id after saving room in mongodb
            const roomId = room._id.toString();

            socket.join(roomId);
            // then tell our client that room has been created
            // go to the next page

            // io -> send data to everyone
            // socket => send data to yourself  
            io.to(roomId).emit('createRoomSuccess', room);
        } catch (e) {
            console.log(e);
        }

    });
});

mongoose.connect(DB).then(() => {
    console.log("connection successful");
}).catch((e) => {
    console.log(e);
});
// promise in JS = Future in Dart

server.listen(port, '0.0.0.0', () => {
    console.log(`server is running on ${port}`);
});