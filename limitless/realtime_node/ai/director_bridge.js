const axios = require("axios");

async function askDirector(activeCameras) {
  const res = await axios.post("http://localhost:8000/ai/director/select", {
    cameras: activeCameras
  });

  return res.data.selected_camera;
}

module.exports = { askDirector };const axios = require("axios");
const FormData = require("form-data");
const fs = require("fs");

async function analyzeFrames(cameraFrames) {
  const form = new FormData();
  const cameras = Object.keys(cameraFrames);
  for (let id of cameras) {
    form.append("files", cameraFrames[id], `${id}.jpg`);
  }
  form.append("cameras", JSON.stringify(cameras));

  const res = await axios.post(
    "http://localhost:8000/ai/director/analyze",
    form,
    { headers: form.getHeaders() }
  );

  return res.data;
}

module.exports = { analyzeFrames };

