verses = '''This is the horse and the hound and the horn,
that belonged to the farmer sowing his corn
that kept the rooster that crowed in the morn
that woke the priest all shaven and shorn
that married the man all tattered and torn
that kissed the maiden all forlorn
that milked the cow with the crumpled horn
that tossed the dog
that worried the cat
that killed the rat
that ate the malt
that lay in the house that Jack built.'''


def recite(start_verse, end_verse):
    start_string = "This is the"
    verses_list = verses.split('\n')
    target_verse = verses_list[-start_verse]

    return start_string + target_verse.split('the')[1]


if __name__ == "__main__":
    recite(1, 1)
