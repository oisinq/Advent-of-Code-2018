from collections import defaultdict

with open("input.txt", "r") as f:
    values = []
    for line in f:
        values.append(line.strip())

twosCount, threesCount = 0, 0

for box in values:
    foundTwo, foundThree = False, False
    letterdict = defaultdict(int)
    for letter in box:
        letterdict[letter] = letterdict[letter] + 1
    for k, result in letterdict.items():
        if result == 2 and not foundTwo:
            twosCount += 1
            foundTwo = True
        if result == 3 and not foundThree:
            threesCount += 1
            foundThree = True

print(threesCount*twosCount)