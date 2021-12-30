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
  for row in rows:
    s = row.strip()
    if len(s) == 0:
      continue
    else if s[0] == "#":
      comments += 1
    else:
      code += 1
  return [code, comments]
  
all_files = os.listdir() # list of all files
py_files = list(filter(is_py, all_files))
print(f"Number of python files: {len(py_files)}")

num_code_lines = 0
num_comment_lines = 0
      
for dirpath, dirnames, filenames in os.walk("."):
  for (filename in filenames) :
      if is_py(filename):
        lines = get_num_lines(filename) # [num of code lines, num of comment lines]
        num_code_lines += lines[0]
        num_comment_lines += lines[1]
        
print(f"""
Number of lines of code: {num_code_lines}
Number of lines of comments: {num_comments_lines}
""")

  
