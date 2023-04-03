import glob
import json

path = "PATH_TO_THE_OUTPUT_FOLDER"

datasets = [
    "Background_A",
    "Background_B",
    "Background_C",
    "Background_D",
]

if __name__ == "__main__":
    for i in datasets:
        merged = dict()
        filelist = glob.glob(path+i+"/Lumi_json_*.json")
        print(len(filelist))
        print("")
        new_lumi = open("./"+i+".json", "w")
        for k in range(len(filelist)):
            f = open(filelist[k], "r")
            f_dict = json.loads(f.read())
            merged.update(f_dict)
            f.close()
            print(k, sep=', ')
        json.dump(merged, new_lumi)