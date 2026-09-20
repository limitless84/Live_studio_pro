# backend_fastapi/app/ai/director/cinematic_rules.py

class CinematicRules:
    def select_shot(self, faces, emotion, motion_level):
        """
        انتخاب نوع شات:
        - close-up
        - medium
        - wide
        """

        if faces == 0:
            return "wide"

        if emotion in ["happy", "surprise"] and motion_level < 0.3:
            return "close-up"

        if emotion in ["angry", "fear"]:
            return "medium"

        # حالت پیش‌فرض
        return "medium"

cinematic_rules = CinematicRules()
