"""
Limitless API client for pulling LLM transcripts by date.
"""
import requests
from datetime import datetime, timedelta

def fetch_transcript(date=None):
    """
    Fetch transcript string for a given date as YYYY-MM-DD (default: yesterday America/Chicago).
    """
    # Placeholder: Replace with real GraphQL `/lifelogs?date=` call with authentication
    if date is None:
        # convert now to America/Chicago and go one day back
        date = (datetime.now() - timedelta(days=1)).strftime("%Y-%m-%d")
    return f"Transcript for {date} (mock)"
