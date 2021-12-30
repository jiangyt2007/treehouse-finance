import os

os.chdir(“.\my-python-project”) # cd to the git repo

def is_py(filename):
  if filename[-3:] == ".py":
    return True
  else:
    return False

def get_num_lines(filename):
  rows = open(filename).read()
  code = 0
  comments = 0
  functions = 0
  for row in rows:
    s = row.strip()
    if len(s) == 0:
      continue
    else if s[0] == "#":
      comments += 1
    else:
      if s[:4] == "def ":
        functions += 1
      code += 1
  return [code, comments, functions]
  
all_files = os.listdir() # list of all files
py_files = list(filter(is_py, all_files))
print(f"Number of python files: {len(py_files)}") # qn5a

num_code_lines = 0
num_comment_lines = 0
num_functions = 0
      
for dirpath, dirnames, filenames in os.walk("."):
  for (filename in filenames) :
      if is_py(filename):
        lines = get_num_lines(filename) # [num of code lines, num of comment lines, num of functions]
        num_code_lines += lines[0]
        num_comment_lines += lines[1]
        num_functions += lines[2]
        
print(f"""
Number of lines of code: {num_code_lines}
Number of lines of comments: {num_comments_lines}
""") #qn5b

print(f"Number of functions defined: {num_functions}") #qn5c
