import os

audio_files = os.listdir("unpackd_audio")

# print(audio_files)


members = {}
for af in audio_files:
    id = af.split("_")[0]
    try:
        members[id] += 1
    except:
        members[id] = 1
    # print(id, end=", ")

members_stim = {}
stims = {}
for af in audio_files:
    id = af.split("_")[0]
    stim = af.split("_")[1]
    stims[stim] = 0
    try:
        members_stim[id][stim] += 1
    except:
        try:
            members_stim[id]
        except:
            members_stim[id] = {}
        members_stim[id][stim] = 1
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

print("id", end=", ")
for k in stims.keys():
    print(k, end=", ")
print("\n")
for k in members_stim.keys():
    print(k, end=", ")
    for s in stims:
        try:
            print(members_stim[k][s], end=", ")
        except:
            print("", end=", ")
    print()


# keys = members_asm.keys()
# values = members_asm.values()

print("no. of files: ", len(audio_files))
# print("members length: ", len(keys))
# print("values length: ", sum(values))
