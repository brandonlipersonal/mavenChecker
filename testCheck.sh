# declare -A maven_var
# maven_var[pomFile]="./maven-project/pom.xml"
# maven_var[buildFile]="./maven-project/build.xml"

# Dictionary_Builder () {
#     declare -A The_Dictionary=([A_Key]=A_Word
#                                [B_KEY]=B_Word)
#     echo '('
#     for key in "${!The_Dictionary[@]}";
#     do
#         echo "[$key]=${The_Dictionary[$key]}"
#     done
#     echo ')'
# }
# declare -A The_Output_Dictionary="$(Dictionary_Builder)"
# for key in "${!The_Output_Dictionary[@]}";
# do
#     echo Filename: $key, Status: ${The_Output_Dictionary[$key]}
# done
# Create list of all files and directories, and insert it into dictionary builder



# Function to check if file is non binary
shopt -s globstar

# binaryCheck () {
# for eachfile in */**/***
# do
#     if [[ -s "$eachfile" ]];                        # -s returns true if file exists and has a size greater than 0
#     then
#         echo "$eachfile is a binary file"
#     else
#         echo "$eachfile is not a binary file"
#     fi
# done
# }

Function to check if its a directory and whether its empty
directoryCheck () {
for eachdirectory in */**/***
do
    if [[ -d "$eachdirectory" ]];                        # -s returns true if file exists and has a size greater than 0
    then
        if [ "$(ls -A $eachdirectory)" ];
        then
            echo "$eachdirectory is a directory and not empty"
        else
            echo "$eachdirectory is directory and is empty"
        fi
    else
        echo "$eachdirectory is not a directory"
    fi
done
}

directoryCheck
# Function to check i

shopt -u globstar