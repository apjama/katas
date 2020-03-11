LOOKUP = {
    "Phenylalanine": ["UUU", "UUC"],
    "Methionine": ["AUG"],
    "Leucine": ["UUA", "UUG"],
    "Serine": ["UCU", "UCC", "UCA", "UCG"],
    "Tyrosine": ["UAU", "UAC"],
    "Cysteine": ["UGU", "UGC"],
    "Tryptophan": ["UGG"],
    "STOP": ["UAA", "UAG", "UGA"]

}


def proteins(strand):
    strains_list = []
    if len(strand) > 3:
        strands_list = [strand[i: i + 3] for i in range(0, len(strand), 3)]
    else:
        strands_list = [strand]

    for single_strand in strands_list:
        strains_list.append(get_strains(single_strand))

    if "STOP" in strains_list:
        index_stop = strains_list.index("STOP")
        strains_list = strains_list[:index_stop]

    return strains_list


def get_strains(single_strand):
    for key in LOOKUP:

        if single_strand in LOOKUP[key]:
            return key
