# Anthony Petrosino
# Homework 2, Question 4: Cryptanalyze Vigenere Ciphertext 

# Looked up the enumerate() function to get index and char in a loop.
# Consulted AI to help with implementing some of my calculations and some comments.

# How to run the program:
# python3 q4.py examplefile.txt

# You can use the output of this program as input to q3.py to help decrypt the ciphertext.
# For example, you can use this output:
# For key length 9:
# "Possible key 1: mprktgaxr
# Possible key 2: bavxdweix
# Possible key 3: vdgzxfpsn"
# To determine that the key is "marktwain"

# Graded by Sean Baker: 10/10

import sys


def calc_ioc(text):
    frequency = {}  # Dictionary to hold frequency of each letter

    for char in text:
        if char.isalpha():
            char = char.lower()  # Not case sensitive
            if char in frequency:
                frequency[char] += 1  # Increment count at that char position
            else:
                frequency[char] = 1  # Initialize count at that char position

    n = sum(frequency.values())
    if n <= 1:  # Need at lease 2 characters to calculate ioc
        return 0.0

    # Calculate ioc
    ioc = sum(count * (count - 1) for count in frequency.values())
    ioc = ioc / (n * (n - 1))
    return ioc


def test_key_lengths(filename, max_key_length):
    with open(filename, 'r') as file:
        text = file.read()

    print("Testing key lengths for file:", filename)
    print("Key Length | Average IoC")
    print("-" * 25)

    key_length_distances = []  # Contains (distance, key length)
    target_ioc = 0.0658

    for key_length in range(1, max_key_length + 1):
        subsequences = [''] * key_length  # Initialize list of empty strings
        
        # Split text into subsequences
        for i, char in enumerate(text):
            subsequences[i % key_length] += char
        
        # Calculate ioc for each subsequence of this length
        subseq_iocs = []
        for subseq in subsequences:
            if len(subseq) > 0:
                subseq_iocs.append(calc_ioc(subseq))
        
        # Calculate average ioc for this key length
        avg_ioc = sum(subseq_iocs) / len(subseq_iocs) if subseq_iocs else 0
        print(key_length, " | ", avg_ioc)

        diff = abs(target_ioc - avg_ioc)  # Distance from target ioc, abs = absolute value
        key_length_distances.append((diff, key_length))
    
    key_length_distances.sort()
    return [key_length for distance, key_length in key_length_distances[:3]]  # Return 3 closest key lengths    


def build_text_blocks(filename, key_length):
    with open(filename, 'r') as file:
        text = file.read()

    text_blocks = [[] for i in range(key_length)]  # Create list of size key length of empty lists
    count = 0
    for char in text:
        text_blocks[count % key_length].append(char)  
        count += 1
    
    return text_blocks


def guess_key(text):
    letter_frequencies = [0] * 26 

    for char in text:  # Count frequency of each letter in the text block
        if char.isalpha():
            char = char.lower()
            letter_frequencies[ord(char) - ord('a')] += 1
        
    top_3 = []  # Get indices of the 3 most frequent letters
    for i in range(3):
        max_index = letter_frequencies.index(max(letter_frequencies))
        top_3.append(max_index)
        letter_frequencies[max_index] = -1

    shifts = [(index - (ord('e') - ord('a'))) % 26 for index in top_3]  # Calculate shifts assuming each maps to 'e'
    return shifts
    
if __name__ == "__main__":
    if len(sys.argv) == 2:
        closest_key_lengths = test_key_lengths(sys.argv[1], max_key_length=20)
        print("Closest key lengths:", closest_key_lengths)
        
        for j, key_length in enumerate(closest_key_lengths):
            print(f"\nFor key length {key_length}:")
            text_blocks = build_text_blocks(sys.argv[1], key_length)
            all_shifts = [guess_key(block) for block in text_blocks]
            for i in range(3):
                shifts = []
                for block_shifts in all_shifts:
                    shifts.append(block_shifts[i])
                key = ''
                for shift in shifts:
                    letter = chr(shift + ord('a'))
                    key += letter
                print(f"Possible key {i+1}: {key}")
        
        print("\nTake these keys and use them to decrypt the ciphertext using q3.py.")
        print("Then, analyze the decrypted text to determine which key produces the most coherent plaintext.")
    else: 
        print("Usage: python q4.py <filename>")
