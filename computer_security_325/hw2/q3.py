# Anthony Petrosino
# Homework 2, Question 3: Vigenere Cipher

# The text you will be encrypting/decrypting must be in a text file.
# Treats non-alpha characters as non-encrypted characters and differs
# between uppercase and lowercase letters.
# The key must be alphabetic characters only.

# How to run the program:
# python3 q3.py decrypt examplefile.txt key

# Looked up ord() functionality to convert char to ascii value

# Grded by Sean Baker: 10/10

import sys


def vigenere_cipher_decrypt(filename, key):
    with open(filename, 'r') as file:
        text = file.read()
    print("Decrypting text:", filename)
    print("Using key:", key)

    decrypted_text = []
    key_position = 0
    key_length = len(key)

    for char in text:
        current_char = ''
        if char.isalpha():
            shift = ord(key[key_position % key_length])  # Calculate key ascii value
            if char.islower():  # If the char is lowercase, use lowercase ascii offset
                current_char = chr((((ord(char) - 97) - (shift - 97)) % 26) + 97)
            if char.isupper():  # If the char is uppercase, use uppercase ascii offset
                current_char = chr((((ord(char) - 65) - (shift - 65)) % 26) + 65)
        else:
            current_char = char  # Accommodate non-alpha characters
        decrypted_text.append(current_char)
        key_position += 1
    return decrypted_text


def vigenere_cipher_encrypt(filename, key):
    with open(filename, 'r') as file:
        text = file.read()
    print("Encrypting text:", filename)
    print("Using key:", key)

    decrypted_text = []
    key_position = 0
    key_length = len(key)

    for char in text:
        next_char = ''
        if char.isalpha():
            shift = ord(key[key_position % key_length])  # Calculate key ascii value
            if char.islower():  # If the char is lowercase, use lowercase ascii offset
                next_char = chr((((ord(char) - 97) + (shift - 97)) % 26) + 97)
            if char.isupper():  # If the char is uppercase, use uppercase ascii offset
                next_char = chr((((ord(char) - 65) + (shift - 65)) % 26) + 65)
        else:
            next_char = char  # Accommodate non-alpha characters
        decrypted_text.append(next_char)
        key_position += 1
    return decrypted_text


if __name__ == "__main__":
    if len(sys.argv) == 4 and sys.argv[1] == "decrypt":
        print(vigenere_cipher_decrypt(filename=sys.argv[2], key=sys.argv[3]))
    elif len(sys.argv) == 4 and sys.argv[1] == "encrypt":
        print(vigenere_cipher_encrypt(filename=sys.argv[2], key=sys.argv[3]))
    else: 
        print("Usage: python q3.py <decrypt/encrypt> <filename> <key>")