import streamlit as st
import logging
from datetime import datetime
from src.api.limitless import fetch_transcript
from src.core.summariser import summarise_transcript
from src.api.notion import persist_to_notion
from src.api.todoist import send_task

logger = st.logger.get_logger(__name__)

st.set_page_config(page_title="Day-Summary & Action-Hub", layout="wide")
st.title("Day-Summary & Action-Hub")

# UI: Select date or upload file
col1, col2 = st.columns([2,3])

def get_transcript():
    upload = st.sidebar.file_uploader("Upload transcript file", type=["txt"])
    date_input = st.sidebar.date_input("Date", datetime.now())
    if upload:
        transcript = upload.read().decode()
        logger.info("Transcript loaded from file.")
    else:
        date = date_input.strftime("%Y-%m-%d")
        transcript = fetch_transcript(date)
        logger.info(f"Pulled transcript for {date} via API.")
    return transcript

transcript = get_transcript()

if transcript:
    narrative, business, personal, time_blocks = summarise_transcript(transcript)
    # Persist to Notion DB
    if st.button("Persist summary & tasks to Notion DB"):
        success = persist_to_notion(datetime.now().strftime("%Y-%m-%d"), narrative, business+personal, time_blocks)
        if success:
            st.success("Saved to Notion!")
        else:
            st.error("Notion save failed!")

    with col1:
        st.subheader("Narrative")
        st.write(narrative)
    with col2:
        with st.expander("Business Tasks", expanded=True):
            for bt in business:
                if st.button(f"Send: {bt}"):
                    ok, msg = send_task(bt)
                    if ok:
                        st.toast("Pushed to Todoist!", icon="✅")
                    else:
                        st.toast("Todoist failed!", icon="🚫")
                st.markdown(f"- {bt}")
        with st.expander("Personal Tasks", expanded=True):
            for pt in personal:
                if st.button(f"Send: {pt}"):
                    ok, msg = send_task(pt)
                    if ok:
                        st.toast("Pushed to Todoist!", icon="✅")
                    else:
                        st.toast("Todoist failed!", icon="🚫")
                st.markdown(f"- {pt}")
