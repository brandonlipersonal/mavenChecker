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

# Look for non-binary files and binary files and displays them
# directoryPath="C:/Users/15712/Desktop/mavenChecker/mavenChecker" #(Laptop)
# directoryPath="C:/Users/brand/OneDrive/Desktop/Jenkins/mavenChecker" #(Desktop)

# Code Starts -----------------------------------------------------

# Listing ALL files located in maven-project folder
shopt -s globstar                                       # set it so that pattern ** used in a filename expansion context will match all files and zero or more directories and subdirectories
directoryPath="C:/Users/brand/OneDrive/Desktop/Jenkins/mavenChecker" 
exec > "log.txt"
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
                    echo "$eachfile is a directory and is empty (WARNING)"
                fi
            else
                echo ""$eachfile" is a non-binary file (WARNING)"
            fi
        fi
    done
else
    echo ""$directoryPath" is incorrect"
fi
shopt -u globstar                                       # Unsets it

echo "----- Now checking if file is named correctly and exists -----"

pomFile="./maven-project/pom.xml"
buildFile="./maven-project/build.xml"
readmeFile="./maven-project/README.txt"
noticeFile="./maven-project/NOTICE.txt"
licenseFile="./maven-project/LICENSE.txt"
deployFile="./maven-project/deploy.sh"
appscanScript="./maven-project/AppScan/example.script"
appscanPPF="./maven-project/AppScan/example.ppf"
appscanPAF="./maven-project/AppScan/example.paf"
deploymentPropertiesFolder="./maven-project/deployment/deployment.properties"

fileCheck () {
if [[ -f $* ]]
then
    if [[ -s $* ]];                        # -s returns true if file exists and has a size greater than 0
    then
        echo "$* path is correct and is a binary file"
    else
        echo "$* is a non-binary file (WARNING)"
    fi
else
    echo "$* path does not exist (ERROR)"
fi
}

# Calling function to check the filepath and binary/non-binary
fileCheck $pomFile 
fileCheck $buildFile
fileCheck $readmeFile
fileCheck $noticeFile
fileCheck $licenseFile
fileCheck $deployFile
fileCheck $appscanScript
fileCheck $appscanPPF
fileCheck $appscanPAF
fileCheck $deploymentPropertiesFolder

echo "----- Now checking if folder is named correctly and exists -----"

srcFolder="./maven-project/src"
elcArtifacts="./maven-project/elcArtifacts"
mainFolder="./maven-project/src/main"
mainJavaFolder="./maven-project/src/main/java"
mainFiltersFolder="./maven-project/src/main/filters"
mainWebappFolder="./maven-project/src/main/webapp"
mainResourcesFolder="./maven-project/src/main/resources"
testFolder="./maven-project/src/test"
testJavaFolder="./maven-project/src/test/java"
testFiltersFolder="./maven-project/src/test/filters"
testResourcesFolder="./maven-project/src/test/resources"
deploymentFolder="./maven-project/deployment"
deploymentScriptsFolder="./maven-project/deployment/scripts"
appscan="./maven-project/AppScan"
target="./maven-project/target"

directoryCheck () {
if [[ -d "$*" ]];                       
then
    if [ "$(ls -A $*)" ];
    then
        echo "$* is a directory and not empty"
    else
        echo "$* is directory and is empty (WARNING)"
    fi
else
    echo "$* is not a directory (ERROR)"
fi
}

# Calling function to check if directory exists and has contents
directoryCheck $srcFolder
directoryCheck $elcArtifacts
directoryCheck $mainFolder
directoryCheck $mainJavaFolder
directoryCheck $mainFiltersFolder
directoryCheck $mainWebappFolder
directoryCheck $mainResourcesFolder
directoryCheck $testFolder
directoryCheck $testJavaFolder
directoryCheck $testFiltersFolder
directoryCheck $testResourcesFolder
directoryCheck $deploymentFolder
directoryCheck $deploymentScriptsFolder
directoryCheck $appscan
directoryCheck $target