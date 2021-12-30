import os

os.chdir(“.\my-python-project”) # cd to the git repo

def is_py(filename):
  if filename[-3:] == ".py":
    return True
  else:
    return False

all_files = os.listdir() # list of all files
py_files = list(filter(is_py, all_files))
print(len(py_files) # number of py files
