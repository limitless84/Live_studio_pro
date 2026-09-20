# backend_fastapi/app/api/live_director_route.py

from fastapi import APIRouter
from app.ai.ai_director import director

router = APIRouter()

@router.post("/ai/director/select")
async def select_camera(data: dict):
    cameras = data.get("cameras", [])
    selected = director.analyze_scene(cameras)

    return {"selected_camera": selected}from fastapi import UploadFile, File
from typing import List
from app.ai.ai_director import director

@router.post("/ai/director/analyze")
async def director_analyze(cameras: List[str] = [], files: List[UploadFile] = File(...)):
    """
    دریافت فریم‌ها از Node.js برای هر دوربین و تصمیم انتخاب بهترین
    """
    frames = {}
    for i, file in enumerate(files):
        cam_id = cameras[i] if i < len(cameras) else f"cam_{i}"
        frames[cam_id] = await file.read()

    result = director.analyze_frames(frames)
    return result

