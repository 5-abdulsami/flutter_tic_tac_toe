const express = require("express");
const http = require("http");
const mongoose = require("mongoose");

const app = express();
const port = process.env.PORT || 3000;

var server = http.createServer(app);

var io = require("socket.io")(server);

// middle ware
app.use(express.json());

const DB = "mongodb+srv://abdulsami3804:test123@cluster1.ttdfu.mongodb.net/?retryWrites=true&w=majority&appName=Cluster1";

io.on("connection", (socket) => {
    console.log("connected");
    socket.on("createRoom", ({ nickname }) => {
        console.log(nickname);
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