import string


def is_pangram(sentence):
    if not sentence:
        return False

    sentence.replace("_", " ")
    cleaned_sentence = sentence.lower()

    letters = string.ascii_lowercase

    missing_letters = [
        letter for letter in letters if letter not in cleaned_sentence]
    if missing_letters:
        return False
    return True
