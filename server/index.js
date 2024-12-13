const express = require("express");
const http = require("http");
const mongoose = require("mongoose");

const app = express();
const port = process.env.PORT || 3000;

const server = http.createServer(app);
const Room = require("./models/room");
const io = require("socket.io")(server);

app.use(express.json());

const DB = "mongodb+srv://abdulsami3804:test123@cluster1.ttdfu.mongodb.net/?retryWrites=true&w=majority&appName=Cluster1";

io.on("connection", (socket) => {
    console.log(`User connected: ${socket.id}`);

    // Create Room
    socket.on("createRoom", async ({ nickname }) => {
        try {
            let room = new Room();
            const player = {
                socketID: socket.id,
                nickname,
                playerType: "X",
            };

            room.players.push(player);
            room.turn = player;
            room = await room.save();

            const roomId = room._id.toString();
            socket.join(roomId);

            io.to(roomId).emit("createRoomSuccess", room);
        } catch (e) {
            console.log(e);
            socket.emit("errorOccured", "An error occurred while creating the room.");
        }
    });

    // Join Room
    socket.on("joinRoom", async ({ nickname, roomId }) => {
        try {
            if (!mongoose.Types.ObjectId.isValid(roomId)) {
                socket.emit("errorOccured", "Invalid room ID.");
                return;
            }

            let room = await Room.findById(roomId);
            if (!room) {
                socket.emit("errorOccured", "Room not found.");
                return;
            }

            if (room.players.length >= 2) {
                socket.emit("errorOccured", "Room is already full.");
                return;
            }

            if (room.isJoin) {
                const player = {
                    socketID: socket.id,
                    nickname,
                    playerType: "O",
                };

                room.players.push(player);
                room.isJoin = false;
                room = await room.save();

                socket.join(roomId);
                io.to(roomId).emit("joinRoomSuccess", room);
                io.to(roomId).emit("updatePlayers", room.players);
                io.to(roomId).emit("updateRoom", room);
            } else {
                socket.emit("errorOccured", "Game is in progress. Try again later.");
            }
        } catch (e) {
            console.log(e);
            socket.emit("errorOccured", "An error occurred while joining the room.");
        }
    });

    // Handle Disconnection
    socket.on("disconnect", () => {
        console.log(`User disconnected: ${socket.id}`);
        // Additional cleanup logic (e.g., removing players from rooms) can go here
    });
});

mongoose
    .connect(DB)
    .then(() => {
        console.log("Database connection successful.");
    })
    .catch((e) => {
        console.log("Database connection error:", e);
    });

server.listen(port, "0.0.0.0", () => {
    console.log(`Server is running on port ${port}`);
});
