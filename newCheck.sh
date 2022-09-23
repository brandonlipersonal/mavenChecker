pomFile="./maven-project/pom.xml"
buildFile="./maven-project/build.xml"
readmeFile="./maven-project/README.txt"
noticeFile="./maven-project/NOTICE.txt"
licenseFile="./maven-project/LICENSE.txt"
deployFile="./maven-project/deploy.sh"
appscanScript="./maven-project/AppScan/example.script"
appscanPPF="./maven-project/AppScan/example.ppf"
appscanPAF="./maven-project/AppScan/example.paf"


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

fileCheck $pomFile 
fileCheck $buildFile
fileCheck $readmeFile
fileCheck $noticeFile
fileCheck $licenseFile
fileCheck $deployFile
fileCheck $appscanScript
fileCheck $appscanPPF
fileCheck $appscanPAF


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
deploymentPropertiesFolder="./maven-project/deployment/deployment.properties"
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
directoryCheck $deploymentPropertiesFolder
directoryCheck $appscan
directoryCheck $target
