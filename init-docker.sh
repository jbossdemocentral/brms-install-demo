#!/bin/sh
DEMO="Install Demo"
AUTHORS="Andrew Block, Eric D. Schabell"
AUTHORS2="Duncan Doyle, Jaen Swart"
PROJECT="git@github.com:jbossdemocentral/brms-install-demo.git"
PRODUCT="JBoss BRMS"
DOCKERFILE="support/docker/Dockerfile"
SRC_DIR=./installs
BRMS=jboss-brms-6.4.0.GA-deployable-eap7.x.zip
EAP=jboss-eap-7.0.0-installer.jar
VERSION=6.4

# wipe screen.
clear

echo
echo "#################################################################"
echo "##                                                             ##"
echo "##  Setting up the ${DEMO}                                ##"
echo "##                                                             ##"
echo "##                                                             ##"
echo "##     ####  ####   #   #   ###    #####    #####              ##"
echo "##     #   # #   # # # # # #       #            #              ##"
echo "##     ####  ####  #  #  #  ##     #####    #####              ##"
echo "##     #   # # #   #     #    #    #   #        #              ##"
echo "##     ####  #  #  #     # ###     ##### #  #####              ##"
echo "##                                                             ##"
echo "##                                                             ##"
echo "##  brought to you by,                                         ##"
echo "##             ${AUTHORS}                  ##"
echo "##             ${AUTHORS2}                        ##"
echo "##                                                             ##"
echo "##  ${PROJECT}       ##"
echo "##                                                             ##"
echo "#################################################################"
echo

# make some checks first before proceeding.
if [ -r $SRC_DIR/$EAP ] || [ -L $SRC_DIR/$EAP ]; then
		echo Product sources are present...
		echo
else
		echo Need to download $EAP package from the Customer Portal
		echo and place it in the $SRC_DIR directory to proceed...
		echo
		exit
fi

#if [ -r $SRC_DIR/$EAP_PATCH ] || [ -L $SRC_DIR/$EAP_PATCH ]; then
#		echo Product patches are present...
#		echo
#else
#		echo Need to download $EAP_PATCH package from the Customer Portal
#		echo and place it in the $SRC_DIR directory to proceed...
#		echo
#		exit
#fi

if [ -r $SRC_DIR/$BRMS ] || [ -L $SRC_DIR/$BRMS ]; then
		echo Product sources are present...
		echo
else
		echo Need to download $BRMS package from the Customer Portal
		echo and place it in the $SRC_DIR directory to proceed...
		echo
		exit
fi

cp support/docker/Dockerfile .

echo Starting Docker build.
echo

docker build -t jbossdemocentral/brms-install-demo .

if [ $? -ne 0 ]; then
        echo
        echo Error occurred during Docker build!
        echo Consult the Docker build output for more information.
        exit
fi

echo Docker build finished.
echo

rm Dockerfile

echo
echo "================================================================================="
echo "=                                                                               ="
echo "=  You can now start the $PRODUCT in a Docker container with:                 ="
echo "=                                                                               ="
echo "=  docker run -it -p 8080:8080 -p 9990:9990 jbossdemocentral/brms-install-demo  ="
echo "=                                                                               ="
echo "=  Login into business central at:                                              ="
echo "=                                                                               ="
echo "=    http://localhost:8080/business-central  (u:brmsAdmin / p:jbossbrms1!)      ="
echo "=                                                                               ="
echo "=                                                                               ="
echo "=  $PRODUCT $VERSION $DEMO Setup Complete.                                  ="
echo "=                                                                               ="
echo "================================================================================="
