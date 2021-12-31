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
for dirpath, dirnames, filenames in tuple(os.walk(".")):
  for (filename in filenames):
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

#qn5e
def get_size(pathname):
  size = 0
  for dirpath, dirnames, filenames in tuple(os.walk(pathname)):
    for filename in filenames:
      fp = os.path.join(dirpath, filename)
      if not os.path.islink(fp):
        size += os.path.getsize(fp)
  return size

subdirectories1 = tuple(os.walk("."))[1] # list of folders
for subdir1 in subdirectories1:
  os.chdir(".\" + subdir) # cd into subdir1
  subdirectories2 = os.walk(".\\" + subdir) # list of folders in current subdir1
  size1 = 0 
  for (subdir2 in subdirectories2) :
    size2 = get_size(os.getcwd()) # size of current subdir2
    print(f"{subdir2}: {size2}") # prints name of subdir2 and its size
    size1 += size2
  print(f"{subdir1}: {size1}") # prints name of subdir1 and its size
