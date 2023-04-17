```
cmsrel CMSSW_9_4_4
cd ./CMSSW_9_4_4/src
git clone https://github.com/arhayrap/BToPhiK_py.git
```

# Json files with the runs and the luminosity.

```
cd get_json
cmsenv
```

Change the PATH_TO_YOUR_PROJECT, PATH_TO_THE_OUTPUT_FOLDER and /PUBLIC_DIRECTORY/CERTIFICATE as you need in the .csh files. 

To submit the jobs:
```
condor_submit Run_Background_A.sub
condor_submit Run_Background_B.sub
condor_submit Run_Background_C.sub
condor_submit Run_Background_D.sub
```

When the jobs are done merge the output json files for each dataset:

```
python3 merge_json.py
```

When the files are merged:

```
./setup_brilcalc.sh
source /cvmfs/cms-bril.cern.ch/cms-lumi-pog/brilws-docker/brilws-env
brilcalc lumi -b "STABLE BEAMS" --normtag /cvmfs/cms-bril.cern.ch/cms-lumi-pog/Normtags/normtag_PHYSICS.json -u /fb -i Background_A.json -o Background_A.txt
brilcalc lumi -b "STABLE BEAMS" --normtag /cvmfs/cms-bril.cern.ch/cms-lumi-pog/Normtags/normtag_PHYSICS.json -u /fb -i Background_B.json -o Background_B.txt
brilcalc lumi -b "STABLE BEAMS" --normtag /cvmfs/cms-bril.cern.ch/cms-lumi-pog/Normtags/normtag_PHYSICS.json -u /fb -i Background_C.json -o Background_C.txt
brilcalc lumi -b "STABLE BEAMS" --normtag /cvmfs/cms-bril.cern.ch/cms-lumi-pog/Normtags/normtag_PHYSICS.json -u /fb -i Background_D.json -o Background_D.txt
```
