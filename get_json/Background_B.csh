#!/bin/tcsh

setenv current_DIr `pwd`
setenv X509_USER_PROXY /PUBLIC_DIRECTORY/CERTIFICATE
cd /PATH_TO_YOUR_PROJECT/
source /afs/cern.ch/cms/cmsset_default.csh
cmsenv
echo "before the first cp"
cp ~/public/ /tmp/
cd $current_DIr

set newid=`expr $1 + 1`
cmsenv

cp                 /PATH_TO_YOUR_PROJECT/llp_analyzer/RazorRun_T2 .
cp -r -f           /PATH_TO_YOUR_PROJECT/run_printJson.sh .
./run_printJson.sh /PATH_TO_YOUR_PROJECT/Background_B.txt 1 $newid 2500
cp ./_/*.json      /PATH_TO_THE_OUTPUT_FOLDER/Lumi_json_$newid.json

rm -r *