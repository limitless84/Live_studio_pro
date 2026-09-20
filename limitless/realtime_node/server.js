// server.js
const express = require("express");
const cors = require("cors");
const http = require("http");
const { Server } = require("socket.io");

const app = express();
app.use(cors());
app.use(express.json());

// REST API routes
require("./api/broadcast")(app);

const server = http.createServer(app);

// Socket.io for signaling
const io = new Server(server, {
  cors: { origin: "*" }
});

// WebRTC signaling
require("./signaling/webrtc_signaling")(io);

server.listen(4000, () => {
  console.log("Realtime Node server running on port 4000");
});
const { askDirector } = require("./ai/director_bridge");

socket.on("join-camera", async (roomId) => {
    rooms[roomId] = rooms[roomId] || { host: null, cameras: [] };
    rooms[roomId].cameras.push(socket.id);
    socket.join(roomId);
    console.log(`Camera joined room ${roomId}`);

    if (rooms[roomId].host) {
        io.to(rooms[roomId].host).emit("camera-joined", socket.id);
    }

    // Run AI Director
    const activeCameras = rooms[roomId].cameras;
    const selected = await askDirector(activeCameras);

    if (selected && rooms[roomId].host) {
        io.to(rooms[roomId].host).emit("director-select", {
            cameraId: selected
        });
    }
});const result = await analyzeFrames(cameraFrames);

io.to(rooms[roomId].host).emit("director-select", {
    cameraId: result.selected,
    transition: result.transition,
    shot: result.shot,
    scores: result.cameras
});
const streamRoutes = require("./api/stream_routes");
app.use("/api/stream", streamRoutes);
const express = require('express');
const { startFFmpeg, stopFFmpeg } = require('./rtmp/ffmpeg_encoder');
const router = express.Router();

router.post('/api/stream/start', async (req, res) => {
    const rtmpUrl = req.body.rtmp;

    if (!rtmpUrl) {
        return res.status(400).json({ error: "RTMP URL not provided" });
    }

    try {
        console.log("Starting stream:", rtmpUrl);
        await startFFmpeg(rtmpUrl);
        res.json({ status: "started" });
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: "Failed to start stream" });
    }
});

router.post('/api/stream/stop', async (req, res) => {
    try {
        stopFFmpeg();
        res.json({ status: "stopped" });
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: "Failed to stop stream" });
    }
});

module.exports = router;
app.use(require("./stream_routes"));




