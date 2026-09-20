# backend_fastapi/app/ai/analysis/emotion_engine.py

import numpy as np
import cv2
from fer import FER

class EmotionEngine:
    def __init__(self):
        self.detector = FER()

    def detect_emotion(self, frame_bytes):
        np_arr = np.frombuffer(frame_bytes, np.uint8)
        frame = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)

        emotions = self.detector.detect_emotions(frame)
        if not emotions:
            return {"emotion": "neutral", "score": 0}

        dominant = emotions[0]["emotions"]
        emotion = max(dominant, key=dominant.get)
        score = dominant[emotion]

        return {"emotion": emotion, "score": float(score)}

emotion_engine = EmotionEngine()
