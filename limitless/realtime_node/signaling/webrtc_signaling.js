// realtime_node/signaling/webrtc_signaling.js

module.exports = (io) => {
  // rooms = {
  //   roomId: {
  //       host: socketId,
  //       cameras: [socketId, socketId]
  //   }
  // }
  const rooms = {};

  io.on("connection", (socket) => {
    console.log("Client connected:", socket.id);

    // Host joins room
    socket.on("join-host", (roomId) => {
      rooms[roomId] = rooms[roomId] || { host: null, cameras: [] };
      rooms[roomId].host = socket.id;
      socket.join(roomId);
      console.log(`Host joined room ${roomId}`);
    });

    // Camera joins room
    socket.on("join-camera", (roomId) => {
      rooms[roomId] = rooms[roomId] || { host: null, cameras: [] };
      rooms[roomId].cameras.push(socket.id);
      socket.join(roomId);
      console.log(`Camera joined room ${roomId}`);

      // Notify host that a new camera joined
      if (rooms[roomId].host) {
        io.to(rooms[roomId].host).emit("camera-joined", socket.id);
      }
    });

    // Relay WebRTC messages
    socket.on("offer", (data) => {
      io.to(data.target).emit("offer", {
        sdp: data.sdp,
        from: socket.id,
      });
    });

    socket.on("answer", (data) => {
      io.to(data.target).emit("answer", {
        sdp: data.sdp,
        from: socket.id,
      });
    });

    socket.on("ice-candidate", (data) => {
      io.to(data.target).emit("ice-candidate", {
        candidate: data.candidate,
        from: socket.id,
      });
    });

    // Cleanup when a client disconnects
    socket.on("disconnect", () => {
      console.log("Client disconnected:", socket.id);
      for (const roomId in rooms) {
        const room = rooms[roomId];

        if (room.host === socket.id) {
          console.log("Host left room:", roomId);
          delete rooms[roomId];
        } else {
          room.cameras = room.cameras.filter((c) => c !== socket.id);
        }
      }
    });
  });
};
