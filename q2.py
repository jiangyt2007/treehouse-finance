def exists(v):
    if v in globals():
        return True
    if  v in locals():
        return True
    else:
        return False
