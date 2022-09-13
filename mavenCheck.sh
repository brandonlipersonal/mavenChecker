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
#

# Code Starts -----------------------------------------------------
 
# Look for non-binary files and notify user to delete or update

# firstLevel='./*'
# secondLevel='./*/*'
# thirdLevel='./*/*/*'
# for eachfile in $firstLevel $secondLevel $thirdLevel
# do
#     if [[ -s $eachfile ]];              # -s returns true if file exists and has a size greater than 0
#     then
#         echo "$eachfile This is a binary file"
#     else
#         echo "$eachfile This is a non-binary file"
#     fi
# done


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

# Testing if directories are empty
# FILE=""
# DIR="maven-project"
# if [ -d "$DIR" ]
# then   
#     if [ "$(ls -A $DIR)" ]; then
#         echo "$DIR is not empty"
#     else
#     echo "$DIR is empty"
#     fi
# else
#     echo "Directory $DIR not found."
# fi


#------------------------------------
