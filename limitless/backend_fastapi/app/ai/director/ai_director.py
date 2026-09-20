from typing import Dict
from app.ai.analysis.face_tracking import tracker
from app.ai.analysis.scene_analyzer import scene_analyzer
from app.ai.analysis.emotion_engine import emotion_engine
from app.ai.director.cinematic_rules import cinematic_rules
from app.ai.director.transition_engine import transition_engine

class AIDirector:
    def __init__(self):
        self.last_decision = None

    def analyze_frames(self, frames: Dict[str, bytes]):
        if not frames:
            return None

        camera_results = {}

        for cam_id, frame_bytes in frames.items():
            face_info = tracker.analyze_frame(frame_bytes, cam_id)
            scene_score = scene_analyzer.score_scene(frame_bytes)
            emotion_info = emotion_engine.detect_emotion(frame_bytes)

            shot_type = cinematic_rules.select_shot(
                face_info["faces"], 
                emotion_info["emotion"], 
                scene_score
            )

            transition = transition_engine.choose_transition(shot_type)

            final_score = (
                (face_info["faces"] * 1.5) +
                (scene_score * 1.2) +
                (emotion_info["score"] * 2.0)
            )

            camera_results[cam_id] = {
                "faces": face_info["faces"],
                "emotion": emotion_info,
                "shot": shot_type,
                "transition": transition,
                "score": float(final_score),
            }

        best = max(camera_results, key=lambda c: camera_results[c]["score"])
        result = {
            "selected": best,
            "cameras": camera_results,
            "transition": camera_results[best]["transition"],
            "shot": camera_results[best]["shot"],
        }

        self.last_decision = result
        return result

director = AIDirector()


ent_camera = selected

        return {"selected": selected, "scores": scores}

director = AIDirector()

