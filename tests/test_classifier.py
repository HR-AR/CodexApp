from src.core import classifier

def test_classify_and_format_actions():
    actions = ["Email boss @work", "Buy milk @errands"]
    business, personal = classifier.classify_and_format_actions(actions)
    assert isinstance(business, list)
    assert isinstance(personal, list)
