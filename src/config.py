import os

DEFAULT_MODEL = os.getenv("OPENAI_DEFAULT_MODEL", "")   # leave blank by default
MODEL_ALIASES = {"best_reasoning": None}                # resolved at runtime
