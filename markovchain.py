import random

def generate(filename, length):
    file = open(filename, "r")
    text = file.read().split()

    final_string = ""
    current_word = text[0]

    for i in range(1, length):
        final_string += current_word + " "
        g = __get_list(text, current_word)
        current_word = random.choice(g)

    file.close()
    return final_string


def __get_list(text, current_word):
    return_list = []
    for idx in range(0, len(text) - 1):
        if text[idx] == current_word:
            return_list.append(text[idx + 1])
    if not return_list:
        return_list = get_list(text, text[0])
    return return_list
