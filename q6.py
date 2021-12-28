import re

# read txt file into string variable
file = open('file_name.txt', 'r')
string = file.read()
file.close()

patternA = "[01][0-9][0-9][0-9]|20[01][0-9]|202[01]/0[1-9]|[01][12]/0[1-9]|[12][0-9]|3[01]" # yyyy mm dd
patternB = "0[1-9]|[01][12]/0[1-9]|[12][0-9]|3[01]/[01][0-9][0-9][0-9]|20[01][0-9]|202[01]" # mm dd yyyy
patternC = "[01][0-9][0-9][0-9]|20[01][0-9]|202[01]/0[1-9]|[01][12]/0[1-9]|[12][0-9]|3[01]" # dd mm yyyy
patternD = "0[1-9]|[12][0-9]|3[01] \D\D\D|\D\D\D\D [01][0-9][0-9][0-9]|20[01][0-9]|202[01]" # dd month yyyy

a = len(re.findall(patternA, string))
b = len(re.findall(patternB, string))
c = len(re.findall(patternC, string))
d = len(re.findall(patternD, string))

print(a, b, c, d, sep="\n")
