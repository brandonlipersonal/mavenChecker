# !/bin/bash
 
# Look at the source code repo
# Check for all the required files (pom.xml, build.xml, deploy.sh, Appscan/, etc.).
# If wrong, show the missing files
# If yes, show that everything has been formatted correctly
 
# Stage A: Source Code Pull
# - cd /opta/app/CICD/file.CICD or .deployment
# - rm -rf * or select file (buildfiles)
# - ls -al
# - Checkout from version control (Git/RTC)
# Stage B: Build and Compile Artifacts
# - Call .jar file in RTC
# - RTC: cd to the main directory, make a directory for application
# - RTC: They zip all of their .yaml files, dockerfile, .jar into a .zip (fbp.notif-app-package.zip)

# Code Starts -----------------------------------------------------
 
# Look for non-binary files and binary files and displays them
directoryPath="C:/Users/15712/Desktop/mavenChecker/mavenChecker"
firstLevel='./*'
secondLevel='./*/*'
thirdLevel='./*/*/*'
fourthLevel='./*/*/*/*'
if [[ -d $directoryPath ]];                 # -d returns true if directory exists
then
    for eachfile in $firstLevel $secondLevel $thirdLevel $fourthLevel
    do
        if [[ -s $eachfile ]];              # -s returns true if file exists and has a size greater than 0
        then
            echo "$eachfile This is a binary file"
        else
            echo "$eachfile This is a non-binary file"
        fi
    done
else
    echo "$directoryPath is incorrect"
fi


# Check to see if standard files exist
# echo "----- Now checking if file is named correctly and exists -----"
 
# if [[ -f maven-project/deploy.sh ]]
# then
#     if [[ -s maven-project/deploy.sh ]]
#     then
#         echo "deploy.sh exists and not empty"
#     else
#         echo "deploy.sh exists but empty"
#     fi
# else
#     echo "deploy.sh does not exist"
# fi

# if [[ -f maven-project/build.xml ]]
# then
#     if [[ -s maven-project/build.xml ]]
#     then
#         echo "build.xml exists and not empty"
#     else
#         echo "build.xml exists but empty"
#     fi
# else
#     echo "build.xml does not exist"
# fi

# if [[ -f maven-project/pom.xml ]]
# then
#     if [[ -s maven-project/pom.xml ]]
#     then
#         echo "pom.xml exists and not empty"
#     else
#         echo "pom.xml exists but empty"
#     fi
# else
#     echo "pom.xml does not exist"
# fi

# ------------------------------------
# find ./maven-project/ -exec file {} \; | grep text | cut -d: -f1 --- For finding all binary files
# Issues
# When running the above script, child folders within the root directory return as non-binary even if they are populated
# Trying to find a way to show it is also binary if they have stuff inside
