# backend_fastapi/app/ai/director/transition_engine.py

import random

class TransitionEngine:
    def choose_transition(self, shot_type):
        """
        انتخاب ترنزیشن مناسب بر اساس نوع شات
        """

        if shot_type == "close-up":
            return "smooth-zoom"

        if shot_type == "medium":
            return "cut"

        if shot_type == "wide":
            return "fade"

        return random.choice(["cut", "fade"])

transition_engine = TransitionEngine()
