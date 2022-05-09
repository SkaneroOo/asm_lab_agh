from sys import argv

if len(argv) == 1:
    print("No file provided.")
    exit(1)

with open(argv[1], "r") as f:
    for line in f:
        if "rsp=" in line:
            num = int(line[4:16])