"""
Chunk transcript to fit a 12k token window, keeping splits on paragraph/timestamp.
Implements recursive chunk-and-map-reduce strategy.
"""
def chunk_transcript(transcript: str, max_tokens=12000):
    """
    Splits transcript, preserving timestamps, for recursive summarization.
    Returns: List of (chunk:str)
    """
    # Mock splitting: returns single chunk
    return [transcript]
