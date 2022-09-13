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
 
 
# Look for non-binary files and notify user to delete or update
# Look for all .txt files in the current directory (filepath can be changed)
fileNames='./*/*'
for eachfile in $fileNames
do
    echo $eachfile
    if [[ -s $eachfile ]];              # -s returns true if file exists and has a size greater than 0
    then
        echo "This is a binary file"
    else
        echo "This is a non-binary file"
        rm -i $eachfile                # -i to provide prompt before deleting the file
    fi
done

# Check for Maven Standards
 
echo "----- Now checking if file is named correctly and exists -----"
 
if [[ -f "maven-project/deploy.sh" ]]
then
    echo "deploy.sh exists"
else
    echo $eachfile
    echo "File is incorrect"
fi
