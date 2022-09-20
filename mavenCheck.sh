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

srcFolder="./maven-project/src"
if [ -d "$srcFolder" ]
then
	if [ "$(ls -A $srcFolder)" ]; then
     echo "$srcFolder is not empty"
	else
        echo "$srcFolder is empty"
	fi
else
	echo "Directory $srcFolder not found."
fi

mainFolder="./maven-project/src/main"
if [ -d "$mainFolder" ]
then
	if [ "$(ls -A $mainFolder)" ]; then
     echo "$mainFolder is not empty"
	else
        echo "$mainFolder is empty"
	fi
else
	echo "Directory $mainFolder not found."
fi

mainJavaFolder="./maven-project/src/main/java"
if [ -d "$mainJavaFolder" ]
then
	if [ "$(ls -A $mainJavaFolder)" ]; then
     echo "$mainJavaFolder is not empty"
	else
        echo "$mainJavaFolder is empty"
	fi
else
	echo "Directory $mainJavaFolder not found."
fi

mainFiltersFolder="./maven-project/src/main/filters"
if [ -d "$mainFiltersFolder" ]
then
	if [ "$(ls -A $mainFiltersFolder)" ]; then
     echo "$mainFiltersFolder is not empty"
	else
        echo "$mainFiltersFolder is empty"
	fi
else
	echo "Directory $mainFiltersFolder not found."
fi

mainWebappFolder="./maven-project/src/main/webapp"
if [ -d "$mainWebappFolder" ]
then
	if [ "$(ls -A $mainWebappFolder)" ]; then
     echo "$mainWebappFolder is not empty"
	else
        echo "$mainWebappFolder is empty"
	fi
else
	echo "Directory $mainWebappFolder not found."
fi

mainResourcesFolder="./maven-project/src/main/resources"
if [ -d "$mainResourcesFolder" ]
then
	if [ "$(ls -A $mainResourcesFolder)" ]; then
     echo "$mainResourcesFolder is not empty"
	else
        echo "$mainResourcesFolder is empty"
	fi
else
	echo "Directory $mainResourcesFolder not found."
fi

testFolder="./maven-project/src/test"
if [ -d "$testFolder" ]
then
	if [ "$(ls -A $testFolder)" ]; then
     echo "$testFolder is not empty"
	else
        echo "$testFolder is empty"
	fi
else
	echo "Directory $testFolder not found."
fi

testJavaFolder="./maven-project/src/test/java"
if [ -d "$testJavaFolder" ]
then
	if [ "$(ls -A $testJavaFolder)" ]; then
     echo "$testJavaFolder is not empty"
	else
        echo "$testJavaFolder is empty"
	fi
else
	echo "Directory $testJavaFolder not found."
fi

testFiltersFolder="./maven-project/src/test/filters"
if [ -d "$testFiltersFolder" ]
then
	if [ "$(ls -A $testFiltersFolder)" ]; then
     echo "$testFiltersFolder is not empty"
	else
        echo "$testFiltersFolder is empty"
	fi
else
	echo "Directory $testFiltersFolder not found."
fi

testResourcesFolder="./maven-project/src/test/resources"
if [ -d "$testResourcesFolder" ]
then
	if [ "$(ls -A $testResourcesFolder)" ]; then
     echo "$testResourcesFolder is not empty"
	else
        echo "$testResourcesFolder is empty"
	fi
else
	echo "Directory $testResourcesFolder not found."
fi

deploymentFolder="./maven-project/deployment"
if [ -d "$deploymentFolder" ]
then
	if [ "$(ls -A $deploymentFolder)" ]; then
     echo "$deploymentFolder is not empty"
	else
        echo "$deploymentFolder is empty"
	fi
else
	echo "Directory $deploymentFolder not found."
fi

deploymentScriptsFolder="./maven-project/deployment/scripts"
if [ -d "$deploymentScriptsFolder" ]
then
	if [ "$(ls -A $deploymentScriptsFolder)" ]; then
     echo "$deploymentScriptsFolder is not empty"
	else
        echo "$deploymentScriptsFolder is empty"
	fi
else
	echo "Directory $deploymentScriptsFolder not found."
fi

deploymentPropertiesFolder="./maven-project/deployment/deployment.properties"
if [[ -f $deploymentPropertiesFolder ]]
then
    if [[ -s $deploymentPropertiesFolder ]]
    then
        echo "$deploymentPropertiesFolder exists and not empty"
    else
        echo "$deploymentPropertiesFolder exists but empty"
    fi
else
    echo "$deploymentPropertiesFolder does not exist"
fi

appscan="./maven-project/AppScan"
if [ -d "$appscan" ]
then
	if [ "$(ls -A $appscan)" ]; then
     echo "$appscan is not empty"
	else
        echo "$appscan is empty"
	fi
else
	echo "Directory $appscan not found."
fi

appscanScript="./maven-project/AppScan/example.script"
if [[ -f $appscanScript ]]
then
    if [[ -s $appscanScript ]]
    then
        echo "$appscanScript exists and not empty"
    else
        echo "$appscanScript exists but empty"
    fi
else
    echo "$appscanScript does not exist"
fi

appscanPPF="./maven-project/AppScan/example.ppf"
if [[ -f $appscanPPF ]]
then
    if [[ -s $appscanPPF ]]
    then
        echo "$appscanPPF exists and not empty"
    else
        echo "$appscanPPF exists but empty"
    fi
else
    echo "$appscanPPF does not exist"
fi

appscanPAF="./maven-project/AppScan/example.paf"
if [[ -f $appscanPAF ]]
then
    if [[ -s $appscanPAF ]]
    then
        echo "$appscanPAF exists and not empty"
    else
        echo "$appscanPAF exists but empty"
    fi
else
    echo "$appscanPAF does not exist"
fi

target="./maven-project/target"
if [ -d "$target" ]
then
	if [ "$(ls -A $target)" ]; then
     echo "$target is not empty"
	else
        echo "$target is empty"
	fi
else
	echo "Directory $target not found."
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