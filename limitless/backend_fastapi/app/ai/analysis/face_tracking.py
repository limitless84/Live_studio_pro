# backend_fastapi/app/ai/analysis/face_tracking.py

import cv2
import face_recognition
import numpy as np

class FaceTracker:
    def __init__(self):
        self.last_face_positions = {}

    def analyze_frame(self, frame_bytes, camera_id: str):
        """
        ورودی:
          - frame_bytes: تصویر فعلی دوربین
          - camera_id: شناسه دوربین
        خروجی:
          - تعداد چهره‌ها + موقعیت اولین چهره
        """

        np_arr = np.frombuffer(frame_bytes, np.uint8)
        frame = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)
        rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)

        faces = face_recognition.face_locations(rgb)

        if faces:
            top, right, bottom, left = faces[0]
            self.last_face_positions[camera_id] = (top, right, bottom, left)
            return {
                "faces": len(faces),
                "center_x": (left + right) // 2,
                "center_y": (top + bottom) // 2
            }

        return {"faces": 0}

tracker = FaceTracker()
