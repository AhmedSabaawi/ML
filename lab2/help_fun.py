import os
import pandas as pd


#  create a function that read all the csv file from path and create a pakled file for each csv file
def read_csv_files(path):
    # get all the files in the path
    files = os.listdir(path)
    # iterate through the files
    for file in files:
        # check if the file is a csv file
        # create folder to save the pickle files
        if not os.path.exists(path + "pkl_files"):
            os.makedirs(path + "pkl_files")
        if file.endswith(".csv"):
            # read the csv file
            data = pd.read_csv(path + file)
            # save the data to a pickle file
            data.to_pickle(path + "pkl_files/" + file.split(".")[0] + ".pkl")
            print(f"{file} has been read and saved as a pickle file")
