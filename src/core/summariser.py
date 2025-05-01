"""
Summarise transcript text using OpenAI, extracting narrative and action items.
Handles chunking and timestamped paragraph formatting per functional spec.
"""
import openai
from src.utils.chunker import chunk_transcript
from src.config import DEFAULT_MODEL

# TODO: Incorporate temperature=0.3, top_p=1, seed=123 in OpenAI call
# TODO: Support chunk-and-map-reduce summarization

def summarise_transcript(transcript, chunks=None):
    """
    Summarise complete transcript (or recursively chunked pieces).
    Returns: (story_narrative: str, business_tasks: list, personal_tasks: list, time_blocks: list)
    """
    # Placeholder implementation
    # Parse transcript -> chunks
    if chunks is None:
        chunks = chunk_transcript(transcript)
    story_narrative = "Generated story-style day narrative based on transcript chunks."
    business_tasks  = ["Email marketing plan @work due:tomorrow p1"]
    personal_tasks  = ["Buy groceries @errands p2 due:today"]
    time_blocks     = ["08:15-08:47"]
    return story_narrative, business_tasks, personal_tasks, time_blocks
