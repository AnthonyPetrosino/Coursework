#!/usr/bin/env python3
"""
Anthony Petrosino
Computer Security: hw3 question 3 part d
Given info:
- p1.bin: plaintext we know
- c1.bin: ciphertext of p1.bin  
- c2.bin: ciphertext of p2.bin (what we want to recover)

Thr output is recovered_p2.bin, which contains the recovered plaintext p2.

How it works:
1. Get keystream: keystream = c1 XOR p1
2. Recover p2: p2 = c2 XOR keystream

I used ai to help write this code, given the implementation details described above.

"""

def main():
    # Read the files
    with open("p1.bin", "rb") as f:
        p1 = f.read()
    with open("c1.bin", "rb") as f:
        c1 = f.read()
    with open("c2.bin", "rb") as f:
        c2 = f.read()
    
    # Find the keystream by XORing known plaintext with its ciphertext
    keystream = []
    for i in range(len(p1)):
        keystream.append(p1[i] ^ c1[i])
    
    # Recover p2 by XORing c2 with the keystream
    recovered_p2 = []
    for i in range(len(c2)):
        if i < len(keystream):
            # If we have keystream for this position
            recovered_p2.append(c2[i] ^ keystream[i])
        else:
            # No keystream available, can't recover this byte
            recovered_p2.append(0)
    
    # Save the result
    with open("recovered_p2.bin", "wb") as f:
        f.write(bytes(recovered_p2))
    
    # Show what we found
    print("Recovery complete!")
    print(f"Original p1 length: {len(p1)} bytes")
    print(f"Keystream length: {len(keystream)} bytes") 
    print(f"Target c2 length: {len(c2)} bytes")
    print(f"Recovered bytes: {min(len(keystream), len(c2))}")
    
    # Try to show recovered text
    try:
        # Remove trailing zeros and convert to text
        text = bytes(recovered_p2).rstrip(b'\x00').decode('utf-8')
        print(f"\nRecovered text:\n{text}")
    except:
        print("\nCouldn't display as text, showing first 50 bytes as hex:")
        hex_str = ''.join(f'{b:02x}' for b in recovered_p2[:50])
        print(hex_str)

if __name__ == "__main__":
    main()
