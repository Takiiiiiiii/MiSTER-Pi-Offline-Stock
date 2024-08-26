#!/usr/bin/python

# Run this Python script to generate the gamma profile.

print("# CRT gamma by c0d3h4x0r\n")

gamma_map = {
    0.00: 1.5,
    0.10: 1.4,
    0.20: 1.3,
    0.30: 1.2,
    0.40: 1.1,
    0.45: 1.0,
    0.50: 0.9,
    0.60: 0.8,
    0.70: 0.7,
    0.80: 0.6,
    0.90: 0.5
    }

for i in range(0, 256):
    percent_in = i / 255.0

    for k,v in gamma_map.items():
        if percent_in >= k:
            gamma = v
        else:
            break

    percent_out = percent_in ** gamma
    print("    " + str(int(255 * percent_out)))

