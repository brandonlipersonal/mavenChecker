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
# directoryPath="C:/Users/15712/Desktop/mavenChecker/mavenChecker" #(Laptop)
# directoryPath="C:/Users/brand/OneDrive/Desktop/Jenkins/mavenChecker" #(Desktop)

shopt -s globstar                                       # set it so that pattern ** used in a filename expansion context will match all files and zero or more directories and subdirectories
directoryPath="C:/Users/brand/OneDrive/Desktop/Jenkins/mavenChecker" 
if [[ -d "$directoryPath" ]];                           # -d returns true if directory exists
then
    for eachfile in */**/***                            # Loops through levels of subdirectories
    do
        if [[ -s "$eachfile" ]];                        # -s returns true if file exists and has a size greater than 0
        then
            echo "$eachfile" "This is a binary file"
        else
            if [[ -d "$eachfile" ]];                    # If it is non-binary, check to see if its a directory
            then
                echo ""$eachfile" is a directory"
            else
                echo ""$eachfile" is a non-binary file"
            fi
        fi
    done
else
    echo ""$directoryPath" is incorrect"
fi
shopt -u globstar                                       # Unsets it


# Check to see if standard files exist and named correctly
echo "----- Now checking if file is named correctly and exists -----"

AppScan="./maven-project/AppScan"
if [ -d "$AppScan" ]
then
	if [ "$(ls -A $AppScan)" ]; then
     echo "$AppScan is not empty"
	else
        echo "$AppScan is empty"
	fi
else
	echo "Directory $AppScan not found."
fi

emptyDirectory="./maven-project/emptyDirectory"
if [ -d "$emptyDirectory" ]
then
	if [ "$(ls -A $emptyDirectory)" ]; then
     echo "$emptyDirectory is not empty"
	else
        echo "$emptyDirectory is empty"
	fi
else
	echo "Directory $emptyDirectory not found."
fi

deploy="./maven-project/deploy.sh"
if [[ -f $deploy ]]
then
    if [[ -s $deploy ]]
    then
        echo "$deploy exists and not empty"
    else
        echo "$deploy exists but empty"
    fi
else
    echo "$deploy does not exist"
fi

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
# Issues
# When running the above script, child folders within the root directory return as non-binary even if they are populated
# Trying to find a way to show it is also binary if they have stuff inside