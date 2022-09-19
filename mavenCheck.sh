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

# Append to array or log file if file doesnt exist

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
                if [ "$(ls -A $eachfile)" ]; then                           # ls -A lists all (hidden) files starting with '.', will fail if no files are listed
                    echo "$eachfile is a directory and not empty"
                else
                    echo "$eachfile is a directory and is empty"
                fi
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

pomFile="./maven-project/pom.xml"
if [[ -f $pomFile ]]                                                # -f  checks if the provided path exists and is a regular file
then
    if [[ -s $pomFile ]]
    then
        echo "$pomFile exists and not empty"
    else
        echo "$pomFile exists but empty"
    fi
else
    echo "$pomFile does not exist"
fi

buildFile="./maven-project/build.xml"
if [[ -f $buildFile ]]
then
    if [[ -s $buildFile ]]
    then
        echo "$buildFile exists and not empty"
    else
        echo "$buildFile exists but empty"
    fi
else
    echo "$buildFile does not exist"
fi

elcArtifacts="./maven-project/elcArtifacts"
if [[ -d $elcArtifacts ]]
then
	if [ "$(ls -A $elcArtifacts)" ]; then                           # ls -A lists all (hidden) files starting with '.', will fail if no files are listed
     echo "$elcArtifacts is not empty"
	else
        echo "$elcArtifacts is empty"
	fi
else
	echo "Directory $elcArtifacts not found."
fi

readmeFile="./maven-project/README.txt"
if [[ -f $readmeFile ]]
then
    if [[ -s $readmeFile ]]
    then
        echo "$readmeFile exists and not empty"
    else
        echo "$readmeFile exists but empty"
    fi
else
    echo "$readmeFile does not exist"
fi

noticeFile="./maven-project/NOTICE.txt"
if [[ -f $noticeFile ]]
then
    if [[ -s $noticeFile ]]
    then
        echo "$noticeFile exists and not empty"
    else
        echo "$noticeFile exists but empty"
    fi
else
    echo "$noticeFile does not exist"
fi

licenseFile="./maven-project/LICENSE.txt"
if [[ -f $licenseFile ]]
then
    if [[ -s $licenseFile ]]
    then
        echo "$licenseFile exists and not empty"
    else
        echo "$licenseFile exists but empty"
    fi
else
    echo "$licenseFile does not exist"
fi

deployFile="./maven-project/deploy.sh"
if [[ -f $deployFile ]]
then
    if [[ -s $deployFile ]]
    then
        echo "$deployFile exists and not empty"
    else
        echo "$deployFile exists but empty"
    fi
else
    echo "$deployFile does not exist"
fi



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
# ------------------------------------
# Issues
# When running the above script, child folders within the root directory return as non-binary even if they are populated
# Trying to find a way to show it is also binary if they have stuff inside