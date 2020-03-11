import string
import random


class Robot:
    used_names = []

    def __init__(self):
        self.reset()

    def reset(self):
        return self.generate_new_name()

    def generate_new_name(self):
        random_number = random.randint(100, 999)
        letters_list = random.sample(string.ascii_uppercase, 2)
        letters_string = "".join(letters_list)
        new_name = "{}{}".format(letters_string, random_number)

        if new_name in self.used_names:
            self.generate_new_name()
        else:
            self.name = new_name
            self.used_names.append(new_name)
