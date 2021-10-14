import os

audio_files = os.listdir("/Volumes/Stuff/Work Stuff/Asquire/Data_asquire2")

# print(audio_files)


members = {}

for af in audio_files:
    id = af.split("_")[0]
    try:
        members[id] += 1
    except:
        members[id] = 1
    # print(id, end=", ")

members_asm = {}
for af in audio_files:
    id = af.split("_")[0]
    t = ""
    if "before" in af:
        t += "before, "
        # t = af + ", "
    elif "after" in af:
        t += "after, "
        # t = af + ", "
    else:
        continue
    try:
        members_asm[id] += t
    except:
        members_asm[id] = t

for k in members.keys():
    print(k, members[k])

keys = members.keys()
values = members.values()

print("no. of files: ", len(audio_files))
print("members length: ", len(keys))
# print("values length: ", sum(values))