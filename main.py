import os
import re

def search_word(word, directory):
    for subdir, dirs, files in os.walk(directory):
        for file in files:
            filepath = os.path.join(subdir, file)
            try:
                with open(filepath, 'r') as f:
                    text = f.read()
                    if re.search(word, text):
                        print(f"Found '{word}' in {filepath}")
            except UnicodeDecodeError:
                print(f"Skipping file {filepath} due to UnicodeDecodeError")

search_word('colorscheme', './')
