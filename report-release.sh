#/bin/bash




## Reports a release of binaries to kosli
TRAIL_ID=release-1
FLOW_ID=releases

kosli begin trail $TRAIL_ID \
	--flow $FLOW_ID \
	--description "Recording every vendor release" 


# for every file in server
for file in server/*; do
    file_name=$(basename $file)
    #remove the file extension
    artifact_name="${file_name%.*}"

    kosli attest artifact $file \
        --artifact-type file \
        --build-url https://exampleci.com \
        --name $artifact_name \
        --flow FLOW_ID \
        --trail $TRAIL_ID \
        --commit-url "https://github.com/" \
        --commit "1234567890" \


done