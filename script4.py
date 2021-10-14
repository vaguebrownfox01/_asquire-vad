import os

root_data_folder = "subjects_data_weekly"
data_chunk_folders = ["Week1", "Week2", "Week3", "Week4"]

contrib_data_path: str = os.path.join(root_data_folder, data_chunk_folders[0])
contrib_audio_folders: list = os.listdir(contrib_data_path)

# print(contrib_audio_folders)

for cont in contrib_audio_folders:

    cont: str = cont
    cont_audio_folder_path: str = os.path.join(contrib_data_path, cont)
    cont_audio_files: list = os.listdir(cont_audio_folder_path)

    # print(cont_audio_files)

    for aud in cont_audio_files:
        aud_fpath = os.path.join(cont_audio_folder_path, aud)
        print(aud_fpath)

    break