import re

# read txt file into string variable
file = open('file_name.txt', 'r')
string = file.read()
file.close()

patternA = "[0-2021]/[01-12]/[01-31]" # yyyy mm dd
patternB = "[01-12]/[01-31]/[0000-2021]" # mm dd yyyy
patternC = "[0000-2021]/[01-12]/[01-31]" # dd mm yyyy
patternC = "[0-31] [months] [0000-2021]" # dd month yyyy

a = len(re.findall(patternA, string))
b = len(re.findall(patternB, string))
c = len(re.findall(patternC, string))
d = len(re.findall(patternD, string))

print(a, b, c, d, sep="\n")
