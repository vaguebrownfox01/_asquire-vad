import os
import shutil

root_data_folder = "unpackd_audio_all"
audio_files = os.listdir(root_data_folder)

# print(audio_files)


members_files = {}
for af in audio_files:
    id = af.split("_")[0]
    fpath = os.path.join(root_data_folder, af)
    try:
        fileArr: list = members_files[id]
        fileArr.append(fpath)
    except:
        members_files[id] = [fpath]
    # print(id, end=", ")

print("memb files", members_files)

if not os.path.exists("subjects_data"):
    os.mkdir("subjects_data")

for k in members_files.keys():
    mem_foldername = f"webapp-vadscripttest_{k}"
    mem_folder_path = os.path.join("subjects_data", mem_foldername)
    os.mkdir(mem_folder_path)
    for src in members_files[k]:
        src: str = src
        tc = src.split("/")[1].split("_")[-1].split(".")[0]
        stim = src.split("/")[1].split("_")[1]
        stim = stim.replace("Exhale|Wheeze|Inhale", "Breath")
        fname = f"tc_{tc}_webapp-vadscripttest_{k}-{stim}-0-asquire-mox.wav"
        dst = os.path.join(mem_folder_path, fname)
        shutil.copy(src, dst)


# members_stim = {}
# stims = {}
# for af in audio_files:
#     id = af.split("_")[0]
#     stim = af.split("_")[1]
#     stims[stim] = 0
#     try:
#         members_stim[id][stim] += 1
#     except:
#         try:
#             members_stim[id]
#         except:
#             members_stim[id] = {}
#         members_stim[id][stim] = 1
#     # print(id, end=", ")

# members_asm = {}
# for af in audio_files:
#     id = af.split("_")[0]
#     t = ""
#     if "before" in af:
#         t += "before, "
#         # t = af + ", "
#     elif "after" in af:
#         t += "after, "
#         # t = af + ", "
#     else:
#         continue
#     try:
#         members_asm[id] += t
#     except:
#         members_asm[id] = t

# print("id", end=", ")
# for k in stims.keys():
#     print(k, end=", ")
# print("\n")
# for k in members_stim.keys():
#     print(k, end=", ")
#     for s in stims:
#         try:
#             print(members_stim[k][s], end=", ")
#         except:
#             print("", end=", ")
#     print()


# keys = members_asm.keys()
# values = members_asm.values()

print("no. of files: ", len(audio_files))
# print("members length: ", len(keys))
# print("values length: ", sum(values))
