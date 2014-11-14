#!/bin/sh 
DEMO="Install Demo"
AUTHORS="Eric D. Schabell"
PROJECT="git@github.com:eschabell/brms-install-demo.git"
PRODUCT="JBoss BRMS"
JBOSS_HOME=./target/jboss-eap-6.3
SERVER_DIR=$JBOSS_HOME/standalone/deployments/
SERVER_CONF=$JBOSS_HOME/standalone/configuration/
SERVER_BIN=$JBOSS_HOME/bin
SRC_DIR=./installs
SUPPORT_DIR=./support
PRJ_DIR=./projects
BRMS=jboss-brms-installer-6.1.0.ER2.jar
VERSION=6.1.ER2

# wipe screen.
clear 

echo
echo "#################################################################"
echo "##                                                             ##"   
echo "##  Setting up the ${DEMO}                                ##"
echo "##                                                             ##"   
echo "##                                                             ##"   
echo "##     ####  ####   #   #   ###    #####                       ##"
echo "##     #   # #   # # # # # #       #                           ##"
echo "##     ####  ####  #  #  #  ##     #####                       ##"
echo "##     #   # # #   #     #    #    #   #                       ##"
echo "##     ####  #  #  #     # ###     #####                       ##"
echo "##                                                             ##"   
echo "##                                                             ##"   
echo "##  brought to you by,                                         ##"   
echo "##             ${AUTHORS}                                ##"
echo "##                                                             ##"   
echo "##  ${PROJECT}             ##"
echo "##                                                             ##"   
echo "#################################################################"
echo

command -v mvn -q >/dev/null 2>&1 || { echo >&2 "Maven is required but not installed yet... aborting."; exit 1; }

# make some checks first before proceeding.	
if [ -r $SRC_DIR/$BRMS ] || [ -L $SRC_DIR/$BRMS ]; then
		echo Product sources are present...
		echo
else
		echo Need to download $BRMS installer from the Customer Portal 
		echo and place it in the $SRC_DIR directory to proceed...
		echo
		exit
fi

# Move the old JBoss instance, if it exists, to the OLD position.
if [ -x $JBOSS_HOME ]; then
		echo "  - existing JBoss product install detected..."
		echo
		echo "  - moving existing JBoss product install aside..."
		echo
		rm -rf $JBOSS_HOME.OLD
		mv $JBOSS_HOME $JBOSS_HOME.OLD
fi

# Run installer.
echo Product installer running now...
echo
java -jar $SRC_DIR/$BRMS $SUPPORT_DIR/installation-brms -variablefile $SUPPORT_DIR/installation-brms.variables


echo "  - enabling demo accounts role setup in application-roles.properties file..."
echo
cp $SUPPORT_DIR/application-roles.properties $SERVER_CONF

echo "  - setting up standalone.xml configuration adjustments..."
echo
cp $SUPPORT_DIR/standalone.xml $SERVER_CONF

# Add execute permissions to the standalone.sh script.
echo "  - making sure standalone.sh for server is executable..."
echo
chmod u+x $JBOSS_HOME/bin/standalone.sh

echo "You can now start the $PRODUCT with $SERVER_BIN/standalone.sh"
echo
echo "Login to http://localhost:8080/business-central   (u:erics / p:jbossbrms1!)"
echo

echo "$PRODUCT $VERSION $DEMO Setup Complete."
echo

