from src.core import summariser

def test_summarise_transcript():
    transcript = "Test transcript with timestamps."
    out = summariser.summarise_transcript(transcript)
    assert isinstance(out, tuple)
    assert len(out) == 4
