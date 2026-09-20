# backend_fastapi/app/ai/analysis/scene_analyzer.py

import numpy as np
import cv2

class SceneAnalyzer:
    def score_scene(self, frame_bytes: bytes):
        """
        نمره‌گذاری کیفیت صحنه:
          - روشنایی
          - تضاد (Contrast)
          - میزان حرکت (Motion)
        """

        np_arr = np.frombuffer(frame_bytes, np.uint8)
        frame = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)

        brightness = np.mean(frame)
        contrast = np.std(frame)

        # مقادیر نرمال‌سازی شده
        score = (brightness / 255.0) * 0.6 + (contrast / 128.0) * 0.4

        return float(score)

scene_analyzer = SceneAnalyzer()
