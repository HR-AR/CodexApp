"""
Classifies action items as Business or Personal and formats with Todoist quick-add syntax.
"""
def classify_and_format_actions(action_texts):
    """
    Args:
        action_texts (list[str]): List of raw action items.
    Returns:
        business: list[str], personal: list[str]
    """
    # Placeholder: Implement with OpenAI
    business = [a for a in action_texts if "work" in a or "Email" in a]
    personal = [a for a in action_texts if "groceries" in a or "Buy" in a]
    return business, personal
